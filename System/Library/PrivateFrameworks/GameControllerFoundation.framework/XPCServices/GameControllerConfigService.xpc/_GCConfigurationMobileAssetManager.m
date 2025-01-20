@interface _GCConfigurationMobileAssetManager
- (_GCConfigurationMobileAssetManager)init;
- (_GCConfigurationMobileAssetManager)initWithProvider:(id)a3;
- (id)assets;
- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5;
- (id)configurationBundleURLsForType:(id)a3;
- (id)currentAsset:(BOOL)a3;
- (id)lastUpdateDate;
@end

@implementation _GCConfigurationMobileAssetManager

- (_GCConfigurationMobileAssetManager)initWithProvider:(id)a3
{
  v15.receiver = self;
  v15.super_class = &OBJC_CLASS____GCConfigurationMobileAssetManager;
  id v3 = -[_GCConfigurationMobileAssetManager init](&v15, "init", a3);
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_1000046EC();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.mobileasset.GameController.DB", v5, v7);
  v9 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v8;

  dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2( "com.apple.mobileasset.GameController.DB [Locator]",  v11,  *((dispatch_queue_t *)v3 + 1));
  v13 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v12;

  return (_GCConfigurationMobileAssetManager *)v3;
}

- (_GCConfigurationMobileAssetManager)init
{
  return -[_GCConfigurationMobileAssetManager initWithProvider:](self, "initWithProvider:", 0LL);
}

- (id)configurationBundleURLsForType:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  currentDBAsset = v5->_currentDBAsset;
  if (currentDBAsset)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset configurationBundleURLsForType:](currentDBAsset, "configurationBundleURLsForType:", v4));
    objc_sync_exit(v5);
  }

  else
  {
    objc_sync_exit(v5);

    locatorQueue = v5->_locatorQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000494C;
    v12[3] = &unk_100010348;
    v12[4] = v5;
    v5 = (_GCConfigurationMobileAssetManager *)objc_claimAutoreleasedReturnValue( +[GCFuture futureOnQueue:withBlock:]( &OBJC_CLASS___GCFuture,  "futureOnQueue:withBlock:",  locatorQueue,  v12));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100004F7C;
    v10[3] = &unk_100010370;
    id v11 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_GCConfigurationMobileAssetManager thenWithResult:](v5, "thenWithResult:", v10));
  }

  return v7;
}

- (id)assets
{
  id v2 = sub_1000051BC(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thenSynchronouslyWithResult:&stru_1000103F0]);

  return v4;
}

- (id)currentAsset:(BOOL)a3
{
  if (a3)
  {
    locatorQueue = self->_locatorQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100005368;
    v8[3] = &unk_100010348;
    v8[4] = self;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GCFuture futureOnQueue:withBlock:]( &OBJC_CLASS___GCFuture,  "futureOnQueue:withBlock:",  locatorQueue,  v8));
    return v4;
  }

  if (self->_currentDBAsset)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCFuture futureWithResult:](&OBJC_CLASS___GCFuture, "futureWithResult:"));
    return v4;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCFuture futureWithResult:](&OBJC_CLASS___GCFuture, "futureWithResult:", v6));

  return v7;
}

- (id)lastUpdateDate
{
  id v2 = sub_1000051BC(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thenSynchronouslyWithResult:&stru_100010430]);

  return v4;
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  dispatch_queue_attr_t v10 = self;
  objc_sync_enter(v10);
  if (v10->_updateProgress || !a3)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    objc_sync_exit(v10);

    v25 = 0LL;
  }

  else
  {
    if (v10->_updateCallbacks)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v27 handleFailureInMethod:a2 object:v10 file:@"_GCConfigurationMobileAssetManager.m" lineNumber:217 description:@"Assertion failed: _updateProgress == ((void *)0) && _updateCallbacks == ((void *)0)"];
    }

    id v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    updateCallbacks = v10->_updateCallbacks;
    v10->_updateCallbacks = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSProgress);
    updateProgress = v10->_updateProgress;
    v10->_updateProgress = v13;

    objc_super v15 = v10->_updateCallbacks;
    id v16 = objc_retainBlock(v9);
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v17 = v10->_updateProgress;
    objc_sync_exit(v10);

    v18 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Check For Updates",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DETACHED);
    os_activity_scope_enter(v18, &state);
    v19 = v10->_privateQueue;
    v37[0] = 0LL;
    v37[1] = v37;
    v37[2] = 0x3032000000LL;
    v37[3] = sub_1000058F8;
    v37[4] = sub_100005908;
    id v38 = 0LL;
    -[NSProgress setPausable:](v17, "setPausable:", 0LL);
    -[NSProgress setCancellable:](v17, "setCancellable:", 1LL);
    -[NSProgress setLocalizedDescription:](v17, "setLocalizedDescription:", @"Checking for updates");
    if (v5) {
      uint64_t v20 = 3LL;
    }
    else {
      uint64_t v20 = 4LL;
    }
    -[NSProgress setTotalUnitCount:](v17, "setTotalUnitCount:", v20);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100005910;
    v34[3] = &unk_100010480;
    v21 = v19;
    v35 = v21;
    v36 = v37;
    -[NSProgress setCancellationHandler:](v17, "setCancellationHandler:", v34);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000059B8;
    v33[3] = &unk_1000104D0;
    v33[4] = v10;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100005DDC;
    v28[3] = &unk_1000106D0;
    v30 = objc_retainBlock(v33);
    v31 = v37;
    v28[4] = v10;
    BOOL v32 = v5;
    v22 = v17;
    v29 = v22;
    v23 = v30;
    dispatch_async(v21, v28);
    v24 = v29;
    v25 = v22;

    _Block_object_dispose(v37, 8);
    os_activity_scope_leave(&state);
  }

  return v25;
}

- (void).cxx_destruct
{
}

@end