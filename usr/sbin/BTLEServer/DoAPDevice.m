@interface DoAPDevice
+ (id)doapDeviceWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (CBPeripheral)peripheral;
- (DoAPDevice)init;
- (DoAPDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (DoAPServiceProtocol)service;
- (id)allocQueue;
- (id)doapStateNameFor:(unsigned __int8)a3;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (unsigned)state;
- (unsigned)streamID;
- (void)dealloc;
- (void)doapStateSet:(unsigned __int8)a3;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)notifyDidStart;
- (void)notifyDidStop;
- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4;
- (void)setPeripheral:(id)a3;
- (void)setService:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setStreamID:(unsigned __int16)a3;
- (void)start;
- (void)stop;
@end

@implementation DoAPDevice

+ (id)doapDeviceWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 1 && (v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___DoAPSiriRemoteDevice, v5)) != 0LL) {
    id v8 = [[v7 alloc] initWithCodecs:v6 streamID:1];
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 1LL);
  objc_sync_exit(obj);
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 7LL);
  objc_sync_exit(obj);
}

- (void)handleStartStreaming
{
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
}

- (DoAPDevice)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[DoAPDevice init]"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Calling %@ is not allowed",  v3);

  return 0LL;
}

- (DoAPDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DoAPDevice;
  result = -[DoAPDevice init](&v6, "init", a3);
  if (result)
  {
    result->_state = 0;
    result->_streamID = a4;
  }

  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___DoAPDevice;
  -[DoAPDevice dealloc](&v2, "dealloc");
}

- (void)notifyDidStart
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035DCC;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035EAC;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (int)selectCodec:(unsigned __int8)a3
{
  uint64_t v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAP Send selectCodec", buf, 2u);
  }

  v10[0] = 1;
  v10[1] = -[DoAPDevice streamID](self, "streamID");
  v10[2] = -[DoAPDevice streamID](self, "streamID") >> 8;
  v10[3] = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v10,  4LL,  0LL));
  if (-[DoAPDevice state](self, "state"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    [v7 selectCodec:v6];

    int v8 = 0;
  }

  else
  {
    int v8 = -536870195;
  }

  return v8;
}

- (int)startStreaming
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAP Send startStreaming", buf, 2u);
  }

  v9[0] = -[DoAPDevice streamID](self, "streamID");
  v9[1] = -[DoAPDevice streamID](self, "streamID") >> 8;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v9,  2LL,  0LL));
  if (-[DoAPDevice state](self, "state") == 2 || -[DoAPDevice state](self, "state") == 3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    [v5 startStreaming:v4];

    objc_super v6 = self;
    objc_sync_enter(v6);
    -[DoAPDevice doapStateSet:](v6, "doapStateSet:", 5LL);
    objc_sync_exit(v6);

    -[DoAPDevice setHighPriorityLink:burstTime:](v6, "setHighPriorityLink:burstTime:", 1LL, &off_10005FF70);
    int v7 = 0;
  }

  else
  {
    int v7 = -536870195;
  }

  return v7;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 67109120;
    HIDWORD(v11) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DoAP Send stopStreaming %d",  (uint8_t *)&v11,  8u);
  }

  LOBYTE(v11) = -[DoAPDevice streamID](self, "streamID");
  BYTE1(v11) = -[DoAPDevice streamID](self, "streamID", v11) >> 8;
  BYTE2(v11) = v3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  &v11,  3LL,  0LL));
  if (-[DoAPDevice state](self, "state") < 2)
  {
    int v9 = -536870198;
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    [v7 stopStreaming:v6];

    int v8 = self;
    objc_sync_enter(v8);
    -[DoAPDevice doapStateSet:](v8, "doapStateSet:", 6LL);
    objc_sync_exit(v8);

    int v9 = 0;
  }

  return v9;
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  int v4 = a4;
  int v5 = a3;
  int v7 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v15) = 67109376;
    HIDWORD(v15) = v5;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DoAP Send eventIndicator(%u) value(%u)",  (uint8_t *)&v15,  0xEu);
  }

  LOBYTE(v15) = -[DoAPDevice streamID](self, "streamID");
  BYTE1(v15) = -[DoAPDevice streamID](self, "streamID", v15) >> 8;
  BYTE2(v15) = v5;
  BYTE3(v15) = 1;
  BYTE4(v15) = v4;
  if (-[DoAPDevice streamID](self, "streamID") != 1)
  {
    if (-[DoAPDevice streamID](self, "streamID") == 2
      && (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v11) & 1) == 0)
    {
      v12 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003DA94(v12);
      }
    }

    return 0;
  }

  int v8 = -536870198;
  if (v5 == 4)
  {
    if (-[DoAPDevice state](self, "state") >= 2 && -[DoAPDevice state](self, "state") <= 6)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  &v15,  5LL,  0LL));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
      [v10 eventIndicator:v9];

      return 0;
    }
  }

  else
  {
    v13 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003DA20(v5, v13);
    }
  }

  return v8;
}

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
  [v7 setHighPriorityLink:v4 burstTime:v6];
}

- (id)allocQueue
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  BOOL v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(self, v5));
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v4);

  return v8;
}

- (id)doapStateNameFor:(unsigned __int8)a3
{
  else {
    return *(&off_10005D7E0 + (char)(a3 - 1));
  }
}

- (void)doapStateSet:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (-[DoAPDevice state](self, "state") >= 3)
  {
    unsigned int v5 = -[DoAPDevice state](self, "state");
    if ((_DWORD)v3 == 2 && v5 <= 6) {
      -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 0LL, 0LL);
    }
  }

  id v6 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](self, "doapStateNameFor:", -[DoAPDevice state](self, "state")));
    unsigned int v12 = -[DoAPDevice state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](self, "doapStateNameFor:", v3));
    int v14 = 138478851;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    int v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DoAP state change for ID %{private}@: %{public}@ (%d) -> %{public}@ (%d)",  (uint8_t *)&v14,  0x2Cu);
  }

  -[DoAPDevice setState:](self, "setState:", v3);
}

- (DoAPServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
}

@end