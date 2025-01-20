@interface ADDeviceSyncSession
- (ADDeviceSyncSession)initWithQueue:(id)a3 deviceIdentifier:(id)a4 dataConsumersByType:(id)a5 dataProvidersByType:(id)a6 messageSenders:(id)a7;
- (BOOL)_handlePulledDeltaWithIncrementalChanges:(id)a3 forDataType:(id)a4;
- (BOOL)_handlePulledSnapshot:(id)a3 forDataType:(id)a4;
- (BOOL)_handlePushedOrPulledGeneration:(unint64_t)a3 forDataType:(id)a4;
- (NSString)deviceIdentifier;
- (void)_handlePingWithCompletion:(id)a3;
- (void)_handlePullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)_handlePullGenerationsForDataTypes:(id)a3 completion:(id)a4;
- (void)_handlePullSnapshotForDataType:(id)a3 completion:(id)a4;
- (void)_handlePushGenerationsByDataType:(id)a3 completion:(id)a4;
- (void)_invalidate;
- (void)_pingWithCompletion:(id)a3;
- (void)_pullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)_pullGenerationsForDataTypes:(id)a3 completion:(id)a4;
- (void)_pullSnapshotForDataType:(id)a3 completion:(id)a4;
- (void)_pushGenerationsByDataType:(id)a3 completion:(id)a4;
- (void)_receiveMessage:(id)a3 completion:(id)a4;
- (void)_sendMessage:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)pushGenerationsByDataTypes:(id)a3;
- (void)receiveMessage:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
@end

@implementation ADDeviceSyncSession

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDeviceSyncSession;
  -[ADDeviceSyncSession dealloc](&v3, "dealloc");
}

- (ADDeviceSyncSession)initWithQueue:(id)a3 deviceIdentifier:(id)a4 dataConsumersByType:(id)a5 dataProvidersByType:(id)a6 messageSenders:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ADDeviceSyncSession;
  v18 = -[ADDeviceSyncSession init](&v31, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    v20 = (NSString *)[v14 copy];
    deviceIdentifier = v19->_deviceIdentifier;
    v19->_deviceIdentifier = v20;

    v22 = (NSDictionary *)[v15 copy];
    dataConsumersByType = v19->_dataConsumersByType;
    v19->_dataConsumersByType = v22;

    v24 = (NSDictionary *)[v16 copy];
    dataProvidersByType = v19->_dataProvidersByType;
    v19->_dataProvidersByType = v24;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1001302B4;
    v29[3] = &unk_1004F24F0;
    id v30 = v14;
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v17 objectsPassingTest:v29]);
    messageSenders = v19->_messageSenders;
    v19->_messageSenders = (NSSet *)v26;
  }

  return v19;
}

- (void)pushGenerationsByDataTypes:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001302A4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013029C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)receiveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013028C;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013027C;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = 0LL;

  dataConsumersByType = self->_dataConsumersByType;
  self->_dataConsumersByType = 0LL;

  dataProvidersByType = self->_dataProvidersByType;
  self->_dataProvidersByType = 0LL;

  messageSenders = self->_messageSenders;
  self->_messageSenders = 0LL;
}

- (BOOL)_handlePushedOrPulledGeneration:(unint64_t)a3 forDataType:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataConsumersByType, "objectForKey:", v6));
  if (v7)
  {
    id v8 = self->_queue;
    objc_initWeak(&location, self);
    deviceIdentifier = self->_deviceIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10012FEA0;
    v12[3] = &unk_1004F2568;
    id v13 = v7;
    id v14 = self;
    v17[1] = (id)a3;
    id v10 = v8;
    id v15 = v10;
    objc_copyWeak(v17, &location);
    id v16 = v6;
    [v13 getGenerationForDeviceWithIdentifier:deviceIdentifier completion:v12];

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

  return v7 != 0LL;
}

- (BOOL)_handlePulledDeltaWithIncrementalChanges:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataConsumersByType, "objectForKey:", a4));
  id v8 = v7;
  if (v7) {
    [v7 applyIncrementalChanges:v6 fromDeviceWithIdentifier:self->_deviceIdentifier];
  }

  return v8 != 0LL;
}

- (BOOL)_handlePulledSnapshot:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataConsumersByType, "objectForKey:", a4));
  id v8 = v7;
  if (v7) {
    [v7 applySnapshot:v6 fromDeviceWithIdentifier:self->_deviceIdentifier];
  }

  return v8 != 0LL;
}

- (void)_receiveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    deviceIdentifier = self->_deviceIdentifier;
    *(_DWORD *)buf = 136315650;
    v51 = "-[ADDeviceSyncSession _receiveMessage:completion:]";
    __int16 v52 = 2112;
    v53 = deviceIdentifier;
    __int16 v54 = 2112;
    id v55 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, incomingMessage = %@",  buf,  0x20u);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v45 = sub_10012F4EC;
  v46 = &unk_1004FD9E0;
  v47 = self;
  id v49 = v7;
  id v48 = v6;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v39 = sub_10012F574;
  v40 = &unk_1004F25B8;
  v41 = self;
  id v43 = v49;
  id v42 = v48;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v33 = sub_10012F61C;
  v34 = &unk_1004F2608;
  v35 = self;
  id v37 = v43;
  id v36 = v42;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v27 = sub_10012F6C4;
  v28 = &unk_1004F2630;
  v29 = self;
  id v31 = v37;
  id v30 = v36;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v21 = sub_10012F79C;
  v22 = &unk_1004F2658;
  v23 = self;
  id v10 = v31;
  id v25 = v10;
  id v24 = v30;
  id v11 = v24;
  id v12 = v44;
  id v13 = v38;
  id v14 = v32;
  id v15 = v26;
  id v16 = v20;
  BOOL v17 = 0;
  switch((unint64_t)[v11 type])
  {
    case 1uLL:
      v45((uint64_t)v12);
      BOOL v17 = 1;
      break;
    case 3uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 commandPushGenerationsRequest]);
      BOOL v17 = v18 != 0LL;
      if (v18) {
        v39((uint64_t)v13, v18);
      }
      goto LABEL_13;
    case 5uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 commandPullGenerationsRequest]);
      BOOL v17 = v18 != 0LL;
      if (v18) {
        v33((uint64_t)v14, v18);
      }
      goto LABEL_13;
    case 7uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 commandPullDeltaRequest]);
      BOOL v17 = v18 != 0LL;
      if (v18) {
        v27((uint64_t)v15, v18);
      }
      goto LABEL_13;
    case 9uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 commandPullSnapshotRequest]);
      BOOL v17 = v18 != 0LL;
      if (v18) {
        v21((uint64_t)v16, v18);
      }
LABEL_13:

      break;
    default:
      break;
  }

  if (v10 && !v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2408LL,  @"There's no supported request in incoming message.",  0LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v19);
  }
}

- (void)_handlePingWithCompletion:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  id v4 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceSyncSession _handlePingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  if (v3) {
    v3[2](v3, 0LL);
  }
}

- (void)_handlePushGenerationsByDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADDeviceSyncSession _handlePushGenerationsByDataType:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s generationsByDataType = %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012F484;
  v14[3] = &unk_1004F2680;
  v14[4] = self;
  v14[5] = buf;
  [v6 enumerateKeysAndObjectsUsingBlock:v14];
  if (v7)
  {
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      id v9 = 0LL;
    }

    else
    {
      id v10 = objc_alloc(&OBJC_CLASS___NSString);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
      id v12 = -[NSString initWithFormat:](v10, "initWithFormat:", @"No data consumer for data types %@.", v11);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2411LL,  v12,  0LL));

      if (v9)
      {
        id v13 = (os_log_s *)AFSiriLogContextDeviceSync;
        if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v15 = 136315394;
          id v16 = "-[ADDeviceSyncSession _handlePushGenerationsByDataType:completion:]";
          __int16 v17 = 2112;
          v18 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s error = %@", v15, 0x16u);
        }
      }
    }

    v7[2](v7, v9);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_handlePullGenerationsForDataTypes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[ADDeviceSyncSession _handlePullGenerationsForDataTypes:completion:]";
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataTypes = %@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = self->_queue;
    id v10 = dispatch_group_create();
    id v11 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v21 = v7;
    v22 = v6;
    if (v6) {
      id v12 = v6;
    }
    else {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_dataProvidersByType, "allKeys"));
    }
    id v13 = v12;
    id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataProvidersByType, "objectForKey:", v18));
          if (v19)
          {
            dispatch_group_enter(v10);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472LL;
            v27[2] = sub_10012F1DC;
            v27[3] = &unk_1004F26A8;
            v28 = v9;
            v29 = v11;
            uint64_t v30 = v18;
            id v31 = v10;
            [v19 getGenerationWithCompletion:v27];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v15);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012F270;
    block[3] = &unk_1004FD9E0;
    id v24 = v11;
    id v6 = v22;
    id v25 = v22;
    id v7 = v21;
    id v26 = v21;
    char v20 = v11;
    dispatch_group_notify(v10, (dispatch_queue_t)v9, block);
  }
}

- (void)_handlePullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = (OS_dispatch_queue *)a3;
  id v11 = a6;
  id v12 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v22 = "-[ADDeviceSyncSession _handlePullDeltaForDataType:generation:limit:completion:]";
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s dataType = %@, generation = %llu, limit = %llu",  buf,  0x2Au);
  }

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataProvidersByType, "objectForKey:", v10));
    if (v13)
    {
      id v14 = self->_queue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10012EFE0;
      v18[3] = &unk_1004FD718;
      v19 = v14;
      id v20 = v11;
      id v15 = v14;
      [v13 getIncrementalChangesAfterGeneration:a4 limit:a5 completion:v18];
    }

    else
    {
      uint64_t v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"No data provider for data type %@.",  v10);
      id v15 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2410LL,  v16,  0LL));

      __int16 v17 = (os_log_s *)AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[ADDeviceSyncSession _handlePullDeltaForDataType:generation:limit:completion:]";
        __int16 v23 = 2112;
        id v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }

      (*((void (**)(id, void, OS_dispatch_queue *))v11 + 2))(v11, 0LL, v15);
    }
  }
}

- (void)_handlePullSnapshotForDataType:(id)a3 completion:(id)a4
{
  id v6 = (OS_dispatch_queue *)a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[ADDeviceSyncSession _handlePullSnapshotForDataType:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataType = %@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dataProvidersByType, "objectForKey:", v6));
    if (v9)
    {
      id v10 = self->_queue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10012EDE4;
      v14[3] = &unk_1004F26D0;
      id v15 = v10;
      id v16 = v7;
      id v11 = v10;
      [v9 getSnapshotWithCompletion:v14];
    }

    else
    {
      id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"No data provider for data type %@.",  v6);
      id v11 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2410LL,  v12,  0LL));

      id v13 = (os_log_s *)AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "-[ADDeviceSyncSession _handlePullSnapshotForDataType:completion:]";
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }

      (*((void (**)(id, void, OS_dispatch_queue *))v7 + 2))(v7, 0LL, v11);
    }
  }
}

- (void)_sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    deviceIdentifier = self->_deviceIdentifier;
    *(_DWORD *)buf = 136315650;
    id v37 = "-[ADDeviceSyncSession _sendMessage:completion:]";
    __int16 v38 = 2112;
    __int16 v39 = deviceIdentifier;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, outgoingMessage = %@",  buf,  0x20u);
  }

  v22 = v7;
  id v10 = -[ADDeviceSyncMessageSendingContext initWithQueue:deviceIdentifier:timeoutDuration:completion:]( objc_alloc(&OBJC_CLASS___ADDeviceSyncMessageSendingContext),  "initWithQueue:deviceIdentifier:timeoutDuration:completion:",  self->_queue,  self->_deviceIdentifier,  v7,  16.0);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v11 = self->_messageSenders;
  id v12 = -[NSSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        -[ADDeviceSyncMessageSendingContext beginSendingWithMessageSender:]( v10,  "beginSendingWithMessageSender:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v15));
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    }

    while (v13);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v16 = self->_messageSenders;
  id v17 = -[NSSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v20);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_10012EDD0;
        v23[3] = &unk_1004F26F8;
        id v24 = v10;
        __int16 v25 = v21;
        [v21 sendMessage:v6 completion:v23];

        id v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = -[NSSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v18);
  }
}

- (void)_pingWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[ADDeviceSyncSession _pingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012E9A0;
  v15[3] = &unk_1004F2718;
  uint8_t v15[4] = outgoingSequence;
  id v7 = +[ADDeviceSyncMessage newWithBuilder:](&OBJC_CLASS___ADDeviceSyncMessage, "newWithBuilder:", v15);
  id v8 = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012E9E4;
  v11[3] = &unk_1004F2740;
  id v12 = v8;
  id v13 = v4;
  unint64_t v14 = outgoingSequence;
  id v9 = v8;
  id v10 = v4;
  -[ADDeviceSyncSession _sendMessage:completion:](self, "_sendMessage:completion:", v7, v11);
}

- (void)_pushGenerationsByDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v23 = "-[ADDeviceSyncSession _pushGenerationsByDataType:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s generationsByDataType = %@", buf, 0x16u);
  }

  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10012E53C;
  v19[3] = &unk_1004F2768;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:](&OBJC_CLASS___ADDeviceSyncMessage, "newWithBuilder:", v19);
  id v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012E5B4;
  v15[3] = &unk_1004F2740;
  id v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  id v13 = v12;
  id v14 = v7;
  -[ADDeviceSyncSession _sendMessage:completion:](self, "_sendMessage:completion:", v11, v15);
}

- (void)_pullGenerationsForDataTypes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v23 = "-[ADDeviceSyncSession _pullGenerationsForDataTypes:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataTypes = %@", buf, 0x16u);
  }

  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10012DFF8;
  v19[3] = &unk_1004F2768;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:](&OBJC_CLASS___ADDeviceSyncMessage, "newWithBuilder:", v19);
  id v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012E070;
  v15[3] = &unk_1004F2740;
  id v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  id v13 = v12;
  id v14 = v7;
  -[ADDeviceSyncSession _sendMessage:completion:](self, "_sendMessage:completion:", v11, v15);
}

- (void)_pullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int128 v29 = "-[ADDeviceSyncSession _pullDeltaForDataType:generation:limit:completion:]";
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2048;
    unint64_t v33 = a4;
    __int16 v34 = 2048;
    unint64_t v35 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s dataType = %@, generation = %llu, limit = %llu",  buf,  0x2Au);
  }

  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10012DAB0;
  v23[3] = &unk_1004F27E0;
  id v24 = v10;
  unint64_t v25 = outgoingSequence;
  unint64_t v26 = a4;
  unint64_t v27 = a5;
  id v14 = v10;
  id v15 = +[ADDeviceSyncMessage newWithBuilder:](&OBJC_CLASS___ADDeviceSyncMessage, "newWithBuilder:", v23);
  id v16 = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10012DB2C;
  v19[3] = &unk_1004F2740;
  id v20 = v16;
  id v21 = v11;
  unint64_t v22 = outgoingSequence;
  id v17 = v16;
  id v18 = v11;
  -[ADDeviceSyncSession _sendMessage:completion:](self, "_sendMessage:completion:", v15, v19);
}

- (void)_pullSnapshotForDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v23 = "-[ADDeviceSyncSession _pullSnapshotForDataType:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataType = %@", buf, 0x16u);
  }

  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10012D56C;
  v19[3] = &unk_1004F2768;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:](&OBJC_CLASS___ADDeviceSyncMessage, "newWithBuilder:", v19);
  id v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012D5E4;
  v15[3] = &unk_1004F2740;
  id v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  id v13 = v12;
  id v14 = v7;
  -[ADDeviceSyncSession _sendMessage:completion:](self, "_sendMessage:completion:", v11, v15);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

@end