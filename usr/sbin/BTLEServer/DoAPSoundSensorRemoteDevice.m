@interface DoAPSoundSensorRemoteDevice
- (DoAPAudioRelay)doapAudioRelay;
- (DoAPSoundSensorRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (NSArray)codecs;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (void)activateSoundSensorClient;
- (void)cancelSoundSensorClient;
- (void)clearEvent;
- (void)clearState;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DoAPSoundSensorRemoteDevice

- (DoAPSoundSensorRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v7 = a3;
  if (v4 == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
    v8 = -[DoAPDevice initWithCodecs:streamID:](&v23, "initWithCodecs:streamID:", v7, 2LL);
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
            dispatch_set_finalizer_f((dispatch_object_t)v9->_queue, (dispatch_function_t)j__objc_msgSend_notifyDidStop);
            goto LABEL_11;
          }

          v20 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0LL;
        }

        v21 = v9->_groupStart;
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
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Stop DoAPSoundSensorRemoteDevice - Destroy DoAPAudioRelay",  buf,  2u);
  }

  int v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
  if (v5)
  {
    v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    [v8 invalidate];

    -[DoAPSoundSensorRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", 0LL);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  -[DoAPDevice stop](&v11, "stop");
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B9B8;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  -[DoAPDevice start](&v44, "start");
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Start DoAPSoundSensorRemoteDevice - Create DoAPAudioRelay",  buf,  2u);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice codecs](self, "codecs"));
  id v5 = [v4 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v41;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if (v9)
        {
          [*(id *)(*((void *)&v40 + 1) + 8 * (void)i) codec];
          if (v37 == 7)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v20,  @"DoAP Sound Sensor"));

            v22 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](&OBJC_CLASS___DoAPAudioRelayHub, "instance"));
            [v9 codec];
            objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 relayWithIdentifier:v21 deviceType:4 properties:0 codecType:v36]);
            -[DoAPSoundSensorRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
            [v24 setDelegate:self];

            v25 = (void *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v25;
              [v9 codec];
              *(_DWORD *)buf = 67109120;
              int v46 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Start DoAPSoundSensorRemoteDevice - Send SelectCodec(%u) msg",  buf,  8u);
            }

            groupStart = self->_groupStart;
            queue = (dispatch_queue_s *)self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10002BDF0;
            block[3] = &unk_10005D248;
            block[4] = self;
            void block[5] = v9;
            dispatch_group_async((dispatch_group_t)groupStart, queue, block);
            v30 = self->_groupStart;
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
            v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_10002BE3C;
            v33[3] = &unk_10005CB58;
            v33[4] = self;
            dispatch_group_async((dispatch_group_t)v30, v32, v33);

            return;
          }
        }

        else
        {
          uint64_t v37 = 0LL;
          uint64_t v38 = 0LL;
          int v39 = 0;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003C230(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (int)selectCodec:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  return -[DoAPDevice selectCodec:](&v4, "selectCodec:", a3);
}

- (int)startStreaming
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  uint64_t v3 = -[DoAPDevice startStreaming](&v12, "startStreaming");
  if ((_DWORD)v3)
  {
    objc_super v4 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C260(v3, v4, v5, v6, v7, v8, v9, v10);
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
  v4.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  return -[DoAPDevice stopStreaming:](&v4, "stopStreaming:", a3);
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  uint64_t v4 = -[DoAPDevice eventIndicator:eventValue:](&v13, "eventIndicator:eventValue:", a3, a4);
  if ((_DWORD)v4)
  {
    uint64_t v5 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C2C4(v4, v5, v6, v7, v8, v9, v10, v11);
    }
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
    uint64_t v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v3);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v4)
  {
    uint64_t v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v5);

    -[DoAPSoundSensorRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](self, "audioBuffer"));

  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v7, "audioBuffer"));
    [v8 removeAllObjects];

    objc_sync_exit(v7);
  }

  obj = self;
  objc_sync_enter(obj);
  -[DoAPSoundSensorRemoteDevice clearEvent](obj, "clearEvent");
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 2LL);
  objc_sync_exit(obj);
}

- (void)activateSoundSensorClient
{
  uint64_t v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    int v8 = 138477827;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensor - activateSoundSensorClient: ** TBD ** for ID %{private}@",  (uint8_t *)&v8,  0xCu);
  }

  -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 1LL, &off_10005FF10);
}

- (void)cancelSoundSensorClient
{
  uint64_t v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensor - cancelSoundSensorClient - id \"%@\"",  (uint8_t *)&v8,  0xCu);
  }

- (void)handleStartStreaming
{
  v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensorRemoteDevice received StartStreaming",  v3,  2u);
  }

- (void)handleStopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensorRemoteDevice Received StopStreaming with error code%d",  (uint8_t *)v7,  8u);
  }

  if (-[DoAPDevice state](self, "state") == 5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    [v6 cancelStream];
  }

  -[DoAPSoundSensorRemoteDevice clearState](self, "clearState");
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  if (-[DoAPDevice state](self, "state") <= 6 && a3 && a4 >= 1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[DoAPSoundSensorRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v7);

    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
    if (-[DoAPDevice state](self, "state") == 5)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      unsigned int v10 = [v9 isHubConnected];

      if (!v10)
      {
        uint64_t v14 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003C328(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        goto LABEL_15;
      }

      uint64_t v11 = (DoAPSoundSensorRemoteDevice *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      -[DoAPSoundSensorRemoteDevice sendAudioFrame:](v11, "sendAudioFrame:", v8);
    }

    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        unsigned int v22 = -[DoAPDevice state](self, "state");
        objc_super v23 = (os_log_s *)qword_100070CC8;
        BOOL v24 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
        if (v22 == 2)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensor - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }

          -[DoAPSoundSensorRemoteDevice stopStreaming:](self, "stopStreaming:", 6LL);
          queue = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10002C6AC;
          block[3] = &unk_10005CB58;
          block[4] = self;
          dispatch_async(queue, block);
        }

        else if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "DoAPSoundSensor - Audio data ignored",  buf,  2u);
        }

        goto LABEL_15;
      }

      uint64_t v11 = self;
      objc_sync_enter(v11);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v11, "audioBuffer"));

      if (v12)
      {
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v11, "audioBuffer"));
        [v13 addObject:v8];
      }

      objc_sync_exit(v11);
    }

LABEL_15:
  }

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  if ((a3 - 3) >= 3 && a3 != 1)
  {
    uint64_t v5 = a3;
    if (a3 == 2)
    {
      uint64_t v6 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003C3BC(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    else
    {
      uint64_t v14 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003C358(v5, v14, v15, v16, v17, v18, v19, v20);
      }
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
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88LL, 1);
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