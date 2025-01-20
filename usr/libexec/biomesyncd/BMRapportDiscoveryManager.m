@interface BMRapportDiscoveryManager
- (BMRapportDiscoveryManager)initWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
- (NSArray)devices;
- (id)deviceWithIdentifier:(id)a3;
- (id)localDevice;
- (id)newDiscoveryClients;
- (void)ignoreDevice:(id)a3;
- (void)invalidate;
- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4;
- (void)rapportClient:(id)a3 didLoseDevice:(id)a4;
- (void)startWithCompletion:(id)a3;
- (void)stop;
@end

@implementation BMRapportDiscoveryManager

- (BMRapportDiscoveryManager)initWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___BMRapportDiscoveryManager;
  v12 = -[BMRapportDiscoveryManager init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    devices = v13->_devices;
    v13->_devices = v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    unsupportedDevices = v13->_unsupportedDevices;
    v13->_unsupportedDevices = v16;
  }

  return v13;
}

- (id)newDiscoveryClients
{
  if (self->_invalidated) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[BMRapportClient clientForSameAccountDiscoveryWithServiceName:delegate:queue:]( &OBJC_CLASS___BMRapportClient,  "clientForSameAccountDiscoveryWithServiceName:delegate:queue:",  @"com.apple.biomesyncd.rapport",  self,  self->_queue));
  v5 = v4;
  if (!v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[BMRapportClient clientForSharedHomeDiscoveryWithServiceName:delegate:queue:]( &OBJC_CLASS___BMRapportClient,  "clientForSharedHomeDiscoveryWithServiceName:delegate:queue:",  @"com.apple.biomesyncd.rapport",  self,  self->_queue));
  v7 = v6;
  if (!v6) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_pas_filteredArrayWithTest:", &stru_100068D78));

  if (!v6) {
  if (!v4)
  }

  return v3;
}

- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bm_companionLinkDeviceIdentifier"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
        if (v8)
        {
        }

        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unsupportedDevices,  "objectForKeyedSubscript:",  v6));

          if (!v24)
          {
            v25 = -[BMRapportDevice initWithRPCompanionLinkDevice:]( objc_alloc(&OBJC_CLASS___BMRapportDevice),  "initWithRPCompanionLinkDevice:",  v5);
            uint64_t v26 = objc_claimAutoreleasedReturnValue(-[BMRapportDevice serviceTypes](v25, "serviceTypes"));
            if (v26
              && (v27 = (void *)v26,
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice serviceTypes](v25, "serviceTypes")),
                  unsigned __int8 v29 = [v28 containsObject:self->_serviceName],
                  v28,
                  v27,
                  (v29 & 1) == 0))
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_unsupportedDevices,  "setObject:forKeyedSubscript:",  v25,  v6);
            }

            else
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              if ([WeakRetained discoveryManager:self supportsDevice:v25])
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_devices,  "setObject:forKeyedSubscript:",  v25,  v6);
                uint64_t v31 = __biome_log_for_category(11LL);
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](v25, "shortenedRapportIdentifier"));
                  int v34 = 138412290;
                  v35 = v33;
                  _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "BMRappportDiscoveryManager: discovered device %@",  (uint8_t *)&v34,  0xCu);
                }

                [WeakRetained discoveryManager:self didDiscoverDevice:v25];
              }

              else
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_unsupportedDevices,  "setObject:forKeyedSubscript:",  v25,  v6);
              }
            }
          }
        }

        goto LABEL_11;
      }

      uint64_t v17 = __biome_log_for_category(11LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100040AC8((uint64_t)v5, v10, v18, v19, v20, v21, v22, v23);
      }
    }

    else
    {
      uint64_t v9 = __biome_log_for_category(11LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100040A60((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
      }
    }

LABEL_11:
  }
}

- (void)rapportClient:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bm_companionLinkDeviceIdentifier"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v8));
    if (v9)
    {
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unsupportedDevices,  "objectForKeyedSubscript:",  v8));

      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v11 = self->_discoveryClients;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8LL * (void)i);
          if (v16 != v6)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeDevices", (void)v24));
            unsigned int v18 = [v17 containsObject:v7];

            if (v18)
            {
              uint64_t v23 = __biome_log_for_category(11LL);
              id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v29 = v7;
                _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_INFO,  "BMRappportDiscoveryManager: already discovered by other connection to rapport %@",  buf,  0xCu);
              }

              goto LABEL_20;
            }
          }
        }

        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0LL, v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_unsupportedDevices,  "setObject:forKeyedSubscript:",  0LL,  v8);
    if (v11)
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray shortenedRapportIdentifier](v11, "shortenedRapportIdentifier"));
        *(_DWORD *)buf = 138412290;
        id v29 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "BMRappportDiscoveryManager: lost device %@",  buf,  0xCu);
      }

      id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_delegate);
      -[os_log_s discoveryManager:didLoseDevice:](WeakRetained, "discoveryManager:didLoseDevice:", self, v11);
LABEL_20:
    }

    goto LABEL_22;
  }

- (void)ignoreDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (!self->_invalidated)
    {
      unsupportedDevices = self->_unsupportedDevices;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportIdentifier]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](unsupportedDevices, "objectForKeyedSubscript:", v6));

      if (!v7)
      {
        devices = self->_devices;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportIdentifier]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v9));

        if (v10)
        {
          uint64_t v11 = __biome_log_for_category(11LL);
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 shortenedRapportIdentifier]);
            int v19 = 138412290;
            uint64_t v20 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "BMRappportDiscoveryManager: ignore device %@",  (uint8_t *)&v19,  0xCu);
          }

          uint64_t v14 = self->_devices;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0LL, v15);

          id v16 = self->_unsupportedDevices;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v4, v17);

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained discoveryManager:self didLoseDevice:v4];
        }
      }
    }
  }
}

- (NSArray)devices
{
  if (self->_invalidated) {
    v3 = 0LL;
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_devices, "allValues"));
  }
  return (NSArray *)v3;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_discoveryClients, "firstObject"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localDevice]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bm_companionLinkDeviceIdentifier"));
    unsigned int v9 = [v8 isEqual:v4];

    if (v9) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[BMRapportDiscoveryManager localDevice](self, "localDevice"));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
    }
    id v5 = (void *)v10;
  }

  return v5;
}

- (id)localDevice
{
  if (self->_invalidated)
  {
    v3 = 0LL;
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___BMRapportDevice);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_discoveryClients, "firstObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localDevice]);
    v3 = -[BMRapportDevice initWithRPCompanionLinkDevice:](v4, "initWithRPCompanionLinkDevice:", v6);
  }

  return v3;
}

- (void)startWithCompletion:(id)a3
{
  id v4 = (void (**)(id, dispatch_group_s *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    int v34 = @"BMRappportDiscoveryManager has been invalidated";
    id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    id v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  4LL,  v5));
    v4[2](v4, v6);
  }

  else
  {
    uint64_t v7 = __biome_log_for_category(11LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: start", buf, 2u);
    }

    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v6 = dispatch_group_create();
    discoveryClients = self->_discoveryClients;
    if (!discoveryClients)
    {
      uint64_t v10 = -[BMRapportDiscoveryManager newDiscoveryClients](self, "newDiscoveryClients");
      uint64_t v11 = self->_discoveryClients;
      self->_discoveryClients = v10;

      discoveryClients = self->_discoveryClients;
    }

    int v19 = self;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v12 = discoveryClients;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          dispatch_group_enter(v6);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_10000DB04;
          v24[3] = &unk_100068DA0;
          __int128 v25 = v5;
          __int128 v26 = v6;
          [v17 activateWithCompletion:v24];
        }

        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v14);
    }

    if (v4)
    {
      queue = (dispatch_queue_s *)v19->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000DB34;
      block[3] = &unk_100068DC8;
      id v5 = v5;
      uint64_t v21 = v5;
      uint64_t v22 = v19;
      uint64_t v23 = v4;
      dispatch_group_notify(v6, queue, block);
    }
  }
}

- (void)stop
{
  if (!self->_invalidated)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: stop", buf, 2u);
    }

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = self->_discoveryClients;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        unsigned int v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "invalidate", (void)v11);
          unsigned int v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
      }

      while (v7);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0LL;
  }

- (void)invalidate
{
  if (!self->_invalidated)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: invalidate", buf, 2u);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = self->_discoveryClients;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        unsigned int v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "invalidate", (void)v13);
          unsigned int v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v7);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0LL;

    unsupportedDevices = self->_unsupportedDevices;
    self->_unsupportedDevices = 0LL;

    devices = self->_devices;
    self->_devices = 0LL;
  }

- (void).cxx_destruct
{
}

@end