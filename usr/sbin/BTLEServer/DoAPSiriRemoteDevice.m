@interface DoAPSiriRemoteDevice
- (DoAPAudioRelay)doapAudioRelay;
- (DoAPSiriRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (NSArray)codecs;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (void)activateSiri:(int64_t)a3;
- (void)cancelSiri;
- (void)clearEvent;
- (void)clearState;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)start;
- (void)stop;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation DoAPSiriRemoteDevice

- (DoAPSiriRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v7 = a3;
  if (v4 == 1)
  {
    v27.receiver = self;
    v27.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
    v8 = -[DoAPDevice initWithCodecs:streamID:](&v27, "initWithCodecs:streamID:", v7, 1LL);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_codecs, a3);
      v9->_vtEvent = 0;
      v9->_vtSource = 0;
      v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      audioBuffer = v9->_audioBuffer;
      v9->_audioBuffer = v10;

      dispatch_group_t v12 = dispatch_group_create();
      groupStart = v9->_groupStart;
      v9->_groupStart = (OS_dispatch_group *)v12;

      if (v9->_groupStart)
      {
        dispatch_semaphore_t v14 = dispatch_semaphore_create(1LL);
        doapAudioStart = v9->_doapAudioStart;
        v9->_doapAudioStart = (OS_dispatch_semaphore *)v14;

        if (v9->_doapAudioStart)
        {
          v16 = -[DoAPDevice allocQueue](v9, "allocQueue");
          queue = v9->_queue;
          v9->_queue = v16;

          v18 = (dispatch_object_s *)v9->_queue;
          if (v18)
          {
            dispatch_set_context(v18, v9);
            dispatch_set_finalizer_f( (dispatch_object_t)v9->_queue,  (dispatch_function_t)j__objc_msgSend_notifyDidStop_0);
            v19 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
            v20 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
            v21 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v19,  "initWithName:options:queue:delegate:",  v20,  1LL,  &_dispatch_main_q,  v9);
            notifyObserver = v9->_notifyObserver;
            v9->_notifyObserver = v21;

            v9->_siriState = 0;
            goto LABEL_11;
          }

          v24 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0LL;
        }

        v25 = v9->_groupStart;
        v9->_groupStart = 0LL;
      }

      v9 = 0LL;
    }

- (void)stop
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Stop DoAPSiriRemoteDevice - Destroy DoAPAudioRelay",  buf,  2u);
  }

  int v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
  if (v5)
  {
    v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    [v8 invalidate];

    -[DoAPSiriRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", 0LL);
  }

  -[AFNotifyObserver invalidate](self->_notifyObserver, "invalidate");
  notifyObserver = self->_notifyObserver;
  self->_notifyObserver = 0LL;

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  -[DoAPDevice stop](&v12, "stop");
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F178;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  -[DoAPDevice start](&v37, "start");
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Start DoAPSiriRemoteDevice - Create DoAPAudioRelay",  buf,  2u);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice codecs](self, "codecs"));
  id v5 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if (v9)
        {
          [*(id *)(*((void *)&v33 + 1) + 8 * (void)i) codec];
          if (v30 == 7)
          {
            if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v10))
            {
              objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
              v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
              dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
              v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v14,  @"DoAP Siri"));
            }

            else
            {
              objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
              v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
              v15 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
            }

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](&OBJC_CLASS___DoAPAudioRelayHub, "instance"));
            [v9 codec];
            v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 relayWithIdentifier:v15 deviceType:3 properties:0 codecType:v29]);
            -[DoAPSiriRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", v17);

            v18 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
            [v18 setDelegate:self];

            v19 = (void *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              [v9 codec];
              *(_DWORD *)buf = 67109120;
              int v39 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Start DoAPSiriRemoteDevice - Send SelectCodec(%u) msg",  buf,  8u);
            }

            groupStart = self->_groupStart;
            queue = (dispatch_queue_s *)self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10002F5F4;
            block[3] = &unk_10005D248;
            block[4] = self;
            void block[5] = v9;
            dispatch_group_async((dispatch_group_t)groupStart, queue, block);
            v23 = self->_groupStart;
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
            v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472LL;
            v26[2] = sub_10002F640;
            v26[3] = &unk_10005CB58;
            v26[4] = self;
            dispatch_group_async((dispatch_group_t)v23, v25, v26);

            return;
          }
        }

        else
        {
          uint64_t v30 = 0LL;
          uint64_t v31 = 0LL;
          int v32 = 0;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003CB60();
  }
}

- (int)selectCodec:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  return -[DoAPDevice selectCodec:](&v4, "selectCodec:", a3);
}

- (int)startStreaming
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  int v3 = -[DoAPDevice startStreaming](&v5, "startStreaming");
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003CB8C();
    }
  }

  else
  {
    self->_vtEvent = 1;
    self->_vtSource = 3;
  }

  return v3;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  return -[DoAPDevice stopStreaming:](&v4, "stopStreaming:", a3);
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  int v4 = -[DoAPDevice eventIndicator:eventValue:](&v6, "eventIndicator:eventValue:", a3, a4);
  if (v4 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003CBF0();
  }
  return v4;
}

- (void)clearEvent
{
  self->_vtEvent = 0;
  self->_vtSource = 0;
}

- (void)clearState
{
  if (-[DoAPDevice state](self, "state") == 5)
  {
    int v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v3);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v4)
  {
    objc_super v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v5);

    -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));

  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v7, "audioBuffer"));
    [v8 removeAllObjects];

    objc_sync_exit(v7);
  }

  obj = self;
  objc_sync_enter(obj);
  -[DoAPSiriRemoteDevice clearEvent](obj, "clearEvent");
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 2LL);
  objc_sync_exit(obj);
}

- (void)activateSiri:(int64_t)a3
{
  objc_super v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    *(_DWORD *)buf = 134218243;
    int64_t v23 = a3;
    __int16 v24 = 2113;
    v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - activateSiri: Event %tu for ID %{private}@",  buf,  0x16u);
  }

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 1LL, &off_10005FF28);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10002FBCC;
    v19[3] = &unk_10005D5F0;
    v19[4] = self;
    uint64_t v10 = objc_retainBlock(v19);
    if (a3 == 1)
    {
      BOOL v15 = -[DoAPDevice state](self, "state") != 5;
      uint64_t v16 = mach_absolute_time();
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
      v20[0] = AFSiriActivationUserInfoKey[0];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
      v20[1] = AFSiriActivationUserInfoKey[9];
      v21[0] = v17;
      v21[1] = &__kCFBooleanFalse;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      AFSiriActivationBluetoothDeviceDoubleTap(v16, v14, v18, v10);
    }

    else
    {
      if (a3 != 2)
      {
LABEL_11:

        return;
      }

      uint64_t v11 = mach_absolute_time();
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
      AFSiriActivationBluetoothDeviceVoice(v11, v14, &__NSDictionary0__struct, v10);
    }

    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003CC54();
  }
}

- (void)cancelSiri
{
  int v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Cancellation id \"%@\"", buf, 0xCu);
  }

  uint64_t v8 = mach_absolute_time();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  uint64_t v12 = AFSiriActivationUserInfoKey[9];
  v14[0] = AFSiriActivationUserInfoKey[0];
  v14[1] = v12;
  v15[0] = &__kCFBooleanFalse;
  v15[1] = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  AFSiriActivationBluetoothDeviceDoubleTap(v8, v11, v13, &stru_10005D630);
}

- (void)handleStartStreaming
{
  v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "DoAPSiriRemoteDevice received StartStreaming",  v3,  2u);
  }

- (void)handleStopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  objc_super v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DoAPSiriRemoteDevice Received StopStreaming with error code%d",  (uint8_t *)v7,  8u);
  }

  if (-[DoAPDevice state](self, "state") == 5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    [v6 cancelStream];
  }

  -[DoAPSiriRemoteDevice clearState](self, "clearState");
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  if (-[DoAPDevice state](self, "state") <= 6 && a3 && a4 >= 1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[DoAPSiriRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
    if (-[DoAPDevice state](self, "state") == 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      unsigned int v10 = [v9 isHubConnected];

      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003CDDC();
        }
        goto LABEL_15;
      }

      uint64_t v11 = (DoAPSiriRemoteDevice *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      -[DoAPSiriRemoteDevice sendAudioFrame:](v11, "sendAudioFrame:", v8);
    }

    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        unsigned int v14 = -[DoAPDevice state](self, "state");
        BOOL v15 = (os_log_s *)qword_100070CC8;
        BOOL v16 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
        if (v14 == 2)
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }

          -[DoAPSiriRemoteDevice stopStreaming:](self, "stopStreaming:", 6LL);
          queue = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100030428;
          block[3] = &unk_10005CB58;
          block[4] = self;
          dispatch_async(queue, block);
        }

        else if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Audio data ignored", buf, 2u);
        }

        goto LABEL_15;
      }

      uint64_t v11 = self;
      objc_sync_enter(v11);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v11, "audioBuffer"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v11, "audioBuffer"));
        [v13 addObject:v8];
      }

      objc_sync_exit(v11);
    }

LABEL_15:
  }

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  switch(a3)
  {
    case 1u:
      objc_super v6 = self;
      objc_sync_enter(v6);
      if (-[DoAPDevice state](v6, "state") != 2 && -[DoAPDevice state](v6, "state") != 5) {
        goto LABEL_51;
      }
      int v7 = *a4;
      if (v7 != 1) {
        goto LABEL_40;
      }
      if (-[DoAPDevice state](v6, "state") == 2)
      {
        uint64_t v8 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v42) = 0;
          uint64_t v9 = 2LL;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - handleEventIndicator: SiriActivation by VoiceTrigger",  (uint8_t *)&v42,  2u);
        }

        else
        {
          uint64_t v9 = 2LL;
        }
      }

      else
      {
        int v7 = *a4;
LABEL_40:
        __int128 v34 = (os_log_s *)(id)qword_100070CC8;
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v7 != 2)
        {
          if (v35)
          {
            objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](v6, "doapStateNameFor:", -[DoAPDevice state](v6, "state")));
            int v42 = 67109378;
            LODWORD(v43[0]) = 1;
            WORD2(v43[0]) = 2114;
            *(void *)((char *)v43 + 6) = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - handleEventIndicator: Unhandled event type %d while %{public}@",  (uint8_t *)&v42,  0x12u);
          }

          goto LABEL_51;
        }

        if (v35)
        {
          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](v6, "doapStateNameFor:", -[DoAPDevice state](v6, "state")));
          int v42 = 138543362;
          v43[0] = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - handleEventIndicator: SiriActivation by DoubleTap while %{public}@",  (uint8_t *)&v42,  0xCu);
        }

        uint64_t v9 = 1LL;
      }

      if (-[DoAPDevice state](v6, "state") == 2) {
        -[DoAPDevice doapStateSet:](v6, "doapStateSet:", 3LL);
      }
      v6->_vtEvent = 1;
      v6->_vtSource = *a4;
      -[DoAPSiriRemoteDevice activateSiri:](v6, "activateSiri:", v9);
LABEL_51:
      objc_sync_exit(v6);

      return;
    case 2u:
      unsigned int v10 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - DoAP Received MyriadScore EventIndicator",  (uint8_t *)&v42,  2u);
      }

      if (-[DoAPDevice state](self, "state") >= 2 && self->_vtEvent == 1 && self->_vtSource != 3)
      {
        float v11 = *(float *)a4;
        uint64_t v12 = (os_log_s *)qword_100070CC8;
        double v13 = v11;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          int v42 = 134217984;
          *(double *)v43 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - Siri Myriad Score %f",  (uint8_t *)&v42,  0xCu);
        }

        uint64_t v38 = mach_absolute_time();
        int v39 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 UUIDString]);
        AFSiriActivationHearstBoron(v38, v41, &stru_10005D690, v13);
      }

      return;
    case 3u:
      unsigned int v14 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - DoAP Received StreamingEnd EventIndicator",  (uint8_t *)&v42,  2u);
      }

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

      if (v15)
      {
        BOOL v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
        dispatch_semaphore_signal(v16);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));

      if (v17)
      {
        v18 = self;
        objc_sync_enter(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v18, "audioBuffer"));
        [v19 removeAllObjects];

        objc_sync_exit(v18);
      }

      if (-[DoAPDevice state](self, "state") == 5)
      {
        -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
        v20 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
        dispatch_semaphore_signal(v20);
      }

      v21 = self;
      objc_sync_enter(v21);
      -[DoAPSiriRemoteDevice clearEvent](v21, "clearEvent");
      -[DoAPDevice doapStateSet:](v21, "doapStateSet:", 2LL);
      objc_sync_exit(v21);

      return;
    case 5u:
      v22 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - DoAP Received SiriCancel EventIndicator",  (uint8_t *)&v42,  2u);
      }

      -[DoAPSiriRemoteDevice cancelSiri](self, "cancelSiri");
      return;
    case 6u:
      int64_t v23 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = *a4;
        int v42 = 67109120;
        LODWORD(v43[0]) = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - Doap Received PTT/HTT Button Event (value = %d)",  (uint8_t *)&v42,  8u);
      }

      if (-[DoAPDevice state](self, "state") == 2 && *a4 == 1)
      {
        self->_vtEvent = 6;
        self->_vtSource = 4;
        uint64_t v25 = mach_absolute_time();
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
        AFSiriActivationBluetoothDeviceButtonPress(v25, v28, 0LL, &stru_10005D6B0);
      }

      else if (-[DoAPDevice state](self, "state") == 2 && *a4 == 2)
      {
        uint64_t v29 = mach_absolute_time();
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
        int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
        AFSiriActivationBluetoothDeviceButtonRelease(v29, v32, 0LL, &stru_10005D6D0);
      }

      else
      {
        __int128 v33 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003CE6C(v33, self);
        }
      }

      return;
    default:
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003CE08();
      }
      return;
  }

- (void)doapAudioWillStart:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[DoAPDevice state](self, "state");
  objc_super v6 = (os_log_s *)qword_100070CC8;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioWillStart", buf, 2u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100030E6C;
    v8[3] = &unk_10005CF10;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003CF5C();
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[DoAPDevice state](self, "state");
  objc_super v6 = (os_log_s *)qword_100070CC8;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri waitForSiriAudioToStop", buf, 2u);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
    [v7 timeIntervalSinceNow];
    BOOL v9 = fabs(v8) < 0.5;

    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

      if (v10)
      {
        float v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        [v11 timeIntervalSinceNow];
        double v13 = v12;

        unsigned int v14 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
        dispatch_time_t v15 = dispatch_time(0LL, 1000000 * vcvtpd_s64_f64((v13 + 0.5) * 1000.0));
        uint64_t v16 = dispatch_semaphore_wait(v14, v15);

        v17 = (void *)qword_100070CC8;
        BOOL v18 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            v19 = v17;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
            [v20 timeIntervalSinceNow];
            *(_DWORD *)buf = 134217984;
            double v46 = fabs(v21) * 1000.0;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - Received Siri audio data %f ms ago.",  buf,  0xCu);
          }

          queue = (dispatch_queue_s *)self->_queue;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_1000319B8;
          v41[3] = &unk_10005CF10;
          v41[4] = self;
          id v42 = v4;
          dispatch_async(queue, v41);
        }

        else
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - Received streamEnd event.",  buf,  2u);
          }

          -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
          if (-[DoAPDevice state](self, "state") < 7)
          {
            (*((void (**)(id, void))v4 + 2))(v4, 0LL);
          }

          else
          {
            objc_super v37 = (os_log_s *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - SiriDevice is about to be stopped",  buf,  2u);
            }
          }

          uint64_t v38 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
          dispatch_semaphore_signal(v38);

          int v39 = self;
          objc_sync_enter(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v39, "audioBuffer"));
          [v40 removeAllObjects];

          objc_sync_exit(v39);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003D0A0();
        }
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        v44 = @"No doapAudioStop semaphore";
        int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870165LL,  v32));

        (*((void (**)(id, void *))v4 + 2))(v4, v33);
        __int128 v34 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
        dispatch_semaphore_signal(v34);

        BOOL v35 = self;
        objc_sync_enter(v35);
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v35, "audioBuffer"));
        [v36 removeAllObjects];

        objc_sync_exit(v35);
      }
    }

    else
    {
      int64_t v23 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = v23;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        [v25 timeIntervalSinceNow];
        *(_DWORD *)buf = 134217984;
        double v46 = fabs(v26) * 1000.0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - Have not received audio data for %f ms. Stop Siri session.",  buf,  0xCu);
      }

      -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      objc_super v27 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
      dispatch_semaphore_signal(v27);

      unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));
      if (v28)
      {
        uint64_t v29 = self;
        objc_sync_enter(v29);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v29, "audioBuffer"));
        [v30 removeAllObjects];

        objc_sync_exit(v29);
      }

      uint64_t v31 = self;
      objc_sync_enter(v31);
      -[DoAPSiriRemoteDevice clearEvent](v31, "clearEvent");
      -[DoAPDevice doapStateSet:](v31, "doapStateSet:", 2LL);
      objc_sync_exit(v31);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003D074();
  }
}

- (void)doapAudioDidStop:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[DoAPDevice state](self, "state");
  objc_super v6 = (os_log_s *)qword_100070CC8;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioDidStop", buf, 2u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100031AC4;
    v8[3] = &unk_10005CF10;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003D0CC();
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  double v8 = (AFNotifyObserver *)a3;
  id v9 = v8;
  if (a4 != a5 && self->_notifyObserver == v8)
  {
    self->_int siriState = a5 & 0xFE | ((a5 & 2) != 0);
    unsigned int v10 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      int siriState = self->_siriState;
      v12[0] = 67109376;
      v12[1] = a4;
      __int16 v13 = 1024;
      int v14 = siriState;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - SiriState changed 0x%0X -> 0x%0X",  (uint8_t *)v12,  0xEu);
    }

    -[DoAPSiriRemoteDevice eventIndicator:eventValue:](self, "eventIndicator:eventValue:", 4LL, self->_siriState);
  }
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSArray)codecs
{
  return self->_codecs;
}

- (void).cxx_destruct
{
}

@end