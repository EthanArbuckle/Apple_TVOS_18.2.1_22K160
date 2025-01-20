@interface PBServiceProviderRegistry
+ (id)sharedInstance;
- (PBServiceProviderRegistry)init;
- (void)_updateProcessMonitorPredicate;
- (void)clearEndpointsForIdentifier:(id)a3;
- (void)dealloc;
- (void)endpointForIdentifier:(id)a3 providerType:(id)a4 responseBlock:(id)a5;
- (void)registerEndpoint:(id)a3 forIdentifier:(id)a4 providerType:(id)a5;
@end

@implementation PBServiceProviderRegistry

+ (id)sharedInstance
{
  if (qword_1004702A0 != -1) {
    dispatch_once(&qword_1004702A0, &stru_1003D3190);
  }
  return (id)qword_100470298;
}

- (PBServiceProviderRegistry)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBServiceProviderRegistry;
  v2 = -[PBServiceProviderRegistry init](&v16, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_10007C35C;
    v13 = &unk_1003D31E0;
    objc_copyWeak(&v14, &location);
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  &v10));
    processMonitor = v2->_processMonitor;
    v2->_processMonitor = (RBSProcessMonitor *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v10, v11, v12, v13));
    clientEndpoints = v2->_clientEndpoints;
    v2->_clientEndpoints = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientResponseBlocks = v2->_clientResponseBlocks;
    v2->_clientResponseBlocks = (NSMutableDictionary *)v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBServiceProviderRegistry;
  -[PBServiceProviderRegistry dealloc](&v3, "dealloc");
}

- (void)registerEndpoint:(id)a3 forIdentifier:(id)a4 providerType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: registering endpoint %@ for {%@ : %@}",  buf,  0x20u);
    }

    v12 = objc_opt_new(&OBJC_CLASS___PBServiceProviderRegistryKeyPair);
    -[PBServiceProviderRegistryKeyPair setIdentifier:](v12, "setIdentifier:", v9);
    -[PBServiceProviderRegistryKeyPair setProviderType:](v12, "setProviderType:", v10);
    v13 = self;
    objc_sync_enter(v13);
    clientEndpoints = v13->_clientEndpoints;
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](clientEndpoints, "setObject:forKey:", v8, v12);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](clientEndpoints, "removeObjectForKey:", v12);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v13->_clientResponseBlocks,  "objectForKeyedSubscript:",  v12));
    if (v15) {
      -[NSMutableDictionary removeObjectForKey:](v13->_clientResponseBlocks, "removeObjectForKey:", v12);
    }
    -[PBServiceProviderRegistry _updateProcessMonitorPredicate](v13, "_updateProcessMonitorPredicate");
    objc_sync_exit(v13);

    if (v15)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10007C7E4;
      block[3] = &unk_1003D1490;
      BOOL v21 = v8 == 0LL;
      id v19 = v15;
      id v20 = v8;
      dispatch_async(v17, block);
    }
  }

  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: attempt to register endpoint with nil identifier denied (providerType: %@)",  buf,  0xCu);
  }
}

- (void)clearEndpointsForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: clearing endpoints {%@}",  buf,  0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v7 = self;
    objc_sync_enter(v7);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7->_clientEndpoints, "allKeys"));
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            -[NSMutableDictionary removeObjectForKey:](v7->_clientEndpoints, "removeObjectForKey:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v7->_clientResponseBlocks,  "objectForKeyedSubscript:",  v12));
            if (v15)
            {
              [v6 addObjectsFromArray:v15];
              -[NSMutableDictionary removeObjectForKey:](v7->_clientResponseBlocks, "removeObjectForKey:", v12);
            }
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v9);
    }

    -[PBServiceProviderRegistry _updateProcessMonitorPredicate](v7, "_updateProcessMonitorPredicate");
    objc_sync_exit(v7);

    if (v6)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10007CBE0;
      block[3] = &unk_1003CFF08;
      id v19 = v6;
      dispatch_async(v17, block);
    }
  }

  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: attempt to clear endpoint with nil identifier denied",  buf,  2u);
  }
}

- (void)endpointForIdentifier:(id)a3 providerType:(id)a4 responseBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: getting endpoint for {%@ : %@}",  buf,  0x16u);
  }

  BOOL v11 = objc_opt_new(&OBJC_CLASS___PBServiceProviderRegistryKeyPair);
  -[PBServiceProviderRegistryKeyPair setIdentifier:](v11, "setIdentifier:", v8);
  -[PBServiceProviderRegistryKeyPair setProviderType:](v11, "setProviderType:", v9);
  v12 = self;
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_clientEndpoints,  "objectForKeyedSubscript:",  v11));
  if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBServiceProviderRegistry: got endpoint %@ for {%@ : %@}",  buf,  0x20u);
    }

    v10[2](v10, v13, 0LL);
  }

  else
  {
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_clientResponseBlocks,  "objectForKeyedSubscript:",  v11));
    if (!v15)
    {
      v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12->_clientResponseBlocks,  "setObject:forKeyedSubscript:",  v15,  v11);
    }

    id v16 = [v10 copy];
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    if (!v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12->_clientEndpoints,  "setObject:forKeyedSubscript:",  v17,  v11);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@",  PBSSystemServiceSpecialLaunchScheme,  v9));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10007D058;
      v21[3] = &unk_1003D3208;
      v21[4] = v12;
      __int128 v22 = v11;
      [v18 openApplication:v8 launchURL:v20 options:0 suspended:1 completion:v21];
    }
  }

  objc_sync_exit(v12);
}

- (void)_updateProcessMonitorPredicate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_clientEndpoints, "allKeys"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1003D3248));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  processMonitor = self->_processMonitor;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007D384;
  v8[3] = &unk_1003D3270;
  id v9 = v5;
  id v7 = v5;
  -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v8);
}

- (void).cxx_destruct
{
}

@end