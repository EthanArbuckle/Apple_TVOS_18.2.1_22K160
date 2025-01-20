@interface HHDAssetManager
- (HHDAssetManager)initWithQueue:(id)a3;
- (void)_cancelAccessoryConnectedNotification;
- (void)_cancelNotifications;
- (void)_cancelSiriVoiceTriggerModelUpdateNotification;
- (void)_handleEndpointConnected:(id)a3;
- (void)_handleSiriVoiceTriggerModelChanged;
- (void)_registerForAccessoryConnectedNotification;
- (void)_registerForNotifications;
- (void)_registerForSiriVoiceTriggerModelUpdateNotification;
- (void)assetManagementController:(id)a3 didUpdateSiriVoiceTriggerModelForEndpoint:(id)a4 withError:(id)a5;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation HHDAssetManager

- (HHDAssetManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HHDAssetManager;
  v6 = -[HHDAssetManager init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    assetManager = v6->_assetManager;
    v6->_assetManager = 0LL;

    v7->_assetChangedToken = -1;
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  v4 = (HHDServiceRegistry *)a3;
  id v5 = sub_10000C52C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@Bootstrapping", (uint8_t *)&v12, 0xCu);
  }

  serviceRegistry = self->_serviceRegistry;
  self->_serviceRegistry = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  [v9 addEndpointObserver:self];

  objc_super v10 = -[AMController initWithQueue:](objc_alloc(&OBJC_CLASS___AMController), "initWithQueue:", self->_queue);
  assetManager = self->_assetManager;
  self->_assetManager = v10;

  -[AMController setDelegate:](self->_assetManager, "setDelegate:", self);
}

- (void)start
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@Starting", (uint8_t *)&v5, 0xCu);
  }

  -[HHDAssetManager _registerForNotifications](self, "_registerForNotifications");
}

- (void)stop
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@Stopping", (uint8_t *)&v5, 0xCu);
  }

  -[HHDAssetManager _cancelNotifications](self, "_cancelNotifications");
}

- (void)_registerForNotifications
{
}

- (void)_registerForAccessoryConnectedNotification
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@Registering for Accessory connected state notification",  (uint8_t *)&v6,  0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SIBCNotificationCenter defaultCenter](&OBJC_CLASS___SIBCNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleEndpointConnected:" name:SIBCApplicationNotificationConnectionStarted object:0];
}

- (void)_registerForSiriVoiceTriggerModelUpdateNotification
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@Registering for Siri Voice Trigger Model change notification",  buf,  0xCu);
  }

  if (self->_assetChangedToken == -1)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000C9F4;
    v11[3] = &unk_100024A18;
    objc_copyWeak(&v12, &location);
    uint32_t v8 = notify_register_dispatch( "com.apple.corespeech.voicetriggerassetchange",  &self->_assetChangedToken,  (dispatch_queue_t)queue,  v11);
    if (v8)
    {
      id v9 = sub_10000C52C();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = &stru_100024E50;
        __int16 v16 = 1024;
        uint32_t v17 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@Failed to register for asset change notification, error: %u",  buf,  0x12u);
      }
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  else
  {
    id v5 = sub_10000C52C();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Attempted to re-register for asset change notification",  buf,  0xCu);
    }
  }

- (void)_cancelNotifications
{
}

- (void)_cancelAccessoryConnectedNotification
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@Canceling Accessory connected state notification",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SIBCNotificationCenter defaultCenter](&OBJC_CLASS___SIBCNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];
}

- (void)_cancelSiriVoiceTriggerModelUpdateNotification
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@Canceling Siri Voice Trigger Model change notification",  (uint8_t *)&v6,  0xCu);
  }

  int assetChangedToken = self->_assetChangedToken;
  if (assetChangedToken != -1)
  {
    notify_cancel(assetChangedToken);
    self->_int assetChangedToken = -1;
  }

- (void)_handleSiriVoiceTriggerModelChanged
{
  id v3 = sub_10000C52C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@Received Siri Voice Trigger Model change notification",  buf,  0xCu);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager", 0LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpointList]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v11 state] == (id)2)
        {
          assetManager = self->_assetManager;
          v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bridgedEndpoint]);
          -[AMController startSiriVoiceTriggerModelUpdateForEndpoint:]( assetManager,  "startSiriVoiceTriggerModelUpdateForEndpoint:",  v13);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)_handleEndpointConnected:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000C52C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    __int128 v15 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@Received notification for Endpoint connection",  (uint8_t *)&v14,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:SIBCApplicationNotificationKeyEndpointId]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointForIdentifier:v8 error:0]);

  if (!v10)
  {
    id v13 = sub_10000C52C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      __int128 v15 = &stru_100024E50;
      __int16 v16 = 2114;
      __int128 v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Endpoint not found for accessory UUID %{public}@; skipping Asset Update flow",
        (uint8_t *)&v14,
        0x16u);
    }

    goto LABEL_8;
  }

  if ([v10 state] == (id)2)
  {
    assetManager = self->_assetManager;
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 bridgedEndpoint]);
    -[AMController startSiriVoiceTriggerModelUpdateForEndpoint:]( assetManager,  "startSiriVoiceTriggerModelUpdateForEndpoint:",  v12);
LABEL_8:
  }
}

- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4
{
  assetManager = self->_assetManager;
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bridgedEndpoint", a3));
  -[AMController abortSiriVoiceTriggerModelUpdateForEndpoint:]( assetManager,  "abortSiriVoiceTriggerModelUpdateForEndpoint:",  v5);
}

- (void)assetManagementController:(id)a3 didUpdateSiriVoiceTriggerModelForEndpoint:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_10000C52C();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      __int16 v16 = &stru_100024E50;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      v11 = "%@Failed to update asset %@ for endpoint %@";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v15, v14);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    __int16 v16 = &stru_100024E50;
    __int16 v17 = 2112;
    id v18 = v6;
    v11 = "%@Successfully updated assets for endpoint %@";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end