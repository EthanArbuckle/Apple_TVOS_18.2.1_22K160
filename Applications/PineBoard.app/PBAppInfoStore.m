@interface PBAppInfoStore
- (FBSALOToken)addApplicationObserverToken;
- (FBSALOToken)addPlaceholderObserverToken;
- (FBSALOToken)cancelPlaceholderObserverToken;
- (FBSALOToken)demoteApplicationObserverToken;
- (FBSALOToken)removeApplicationObserverToken;
- (FBSALOToken)replaceApplicationObserverToken;
- (FBSApplicationLibrary)appLibrary;
- (NSDictionary)queue_appInfos;
- (NSDictionary)queue_applicationInfos;
- (NSDictionary)queue_placeholders;
- (NSMapTable)tokensToObservers;
- (OS_dispatch_queue)barrierQueue;
- (OS_dispatch_queue)observerQueue;
- (OS_dispatch_queue)workQueue;
- (PBAppInfoConfiguration)queue_configuration;
- (PBAppInfoStore)initWithApplicationLibrary:(id)a3 policy:(id)a4 dynamicStateDataSource:(id)a5;
- (PBAppInfoStoreDynamicStateDataSource)dynamicStateDataSource;
- (PBAppInfoStorePolicyProviding)policy;
- (id)_appInfoWithUpdatedPolicy:(BOOL)a3 updatedState:(BOOL)a4 sourceAppInfo:(id)a5 applicationInfo:(id)a6;
- (id)_appInfoWithUpdatedPolicy:(BOOL)a3 updatedState:(BOOL)a4 sourceAppInfo:(id)a5 placeholder:(id)a6;
- (id)addObserver:(id)a3;
- (id)appInfoControllerWithEnabledAndVisibleApps;
- (id)appInfoControllerWithEnabledAndVisibleAppsAndPlaceholders;
- (id)appInfoControllerWithEnabledApps;
- (id)appInfoControllerWithEverything;
- (id)appInfos;
- (id)configuration;
- (void)_enqueueUpdate:(id)a3;
- (void)applicationIconDidChange:(id)a3;
- (void)dealloc;
- (void)handleDynamicStateChanged:(id)a3;
- (void)handlePolicyChanged:(id)a3;
- (void)languageDidChange;
- (void)placeholderDidChangeSignificantly:(id)a3;
- (void)placeholderProgressDidUpdate:(id)a3;
- (void)queue_processUpdates:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation PBAppInfoStore

- (PBAppInfoStore)initWithApplicationLibrary:(id)a3 policy:(id)a4 dynamicStateDataSource:(id)a5
{
  id v52 = a3;
  id v53 = a4;
  id v54 = a5;
  v71.receiver = self;
  v71.super_class = (Class)&OBJC_CLASS___PBAppInfoStore;
  id v9 = -[PBAppInfoStore init](&v71, "init");
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.pineBoard.PBAppInfoStore.barrier", &_dispatch_queue_attr_concurrent);
    v11 = (void *)*((void *)v9 + 10);
    *((void *)v9 + 10) = v10;

    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2( "com.apple.PineBoard.PBAppInfoStore",  0LL,  *((dispatch_queue_t *)v9 + 10));
    v13 = (void *)*((void *)v9 + 11);
    *((void *)v9 + 11) = v12;

    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2( "com.apple.PineBoard.PBAppInfoStore.observer",  0LL,  *((dispatch_queue_t *)v9 + 10));
    v15 = (void *)*((void *)v9 + 12);
    *((void *)v9 + 12) = v14;

    objc_storeStrong((id *)v9 + 2, a4);
    objc_storeStrong((id *)v9 + 3, a5);
    objc_storeStrong((id *)v9 + 1, a3);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    v17 = (void *)*((void *)v9 + 13);
    *((void *)v9 + 13) = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    v19 = (void *)*((void *)v9 + 15);
    *((void *)v9 + 15) = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    v21 = (void *)*((void *)v9 + 16);
    *((void *)v9 + 16) = v20;

    v51 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 1) allInstalledApplications]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 1) allPlaceholders]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[_PBAppInfoStoreUpdate addApplicationInfos:]( &OBJC_CLASS____PBAppInfoStoreUpdate,  "addApplicationInfos:",  v51));
    v72[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[_PBAppInfoStoreUpdate addPlaceholders:]( &OBJC_CLASS____PBAppInfoStoreUpdate,  "addPlaceholders:",  v50));
    v72[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 2LL));

    v25 = (dispatch_queue_s *)*((void *)v9 + 11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D2C0;
    block[3] = &unk_1003CFEB8;
    v26 = v9;
    id v69 = v26;
    id v49 = v24;
    id v70 = v49;
    dispatch_sync(v25, block);
    objc_initWeak(&location, v26);
    v27 = (void *)*((void *)v9 + 1);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_10001D2DC;
    v65[3] = &unk_1003D0A60;
    objc_copyWeak(&v66, &location);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 observeDidAddApplicationsWithBlock:v65]);
    v29 = (void *)v26[4];
    v26[4] = v28;

    v30 = (void *)*((void *)v9 + 1);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_10001D3C8;
    v63[3] = &unk_1003D0A60;
    objc_copyWeak(&v64, &location);
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 observeDidRemoveApplicationsWithBlock:v63]);
    v32 = (void *)v26[5];
    v26[5] = v31;

    v33 = (void *)*((void *)v9 + 1);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_10001D4B4;
    v61[3] = &unk_1003D0A88;
    objc_copyWeak(&v62, &location);
    uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 observeDidReplaceApplicationsWithBlock:v61]);
    v35 = (void *)v26[6];
    v26[6] = v34;

    v36 = (void *)*((void *)v9 + 1);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10001D5D0;
    v59[3] = &unk_1003D0A60;
    objc_copyWeak(&v60, &location);
    uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 observeDidDemoteApplicationsWithBlock:v59]);
    v38 = (void *)v26[7];
    v26[7] = v37;

    v39 = (void *)*((void *)v9 + 1);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_10001D6BC;
    v57[3] = &unk_1003D0A60;
    objc_copyWeak(&v58, &location);
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 observeDidAddPlaceholdersWithBlock:v57]);
    v41 = (void *)v26[8];
    v26[8] = v40;

    v42 = (void *)*((void *)v9 + 1);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10001D7A8;
    v55[3] = &unk_1003D0A60;
    objc_copyWeak(&v56, &location);
    uint64_t v43 = objc_claimAutoreleasedReturnValue([v42 observeDidCancelPlaceholdersWithBlock:v55]);
    v44 = (void *)v26[9];
    v26[9] = v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v45 addObserver:v26];

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v46 addObserver:v26 selector:"handlePolicyChanged:" name:@"PBAppInfoStorePolicyDidChangeNotification" object:*((void *)v9 + 2)];

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v47 addObserver:v26 selector:"handleDynamicStateChanged:" name:@"PBAppInfoStoreDynamicStateDidChangeNotification" object:*((void *)v9 + 3)];

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }

  return (PBAppInfoStore *)v9;
}

- (void)dealloc
{
  queue_placeholders = self->_queue_placeholders;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001D9D4;
  v8[3] = &unk_1003D0AB0;
  v8[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](queue_placeholders, "enumerateKeysAndObjectsUsingBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v4 removeObserver:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:@"PBAppInfoStorePolicyDidChangeNotification" object:self->_policy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:@"PBAppInfoStoreDynamicStateDidChangeNotification" object:self->_dynamicStateDataSource];

  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_addApplicationObserverToken);
  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_removeApplicationObserverToken);
  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_replaceApplicationObserverToken);
  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_demoteApplicationObserverToken);
  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_addPlaceholderObserverToken);
  -[FBSApplicationLibrary removeObserverForToken:]( self->_appLibrary,  "removeObserverForToken:",  self->_cancelPlaceholderObserverToken);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAppInfoStore;
  -[PBAppInfoStore dealloc](&v7, "dealloc");
}

- (id)appInfos
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10001DAAC;
  dispatch_queue_t v10 = sub_10001DABC;
  id v11 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001DAD4;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)configuration
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10001DAAC;
  dispatch_queue_t v10 = sub_10001DABC;
  id v11 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001DBC8;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10001DAAC;
  uint64_t v16 = sub_10001DABC;
  id v17 = 0LL;
  observerQueue = (dispatch_queue_s *)self->_observerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DCC4;
  block[3] = &unk_1003D0AD8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(observerQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = (dispatch_queue_s *)self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001DD94;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)_enqueueUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DE68;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)appInfoControllerWithEverything
{
  return  -[PBAppInfoController initWithInfoStore:filter:delegate:]( objc_alloc(&OBJC_CLASS___PBAppInfoController),  "initWithInfoStore:filter:delegate:",  self,  0LL,  0LL);
}

- (id)appInfoControllerWithEnabledAndVisibleAppsAndPlaceholders
{
  id v3 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfoController enabledAndVisibleAppsAndPlaceholdersFilter]( &OBJC_CLASS___PBAppInfoController,  "enabledAndVisibleAppsAndPlaceholdersFilter"));
  v5 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v3,  "initWithInfoStore:filter:delegate:",  self,  v4,  0LL);

  return v5;
}

- (id)appInfoControllerWithEnabledAndVisibleApps
{
  id v3 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfoController enabledAndVisibleAppsFilter]( &OBJC_CLASS___PBAppInfoController,  "enabledAndVisibleAppsFilter"));
  v5 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v3,  "initWithInfoStore:filter:delegate:",  self,  v4,  0LL);

  return v5;
}

- (id)appInfoControllerWithEnabledApps
{
  id v3 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppInfoController enabledAppsFilter](&OBJC_CLASS___PBAppInfoController, "enabledAppsFilter"));
  v5 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v3,  "initWithInfoStore:filter:delegate:",  self,  v4,  0LL);

  return v5;
}

- (void)handlePolicyChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_PBAppInfoStoreUpdate updatePolicy](&OBJC_CLASS____PBAppInfoStoreUpdate, "updatePolicy", a3));
  -[PBAppInfoStore _enqueueUpdate:](self, "_enqueueUpdate:", v4);
}

- (void)handleDynamicStateChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_PBAppInfoStoreUpdate updateDynamicState]( &OBJC_CLASS____PBAppInfoStoreUpdate,  "updateDynamicState",  a3));
  -[PBAppInfoStore _enqueueUpdate:](self, "_enqueueUpdate:", v4);
}

- (void)placeholderProgressDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082574();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100270C0C((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  id v15 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[_PBAppInfoStoreUpdate updatePlaceholders:]( &OBJC_CLASS____PBAppInfoStoreUpdate,  "updatePlaceholders:",  v13));
  -[PBAppInfoStore _enqueueUpdate:](self, "_enqueueUpdate:", v14);
}

- (void)placeholderDidChangeSignificantly:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082574();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100270C70((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  id v15 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[_PBAppInfoStoreUpdate updatePlaceholders:]( &OBJC_CLASS____PBAppInfoStoreUpdate,  "updatePlaceholders:",  v13));
  -[PBAppInfoStore _enqueueUpdate:](self, "_enqueueUpdate:", v14);
}

- (void)applicationIconDidChange:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E32C;
  v7[3] = &unk_1003CFEB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(workQueue, v7);
}

- (void)languageDidChange
{
  id v3 = sub_100082574();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Update appInfoStore for language change",  buf,  2u);
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E590;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_barrier_sync(workQueue, block);
}

- (void)queue_processUpdates:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082574();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100270CD4((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v99 = -[NSDictionary mutableCopy](self->_queue_applicationInfos, "mutableCopy");
  v100 = self;
  id v13 = -[NSDictionary mutableCopy](self->_queue_placeholders, "mutableCopy");
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  id obj = v4;
  id v15 = [obj countByEnumeratingWithState:&v132 objects:v140 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v133;
    uint64_t v87 = *(void *)v133;
    do
    {
      v18 = 0LL;
      id v88 = v16;
      do
      {
        if (*(void *)v133 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)v18);
        id v20 = [v19 updateType];
        if (v20 != (id)8)
        {
          id v21 = v20;
          v91 = v18;
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 placeholders]);
          __int128 v128 = 0u;
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          __int128 v131 = 0u;
          id v97 = v22;
          id v23 = [v22 countByEnumeratingWithState:&v128 objects:v139 count:16];
          if (!v23) {
            goto LABEL_25;
          }
          id v24 = v23;
          uint64_t v25 = *(void *)v129;
          while (1)
          {
            for (i = 0LL; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v129 != v25) {
                objc_enumerationMutation(v97);
              }
              v27 = *(void **)(*((void *)&v128 + 1) + 8LL * (void)i);
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
              if (v21 != (id)6)
              {
                if (v21 == (id)5)
                {
                  [v27 removeObserver:v100];
                  [v13 removeObjectForKey:v28];
                }

                else
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v28]);

                  if (!v30) {
                    [v27 addObserver:v100];
                  }
LABEL_21:
                  [v13 setObject:v27 forKey:v28];
                }

                -[NSMutableSet addObject:](v14, "addObject:", v28);
                goto LABEL_23;
              }

              v29 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v28]);

              if (v29) {
                goto LABEL_21;
              }
LABEL_23:
            }

            id v24 = [v97 countByEnumeratingWithState:&v128 objects:v139 count:16];
            if (!v24)
            {
LABEL_25:
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v19 applicationInfos]);
              __int128 v124 = 0u;
              __int128 v125 = 0u;
              __int128 v126 = 0u;
              __int128 v127 = 0u;
              id v95 = v31;
              id v32 = [v31 countByEnumeratingWithState:&v124 objects:v138 count:16];
              if (v32)
              {
                id v33 = v32;
                uint64_t v34 = *(void *)v125;
                do
                {
                  for (j = 0LL; j != v33; j = (char *)j + 1)
                  {
                    if (*(void *)v125 != v34) {
                      objc_enumerationMutation(v95);
                    }
                    v36 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)j);
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleIdentifier]);
                    if (v21 == (id)3)
                    {
                      v38 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v37]);
                      if (v38)
                      {
                        [v99 removeObjectForKey:v37];
                        id v39 = sub_100082574();
                        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v41 = [v36 isCloudDemoted];
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v137 = v41;
                          *(_WORD *)&v137[4] = 2112;
                          *(void *)&v137[6] = v37;
                          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Cloud demoted state updated to %d for bundle id: %@",  buf,  0x12u);
                        }
                      }

                      else
                      {
                        id v46 = sub_100082574();
                        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)v137 = v37;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Cloud demoted state updated but no placeholder for bundle id: %@",  buf,  0xCu);
                        }
                      }
                    }

                    else if (v21 == (id)1)
                    {
                      [v99 removeObjectForKey:v37];
                      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoStore dynamicStateDataSource](v100, "dynamicStateDataSource"));
                      [v38 invalidateStateForApplicationWithBundleIdentifier:v37];
                    }

                    else
                    {
                      v42 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v37]);
                      v38 = v42;
                      if (v42)
                      {
                        [v42 removeObserver:v100];
                        [v13 removeObjectForKey:v37];
                        id v43 = sub_100082574();
                        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)v137 = v38;
                          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Update appInfo from placeholder to application on completion: %@",  buf,  0xCu);
                        }

                        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoStore dynamicStateDataSource](v100, "dynamicStateDataSource"));
                        [v45 setRecentlyUpdated:1 forApplicationWithBundleIdentifier:v37];
                      }

                      [v99 setObject:v36 forKey:v37];
                    }

                    -[NSMutableSet addObject:](v14, "addObject:", v37);
                  }

                  id v33 = [v95 countByEnumeratingWithState:&v124 objects:v138 count:16];
                }

                while (v33);
              }

              uint64_t v17 = v87;
              id v16 = v88;
              v18 = v91;
              break;
            }
          }
        }

        v18 = (char *)v18 + 1;
      }

      while (v18 != v16);
      id v16 = [obj countByEnumeratingWithState:&v132 objects:v140 count:16];
    }

    while (v16);
  }

  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v51 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472LL;
  v118[2] = sub_10001F0E4;
  v118[3] = &unk_1003D0B28;
  v118[4] = v100;
  id v52 = v47;
  v119 = v52;
  id v53 = v14;
  v120 = v53;
  id v54 = v49;
  id v121 = v54;
  v55 = v50;
  v122 = v55;
  id v56 = v51;
  v123 = v56;
  [v13 enumerateKeysAndObjectsUsingBlock:v118];
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472LL;
  v112[2] = sub_10001F270;
  v112[3] = &unk_1003D0B50;
  v112[4] = v100;
  v96 = v52;
  v113 = v96;
  v94 = v53;
  v114 = v94;
  id v57 = v54;
  id v115 = v57;
  id v58 = v55;
  v116 = v58;
  v59 = v56;
  v117 = v59;
  [v99 enumerateKeysAndObjectsUsingBlock:v112];
  queue_appInfos = v100->_queue_appInfos;
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_10001F3FC;
  v109[3] = &unk_1003D0B78;
  v61 = v59;
  v110 = v61;
  id v62 = v48;
  v63 = v61;
  id v64 = v62;
  v111 = v62;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](queue_appInfos, "enumerateKeysAndObjectsUsingBlock:", v109);
  v65 = (PBAppInfoConfiguration *)objc_claimAutoreleasedReturnValue( -[PBAppInfoStorePolicyProviding configurationForProposedAppInfos:]( v100->_policy,  "configurationForProposedAppInfos:",  v61));
  id v66 = v65;
  if (v65 == v100->_queue_configuration || -[PBAppInfoConfiguration isEqual:](v65, "isEqual:"))
  {
    id v98 = 0LL;
  }

  else
  {
    id v98 = (id)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    [v98 setObject:v66 forKey:v100->_queue_configuration];
  }

  v67 = (NSDictionary *)-[NSMutableDictionary copy](v61, "copy");
  v68 = v100->_queue_appInfos;
  v100->_queue_appInfos = v67;

  objc_storeStrong((id *)&v100->_queue_configuration, v66);
  id v69 = (NSDictionary *)[v99 copy];
  queue_applicationInfos = v100->_queue_applicationInfos;
  v100->_queue_applicationInfos = v69;

  objc_super v71 = (NSDictionary *)[v13 copy];
  queue_placeholders = v100->_queue_placeholders;
  v100->_queue_placeholders = v71;

  v73 = v96;
  if (-[NSMutableSet count](v96, "count")
    || -[NSMutableSet count](v64, "count")
    || [v57 count]
    || [v98 count])
  {
    id v86 = -[NSMutableSet copy](v96, "copy");
    v93 = v58;
    id v74 = -[NSMutableSet copy](v64, "copy");
    v89 = v63;
    id v75 = v57;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoStore tokensToObservers](v100, "tokensToObservers"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectEnumerator]);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoStore tokensToObservers](v100, "tokensToObservers"));
    v92 = v64;
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectEnumerator]);

    objc_initWeak((id *)buf, v100);
    observerQueue = (dispatch_queue_s *)v100->_observerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001F458;
    block[3] = &unk_1003D0BA0;
    objc_copyWeak(&v108, (id *)buf);
    id v102 = v86;
    id v103 = v74;
    id v104 = v75;
    id v105 = v77;
    id v106 = v98;
    id v107 = v79;
    id v81 = v79;
    id v82 = v77;
    id v83 = v75;
    id v84 = v74;
    id v85 = v86;
    dispatch_async(observerQueue, block);

    v63 = v89;
    id v58 = v93;

    id v64 = v92;
    v73 = v96;
    objc_destroyWeak(&v108);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_appInfoWithUpdatedPolicy:(BOOL)a3 updatedState:(BOOL)a4 sourceAppInfo:(id)a5 placeholder:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  [v9 isHidden];
  [v9 isEnabled];
  [v9 isRestricted];
  unint64_t v25 = (unint64_t)[v9 disabledReasons];
  if (a3)
  {
    id v11 = -[PBAppInfoStorePolicyProviding isPlaceholderHidden:](self->_policy, "isPlaceholderHidden:", v10);
    unsigned int v12 = [v9 isHidden];
    id v13 = -[PBAppInfoStorePolicyProviding isPlaceholderEnabled:reasons:]( self->_policy,  "isPlaceholderEnabled:reasons:",  v10,  &v25);
    if ((_DWORD)v13 == [v9 isEnabled]
      && (id v14 = (id)v25, v14 == [v9 disabledReasons]))
    {
      int v15 = v11 ^ v12;
    }

    else
    {
      int v15 = 1;
    }

    char v17 = v25;
    uint64_t v18 = (v25 >> 5) & 1;
    unsigned int v19 = [v9 isRestricted];
    id v20 = v9;
    id v16 = v20;
    if ((_DWORD)v18 != v19 || v15)
    {
      id v21 = [v20 mutableCopy];
      [v21 setEnabled:v13];
      [v21 setHidden:v11];
      [v21 setDisabledReasons:v25];
      [v21 setRestricted:(v17 & 0x20) != 0];
      id v22 = [v21 copy];

      id v16 = v22;
    }
  }

  else
  {
    id v16 = v9;
  }

  id v23 = [v16 copy];

  return v23;
}

- (id)_appInfoWithUpdatedPolicy:(BOOL)a3 updatedState:(BOOL)a4 sourceAppInfo:(id)a5 applicationInfo:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  unsigned int v12 = [v10 isHidden];
  unsigned int v13 = [v10 isEnabled];
  id v14 = [v10 isRestricted];
  unsigned int v15 = [v10 isSignatureTrusted];
  unint64_t v45 = (unint64_t)[v10 disabledReasons];
  if (v8)
  {
    unsigned int v16 = -[PBAppInfoStorePolicyProviding isApplicationHidden:]( self->_policy,  "isApplicationHidden:",  v11);
    unsigned int v17 = [v10 isHidden];
    unsigned int v43 = -[PBAppInfoStorePolicyProviding isApplicationEnabled:reasons:]( self->_policy,  "isApplicationEnabled:reasons:",  v11,  &v45);
    unsigned int v44 = v16;
    if (v43 == [v10 isEnabled]
      && (id v18 = (id)v45, v18 == [v10 disabledReasons]))
    {
      int v19 = v16 ^ v17;
    }

    else
    {
      int v19 = 1;
    }

    uint64_t v21 = (v45 >> 5) & 1;
    unsigned int v22 = [v10 isRestricted];
    id v42 = (id)v21;
    BOOL v41 = [v11 signatureState] == (id)4;
    unsigned int v23 = v41 ^ [v10 isSignatureTrusted];
    if ((_DWORD)v21 != v22) {
      unsigned int v23 = 1;
    }
    int v20 = v23 | v19;
  }

  else
  {
    BOOL v41 = v15;
    id v42 = v14;
    unsigned int v43 = v13;
    unsigned int v44 = v12;
    int v20 = 0;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 badgeValue]);
  id v25 = [v10 isBadgeEnabled];
  id v26 = [v10 isRecentlyUpdated];
  id v27 = [v10 isAnyTerminationAssertionInEffect];
  if (v7)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppInfoStoreDynamicStateDataSource badgeValueForApplication:]( self->_dynamicStateDataSource,  "badgeValueForApplication:",  v11));

    id v25 = -[PBAppInfoStoreDynamicStateDataSource isBadgeEnabledForApplication:]( self->_dynamicStateDataSource,  "isBadgeEnabledForApplication:",  v11);
    if ((_DWORD)v25 == [v10 isBadgeEnabled])
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v10 badgeValue]);
      if (v28 == v32)
      {
        LOBYTE(v29) = 0;
      }

      else
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 badgeValue]);
        unsigned int v29 = [v28 isEqual:v33] ^ 1;
      }
    }

    else
    {
      LOBYTE(v29) = 1;
    }

    id v26 = -[PBAppInfoStoreDynamicStateDataSource isApplicationRecentlyUpdated:]( self->_dynamicStateDataSource,  "isApplicationRecentlyUpdated:",  v11);
    unsigned int v35 = v26 ^ [v10 isRecentlyUpdated];
    id v30 = -[PBAppInfoStoreDynamicStateDataSource isAnyTerminationAssertionInEffectForApplication:]( self->_dynamicStateDataSource,  "isAnyTerminationAssertionInEffectForApplication:",  v11);
    char v36 = v30 ^ [v10 isAnyTerminationAssertionInEffect] | v35 | v29 | v20;
    id v37 = v10;
    if ((v36 & 1) == 0)
    {
      id v34 = v37;
      goto LABEL_23;
    }

    goto LABEL_21;
  }

  id v30 = v27;
  id v31 = v10;
  if (v20)
  {
    uint64_t v28 = v24;
LABEL_21:
    id v38 = [v10 mutableCopy];
    [v38 setEnabled:v43];
    [v38 setHidden:v44];
    [v38 setDisabledReasons:v45];
    [v38 setRestricted:v42];
    [v38 setSignatureTrusted:v41];
    [v38 setBadgeValue:v28];
    [v38 setBadgeEnabled:v25];
    [v38 setRecentlyUpdated:v26];
    [v38 setAnyTerminationAssertionInEffect:v30];
    id v34 = [v38 copy];

    goto LABEL_23;
  }

  id v34 = v31;
  uint64_t v28 = v24;
LABEL_23:
  id v39 = [v34 copy];

  return v39;
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (PBAppInfoStorePolicyProviding)policy
{
  return self->_policy;
}

- (PBAppInfoStoreDynamicStateDataSource)dynamicStateDataSource
{
  return self->_dynamicStateDataSource;
}

- (FBSALOToken)addApplicationObserverToken
{
  return self->_addApplicationObserverToken;
}

- (FBSALOToken)removeApplicationObserverToken
{
  return self->_removeApplicationObserverToken;
}

- (FBSALOToken)replaceApplicationObserverToken
{
  return self->_replaceApplicationObserverToken;
}

- (FBSALOToken)demoteApplicationObserverToken
{
  return self->_demoteApplicationObserverToken;
}

- (FBSALOToken)addPlaceholderObserverToken
{
  return self->_addPlaceholderObserverToken;
}

- (FBSALOToken)cancelPlaceholderObserverToken
{
  return self->_cancelPlaceholderObserverToken;
}

- (OS_dispatch_queue)barrierQueue
{
  return self->_barrierQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSMapTable)tokensToObservers
{
  return self->_tokensToObservers;
}

- (NSDictionary)queue_appInfos
{
  return self->_queue_appInfos;
}

- (NSDictionary)queue_applicationInfos
{
  return self->_queue_applicationInfos;
}

- (NSDictionary)queue_placeholders
{
  return self->_queue_placeholders;
}

- (PBAppInfoConfiguration)queue_configuration
{
  return self->_queue_configuration;
}

- (void).cxx_destruct
{
}

@end