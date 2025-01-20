@interface UAUserActivityClientProcessesController
- (BKSApplicationStateMonitor)appStateMonitor;
- (BOOL)addAdditionalUserActivityAdvertisableItems:(id)a3;
- (BOOL)clientIsActive:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)registerAsProxyApplication:(id)a3 forPid:(int)a4;
- (BOOL)removeAdditionalUserActivityAdvertisableItems:(id)a3;
- (BOOL)resume;
- (BOOL)suspend;
- (NSArray)DEBUG_lastEligibleItems;
- (NSArray)userActivityClients;
- (NSDate)ignoreLockScreenUntil;
- (NSMutableDictionary)proxiedClients;
- (NSSet)additionalUserActivityAdvertisableItems;
- (NSSet)visibleUserActivityClients;
- (NSString)frontBundleID;
- (UALocalItemReceiver)localReceiver;
- (UAUserActivityClientProcessesController)initWithManager:(id)a3 name:(id)a4;
- (id)advertiseableItemForBundleIdentifier:(id)a3;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)recentEligibleItemsInOrder:(double)a3;
- (id)statusString;
- (id)userActivityClientForBundleIdentifier:(id)a3;
- (id)userActivityClientForPID:(int)a3;
- (id)userActivityClientForUUID:(id)a3;
- (id)userActivityInfoForUUID:(id)a3;
- (void)addUserActivityClient:(id)a3;
- (void)dealloc;
- (void)handleAppStateMonitorUpdate:(id)a3;
- (void)removeClientActivityClient:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setFrontBundleID:(id)a3;
- (void)setIgnoreLockScreenUntil:(id)a3;
- (void)setLocalReceiver:(id)a3;
@end

@implementation UAUserActivityClientProcessesController

- (UAUserActivityClientProcessesController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___UAUserActivityClientProcessesController;
  v8 = -[UAClientController initWithManager:name:](&v37, "initWithManager:name:", v6, v7);
  if (v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v10 = UActivityCreationXPCServiceName();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = -[NSXPCListener initWithMachServiceName:](v9, "initWithMachServiceName:", v11);
    activityManagerListener = v8->_activityManagerListener;
    v8->_activityManagerListener = v12;

    -[NSXPCListener setDelegate:](v8->_activityManagerListener, "setDelegate:", v8);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    userActivityClientsByPID = v8->_userActivityClientsByPID;
    v8->_userActivityClientsByPID = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v8->_clients;
    v8->_clients = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    userActivityClientsByBundleID = v8->_userActivityClientsByBundleID;
    v8->_userActivityClientsByBundleID = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    visibleUserActivityClients = v8->_visibleUserActivityClients;
    v8->_visibleUserActivityClients = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController appStateMonitor](v8, "appStateMonitor"));
    if (!v22)
    {
      v23 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
      -[UAUserActivityClientProcessesController setAppStateMonitor:](v8, "setAppStateMonitor:", v23);

      objc_initWeak(&location, v8);
      objc_copyWeak(&v35, &location);
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController appStateMonitor]( v8,  "appStateMonitor",  _NSConcreteStackBlock,  3221225472LL,  sub_10003BFC0,  &unk_1000BDB08));
      [v24 setHandler:&v34];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    additionalUserActivityAdvertisableItems = v8->_additionalUserActivityAdvertisableItems;
    v8->_additionalUserActivityAdvertisableItems = (NSMutableSet *)v25;

    v27 = objc_alloc(&OBJC_CLASS___UALocalItemReceiver);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
    v29 = -[UALocalItemReceiver initWithManager:controller:](v27, "initWithManager:controller:", v28, v8);
    localReceiver = v8->_localReceiver;
    v8->_localReceiver = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController localReceiver](v8, "localReceiver"));
    [v31 addReceiver:v32];
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController localReceiver](self, "localReceiver"));
  [v3 removeReceiver:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UAUserActivityClientProcessesController;
  -[UAUserActivityClientProcessesController dealloc](&v5, "dealloc");
}

- (BOOL)suspend
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UAUserActivityClientProcessesController;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v6, "suspend");
  if (v3)
  {
    -[NSXPCListener suspend](self->_activityManagerListener, "suspend");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController localReceiver](self, "localReceiver"));
    [v4 suspend];
  }

  return v3;
}

- (BOOL)resume
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UAUserActivityClientProcessesController;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v6, "resume");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController localReceiver](self, "localReceiver"));
    [v4 resume];

    -[NSXPCListener resume](self->_activityManagerListener, "resume");
  }

  return v3;
}

- (void)addUserActivityClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
    int v7 = [v6 pid];

    if (v7 >= 1)
    {
      v8 = self;
      objc_sync_enter(v8);
      os_log_t v9 = sub_100039584(0LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
        *(_DWORD *)buf = 138478339;
        v26 = v5;
        __int16 v27 = 2114;
        v28 = v11;
        __int16 v29 = 2113;
        v30 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Adding client %{private}@, %{public}@, bundleID=%{private}@ to known userActivityClients.",  buf,  0x20u);
      }

      userActivityClientsByPID = v8->_userActivityClientsByPID;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (int)[v14 pid]));
      -[NSMutableDictionary setObject:forKey:](userActivityClientsByPID, "setObject:forKey:", v5, v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      if (v16)
      {
        userActivityClientsByBundleID = v8->_userActivityClientsByBundleID;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
        -[NSMutableDictionary setObject:forKey:](userActivityClientsByBundleID, "setObject:forKey:", v5, v18);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController appStateMonitor](v8, "appStateMonitor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
      id v21 = [v20 pid];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10003C518;
      v22[3] = &unk_1000BDB30;
      id v23 = v5;
      v24 = v8;
      [v19 applicationInfoForPID:v21 completion:v22];

      objc_sync_exit(v8);
    }
  }
}

- (BOOL)clientIsActive:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleIdentifier]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  return v6;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](self, "userActivityClients"));
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v24 + 1) + 8 * (void)i) userActivityAdvertisableItemByUUID:v4]);
        if (v10)
        {
LABEL_19:
          v18 = v10;
          goto LABEL_20;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController additionalUserActivityAdvertisableItems]( self,  "additionalUserActivityAdvertisableItems",  0LL));
  id v11 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v5);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
        unsigned int v17 = [v16 isEqual:v4];

        if (v17)
        {
          id v10 = v15;
          goto LABEL_19;
        }
      }

      id v12 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v18 = 0LL;
LABEL_20:

  return v18;
}

- (NSArray)userActivityClients
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_userActivityClientsByPID, "allValues"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSSet)visibleUserActivityClients
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_visibleUserActivityClients, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (id)userActivityClientForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](v5, "userActivityClients", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifiers]);
          unsigned int v12 = [v11 containsObject:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)userActivityClientForPID:(int)a3
{
  if (a3 < 2)
  {
    id v7 = 0LL;
  }

  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    userActivityClientsByPID = v4->_userActivityClientsByPID;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](userActivityClientsByPID, "objectForKey:", v6));

    objc_sync_exit(v4);
  }

  return v7;
}

- (NSSet)additionalUserActivityAdvertisableItems
{
  id v3 = self->_additionalUserActivityAdvertisableItems;
  objc_sync_enter(v3);
  id v4 = -[NSMutableSet copy](self->_additionalUserActivityAdvertisableItems, "copy");
  objc_sync_exit(v3);

  return (NSSet *)v4;
}

- (BOOL)addAdditionalUserActivityAdvertisableItems:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self->_additionalUserActivityAdvertisableItems;
    objc_sync_enter(v5);
    unsigned __int8 v6 = -[NSMutableSet containsObject:]( self->_additionalUserActivityAdvertisableItems,  "containsObject:",  v4);
    -[NSMutableSet addObject:](self->_additionalUserActivityAdvertisableItems, "addObject:", v4);
    char v7 = v6 ^ 1;
    objc_sync_exit(v5);
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)removeAdditionalUserActivityAdvertisableItems:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self->_additionalUserActivityAdvertisableItems;
    objc_sync_enter(v5);
    unsigned __int8 v6 = -[NSMutableSet containsObject:]( self->_additionalUserActivityAdvertisableItems,  "containsObject:",  v4);
    -[NSMutableSet removeObject:](self->_additionalUserActivityAdvertisableItems, "removeObject:", v4);
    objc_sync_exit(v5);
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)userActivityClientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_userActivityClientsByBundleID, "objectForKey:", v4));
    objc_sync_exit(v5);
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

- (void)removeClientActivityClient:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
    int v41 = 138478083;
    id v42 = v4;
    __int16 v43 = 2114;
    v44 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing client %{private}@, application %{public}@, from known userActivityClients.",  (uint8_t *)&v41,  0x16u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAdvertisableActivity]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAdvertisableActivity]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 options]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"LSLivePastProcessExit"]);
    unsigned int v13 = [v12 BOOLValue];

    if (v13)
    {
      os_log_t v14 = sub_100039584(0LL);
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAdvertisableActivity]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAdvertisableActivity]);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
        int v41 = 138543875;
        id v42 = v18;
        __int16 v43 = 2113;
        v44 = v19;
        __int16 v45 = 2114;
        v46 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Moving 'LSLivePastProcessExit' activity %{public}@/%{private}@ from process %{public}@ into additionalUserActi vityAdvertisableItems",  (uint8_t *)&v41,  0x20u);
      }

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAdvertisableActivity]);
      -[UAUserActivityClientProcessesController addAdditionalUserActivityAdvertisableItems:]( v8,  "addAdditionalUserActivityAdvertisableItems:",  v21);
    }
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
  BOOL v23 = (int)[v22 pid] > 0;

  if (v23)
  {
    os_log_t v24 = sub_100039584(0LL);
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
      int v41 = 138543362;
      id v42 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Removing client %{public}@ from _userActivityClientsByPID",  (uint8_t *)&v41,  0xCu);
    }

    userActivityClientsByPID = v8->_userActivityClientsByPID;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 auditToken]);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (int)[v28 pid]));
    -[NSMutableDictionary removeObjectForKey:](userActivityClientsByPID, "removeObjectForKey:", v29);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  if (v30)
  {
    os_log_t v31 = sub_100039584(0LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
      int v41 = 138477827;
      id v42 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Removing client %{private}@ from _userActivityClientsByBundleIdentifier",  (uint8_t *)&v41,  0xCu);
    }

    userActivityClientsByBundleID = v8->_userActivityClientsByBundleID;
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[NSMutableDictionary removeObjectForKey:](userActivityClientsByBundleID, "removeObjectForKey:", v35);
  }

  -[NSMutableSet removeObject:](v8->_visibleUserActivityClients, "removeObject:", v4);
  -[NSMutableSet removeObject:](v8->_clients, "removeObject:", v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](v8, "proxiedClients"));

  if (v36)
  {
    objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](v8, "proxiedClients"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    [v37 removeObjectForKey:v38];
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
  [v39 scheduleUpdatingAdvertisableItems:0.1];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
  [v40 processWasRemoved];

  objc_sync_exit(v8);
}

- (void)handleAppStateMonitorUpdate:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:BKSApplicationStateKey]);
    id v8 = [v7 integerValue];
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v10 = sub_10005BF18(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 134218243;
    uint64_t v61 = (uint64_t)v8;
    __int16 v62 = 2113;
    uint64_t v63 = (uint64_t)v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "MAKEFRONT: handleAppStateMonitorUpdate:%ld %{private}@",  buf,  0x16u);
  }

  if (v4)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:BKSApplicationStateDisplayIDKey]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:BKSApplicationStateAppIsFrontmostKey]);
    unsigned int v14 = [v13 BOOLValue];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController userActivityClientForBundleIdentifier:]( self,  "userActivityClientForBundleIdentifier:",  v12));
    if (v12)
    {
      if (v14)
      {
        if (v15)
        {
          __int128 v16 = self;
          objc_sync_enter(v16);
          -[NSMutableSet addObject:](v16->_visibleUserActivityClients, "addObject:", v15);
          objc_sync_exit(v16);

          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v16, "frontBundleID"));
          unsigned int v59 = [v12 isEqual:v17];

          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
          -[UAUserActivityClientProcessesController setFrontBundleID:](v16, "setFrontBundleID:", v18);

          os_log_t v19 = sub_100039584(0LL);
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
            uint64_t v22 = objc_claimAutoreleasedReturnValue([v15 auditToken]);
            BOOL v23 = (void *)v22;
            os_log_t v24 = " and possibly change advertisement.";
            *(_DWORD *)buf = 138543874;
            uint64_t v61 = (uint64_t)v21;
            if (v59) {
              os_log_t v24 = "";
            }
            __int16 v62 = 2114;
            uint64_t v63 = v22;
            __int16 v64 = 2080;
            v65 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "MAKEFRONT: %{public}@/%{public}@ %s",  buf,  0x20u);
          }

          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAdvertisableActivity]);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uuid]);
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 UUIDString]);
          __int16 v29 = (void *)v28;
          v30 = "(update)";
          if (v59) {
            v30 = "";
          }
          os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APP:%@, %@ %s",  v25,  v28,  v30));
          +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v31);

          if ((v59 & 1) != 0) {
            goto LABEL_53;
          }
        }

        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID"));
          objc_super v37 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController userActivityClientForBundleIdentifier:]( self,  "userActivityClientForBundleIdentifier:",  v36));
          v38 = (void *)objc_claimAutoreleasedReturnValue([v37 currentAdvertisableActivity]);

          os_log_t v39 = sub_100039584(0LL);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID"));
            id v42 = (void *)v41;
            __int16 v43 = " and possibly change advertisement.";
            if (!v38) {
              __int16 v43 = "";
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v61 = v41;
            __int16 v62 = 2082;
            uint64_t v63 = (uint64_t)v43;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "MAKEFRONT: -(was %{public}@/%{public}s)",  buf,  0x16u);
          }

          v44 = "(update)";
          if (!v38) {
            v44 = "";
          }
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APP:- %s",  v44));
          +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v45);

          -[UAUserActivityClientProcessesController setFrontBundleID:](self, "setFrontBundleID:", 0LL);
          if (!v38) {
            goto LABEL_53;
          }
        }

        goto LABEL_52;
      }

      if (v15)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAdvertisableActivity]);

        v33 = self;
        objc_sync_enter(v33);
        if (-[NSMutableSet containsObject:](v33->_visibleUserActivityClients, "containsObject:", v15))
        {
          -[NSMutableSet removeObject:](v33->_visibleUserActivityClients, "removeObject:", v15);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAdvertisableActivity]);
          if (v34) {
            id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          }
          else {
            id v35 = 0LL;
          }
          [v15 setLastFrontTime:v35];
          if (v34) {

          }
          os_log_t v46 = sub_100039584(0LL);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
            if (v48) {
              v49 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
            }
            else {
              v49 = @"-";
            }
            v50 = "";
            if (v32) {
              v50 = " and possibly change advertisement.";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v61 = (uint64_t)v49;
            __int16 v62 = 2082;
            uint64_t v63 = (uint64_t)v50;
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "MAKEFRONT:- (was %@) %{public}s",  buf,  0x16u);
            if (v48) {
          }
            }

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
          if (v51) {
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
          }
          else {
            v52 = @"-";
          }
          v53 = " and possibly change advertisement.";
          if (!v32) {
            v53 = "";
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APP:- (was %@) %s",  v52,  v53));
          +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v54);

          if (v51) {
        }
          }

        objc_sync_exit(v33);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
        if (v55)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v33, "frontBundleID"));
          unsigned int v57 = [v56 isEqual:v12];

          if (v57)
          {
            -[UAUserActivityClientProcessesController setFrontBundleID:](v33, "setFrontBundleID:", 0LL);
            if (!v32) {
              goto LABEL_53;
            }
            goto LABEL_52;
          }
        }

        if (v32)
        {
LABEL_52:
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
          [v58 scheduleUpdatingAdvertisableItems:0.1];
        }
      }
    }

- (id)advertiseableItemForBundleIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController userActivityClientForBundleIdentifier:]( self,  "userActivityClientForBundleIdentifier:"));
    id v4 = v3;
    if (v3) {
      os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentAdvertisableActivity]);
    }
    else {
      os_log_t v5 = 0LL;
    }
  }

  else
  {
    os_log_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)registerAsProxyApplication:(id)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  os_log_t v7 = sub_100039584(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v23 = 67240450;
    LODWORD(v24[0]) = v4;
    WORD2(v24[0]) = 2114;
    *(void *)((char *)v24 + 6) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "registerAsProxyApplication, pid=%{public}d controller=%{public}@",  (uint8_t *)&v23,  0x12u);
  }

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](self, "proxiedClients"));
  id v10 = v9;
  if ((int)v4 >= 1)
  {

    if (!v10)
    {
      id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      proxiedClients = self->_proxiedClients;
      self->_proxiedClients = v11;
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](self, "proxiedClients"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    [v14 setObject:v13 forKeyedSubscript:v15];

    os_log_t v16 = sub_100039584(0LL);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](self, "proxiedClients"));
    int v23 = 138543362;
    v24[0] = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "registerAsProxyApplication, added, proxiedClients=%{public}@",  (uint8_t *)&v23,  0xCu);
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }

  if (v10)
  {
    os_log_t v19 = sub_100039584(0LL);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](self, "proxiedClients"));
      int v23 = 138543362;
      v24[0] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "registerAsProxyApplication, removed, proxiedClients=%{public}@",  (uint8_t *)&v23,  0xCu);
    }

    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController proxiedClients](self, "proxiedClients"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    -[os_log_s removeObjectForKey:](v17, "removeObjectForKey:", v18);
    goto LABEL_12;
  }

- (id)items
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](self, "userActivityClients"));
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v8) currentAdvertisableActivity]);
        if (v9) {
          [v3 addObject:v9];
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v6);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController additionalUserActivityAdvertisableItems]( self,  "additionalUserActivityAdvertisableItems",  0LL));
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      unsigned int v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [v3 addObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)v14)];
        unsigned int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v12);
  }

  id v15 = [v3 copy];
  return v15;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v4 = [v3 debugEnablePinging];

  if (v4)
  {
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](self, "userActivityClients"));
    id v6 = [v5 countByEnumeratingWithState:&v80 objects:v91 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v81;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v81 != v7) {
            objc_enumerationMutation(v5);
          }
          os_log_t v9 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAdvertisableActivity]);
          id v11 = v10;
          if (v10)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 activityType]);
            unsigned int v13 = [v12 isEqual:@"com.apple.coreservices.ping"];

            if (v13)
            {
              os_log_t v14 = sub_100039584(0LL);
              id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAdvertisableActivity]);
                *(_DWORD *)buf = 138477827;
                v90 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "*** FORCING item %{private}@ as the most eligible item, since it's a ping",  buf,  0xCu);
              }

              [v2 addObject:v11];
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v80 objects:v91 count:16];
      }

      while (v6);
    }
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](self, "userActivityClients"));
  id v20 = [v19 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v77;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v77 != v21) {
          objc_enumerationMutation(v19);
        }
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v76 + 1) + 8 * (void)j) currentAdvertisableActivity]);
        if (([v23 eligibleToAdvertise] & 1) != 0
          || (__int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 proxiedBundleIdentifier]),
              BOOL v25 = v24 == 0LL,
              v24,
              !v25))
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v23 proxiedBundleIdentifier]);
          if (v26)
          {
            unsigned int v27 = [v23 eligibleToAdvertise];

            if (v27)
            {
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v23 proxiedBundleIdentifier]);
              [v67 setObject:v23 forKey:v28];
            }
          }
        }
      }

      id v20 = [v19 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }

    while (v20);
  }

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController additionalUserActivityAdvertisableItems]( self,  "additionalUserActivityAdvertisableItems"));
  id v30 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v73;
    do
    {
      for (k = 0LL; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v73 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)k);
        if ([v33 eligibleToAdvertise])
        {
        }
      }

      id v30 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
    }

    while (v30);
  }

  if ([v17 count])
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"options.%@",  UAUserActivityAlwaysPickKey));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v34,  0LL));
    v86 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v86, 1LL));
    [v17 sortUsingDescriptors:v36];

    os_log_t v37 = sub_100039584(0LL);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "eligibleAdvertiseableItemsInOrder: alwaysPickItems=%{public}@",  buf,  0xCu);
    }

    [v2 addObjectsFromArray:v17];
  }

  os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID"));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID"));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:v40]);

    if (v41
      || (id v42 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](self, "frontBundleID")),
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController advertiseableItemForBundleIdentifier:]( self,  "advertiseableItemForBundleIdentifier:",  v42)),  v42,  v41))
    {
    }
  }

  if ([v18 count])
  {
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"options.%@",  UAUserActivityEligibleEvenWhenInBackgroundKey));
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v43,  0LL));
    v85 = v44;
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v85, 1LL));
    [v18 sortUsingDescriptors:v45];

    os_log_t v46 = sub_100039584(0LL);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue([v18 description]);
      id v49 = sub_10005BF18(v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      *(_DWORD *)buf = 138477827;
      v90 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "-- Adding in eligibleItemsWhenInBackground items, %{private}@. ",  buf,  0xCu);
    }

    [v2 addObjectsFromArray:v18];
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  v51 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcessesController additionalUserActivityAdvertisableItems]( self,  "additionalUserActivityAdvertisableItems"));
  id v52 = [v51 countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v69;
    do
    {
      for (m = 0LL; m != v52; m = (char *)m + 1)
      {
        if (*(void *)v69 != v53) {
          objc_enumerationMutation(v51);
        }
        uint64_t v55 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)m);
      }

      id v52 = [v51 countByEnumeratingWithState:&v68 objects:v84 count:16];
    }

    while (v52);
  }

  if (v2 && [v2 count])
  {
    os_log_t v56 = sub_100039584(0LL);
    unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
      id v59 = sub_10005BF18(v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      *(_DWORD *)buf = 138543362;
      v90 = v60;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEBUG,  "eligibleAdvertiseableItemsInOrder: result=%{public}@",  buf,  0xCu);
    }
  }

  uint64_t v61 = self;
  objc_sync_enter(v61);
  __int16 v62 = (NSArray *)[v2 copy];
  DEBUG_lastEligibleItems = v61->_DEBUG_lastEligibleItems;
  v61->_DEBUG_lastEligibleItems = v62;

  objc_sync_exit(v61);
  if (v2) {
    id v64 = [v2 copy];
  }
  else {
    id v64 = 0LL;
  }

  return v64;
}

- (id)recentEligibleItemsInOrder:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](self, "userActivityClients", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 lastFrontTime]);
        if (v13)
        {
          os_log_t v14 = (void *)v13;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 lastFrontTime]);
          BOOL v16 = sub_10005BA4C(v15, v6);

          if (v16) {
            [v5 addObject:v12];
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v9);
  }

  if ([v5 count])
  {
    [v5 sortUsingComparator:&stru_1000BDB70];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentAdvertisableActivity]);
    if (v18)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currentAdvertisableActivity]);
      unsigned int v27 = v20;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    }

    else
    {
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  return v21;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478083;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "listener=%{private}@ newConnection=%{private}@",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v10 = -[UAUserActivityClientProcess initWithController:connection:]( objc_alloc(&OBJC_CLASS___UAUserActivityClientProcess),  "initWithController:connection:",  self,  v7);
  id v11 = self;
  objc_sync_enter(v11);
  -[NSMutableSet addObject:](v11->_clients, "addObject:", v10);
  objc_sync_exit(v11);

  [v7 resume];
  return 1;
}

- (id)statusString
{
  v2 = self;
  objc_sync_enter(v2);
  v38 = v2;
  os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"##### Client processes: %ld clients",  -[NSMutableSet count](v2->_clients, "count")));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v2, "frontBundleID"));
  if (v3) {
    unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController frontBundleID](v2, "frontBundleID"));
  }
  else {
    unsigned int v4 = @"-";
  }
  [v39 appendFormat:@" front:%@", v4];
  if (v3) {

  }
  [v39 appendString:@"\n"];
  os_log_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v2->_clients, "allObjects"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000BDBB0]);

  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        unsigned int v11 = -[UAUserActivityClientProcessesController clientIsActive:](v38, "clientIsActive:", v10);
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 statusString]);
        int v13 = (void *)v12;
        id v14 = "";
        if (v11) {
          id v14 = "FRONT ";
        }
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" - %s%@\n",  v14,  v12));
        if ((v11 & 1) != 0) {
          id v16 = 0LL;
        }
        else {
          id v16 = [v37 count];
        }
        [v37 insertObject:v15 atIndex:v16];
      }

      id v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v7);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10003F088;
  v49[3] = &unk_1000BDBD8;
  id v34 = v39;
  id v50 = v34;
  [v37 enumerateObjectsUsingBlock:v49];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController DEBUG_lastEligibleItems](v38, "DEBUG_lastEligibleItems"));
  if (v17)
  {
    [v34 appendString:@" Order:{"];
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    v32 = v17;
    id obj = v17;
    id v36 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(obj);
          }
          __int128 v18 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcessesController userActivityClients](v38, "userActivityClients"));
          id v20 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v42;
            while (2)
            {
              for (k = 0LL; k != v20; k = (char *)k + 1)
              {
                if (*(void *)v42 != v21) {
                  objc_enumerationMutation(v19);
                }
                __int128 v23 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)k);
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
                if (v24)
                {
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueIdentifiers]);
                  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
                  unsigned int v27 = [v25 containsObject:v26];

                  if (v27)
                  {
                    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
                    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
                    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
                    [v34 appendFormat:@"%@/%@ ", v28, v30];

                    goto LABEL_35;
                  }
                }
              }

              id v20 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

- (BKSApplicationStateMonitor)appStateMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAppStateMonitor:(id)a3
{
}

- (NSString)frontBundleID
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setFrontBundleID:(id)a3
{
}

- (NSMutableDictionary)proxiedClients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (UALocalItemReceiver)localReceiver
{
  return (UALocalItemReceiver *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setLocalReceiver:(id)a3
{
}

- (NSDate)ignoreLockScreenUntil
{
  return (NSDate *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIgnoreLockScreenUntil:(id)a3
{
}

- (NSArray)DEBUG_lastEligibleItems
{
  return (NSArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void).cxx_destruct
{
}

@end