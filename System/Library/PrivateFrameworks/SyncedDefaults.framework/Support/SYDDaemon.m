@interface SYDDaemon
+ (id)containerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5;
+ (id)defaultTestConfiguration;
+ (id)syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:(id)a3;
- (ACAccountStore)accountStore;
- (BOOL)isInitializingSyncManagers;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)syncManager:(id)a3 shouldSyncStoreWithIdentifier:(id)a4;
- (NSMutableDictionary)syncManagersByPersona;
- (NSMutableSet)clientConnections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (SYDDaemon)init;
- (SYDDaemon)initWithInitialStoreCreation:(BOOL)a3;
- (id)_queue_allSyncManagers;
- (id)allStoreIdentifiersWithError:(id *)a3;
- (id)allSyncManagers;
- (id)applicationIdentifiersForStoreIdentifiers:(id)a3;
- (id)connection:(id)a3 syncManagerForStoreID:(id)a4 error:(id *)a5;
- (id)syncManagerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5 createIfNecessary:(BOOL)a6 error:(id *)a7;
- (void)_processAccountChanges;
- (void)connectionDidInvalidate:(id)a3;
- (void)initializeKnownSyncManagers;
- (void)processAccountChanges;
- (void)registerForPeriodAnalyticsXPCActivity;
- (void)removeInvalidSyncManagers;
- (void)sendAnalyticsEventForCurrentState;
- (void)setClientConnections:(id)a3;
- (void)setInitializingSyncManagers:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSyncManagersByPersona:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
@end

@implementation SYDDaemon

- (SYDDaemon)init
{
  return -[SYDDaemon initWithInitialStoreCreation:](self, "initWithInitialStoreCreation:", 1LL);
}

- (SYDDaemon)initWithInitialStoreCreation:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SYDDaemon;
  v4 = -[SYDDaemon init](&v14, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    syncManagersByPersona = v4->_syncManagersByPersona;
    v4->_syncManagersByPersona = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.kvs.daemon.queue", v10);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v11;

    if (v3) {
      -[SYDDaemon initializeKnownSyncManagers](v4, "initializeKnownSyncManagers");
    }
  }

  return v4;
}

- (void)start
{
  id v3 = SYDGetConnectionLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002B42C();
  }

  v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.kvsd");
  -[SYDDaemon setXpcListener:](self, "setXpcListener:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon xpcListener](self, "xpcListener"));
  [v6 setDelegate:self];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon xpcListener](self, "xpcListener"));
  [v7 resume];

  -[SYDDaemon registerForPeriodAnalyticsXPCActivity](self, "registerForPeriodAnalyticsXPCActivity");
}

- (id)allSyncManagers
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10000529C;
  dispatch_queue_t v11 = sub_1000052AC;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000052B4;
  v6[3] = &unk_10004CAB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_queue_allSyncManagers
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon syncManagersByPersona](self, "syncManagersByPersona"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000053B0;
  v9[3] = &unk_10004CB00;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  return v7;
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000054CC;
  v9[3] = &unk_10004CA88;
  id v10 = v5;
  dispatch_queue_t v11 = self;
  id v7 = v5;
  dispatch_sync(v6, v9);

  return 1;
}

- (id)connection:(id)a3 syncManagerForStoreID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10000529C;
  v29 = sub_1000052AC;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10000529C;
  v23 = sub_1000052AC;
  id v24 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005770;
  v14[3] = &unk_10004CB28;
  id v11 = v9;
  id v15 = v11;
  v16 = self;
  v17 = &v19;
  v18 = &v25;
  dispatch_sync(v10, v14);

  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)connectionDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000058CC;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)processAccountChanges
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000599C;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_processAccountChanges
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  id v3 = SYDGetConnectionLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Processing account changes", buf, 2u);
  }

  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  char v63 = 0;
  *(void *)buf = 0LL;
  v55 = buf;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_10000529C;
  v58 = sub_1000052AC;
  id v59 = 0LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_10000529C;
  v52 = sub_1000052AC;
  id v53 = 0LL;
  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x2020000000LL;
  char v47 = 0;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon _queue_allSyncManagers](self, "_queue_allSyncManagers"));
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v68 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v43;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v31 = v7;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v9);
        id v11 = SYDGetConnectionLog();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = v31;
          v67 = v10;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Processing account changes for sync manager %@",  v66,  0xCu);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
        if (v13)
        {
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:]( &OBJC_CLASS___UMUserPersonaAttributes,  "personaAttributesForPersonaUniqueString:",  v13));
          if (v14) {
            goto LABEL_12;
          }
        }

        else
        {
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UMUserPersonaAttributes personaAttributesForPersonaType:]( &OBJC_CLASS___UMUserPersonaAttributes,  "personaAttributesForPersonaType:",  0LL));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v14 userPersonaUniqueString]);
          if (v14)
          {
LABEL_12:
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472LL;
            v41[2] = sub_100005FAC;
            v41[3] = &unk_10004CB50;
            v41[4] = self;
            v41[5] = v10;
            v41[6] = &v60;
            v41[7] = v46;
            v41[8] = buf;
            v41[9] = &v48;
            sub_10000D00C(v13, v41);
            goto LABEL_17;
          }
        }

        id v15 = SYDGetConnectionLog();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = v31;
          v67 = v10;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Persona doesn't exist for sync manager %@",  v66,  0xCu);
        }

LABEL_17:
        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v42 objects:v68 count:16];
    }

    while (v6);
  }

  -[SYDDaemon removeInvalidSyncManagers](self, "removeInvalidSyncManagers");
  -[SYDDaemon initializeKnownSyncManagers](self, "initializeKnownSyncManagers");
  if (*((_BYTE *)v61 + 24))
  {
    id v17 = SYDGetConnectionLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "The account did change, will notify clients and tell the sync engine",  v66,  2u);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon clientConnections](self, "clientConnections"));
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v65 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend( *(id *)(*((void *)&v37 + 1) + 8 * (void)i),  "notifyAccountDidChangeFromAccountID:toAccountID:completionHandler:",  *((void *)v55 + 5),  v49[5],  0,  v31);
        }

        id v20 = [v19 countByEnumeratingWithState:&v37 objects:v65 count:16];
      }

      while (v20);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon _queue_allSyncManagers](self, "_queue_allSyncManagers"));
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
          id v28 = SYDGetConnectionLog();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Will tell sync engine to reload the account for sync manager %@",  v66,  0xCu);
          }

          id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 engine]);
          [v30 setNeedsToReloadAccount:1];
        }

        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v64 count:16];
      }

      while (v24);
    }
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v60, 8);
}

- (BOOL)syncManager:(id)a3 shouldSyncStoreWithIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SYDStoreBundleMap sharedInstance](&OBJC_CLASS___SYDStoreBundleMap, "sharedInstance"));
  unsigned __int8 v6 = [v5 shouldSyncStoreWithIdentifier:v4];

  return v6;
}

- (id)applicationIdentifiersForStoreIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SYDStoreBundleMap sharedInstance](&OBJC_CLASS___SYDStoreBundleMap, "sharedInstance"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifiersForStoreIdentifier:v11]);

        if (v13) {
          -[NSMutableSet addObjectsFromArray:](v5, "addObjectsFromArray:", v13);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  objc_super v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006584;
  block[3] = &unk_10004CB78;
  void block[4] = self;
  id v15 = v6;
  id v22 = v15;
  v16 = v5;
  v23 = v16;
  dispatch_sync(v14, block);

  if (!-[NSMutableSet count](v16, "count"))
  {
    id v17 = SYDGetConnectionLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002B6CC();
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));

  return v19;
}

+ (id)syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:(id)a3
{
  id v3 = a3;
  if (sub_10000BF78())
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 userPersonaUniqueString]);

    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v5 = @"PersonalPersona";
  if (v3)
  {
LABEL_5:
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 testServerName]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 testDeviceID]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @"::%@::%@", v6, v7));

    id v5 = (__CFString *)v8;
  }

- (id)syncManagerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5 createIfNecessary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  if (sub_10000D1F8(a3))
  {
    id v14 = [(id)objc_opt_class(self) syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:v13];
    id v15 = (SYDSyncManager *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = SYDGetConnectionLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v65 = sub_10000B838(a3);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      *(_DWORD *)buf = 138412802;
      v98 = v15;
      __int16 v99 = 2112;
      v100 = v66;
      __int16 v101 = 2112;
      id v102 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Getting sync manager for lookup key=%@ storeType=%@ container=%@",  buf,  0x20u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon syncManagersByPersona](self, "syncManagersByPersona"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v15]);

    if (!v19)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon syncManagersByPersona](self, "syncManagersByPersona"));
      [v20 setObject:v19 forKeyedSubscript:v15];
    }

    uint64_t v21 = (SYDSyncManager *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v12]);
    id v22 = 0LL;
    if (v21 || !v8) {
      goto LABEL_55;
    }
    id v23 = SYDGetConnectionLog();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "No existing sync manager, creating now for lookupKey=%@",  buf,  0xCu);
    }

    id v25 = [(id)objc_opt_class(self) containerForStoreType:a3 containerID:v12 testConfiguration:v13];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v94 = 0LL;
    id v27 = sub_10000CC00(v12, v13, &v94);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v22 = v94;
    v85 = v28;
    if (v22)
    {
      id v29 = SYDGetConnectionLog();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10002BAA4();
      }

      if (a7)
      {
        id v22 = v22;
        uint64_t v21 = 0LL;
        *a7 = v22;
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      goto LABEL_54;
    }

    v84 = v26;
    unsigned __int8 v79 = [v28 checkResourceIsReachableAndReturnError:0];
    if ((v79 & 1) != 0) {
      goto LABEL_30;
    }
    id v93 = 0LL;
    id v33 = sub_10000CDB0(v12, &v93);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v35 = v93;
    if (v35)
    {
      id v36 = SYDGetConnectionLog();
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10002BA44();
      }

      id v28 = v85;
    }

    v82 = v35;
    id v22 = 0LL;
    if (![v34 checkResourceIsReachableAndReturnError:0])
    {
LABEL_29:

LABEL_30:
      v77 = v15;
      NSFileAttributeKey v95 = NSFileProtectionKey;
      NSFileProtectionType v96 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL,  v76));
      uint64_t v42 = objc_claimAutoreleasedReturnValue([v28 URLByDeletingLastPathComponent]);
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v89 = v22;
      v80 = (void *)v42;
      v83 = (void *)v41;
      LOBYTE(v42) = [v43 createDirectoryAtURL:v42 withIntermediateDirectories:1 attributes:v41 error:&v89];
      id v44 = v89;

      if ((v42 & 1) == 0)
      {
        id v45 = SYDGetConnectionLog();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
          sub_10002B7EC();
        }
      }

      char v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v80 path]);
      id v88 = v44;
      unsigned __int8 v49 = [v47 setAttributes:v83 ofItemAtPath:v48 error:&v88];
      id v22 = v88;

      if ((v49 & 1) == 0)
      {
        id v50 = SYDGetConnectionLog();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
          sub_10002B78C();
        }
      }

      id v52 = sub_10000CE20(a3);
      id v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v54 = -[SYDCoreDataStore initWithURL:fileProtectionType:]( objc_alloc(&OBJC_CLASS___SYDCoreDataStore),  "initWithURL:fileProtectionType:",  v85,  v53);
      if ((v79 & 1) == 0)
      {
        id v55 = SYDGetConnectionLog();
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "Will set initial account identifier",  buf,  2u);
        }

        dispatch_time_t v57 = dispatch_time(0LL, 500000000LL);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        id v59 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000071FC;
        block[3] = &unk_10004CA88;
        void block[4] = self;
        v87 = v54;
        dispatch_after(v57, v59, block);
      }

      if (!a3 && (sub_10000BF78() & 1) == 0) {
        +[SYDPlistToCoreDataMigrator migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:error:]( &OBJC_CLASS___SYDPlistToCoreDataMigrator,  "migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:error:",  v54,  1LL,  0LL);
      }
      uint64_t v21 = -[SYDSyncManager initWithContainer:coreDataStore:storeType:testConfiguration:]( objc_alloc(&OBJC_CLASS___SYDSyncManager),  "initWithContainer:coreDataStore:storeType:testConfiguration:",  v84,  v54,  a3,  v13);
      -[SYDSyncManager setDelegate:](v21, "setDelegate:", self);
      [v19 setObject:v21 forKeyedSubscript:v12];
      id v60 = SYDGetConnectionLog();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      id v15 = v77;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v98 = v21;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Created sync manager %@", buf, 0xCu);
      }

      if (!-[SYDDaemon isInitializingSyncManagers](self, "isInitializingSyncManagers"))
      {
        id v62 = SYDGetConnectionLog();
        char v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
          sub_10002B72C();
        }
      }

LABEL_52:
      __int128 v26 = v84;
LABEL_54:

LABEL_55:
      goto LABEL_56;
    }

    id v38 = SYDGetConnectionLog();
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Need to migrate old store", buf, 2u);
    }

    id v92 = 0LL;
    char v40 = sub_10000C1E0(&v92);
    id v22 = v92;
    if ((v40 & 1) != 0)
    {
LABEL_28:
      id v28 = v85;
      goto LABEL_29;
    }

    id v91 = 0LL;
    v78 = v34;
    HIDWORD(v76) = [v34 checkResourceIsReachableAndReturnError:&v91];
    id v67 = v91;
    id v90 = 0LL;
    LODWORD(v76) = [v85 checkResourceIsReachableAndReturnError:&v90];
    unint64_t v68 = (unint64_t)v90;
    if (sub_10000B7C4(v67))
    {

      uint64_t v81 = 0LL;
    }

    else
    {
      uint64_t v81 = (uint64_t)v67;
    }

    __int128 v34 = v78;
    if (sub_10000B7C4((void *)v68))
    {

      unint64_t v68 = 0LL;
    }

    if (v81 | v68)
    {
      id v69 = SYDGetConnectionLog();
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
        sub_10002B84C(v81);
      }
    }

    else
    {
      if (((HIDWORD(v76) ^ 1 | v76) & 1) != 0)
      {
        if (((HIDWORD(v76) ^ 1 | v76 ^ 1) & 1) != 0)
        {
          if (((HIDWORD(v76) | v76) & 1) != 0)
          {
            id v71 = SYDGetConnectionLog();
            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
              sub_10002B8C4();
            }
          }

          else
          {
            id v75 = SYDGetConnectionLog();
            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
              sub_10002B924();
            }
          }
        }

        else
        {
          id v74 = SYDGetConnectionLog();
          v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
            sub_10002B984();
          }
        }

        id v22 = 0LL;
        goto LABEL_28;
      }

      id v73 = SYDGetConnectionLog();
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
        sub_10002B9E4();
      }
    }

    if (a7) {
      *a7 = v22;
    }

    uint64_t v21 = 0LL;
    goto LABEL_52;
  }

  id v31 = SYDGetConnectionLog();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v98) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Not creating sync manager for store type %d because it is not supported",  buf,  8u);
  }

  uint64_t v21 = 0LL;
  if (a7) {
    *a7 = 0LL;
  }
LABEL_56:

  return v21;
}

- (void)initializeKnownSyncManagers
{
  id v3 = SYDGetMiscLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BB04();
  }

  -[SYDDaemon setInitializingSyncManagers:](self, "setInitializingSyncManagers:", 1LL);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 listAllPersonaWithAttributes]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        unint64_t v12 = (unint64_t)[v11 userPersonaType];
        if (v12 <= 6 && ((1LL << v12) & 0x45) != 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 userPersonaUniqueString]);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_1000074A4;
          v15[3] = &unk_10004CA88;
          v15[4] = v11;
          v15[5] = self;
          sub_10000D00C(v14, v15);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  -[SYDDaemon setInitializingSyncManagers:](self, "setInitializingSyncManagers:", 0LL);
}

- (void)removeInvalidSyncManagers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon syncManagersByPersona](self, "syncManagersByPersona"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000077EC;
  v10[3] = &unk_10004CB00;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v5 count])
  {
    id v6 = SYDGetConnectionLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Forgetting about sync managers for account identifiers: %@",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemon syncManagersByPersona](self, "syncManagersByPersona"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    [v8 removeObjectsForKeys:v9];
  }
}

+ (id)containerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  uint64_t v9 = v8;
  if (!a3) {
    [v8 setUseClearAssetEncryption:1];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userPersonaUniqueString]);
  [v9 setPersonaIdentifier:v11];

  if (a5 && qword_100057968 != -1) {
    dispatch_once(&qword_100057968, &stru_10004CBC0);
  }
  unint64_t v12 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v7,  v9);

  return v12;
}

+ (id)defaultTestConfiguration
{
  return  -[SYDTestConfiguration initWithTestServerName:testDeviceID:]( objc_alloc(&OBJC_CLASS___SYDTestConfiguration),  "initWithTestServerName:testDeviceID:",  @"CloudKeyValues",  @"DefaultDevice");
}

- (id)allStoreIdentifiersWithError:(id *)a3
{
  id v20 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10000529C;
  id v33 = sub_1000052AC;
  id v34 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007EA4;
  block[3] = &unk_10004CAB0;
  void block[4] = self;
  void block[5] = &v29;
  dispatch_sync(v5, block);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)v30[5];
  id v6 = 0LL;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v7)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      id v8 = 0LL;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v8);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coreDataStore", v20));
        id v23 = v9;
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allStoreIdentifiersWithError:&v23]);
        id v6 = v23;

        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 storeType]));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v13));

        if (v14)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v14]);

          unint64_t v12 = (void *)v15;
        }

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 storeType]));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, v17);

        id v8 = (char *)v8 + 1;
        uint64_t v9 = v6;
      }

      while (v7 != v8);
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
    }

    while (v7);
  }

  if (v20) {
    id *v20 = v6;
  }
  id v18 = -[NSMutableDictionary copy](v4, "copy", v20);

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (void)registerForPeriodAnalyticsXPCActivity
{
  id v3 = SYDGetAnalyticsLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BC58();
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100007F74;
  handler[3] = &unk_10004CBE8;
  handler[4] = self;
  xpc_activity_register("com.apple.kvs.periodic-analytics", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)sendAnalyticsEventForCurrentState
{
  id v3 = SYDGetAnalyticsLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BCDC();
  }

  uint64_t v56 = 0LL;
  dispatch_time_t v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  id v59 = sub_10000529C;
  id v60 = sub_1000052AC;
  id v61 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemon queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000872C;
  block[3] = &unk_10004CAB0;
  void block[4] = self;
  void block[5] = &v56;
  dispatch_sync(v5, block);

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = (id)v57[5];
  id v39 = [obj countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v52;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v36 = v6;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(obj);
        }
        id v45 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "coreDataStore", v36));
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allStoreIdentifiersWithError:0]);

        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v41 = v8;
        id v9 = [v41 countByEnumeratingWithState:&v47 objects:v70 count:16];
        if (v9)
        {
          uint64_t v44 = 0LL;
          uint64_t v42 = *(void *)v48;
          do
          {
            id v10 = 0LL;
            id v43 = v9;
            do
            {
              if (*(void *)v48 != v42) {
                objc_enumerationMutation(v41);
              }
              id v11 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v10);
              unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v45 coreDataStore]);
              id v13 = [v12 numberOfKeyValuesInStoreWithIdentifier:v11 error:0];

              id v14 = v11;
              v46 = v14;
              if ((-[__CFString hasPrefix:](v14, "hasPrefix:", @"com.apple.") & 1) == 0)
              {
                v46 = v14;
                if (arc4random_uniform(0x3E8u) != 13)
                {

                  v46 = @"ThirdPartyStore";
                }
              }

              v68[0] = @"containerIdentifier";
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v45 container]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 containerIdentifier]);
              v69[0] = v16;
              v68[1] = @"containerEnvironment";
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v45 container]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 containerID]);
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 environment]));
              v69[1] = v19;
              v69[2] = v46;
              v68[2] = @"storeIdentifier";
              v68[3] = @"keyValueCount";
              id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13));
              v69[3] = v20;
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  4LL));

              id v22 = SYDGetAnalyticsLog();
              id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v65 = v14;
                __int16 v66 = 2112;
                id v67 = v21;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Store state for %@: %@", buf, 0x16u);
              }

              AnalyticsSendEvent(@"com.apple.kvs.storeState", v21);
              v44 += (uint64_t)v13;
              id v10 = (char *)v10 + 1;
            }

            while (v43 != v10);
            id v9 = [v41 countByEnumeratingWithState:&v47 objects:v70 count:16];
          }

          while (v9);
        }

        else
        {
          uint64_t v44 = 0LL;
        }

        v62[0] = @"containerIdentifier";
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v45 container]);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 containerIdentifier]);
        v63[0] = v25;
        v62[1] = @"containerEnvironment";
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v45 container]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 containerID]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v27 environment]));
        v63[1] = v28;
        v62[2] = @"storeCount";
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v41 count]));
        v63[2] = v29;
        v62[3] = @"keyValueCount";
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v44));
        v63[3] = v30;
        v62[4] = @"databaseSizeBytes";
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v45 coreDataStore]);
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v31 fileSizeBytes]));
        v63[4] = v32;
        id v33 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v63,  v62,  5LL));

        id v34 = SYDGetAnalyticsLog();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v36;
          v65 = v33;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Container state: %@", buf, 0xCu);
        }

        AnalyticsSendEvent(@"com.apple.kvs.containerState", v33);
      }

      id v39 = [obj countByEnumeratingWithState:&v51 objects:v71 count:16];
    }

    while (v39);
  }

  _Block_object_dispose(&v56, 8);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isInitializingSyncManagers
{
  return self->_initializingSyncManagers;
}

- (void)setInitializingSyncManagers:(BOOL)a3
{
  self->_initializingSyncManagers = a3;
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableDictionary)syncManagersByPersona
{
  return self->_syncManagersByPersona;
}

- (void)setSyncManagersByPersona:(id)a3
{
}

- (void).cxx_destruct
{
}

@end