@interface SoftwareUpdateListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SoftwareUpdateListener)init;
- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3;
- (void)getManagedUpdatesWithCompletionBlock:(id)a3;
- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesWithCompletionBlock:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)migrateUpdatesStoreWithCompletionBlock:(id)a3;
- (void)refreshUpdateCountWithCompletionBlock:(id)a3;
- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3;
- (void)removeUpdateBulletins;
- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)showApplicationUpdatesBulletin;
- (void)updateAllWithJobResults:(id)a3;
- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4;
@end

@implementation SoftwareUpdateListener

- (SoftwareUpdateListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SoftwareUpdateListener;
  return -[SoftwareUpdateListener init](&v3, "init");
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  objc_super v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = ASDLogHandleForCategory(40LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v6));
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "clearExpiredUpdateHistoryWithCompletionBlock for client: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  if (v3) {
    v3[2](v3, 1LL, 0LL);
  }
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v11) = 0;
  uint64_t v4 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  0LL,  v3,  1LL,  0LL,  v11,  0LL);

  uint64_t v5 = ASDLogHandleForCategory(40LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v4, "logKey"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] getUpdatesWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v10 getUpdatesWithContext:v4];
}

- (void)getUpdatesMetricsWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = (void *)objc_opt_new(&OBJC_CLASS___ASDSoftwareUpdateMetrics);
  [v4 setUsingModernUpdatesCheck:1];
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2050000000LL;
  uint64_t v5 = (void *)qword_100462620;
  uint64_t v25 = qword_100462620;
  if (!qword_100462620)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1002DDDA4;
    v21[3] = &unk_1003ECDF8;
    v21[4] = &v22;
    sub_1002DDDA4((uint64_t)v21);
    uint64_t v5 = (void *)v23[3];
  }

  id v6 = v5;
  _Block_object_dispose(&v22, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedScheduler]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v16 submittedActivities]);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        unsigned int v13 = [v12 hasPrefix:@"com.apple.appstored.AutoUpdates"];

        if (v13)
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue([v11 predictedOptimalStartDate]);
          goto LABEL_13;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v11) = 0;
  uint64_t v4 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  0LL,  v3,  0LL,  0LL,  v11,  0LL);

  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v4, "logKey"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138412546;
    unsigned int v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] getUpdatesWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v10 getUpdatesWithContext:v4];
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v11) = 0;
  uint64_t v4 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  0LL,  v3,  0LL,  1LL,  v11,  0LL);

  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v4, "logKey"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138412546;
    unsigned int v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] getManagedUpdatesWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v10 getUpdatesWithContext:v4];
}

- (void)hideApplicationBadgeForPendingUpdates
{
  uint64_t v2 = ASDLogHandleForCategory(40LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v4));
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "hideApplicationBadgeForPendingUpdates for client: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v6 hidePendingUpdatesBadge];
}

- (void)migrateUpdatesStoreWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = ASDLogHandleForCategory(40LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "migrateUpdatesStoreWithCompletionBlock", v6, 2u);
  }

  if (v3) {
    v3[2](v3, 1LL, 0LL);
  }
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = ASDLogHandleForCategory(40LL);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138543618;
    __int128 v17 = v5;
    __int16 v18 = 2114;
    __int128 v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ refreshUpdateCountWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002DC7B8;
  v13[3] = &unk_1003F1F00;
  id v14 = v5;
  id v15 = v3;
  id v11 = v3;
  id v12 = v5;
  [v10 refreshUpdateCountWithRequestToken:v12 replyHandler:v13];
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a4;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v7));
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "refreshUpdatesWithCompletionBlock for client: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  if (v4) {
    v4[2](v4, 1LL, 0LL);
  }
}

- (void)showApplicationUpdatesBulletin
{
  uint64_t v2 = ASDLogHandleForCategory(40LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v4));
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "showApplicationUpdatesBanner for client: %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)showApplicationBadgeForPendingUpdates
{
  uint64_t v2 = ASDLogHandleForCategory(40LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v4));
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "showApplicationBadgeForPendingUpdates for client: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v6 showPendingUpdatesBadge];
}

- (void)removeUpdateBulletins
{
  uint64_t v2 = ASDLogHandleForCategory(40LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v4));
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "removeUpdateBulletins for client: %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = ASDLogHandleForCategory(40LL);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id Property = objc_getProperty(v5, v8, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = Property;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v11));
    *(_DWORD *)buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] reloadFromServerInBackgroundWithCompletionBlock from client: %{public}@",  buf,  0x16u);
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002DCE08;
  v16[3] = &unk_1003F1F28;
  id v17 = v5;
  id v18 = v3;
  id v14 = v3;
  id v15 = v5;
  [v13 reloadFromServerInBackgroundWithToken:v15 completionBlock:v16];
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v11) = 1;
  uint64_t v4 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  0LL,  v3,  0LL,  0LL,  v11,  0LL);

  uint64_t v5 = ASDLogHandleForCategory(9LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v4, "logKey"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138412546;
    unsigned int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] reloadFromServerWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v10 reloadUpdatesWithContext:v4];
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v11) = 0;
  uint64_t v4 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  2LL,  0LL,  0LL,  v3,  0LL,  1LL,  v11,  0LL);

  uint64_t v5 = ASDLogHandleForCategory(40LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v4, "logKey"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    *(_DWORD *)buf = 138412546;
    unsigned int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] reloadManagedWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v10 getUpdatesWithContext:v4];
}

- (void)updateAllWithJobResults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v7));
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] updateAllWithJobResults for client: %{public}@",  buf,  0x16u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002DD384;
  v12[3] = &unk_1003F1F50;
  unsigned int v13 = v4;
  id v14 = v3;
  id v10 = v3;
  uint64_t v11 = v4;
  [v9 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v12];
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = ASDLogHandleForCategory(40LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v11));
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ updateAllWithOrder for client: %{public}@",  buf,  0x16u);
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002DD620;
  v16[3] = &unk_1003F1F50;
  id v17 = v8;
  id v18 = v5;
  id v14 = v5;
  id v15 = v8;
  [v13 updateAllWithOrder:v6 requestToken:v15 replyHandler:v16];
}

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, BOOL))a3;
  uint64_t v4 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = ASDLogHandleForCategory(40LL);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v8));
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    unsigned int v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ shouldUseModernUpdatesWithCompletionBlock for client: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  v3[2](v3, +[UpdatesManager shouldUseModernUpdates](&OBJC_CLASS___UpdatesManager, "shouldUseModernUpdates"));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  if (sub_1001D2660((uint64_t)self, v5, @"com.apple.appstored.private")
    || sub_1001D2660((uint64_t)self, v5, @"com.apple.appstored.install-apps"))
  {
    goto LABEL_6;
  }

  uint64_t v7 = ASDLogHandleForCategory(40LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Treating %i as legacy client", buf, 8u);
  }

  if (sub_1001D2660((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_6:
    id v9 = v5;
    int v10 = v9;
    if (self)
    {
      unsigned int v11 = [v9 processIdentifier];
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[XPCClient clientIDForConnection:](&OBJC_CLASS___XPCClient, "clientIDForConnection:", v10));
      uint64_t v13 = ASDLogHandleForCategory(40LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v11;
        LOWORD(v25) = 2114;
        *(void *)((char *)&v25 + 2) = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got connection from pid: %i client: %{public}@",  buf,  0x12u);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDSoftwareUpdateProtocol));
      [v10 setExportedInterface:v15];
      [v10 setExportedObject:self];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v10);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1002DDBC4;
      v20[3] = &unk_1003F1F70;
      unsigned int v21 = v11;
      [v10 setInterruptionHandler:v20];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&__int128 v25 = 3221225472LL;
      *((void *)&v25 + 1) = sub_1002DDC70;
      v26 = &unk_1003E9E88;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      unsigned int v29 = v11;
      [v10 setInvalidationHandler:buf];
      [v10 resume];
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

    BOOL v16 = 1;
  }

  else
  {
    uint64_t v18 = ASDLogHandleForCategory(40LL);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Connection denied for pid: %i for non entitled client",  buf,  8u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

@end