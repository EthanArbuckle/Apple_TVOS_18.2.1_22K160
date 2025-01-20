@interface ADRemoteTimerManager
- (ADRemoteTimerManager)init;
- (id)_storageForDeviceWithIdentifier:(id)a3;
- (void)_invalidateStorageForDeviceWithIdentifier:(id)a3;
- (void)_sendStereoPartnerAction:(id)a3 timerID:(id)a4 changes:(id)a5 completion:(id)a6;
- (void)accessStorageForDeviceWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6;
- (void)finalizeStorageForDeviceWithIdentifier:(id)a3;
- (void)getSnapshotForDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)getSnapshotsByDeviceIdentifierWithCompletion:(id)a3;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)prepareStorageForDeviceWithIdentifier:(id)a3;
- (void)removeTimerWithID:(id)a3 completion:(id)a4;
- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
@end

@implementation ADRemoteTimerManager

- (ADRemoteTimerManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADRemoteTimerManager;
  v2 = -[ADRemoteTimerManager init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.remote-timer-manager", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    storagesByDeviceIdentifier = v2->_storagesByDeviceIdentifier;
    v2->_storagesByDeviceIdentifier = v7;

    if (AFIsHorseman(v9, v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v11 setMessageHandler:v2 forMessageType:@"clocktimer"];
    }

    else
    {
      v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[ADRemoteTimerManager init]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s This platform does not support stereo partner timers",  buf,  0xCu);
      }
    }
  }

  return v2;
}

- (void)getSnapshotForDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007AB60;
    block[3] = &unk_1004FD9E0;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(queue, v9);
  }
}

- (void)getSnapshotsByDeviceIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10007A974;
    v8[3] = &unk_1004FD990;
    v8[4] = self;
    id v9 = v4;
    dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
    dispatch_async(queue, v7);
  }
}

- (void)prepareStorageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007A950;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)finalizeStorageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007A944;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)accessStorageForDeviceWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A8E8;
    block[3] = &unk_1004FD9E0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007A84C;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007A7B8;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[ADCommandCenter sharedCommandCenter]( &OBJC_CLASS___ADCommandCenter,  "sharedCommandCenter",  a3,  a4,  a5,  a6));
  [v6 setAlertContextDirty];
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = (NSUUID *)a4;
  id v11 = (NSUUID *)a5;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v14)
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v35 = 2112;
    v36 = v11;
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, messageType = %@",  buf,  0x20u);
  }

  if ((AFIsHorseman(v14, v15) & 1) != 0)
  {
    if ((-[NSUUID isEqualToString:](v10, "isEqualToString:", @"clocktimer") & 1) != 0)
    {
      id v16 = (NSUUID *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"action"]);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {

        id v16 = 0LL;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"timer-id-string"]);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
        v20 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v18);
      }
      else {
        v20 = 0LL;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"timer-changes"]);
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {

        v23 = 0LL;
      }

      v25 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v34 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        __int16 v35 = 2112;
        v36 = v16;
        __int16 v37 = 2112;
        v38 = v20;
        __int16 v39 = 2112;
        v40 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s action = %@, timerID = %@, changes = %@",  buf,  0x2Au);
      }

      if (-[NSUUID isEqualToString:](v16, "isEqualToString:", @"update-timer"))
      {
        if (v20 && v23)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_10007A400;
          v31[3] = &unk_1004EF1F8;
          id v32 = v12;
          [v26 updateTimerWithID:v20 changes:v23 completion:v31];

          v27 = v32;
          goto LABEL_29;
        }
      }

      else if (-[NSUUID isEqualToString:](v16, "isEqualToString:", @"remove-timer") && v20)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_10007A5DC;
        v29[3] = &unk_1004EF1F8;
        id v30 = v12;
        [v28 removeTimerWithID:v20 completion:v29];

        v27 = v30;
        goto LABEL_29;
      }

      if (!v12)
      {
LABEL_30:

        goto LABEL_31;
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 2114LL));
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v27);
LABEL_29:

      goto LABEL_30;
    }

    v22 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v35 = 2112;
      v36 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Received message from unknown message type: %@",  buf,  0x16u);
      if (!v12) {
        goto LABEL_32;
      }
      goto LABEL_13;
    }

    if (v12)
    {
LABEL_13:
      uint64_t v21 = 1004LL;
      goto LABEL_14;
    }
  }

  else if (v12)
  {
    uint64_t v21 = 2114LL;
LABEL_14:
    id v16 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v21));
    (*((void (**)(id, void, NSUUID *))v12 + 2))(v12, 0LL, v16);
LABEL_31:
  }

- (id)_storageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_storagesByDeviceIdentifier, "objectForKey:", v4));
  if (!v5)
  {
    id v5 = [[AFClockItemStorage alloc] initWithIdentifier:v4 delegate:self];
    -[NSMutableDictionary setObject:forKey:](self->_storagesByDeviceIdentifier, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_invalidateStorageForDeviceWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_storagesByDeviceIdentifier, "objectForKey:"));
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_storagesByDeviceIdentifier, "removeObjectForKey:", v6);
  }
}

- (void)_sendStereoPartnerAction:(id)a3 timerID:(id)a4 changes:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((AFIsHorseman(v13, v14) & 1) != 0)
  {
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v10, @"action");
    if (v11)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, @"timer-id-string");
    }

    if (v12) {
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v12, @"timer-changes");
    }
    uint64_t v17 = self->_queue;
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADRemoteTimerManager _sendStereoPartnerAction:timerID:changes:completion:]";
      __int16 v26 = 2112;
      v27 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Sending stereo partner message %@...",  buf,  0x16u);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100079F38;
    v21[3] = &unk_1004F4150;
    v22 = v17;
    id v23 = v13;
    v20 = v17;
    [v19 sendStereoPartnerMessage:v15 messageType:@"clocktimer" completion:v21];

    goto LABEL_11;
  }

  if (v13)
  {
    uint64_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 2114LL));
    (*((void (**)(id, void, NSMutableDictionary *))v13 + 2))(v13, 0LL, v15);
LABEL_11:
  }
}

- (void).cxx_destruct
{
}

@end