@interface HHDSideBoardManager
+ (id)sideBoardManager;
- (HHDSideBoardManager)initWithFactory:(id)a3 queue:(id)a4;
- (NSArray)endpointAppStateList;
- (NSArray)endpoints;
- (id)endpointWithId:(id)a3;
- (void)_addOrUpdateAppState:(id)a3;
- (void)_publishEndpointAppStateList;
- (void)_removeAppStateWithEndpointId:(id)a3;
- (void)_removeEndpoint:(id)a3;
- (void)applicationController:(id)a3 didUpdateAppState:(id)a4;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)endpointService:(id)a3 didActivateEndpoint:(id)a4;
- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)endpointService:(id)a3 didRemoveEndpoint:(id)a4;
- (void)endpointServiceDidReactivateAllEndpoints:(id)a3;
- (void)stop;
@end

@implementation HHDSideBoardManager

- (HHDSideBoardManager)initWithFactory:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___HHDSideBoardManager;
  v8 = -[HHDSideBoardManager init](&v19, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 createApplicationControllerWithQueue:v7]);
    appController = v8->_appController;
    v8->_appController = (SIBCApplicationController *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("WiFiController", v14);

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 createWiFiControllerWithQueue:v15]);
    wifiController = v8->_wifiController;
    v8->_wifiController = (SIBCWiFiController *)v16;
  }

  return v8;
}

+ (id)sideBoardManager
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  v4 = (HHDServiceRegistry *)a3;
  id v5 = sub_1000141A4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    dispatch_queue_attr_t v11 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@Bootstrapping", (uint8_t *)&v10, 0xCu);
  }

  serviceRegistry = self->_serviceRegistry;
  self->_serviceRegistry = v4;
  v8 = v4;

  -[SIBCApplicationController setDelegate:](self->_appController, "setDelegate:", self);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));

  [v9 addEndpointObserver:self];
}

- (void)stop
{
  id v3 = sub_1000141A4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@Stopping", (uint8_t *)&v5, 0xCu);
  }

  -[SIBCApplicationController stop](self->_appController, "stop");
}

- (NSArray)endpointAppStateList
{
  id v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableDictionary count](self->_cachedEndpointAppStates, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cachedEndpointAppStates, "objectEnumerator", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "hhd_bridgedAppState"));
        -[NSMutableArray addObject:](v3, "addObject:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return (NSArray *)v10;
}

- (void)_removeEndpoint:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 bridgedEndpoint]);
  -[SIBCApplicationController removeEndpoint:](self->_appController, "removeEndpoint:", v6);
  -[SIBCWiFiController removeEndpoint:](self->_wifiController, "removeEndpoint:", v6);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);

  -[HHDSideBoardManager _removeAppStateWithEndpointId:](self, "_removeAppStateWithEndpointId:", v5);
}

- (void)_publishEndpointAppStateList
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry notificationProxy](self->_serviceRegistry, "notificationProxy"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HHDSideBoardManager endpointAppStateList](self, "endpointAppStateList"));
  [v4 endpointAppStateListChanged:v3];
}

- (void)_addOrUpdateAppState:(id)a3
{
  id v10 = a3;
  cachedEndpointAppStates = self->_cachedEndpointAppStates;
  if (!cachedEndpointAppStates)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = self->_cachedEndpointAppStates;
    self->_cachedEndpointAppStates = v5;

    cachedEndpointAppStates = self->_cachedEndpointAppStates;
  }

  id v7 = -[NSMutableDictionary copy](cachedEndpointAppStates, "copy");
  v8 = self->_cachedEndpointAppStates;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 endpointId]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v9);
}

- (void)_removeAppStateWithEndpointId:(id)a3
{
  cachedEndpointAppStates = self->_cachedEndpointAppStates;
  id v5 = a3;
  id v6 = -[NSMutableDictionary copy](cachedEndpointAppStates, "copy");
  -[NSMutableDictionary removeObjectForKey:](self->_cachedEndpointAppStates, "removeObjectForKey:", v5);
}

- (void)endpointService:(id)a3 didActivateEndpoint:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bridgedEndpoint", a3));
  -[SIBCApplicationController addEndpoint:](self->_appController, "addEndpoint:", v5);
  -[SIBCWiFiController addEndpoint:](self->_wifiController, "addEndpoint:", v5);
}

- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4
{
}

- (void)endpointService:(id)a3 didRemoveEndpoint:(id)a4
{
}

- (void)endpointServiceDidReactivateAllEndpoints:(id)a3
{
  id v4 = sub_1000141A4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@Starting", (uint8_t *)&v8, 0xCu);
  }

  -[SIBCApplicationController start](self->_appController, "start");
  wifiController = self->_wifiController;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HHDSideBoardManager endpoints](self, "endpoints"));
  -[SIBCWiFiController startWithEndpoints:](wifiController, "startWithEndpoints:", v7);
}

- (NSArray)endpoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 endpointList]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray hhd_bridgedArrayWithEndpoints:](&OBJC_CLASS___NSArray, "hhd_bridgedArrayWithEndpoints:", v3));

  return (NSArray *)v4;
}

- (id)endpointWithId:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpointList]);

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
        dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryId]);
        unsigned __int8 v12 = [v11 isEqual:v4];

        if ((v12 & 1) != 0)
        {
          id v7 = (id)objc_claimAutoreleasedReturnValue([v10 bridgedEndpoint]);
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)applicationController:(id)a3 didUpdateAppState:(id)a4
{
}

- (void).cxx_destruct
{
}

@end