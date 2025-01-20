@interface CSDCallProviderManager
+ (id)_providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:(id)a3;
- (BOOL)appShouldUseDeprecatedCallingIntents:(id)a3;
- (BOOL)validateUserIntentForCallSource:(id)a3;
- (CSDCallProviderManager)init;
- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4;
- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5;
- (CSDCallProviderManagerDataSource)dataSource;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities;
- (CSDUserIntentManager)userIntentManager;
- (NSDictionary)providersByIdentifier;
- (NSMapTable)delegateToQueue;
- (NSMutableDictionary)localProvidersByIdentifier;
- (NSMutableDictionary)pairedHostDeviceProvidersByIdentifier;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_defaultAppProviderForRemoteClients:(BOOL)a3;
- (id)_providersByIdentifierForRemoteClients:(BOOL)a3;
- (id)_providersPassingTest:(id)a3 forRemoteClients:(BOOL)a4;
- (id)_sortedProvidersForRemoteClients:(BOOL)a3;
- (id)defaultAppProviderForRemoteClients:(BOOL)a3;
- (id)defaultAppRelayProviderToUse;
- (id)localProvidersByIdentifierForRemoteClients:(BOOL)a3;
- (id)pairedHostDeviceProvidersByIdentifierForRemoteClients:(BOOL)a3;
- (id)providersByIdentifierForRemoteClients:(BOOL)a3;
- (id)sortedProvidersForRemoteClients:(BOOL)a3;
- (id)uniqueRingtoneSoundLinkFilenameWithOriginalFilename:(id)a3;
- (void)_donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)_unregisterUninstalledProvidersAndNotify:(BOOL)a3;
- (void)_updateProvidersByIdentifierAndNotify:(BOOL)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)installedProvidersChangedForDataSource:(id)a3;
- (void)launchAppForDialRequest:(id)a3 completion:(id)a4;
- (void)registerLocalProvider:(id)a3;
- (void)registerPairedHostDeviceProviders:(id)a3;
- (void)relayCallingStateChangedForDataSource:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)retrieveSavedProvidersByIdentifierAndNotify:(BOOL)a3 unregister:(BOOL)a4;
- (void)setDelegateToQueue:(id)a3;
- (void)setProtectedAppsUtilities:(id)a3;
- (void)setProvidersByIdentifier:(id)a3;
@end

@implementation CSDCallProviderManager

- (CSDCallProviderManager)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callprovidermanager", 0LL);
  v4 = -[CSDCallProviderManagerDataSource initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDCallProviderManagerDataSource),  "initWithSerialQueue:",  v3);
  v5 = -[CSDCallProviderManager initWithDataSource:serialQueue:](self, "initWithDataSource:serialQueue:", v4, v3);

  return v5;
}

- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v9 = -[CSDCallProviderManager initWithDataSource:serialQueue:featureFlags:]( self,  "initWithDataSource:serialQueue:featureFlags:",  v7,  v6,  v8);

  return v9;
}

- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CSDCallProviderManager;
  v12 = -[CSDCallProviderManager init](&v30, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_dataSource, a3);
    -[CSDCallProviderManagerDataSource setDelegate:](v13->_dataSource, "setDelegate:", v13);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    delegateToQueue = v13->_delegateToQueue;
    v13->_delegateToQueue = (NSMapTable *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    localProvidersByIdentifier = v13->_localProvidersByIdentifier;
    v13->_localProvidersByIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pairedHostDeviceProvidersByIdentifier = v13->_pairedHostDeviceProvidersByIdentifier;
    v13->_pairedHostDeviceProvidersByIdentifier = (NSMutableDictionary *)v18;

    providersByIdentifier = v13->_providersByIdentifier;
    v13->_providersByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    v21 = -[CSDUserIntentManager initWithQueue:](objc_alloc(&OBJC_CLASS___CSDUserIntentManager), "initWithQueue:", v10);
    userIntentManager = v13->_userIntentManager;
    v13->_userIntentManager = v21;

    objc_storeStrong((id *)&v13->_featureFlags, a5);
    objc_initWeak(&location, v13);
    queue = (dispatch_queue_s *)v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001406A8;
    block[3] = &unk_1003D98A0;
    v24 = v13;
    v27 = v24;
    objc_copyWeak(&v28, &location);
    dispatch_sync(queue, block);
    -[CSDCallProviderManager retrieveSavedProvidersByIdentifierAndNotify:unregister:]( v24,  "retrieveSavedProvidersByIdentifierAndNotify:unregister:",  0LL,  1LL);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)retrieveSavedProvidersByIdentifierAndNotify:(BOOL)a3 unregister:(BOOL)a4
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100140878;
  v8[3] = &unk_1003DB0B8;
  v8[4] = self;
  BOOL v9 = a4;
  BOOL v10 = a3;
  dispatch_async(v7, v8);
}

- (void)_updateProvidersByIdentifierAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager dataSource](self, "dataSource"));
  if ([v7 isRelayCallingGuaranteed])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManager pairedHostDeviceProvidersByIdentifier]( self,  "pairedHostDeviceProvidersByIdentifier"));
    id v9 = [v8 count];

    if (!v9) {
      goto LABEL_5;
    }
    id v7 = v6;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManager pairedHostDeviceProvidersByIdentifier]( self,  "pairedHostDeviceProvidersByIdentifier"));
  }

LABEL_5:
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating current providers to %@", buf, 0xCu);
  }

  -[CSDCallProviderManager setProvidersByIdentifier:](self, "setProvidersByIdentifier:", v6);
  if (v3)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager delegateToQueue](self, "delegateToQueue"));
    id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v16]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100140DE0;
          block[3] = &unk_1003D7758;
          void block[4] = v16;
          block[5] = self;
          dispatch_async(v18, block);
        }

        id v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);
    }
  }
}

- (void)_unregisterUninstalledProvidersAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v9 = [v8 copy];
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        if (([v14 isSystemProvider] & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager dataSource](self, "dataSource"));
          unsigned int v16 = [v15 isProviderInstalled:v14];

          if (!v16) {
            continue;
          }
        }

        [v8 removeObject:v14];
      }

      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v11);
  }

  if ([v8 count])
  {
    BOOL v29 = v3;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          __int128 v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
          id v23 = sub_1001704C4();
          __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Unregistering provider because its application is no longer installed: %@",  buf,  0xCu);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
          [v25 setObject:0 forKeyedSubscript:v26];
        }

        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }

      while (v19);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager dataSource](self, "dataSource"));
    [v28 setRegisteredLocalProvidersByIdentifier:v27];

    -[CSDCallProviderManager _updateProvidersByIdentifierAndNotify:]( self,  "_updateProvidersByIdentifierAndNotify:",  v29);
  }
}

- (id)uniqueRingtoneSoundLinkFilenameWithOriginalFilename:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v3));

  return v6;
}

+ (id)_providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v10 supportsCurrentPlatform])
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

- (void)_donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Donating user intent to call provider with identifier: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager userIntentManager](self, "userIntentManager"));
  [v8 donateUserIntentForCallProviderIdentifier:v4];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014146C;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141544;
  block[3] = &unk_1003D7758;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (id)providersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10014166C;
  __int128 v14 = sub_10014167C;
  id v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141684;
  block[3] = &unk_1003D9C68;
  void block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_providersByIdentifierForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    id v7 = (void *)objc_opt_class(self, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager providersByIdentifier](self, "providersByIdentifier"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 _providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:v8]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager providersByIdentifier](self, "providersByIdentifier"));
    id v9 = [v8 copy];
  }

  uint64_t v10 = v9;

  return v10;
}

- (id)localProvidersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10014166C;
  __int128 v14 = sub_10014167C;
  id v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141838;
  block[3] = &unk_1003D9C68;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)pairedHostDeviceProvidersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10014166C;
  __int128 v14 = sub_10014167C;
  id v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001419A4;
  block[3] = &unk_1003D9C68;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)sortedProvidersForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10014166C;
  __int128 v14 = sub_10014167C;
  id v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141B10;
  block[3] = &unk_1003D9C68;
  void block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_sortedProvidersForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManager _defaultAppProviderForRemoteClients:]( self,  "_defaultAppProviderForRemoteClients:",  v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManager _providersByIdentifierForRemoteClients:]( self,  "_providersByIdentifierForRemoteClients:",  v3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:&stru_1003DB0F8]);
  id v10 = [v9 mutableCopy];

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100141CE4;
    v14[3] = &unk_1003DB120;
    id v11 = v6;
    id v15 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 indexesOfObjectsPassingTest:v14]);
    [v10 removeObjectsAtIndexes:v12];
    [v10 insertObject:v11 atIndex:0];
  }

  return v10;
}

- (id)defaultAppProviderForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int128 v16 = sub_10014166C;
  __int128 v17 = sub_10014167C;
  id v18 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141E74;
  block[3] = &unk_1003D9C68;
  void block[4] = self;
  void block[5] = &v13;
  BOOL v12 = v3;
  dispatch_sync(v5, block);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v14[5];
    *(_DWORD *)buf = 67109378;
    BOOL v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Fetched default app provider forRemoteClient %d %@",  buf,  0x12u);
  }

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)_defaultAppProviderForRemoteClients:(BOOL)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"com.apple.coretelephony"]);

  return v6;
}

- (void)registerLocalProvider:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100141FA4;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)registerPairedHostDeviceProviders:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001424D4;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001427E8;
  block[3] = &unk_1003D7758;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (BOOL)validateUserIntentForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001428D8;
  block[3] = &unk_1003D9650;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001429DC;
  v11[3] = &unk_1003D82B0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (BOOL)appShouldUseDeprecatedCallingIntents:(id)a3
{
  return 0;
}

- (id)_providersPassingTest:(id)a3 forRemoteClients:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (unsigned int (**)(id, void))a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManager _providersByIdentifierForRemoteClients:]( self,  "_providersByIdentifierForRemoteClients:",  v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);
  id v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        if (v6[2](v6, v16)) {
          -[NSMutableArray addObject:](v10, "addObject:", v16, (void)v19);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  id v17 = -[NSMutableArray copy](v10, "copy");
  return v17;
}

- (id)defaultAppRelayProviderToUse
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager localProvidersByIdentifier](self, "localProvidersByIdentifier"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"com.apple.coretelephony"]);

  else {
    id v4 = v3;
  }

  return v4;
}

- (void)relayCallingStateChangedForDataSource:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  -[CSDCallProviderManager _updateProvidersByIdentifierAndNotify:](self, "_updateProvidersByIdentifierAndNotify:", 1LL);
}

- (void)installedProvidersChangedForDataSource:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  -[CSDCallProviderManager _unregisterUninstalledProvidersAndNotify:]( self,  "_unregisterUninstalledProvidersAndNotify:",  1LL);
}

- (CSDUserIntentManager)userIntentManager
{
  return self->_userIntentManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableDictionary)localProvidersByIdentifier
{
  return self->_localProvidersByIdentifier;
}

- (NSMutableDictionary)pairedHostDeviceProvidersByIdentifier
{
  return self->_pairedHostDeviceProvidersByIdentifier;
}

- (NSDictionary)providersByIdentifier
{
  return self->_providersByIdentifier;
}

- (void)setProvidersByIdentifier:(id)a3
{
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)setDelegateToQueue:(id)a3
{
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities
{
  return self->_protectedAppsUtilities;
}

- (void)setProtectedAppsUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end