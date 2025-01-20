@interface ADDeviceSyncCoordinator
- (ADDeviceSyncCoordinator)init;
- (id)_sessionWithDeviceIdentifier:(id)a3;
- (void)_getGenerationsForDataTypes:(id)a3 andPushToDeviceWithIdentifier:(id)a4;
- (void)deviceSyncDataProviderDidUpdate:(id)a3;
- (void)deviceSyncMessageService:(id)a3 didFoundDeviceWithIdentifier:(id)a4;
- (void)deviceSyncMessageService:(id)a3 didLostDeviceWithIdentifier:(id)a4;
- (void)deviceSyncMessageService:(id)a3 didReceiveMessage:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADDeviceSyncCoordinator

- (ADDeviceSyncCoordinator)init
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCoordinator;
  v2 = -[ADDeviceSyncCoordinator init](&v49, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.device-sync.coordinator", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (AFIsHorseman(v10, v11))
    {
      v12 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncTimerConsumer);
      -[NSMutableArray addObject:](v9, "addObject:", v12);

      v13 = -[ADDeviceSyncTimerProvider initWithDelegate:]( objc_alloc(&OBJC_CLASS___ADDeviceSyncTimerProvider),  "initWithDelegate:",  v2);
      -[NSMutableArray addObject:](v10, "addObject:", v13);
    }

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    v15 = v9;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 type]);
          -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v20, v21);
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
      }

      while (v17);
    }

    v22 = (NSDictionary *)-[NSMutableDictionary copy](v14, "copy");
    dataConsumersByType = v2->_dataConsumersByType;
    v2->_dataConsumersByType = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v25 = v10;
    id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v41,  v52,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v42;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "type", (void)v41));
          -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v30, v31);
        }

        id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v41,  v52,  16LL);
      }

      while (v27);
    }

    v32 = (NSDictionary *)-[NSMutableDictionary copy](v24, "copy");
    dataProvidersByType = v2->_dataProvidersByType;
    v2->_dataProvidersByType = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionsByDeviceIdentifier = v2->_sessionsByDeviceIdentifier;
    v2->_sessionsByDeviceIdentifier = v34;

    v36 = -[ADDeviceSyncMessagingServiceRapport initWithMode:delegate:]( objc_alloc(&OBJC_CLASS___ADDeviceSyncMessagingServiceRapport),  "initWithMode:delegate:",  1LL,  v2);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncMessagingServiceRapport channel](v36, "channel"));
    v50 = v37;
    v51 = v36;
    uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
    messagingServicesByChannel = v2->_messagingServicesByChannel;
    v2->_messagingServicesByChannel = (NSDictionary *)v38;
  }

  return v2;
}

- (void)deviceSyncMessageService:(id)a3 didFoundDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didFoundDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s deviceSyncMessageService = %@, deviceIdentifier = %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100126E6C;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)deviceSyncMessageService:(id)a3 didLostDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didLostDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s deviceSyncMessageService = %@, deviceIdentifier = %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100126DC0;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)deviceSyncMessageService:(id)a3 didReceiveMessage:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didReceiveMessage:fromDeviceWithIdentifier:completion:]";
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s deviceSyncMessageService = %@, deviceIdentifier = %@, incomingMessage = %@",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100126D6C;
  v19[3] = &unk_1004FDA30;
  v19[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (void)deviceSyncDataProviderDidUpdate:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADDeviceSyncCoordinator deviceSyncDataProviderDidUpdate:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s deviceSyncDataProvider = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100126CD0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (id)_sessionWithDeviceIdentifier:(id)a3
{
  id v4 = (ADDeviceSyncSession *)a3;
  dispatch_queue_attr_t v5 = (ADDeviceSyncSession *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sessionsByDeviceIdentifier,  "objectForKey:",  v4));
  if (!v5)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[ADDeviceSyncCoordinator _sessionWithDeviceIdentifier:]";
      __int16 v26 = 2112;
      __int16 v27 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Creating session for device with identifier %@...",  buf,  0x16u);
    }

    id v7 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSDictionary count](self->_messagingServicesByChannel, "count"));
    messagingServicesByChannel = self->_messagingServicesByChannel;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100126C64;
    v21[3] = &unk_1004F2260;
    id v9 = v7;
    id v22 = v9;
    id v10 = v4;
    v23 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( messagingServicesByChannel,  "enumerateKeysAndObjectsUsingBlock:",  v21);
    id v11 = objc_alloc(&OBJC_CLASS___ADDeviceSyncSession);
    __int16 v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.assistant.device-sync.session.%@", v10);
    id v13 = -[NSString UTF8String](v12, "UTF8String");
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);
    id v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);

    dispatch_queue_t v18 = dispatch_queue_create(v13, v17);
    dispatch_queue_attr_t v5 = -[ADDeviceSyncSession initWithQueue:deviceIdentifier:dataConsumersByType:dataProvidersByType:messageSenders:]( v11,  "initWithQueue:deviceIdentifier:dataConsumersByType:dataProvidersByType:messageSenders:",  v18,  v10,  self->_dataConsumersByType,  self->_dataProvidersByType,  v9);

    -[NSMutableDictionary setObject:forKey:](self->_sessionsByDeviceIdentifier, "setObject:forKey:", v5, v10);
    v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v25 = "-[ADDeviceSyncCoordinator _sessionWithDeviceIdentifier:]";
      __int16 v26 = 2112;
      __int16 v27 = v5;
      __int16 v28 = 2112;
      __int16 v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Created session %@ for device with identifier %@.",  buf,  0x20u);
    }
  }

  return v5;
}

- (void)_getGenerationsForDataTypes:(id)a3 andPushToDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  id v7 = self->_queue;
  v8 = dispatch_group_create();
  id v9 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_dataProvidersByType, "allKeys"));
  }
  id v11 = v10;
  id v21 = v6;
  id v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataProvidersByType, "objectForKey:", v16));
        if (v17)
        {
          dispatch_group_enter(v8);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_100126AD4;
          v26[3] = &unk_1004F26A8;
          __int16 v27 = v7;
          __int16 v28 = v9;
          uint64_t v29 = v16;
          id v30 = v8;
          [v17 getGenerationWithCompletion:v26];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100126B68;
  block[3] = &unk_1004FD4C0;
  id v23 = v20;
  v24 = self;
  __int16 v25 = v9;
  dispatch_queue_t v18 = v9;
  id v19 = v20;
  dispatch_group_notify(v8, (dispatch_queue_t)v7, block);
}

- (void).cxx_destruct
{
}

@end