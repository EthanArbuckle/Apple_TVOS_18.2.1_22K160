@interface ADDeviceSyncMessagingServiceRapport
- (ADDeviceSyncMessagingServiceRapport)initWithMode:(int64_t)a3 delegate:(id)a4;
- (NSString)channel;
- (void)_handleCompanionServiceActiveDevicesDidChange;
- (void)_handleCompanionServiceReadyStateDidChange;
- (void)_handleCompanionServiceStereoConfigurationDidChange;
- (void)_handleIncomingDictionary:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_handleOutgoingMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_invalidate;
- (void)_setDeviceIdentifiers:(id)a3;
- (void)_setIsReady:(BOOL)a3;
- (void)_setStereoPartnerDeviceIdentifier:(id)a3;
- (void)companionServiceActiveDevicesDidChange:(id)a3;
- (void)companionServiceReadyStateDidChange:(id)a3;
- (void)companionServiceStereoConfigurationDidChange:(id)a3;
- (void)dealloc;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)sendMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation ADDeviceSyncMessagingServiceRapport

- (ADDeviceSyncMessagingServiceRapport)initWithMode:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessagingServiceRapport;
  v7 = -[ADDeviceSyncMessagingServiceRapport init](&v23, "init");
  if (v7)
  {
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.assistant.device-sync.messaging-service.rapport", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v7->_mode = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    companionService = v7->_companionService;
    v7->_companionService = (ADCompanionService *)v14;

    -[ADCompanionService setMessageHandler:forMessageType:]( v7->_companionService,  "setMessageHandler:forMessageType:",  v7,  @"devicesync");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v7 selector:"companionServiceReadyStateDidChange:" name:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v7 selector:"companionServiceActiveDevicesDidChange:" name:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v7 selector:"companionServiceStereoConfigurationDidChange:" name:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];

    v19 = (dispatch_queue_s *)v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AAFE8;
    block[3] = &unk_1004FD940;
    v22 = v7;
    dispatch_async(v19, block);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessagingServiceRapport;
  -[ADDeviceSyncMessagingServiceRapport dealloc](&v3, "dealloc");
}

- (void)companionServiceReadyStateDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AAFE0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)companionServiceActiveDevicesDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AAFD8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)companionServiceStereoConfigurationDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AAFD0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AAFC8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a4 isEqualToString:@"devicesync"])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000AAFB8;
    v15[3] = &unk_1004FDA30;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    dispatch_async(queue, v15);
  }

  else if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1004LL));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v14);
  }
}

- (NSString)channel
{
  v2 = @"com.apple.assistant.device-sync.messaging-channel.rapport";
  return (NSString *)@"com.apple.assistant.device-sync.messaging-channel.rapport";
}

- (void)sendMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[ADDeviceSyncMessagingServiceRapport sendMessage:toDeviceWithIdentifier:completion:]";
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, outgoingMessage = %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000AAFA8;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

- (void)_invalidate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[ADCompanionService removeMessageHandler:forMessageType:]( self->_companionService,  "removeMessageHandler:forMessageType:",  self,  @"devicesync");
  companionService = self->_companionService;
  self->_companionService = 0LL;

  objc_storeWeak((id *)&self->_delegate, 0LL);
}

- (void)_handleOutgoingMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v23 = "-[ADDeviceSyncMessagingServiceRapport _handleOutgoingMessage:toDeviceWithIdentifier:completion:]";
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, outgoingMessage = %@",  buf,  0x20u);
  }

  id v21 = 0LL;
  id v12 = sub_1002D3418(v8, &v21);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v21;
  if (v14)
  {
    if (v10) {
      v10[2](v10, 0LL, v14);
    }
  }

  else
  {
    id v15 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v23 = "-[ADDeviceSyncMessagingServiceRapport _handleOutgoingMessage:toDeviceWithIdentifier:completion:]";
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, outgoingDictionary = %@",  buf,  0x20u);
    }

    companionService = self->_companionService;
    if (companionService)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000AAD24;
      v18[3] = &unk_1004F68A0;
      v18[4] = self;
      id v19 = v9;
      v20 = v10;
      -[ADCompanionService sendMessage:messageType:toDeviceWithIDSIdentifier:completion:]( companionService,  "sendMessage:messageType:toDeviceWithIDSIdentifier:completion:",  v13,  @"devicesync",  v19,  v18);
    }

    else if (v10)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2413LL,  @"Rapport messaging channel is nil.",  0LL));
      v10[2](v10, 0LL, v17);
    }
  }
}

- (void)_handleIncomingDictionary:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v23 = "-[ADDeviceSyncMessagingServiceRapport _handleIncomingDictionary:fromDeviceWithIdentifier:completion:]";
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, incomingDictionary = %@",  buf,  0x20u);
  }

  id v21 = 0LL;
  id v12 = sub_1002D35C8(v8, &v21);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v21;
  if (!v14)
  {
    id v15 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v23 = "-[ADDeviceSyncMessagingServiceRapport _handleIncomingDictionary:fromDeviceWithIdentifier:completion:]";
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, incomingMessage = %@",  buf,  0x20u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000AAB50;
      v18[3] = &unk_1004EFD78;
      id v19 = v9;
      id v20 = v10;
      [WeakRetained deviceSyncMessageService:self didReceiveMessage:v13 fromDeviceWithIdentifier:v19 completion:v18];

      id v17 = v19;
    }

    else
    {
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2404LL,  @"No messaging service delegate to handle incoming message.",  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v17);
    }

    goto LABEL_13;
  }

  if (v10) {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v14);
  }
LABEL_14:
}

- (void)_handleCompanionServiceReadyStateDidChange
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceReadyStateDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADDeviceSyncMessagingServiceRapport _setIsReady:]( self,  "_setIsReady:",  -[ADCompanionService isReady](self->_companionService, "isReady"));
}

- (void)_setIsReady:(BOOL)a3
{
  int v3 = a3;
  v5 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[ADDeviceSyncMessagingServiceRapport _setIsReady:]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s int isReady = %d", (uint8_t *)&v8, 0x12u);
  }

  int isReady = self->_isReady;
  if (isReady != v3)
  {
    v7 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      id v9 = "-[ADDeviceSyncMessagingServiceRapport _setIsReady:]";
      __int16 v10 = 1024;
      int v11 = isReady;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s isReady: %d -> %d", (uint8_t *)&v8, 0x18u);
    }

    self->_int isReady = v3;
  }

- (void)_handleCompanionServiceActiveDevicesDidChange
{
  if (!self->_mode)
  {
    int v3 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v8 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceActiveDevicesDidChange]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    companionService = self->_companionService;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000AAA54;
    v5[3] = &unk_1004EFDA0;
    objc_copyWeak(&v6, (id *)buf);
    -[ADCompanionService getDeviceIdentifiersWithCompletion:]( companionService,  "getDeviceIdentifiersWithCompletion:",  v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }

- (void)_setDeviceIdentifiers:(id)a3
{
  int v4 = (NSSet *)a3;
  v5 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
    __int16 v43 = 2112;
    v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s deviceIdentifiers = %@", buf, 0x16u);
  }

  deviceIdentifiers = self->_deviceIdentifiers;
  if (deviceIdentifiers != v4 && !-[NSSet isEqualToSet:](deviceIdentifiers, "isEqualToSet:", v4))
  {
    if (-[NSSet count](v4, "count"))
    {
      if (-[NSSet count](self->_deviceIdentifiers, "count"))
      {
        v7 = (NSSet *)-[NSSet mutableCopy](v4, "mutableCopy");
        -[NSSet minusSet:](v7, "minusSet:", self->_deviceIdentifiers);
      }

      else
      {
        v7 = v4;
      }
    }

    else
    {
      v7 = 0LL;
    }

    if (-[NSSet count](v7, "count"))
    {
      int v8 = (os_log_s *)AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
        __int16 v43 = 2112;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: + %@", buf, 0x16u);
      }
    }

    if (-[NSSet count](self->_deviceIdentifiers, "count"))
    {
      NSUInteger v9 = -[NSSet count](v4, "count");
      __int16 v10 = self->_deviceIdentifiers;
      if (v9)
      {
        int v11 = (NSSet *)-[NSSet mutableCopy](v10, "mutableCopy");
        -[NSSet minusSet:](v11, "minusSet:", v4);
      }

      else
      {
        int v11 = v10;
      }
    }

    else
    {
      int v11 = 0LL;
    }

    NSUInteger v12 = -[NSSet count](v11, "count");
    int v13 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (v12 && os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
      __int16 v43 = 2112;
      v44 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: - %@", buf, 0x16u);
      int v13 = (os_log_s *)AFSiriLogContextDeviceSync;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = self->_deviceIdentifiers;
      *(_DWORD *)buf = 136315650;
      v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
      __int16 v43 = 2112;
      v44 = v14;
      __int16 v45 = 2112;
      v46 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: %@ -> %@", buf, 0x20u);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v15 = v11;
    id v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained deviceSyncMessageService:self didLostDeviceWithIdentifier:v20];
        }

        id v17 = -[NSSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      }

      while (v17);
    }

    __int16 v22 = (NSSet *)-[NSSet copy](v4, "copy");
    id v23 = self->_deviceIdentifiers;
    self->_deviceIdentifiers = v22;

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int16 v24 = v7;
    id v25 = -[NSSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
          id v30 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v30, "deviceSyncMessageService:didFoundDeviceWithIdentifier:", self, v29, (void)v31);
        }

        id v26 = -[NSSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v26);
    }
  }
}

- (void)_handleCompanionServiceStereoConfigurationDidChange
{
  if (self->_mode == 1)
  {
    int v3 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v8 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceStereoConfigurationDidChange]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    companionService = self->_companionService;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000AA9AC;
    v5[3] = &unk_1004EFDC8;
    objc_copyWeak(&v6, (id *)buf);
    -[ADCompanionService getStereoPartnerIdentifierWithCompletion:]( companionService,  "getStereoPartnerIdentifierWithCompletion:",  v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }

- (void)_setStereoPartnerDeviceIdentifier:(id)a3
{
  int v4 = (NSString *)a3;
  v5 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[ADDeviceSyncMessagingServiceRapport _setStereoPartnerDeviceIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s stereoPartnerDeviceIdentifier = %@",  (uint8_t *)&v13,  0x16u);
  }

  stereoPartnerDeviceIdentifier = self->_stereoPartnerDeviceIdentifier;
  if (stereoPartnerDeviceIdentifier != v4
    && !-[NSString isEqualToString:](stereoPartnerDeviceIdentifier, "isEqualToString:", v4))
  {
    v7 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      int v8 = self->_stereoPartnerDeviceIdentifier;
      int v13 = 136315650;
      id v14 = "-[ADDeviceSyncMessagingServiceRapport _setStereoPartnerDeviceIdentifier:]";
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s stereoPartnerDeviceIdentifier: %@ -> %@",  (uint8_t *)&v13,  0x20u);
    }

    if (self->_stereoPartnerDeviceIdentifier)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained deviceSyncMessageService:self didLostDeviceWithIdentifier:self->_stereoPartnerDeviceIdentifier];
    }

    __int16 v10 = (NSString *)-[NSString copy](v4, "copy");
    int v11 = self->_stereoPartnerDeviceIdentifier;
    self->_stereoPartnerDeviceIdentifier = v10;

    if (self->_stereoPartnerDeviceIdentifier)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 deviceSyncMessageService:self didFoundDeviceWithIdentifier:self->_stereoPartnerDeviceIdentifier];
    }
  }
}

- (void).cxx_destruct
{
}

@end