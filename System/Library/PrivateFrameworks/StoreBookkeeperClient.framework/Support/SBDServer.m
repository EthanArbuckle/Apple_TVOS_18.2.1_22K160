@interface SBDServer
+ (id)allSyncingDomains;
+ (id)server;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)serviceConnections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (SBDPushNotificationController)pushNotificationController;
- (SBDServer)init;
- (id)_init;
- (id)_pushNotificationController;
- (void)_accountsDidChangeNotification:(id)a3;
- (void)_performOnDomainSyncServiceHandlerWithBookkeeperDomain:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)_updateForAccountChangeAfterReloadingAccounts:(BOOL)a3;
- (void)_updateForSharedLibraryImportFinished;
- (void)_updatePushNotificationRegistrations;
- (void)dealloc;
- (void)pushNotificationController:(id)a3 didReceiveUpdateRequestForAccount:(id)a4 withBookkeeperDomain:(id)a5 toDomainRevision:(id)a6;
- (void)start;
- (void)synchronizeForUpdateJobForAccount:(id)a3 withDomain:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SBDServer

- (SBDServer)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"SBDServer.m" lineNumber:53 description:@"Use +sharedInstance instead"];

  return 0LL;
}

- (id)_init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SBDServer;
  v2 = -[SBDServer init](&v32, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storebookkeeperd.SBDServer", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    serviceConnections = v2->_serviceConnections;
    v2->_serviceConnections = (NSArray *)&__NSArray0__struct;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    systemSyncHandlers = v2->_systemSyncHandlers;
    v2->_systemSyncHandlers = (NSMutableArray *)v6;

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v8 = [(id)objc_opt_class(v2) allSyncingDomains];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v29;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = -[SBDDomainSyncServiceHandler initWithDomain:]( objc_alloc(&OBJC_CLASS___SBDDomainSyncServiceHandler),  "initWithDomain:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)v12));
          -[NSMutableArray addObject:](v2->_systemSyncHandlers, "addObject:", v13);

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v10);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLSessionManager sharedManager](&OBJC_CLASS___SSURLSessionManager, "sharedManager"));
    [v14 setHttpArchiveBufferSize:0];

    -[SBDServer _updatePushNotificationRegistrations](v2, "_updatePushNotificationRegistrations");
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x3032000000LL;
    v26[3] = sub_100003DF8;
    v26[4] = sub_100003E08;
    v15 = v2;
    v27 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v15 selector:"_accountsDidChangeNotification:" name:ACDAccountStoreDidChangeNotification object:0];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100003E10;
    v25[3] = &unk_10001C7C0;
    v25[4] = v26;
    uint64_t v18 = objc_claimAutoreleasedReturnValue( [v17 addObserverForName:ICActiveUserIdentityDidChangeNotification object:0 queue:0 usingBlock:v25]);
    id SBKStoreAccountChangedNotificationObserver = v15->_SBKStoreAccountChangedNotificationObserver;
    v15->_id SBKStoreAccountChangedNotificationObserver = (id)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100003E24;
    v24[3] = &unk_10001C7C0;
    v24[4] = v26;
    uint64_t v21 = objc_claimAutoreleasedReturnValue( [v20 addObserverForName:ML3MusicLibraryImportDidFinishNotification object:0 queue:0 usingBlock:v24]);
    id SBKSBKSharedMusicLibraryImportFinishedObserver = v15->_SBKSBKSharedMusicLibraryImportFinishedObserver;
    v15->_id SBKSBKSharedMusicLibraryImportFinishedObserver = (id)v21;

    +[SBDJobScheduler initializeBackgroundTaskAgentWithJobRunner:]( &OBJC_CLASS___SBDJobScheduler,  "initializeBackgroundTaskAgentWithJobRunner:",  &stru_10001C800);
    _Block_object_dispose(v26, 8);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:ACDAccountStoreDidChangeNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self->_SBKStoreAccountChangedNotificationObserver];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self->_SBKSBKSharedMusicLibraryImportFinishedObserver];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray valueForKey:](self->_serviceConnections, "valueForKey:", @"XPCConnection"));
  [v6 makeObjectsPerformSelector:"invalidate"];

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  -[NSXPCListener suspend](self->_xpcListener, "suspend");
  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", 0LL);
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SBDServer;
  -[SBDServer dealloc](&v8, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SBDPlaybackPositionService serviceForXPCConnection:]( &OBJC_CLASS___SBDPlaybackPositionService,  "serviceForXPCConnection:",  a4));
  if (v5)
  {
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_serviceConnections, "arrayByAddingObject:", v5));
    serviceConnections = self->_serviceConnections;
    self->_serviceConnections = v6;

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 XPCConnection]);
    [v8 resume];
  }

  return v5 != 0LL;
}

- (void)start
{
  if (!self->_xpcListener)
  {
    dispatch_queue_t v3 = (NSXPCListener *)+[SBCPlaybackPositionService newListener]( &OBJC_CLASS___SBCPlaybackPositionService,  "newListener");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    v5 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Starting service 'SBCPlaybackPositionService'",  v6,  2u);
    }

    -[NSXPCListener resume](self->_xpcListener, "resume");
    notify_post("com.apple.storebookkeeperd.launched");
  }

- (id)_pushNotificationController
{
  pushNotificationController = self->_pushNotificationController;
  if (!pushNotificationController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SBDPushNotificationController);
    v5 = self->_pushNotificationController;
    self->_pushNotificationController = v4;

    pushNotificationController = self->_pushNotificationController;
  }

  return pushNotificationController;
}

- (void)_updateForSharedLibraryImportFinished
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003D0C;
  block[3] = &unk_10001D2C8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateForAccountChangeAfterReloadingAccounts:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000036CC;
  v3[3] = &unk_10001C890;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(&_dispatch_main_q, v3);
}

- (void)_accountsDidChangeNotification:(id)a3
{
}

- (void)pushNotificationController:(id)a3 didReceiveUpdateRequestForAccount:(id)a4 withBookkeeperDomain:(id)a5 toDomainRevision:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003638;
  v10[3] = &unk_10001C8B8;
  id v11 = a6;
  id v9 = v11;
  -[SBDServer _performOnDomainSyncServiceHandlerWithBookkeeperDomain:forAccountWithIdentifier:completion:]( self,  "_performOnDomainSyncServiceHandlerWithBookkeeperDomain:forAccountWithIdentifier:completion:",  a5,  a4,  v10);
}

- (void)synchronizeForUpdateJobForAccount:(id)a3 withDomain:(id)a4 withCompletionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000035A4;
  v9[3] = &unk_10001C8E0;
  id v10 = a5;
  id v8 = v10;
  -[SBDServer _performOnDomainSyncServiceHandlerWithBookkeeperDomain:forAccountWithIdentifier:completion:]( self,  "_performOnDomainSyncServiceHandlerWithBookkeeperDomain:forAccountWithIdentifier:completion:",  a4,  a3,  v9);
}

- (void)_performOnDomainSyncServiceHandlerWithBookkeeperDomain:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v37 = (void (**)(id, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentitiesForManageableAccountsWithError:0]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    uint64_t v31 = *(void *)v45;
    id v32 = v8;
    do
    {
      v14 = 0LL;
      id v34 = v12;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountDSID]);
        id v17 = [v16 integerValue];
        id v18 = [v8 integerValue];

        if (v17 == v18)
        {
          v36 = v14;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v15));
          v38 = (void *)objc_claimAutoreleasedReturnValue([v19 databasePath]);

          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          v39 = self->_systemSyncHandlers;
          id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v40,  v48,  16LL);
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v41;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(v39);
                }
                v24 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v24 domain]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v25 domainIdentifier]);
                if ([v26 isEqualToString:v7])
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v24 domain]);
                  id v28 = v7;
                  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 foreignDatabasePath]);
                  unsigned int v30 = [v29 isEqualToString:v38];

                  id v7 = v28;
                  if (v30) {
                    v37[2](v37, v24);
                  }
                }

                else
                {
                }
              }

              id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v40,  v48,  16LL);
            }

            while (v21);
          }

          uint64_t v13 = v31;
          id v8 = v32;
          id v12 = v34;
          v14 = v36;
        }

        v14 = (char *)v14 + 1;
      }

      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v12);
  }
}

- (void)_updatePushNotificationRegistrations
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v4 = self->_systemSyncHandlers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v8), "domain", (void)v13));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 domainIdentifier]);

        [v3 addObject:v10];
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SBDServer _pushNotificationController](self, "_pushNotificationController"));
        [v11 setDelegate:self forBookkeeperDomain:v10];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SBDServer _pushNotificationController](self, "_pushNotificationController"));
  [v12 setEnabledDomains:v3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (SBDPushNotificationController)pushNotificationController
{
  return self->_pushNotificationController;
}

- (NSArray)serviceConnections
{
  return self->_serviceConnections;
}

- (void).cxx_destruct
{
}

+ (id)server
{
  if (qword_100023860 != -1) {
    dispatch_once(&qword_100023860, &stru_10001C798);
  }
  return (id)qword_100023858;
}

+ (id)allSyncingDomains
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v20 = 0LL;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userIdentitiesForManageableAccountsWithError:&v20]);
  id v4 = v20;

  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "SBCPlaybackPositionDomain: Error fetching user identities. err=%@",  buf,  0xCu);
    }

    id v6 = &__NSArray0__struct;
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i)));
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 databasePath]);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SBCPlaybackPositionDomain domainForSyncingMusicLibraryWithLibraryPath:]( &OBJC_CLASS___SBCPlaybackPositionDomain,  "domainForSyncingMusicLibraryWithLibraryPath:",  v13));
          -[os_log_s addObject:](v5, "addObject:", v14);
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v9);
    }

    id v6 = -[os_log_s copy](v5, "copy");
    id v4 = 0LL;
  }

  return v6;
}

@end