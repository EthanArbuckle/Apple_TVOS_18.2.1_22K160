@interface MSCRODBrailleConnectionHelper
+ (id)sharedHelper;
- (MSCRODBrailleConnectionHelper)init;
- (void)_processDeviceReconnectQueue;
- (void)handleBluetoothConnectionEventForQueue:(id)a3;
- (void)handleBluetoothConnectionEventForQueue:(id)a3 forceProcess:(BOOL)a4;
- (void)queueDeviceConnection:(id)a3 withCallback:(id)a4;
@end

@implementation MSCRODBrailleConnectionHelper

+ (id)sharedHelper
{
  if (qword_100019C08 != -1) {
    dispatch_once(&qword_100019C08, &stru_1000146A8);
  }
  return (id)qword_100019C00;
}

- (MSCRODBrailleConnectionHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSCRODBrailleConnectionHelper;
  v2 = -[MSCRODBrailleConnectionHelper init](&v10, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  reconnectDeviceQueue = v2->_reconnectDeviceQueue;
  v2->_reconnectDeviceQueue = (NSMutableArray *)v3;

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  reconnectDeviceCallbacks = v2->_reconnectDeviceCallbacks;
  v2->_reconnectDeviceCallbacks = (NSMutableDictionary *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("global-braille-reconnect-queue", 0LL);
  reconnectQueue = v2->_reconnectQueue;
  v2->_reconnectQueue = (OS_dispatch_queue *)v7;

  v2->_waitingForCallback = 0;
  return v2;
}

- (void)_processDeviceReconnectQueue
{
  if (!self->_waitingForCallback)
  {
LABEL_6:
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_reconnectDeviceQueue, "firstObject"));
    if (v5)
    {
      uint64_t v7 = AXLogBrailleHW();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ATTEMPT BT CONNECT: %@", buf, 0xCu);
      }

      self->_waitingForCallback = 1;
      self->_lastBTConnectTime = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = BTDeviceConnectServices([v5 device], 0xFFFFFFFFLL);
      uint64_t v10 = AXLogBrailleHW();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received connect result: %@", buf, 0xCu);
      }

      reconnectDeviceCallbacks = self->_reconnectDeviceCallbacks;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](reconnectDeviceCallbacks, "objectForKey:", v14));

      if (v15)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1000025B4;
        v16[3] = &unk_1000146D0;
        id v17 = v15;
        int v18 = v9;
        AXPerformBlockAsynchronouslyOnMainThread(v16);
      }
    }

    goto LABEL_16;
  }

  CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - self->_lastBTConnectTime;
  uint64_t v4 = AXLogBrailleHW();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT);
  if (v3 > 30.0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Waited 30 seconds for BT callback, which never came...",  buf,  2u);
    }

    self->_waitingForCallback = 0;
    goto LABEL_6;
  }

  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Still waiting for BT callback",  buf,  2u);
  }

- (void)handleBluetoothConnectionEventForQueue:(id)a3
{
}

- (void)handleBluetoothConnectionEventForQueue:(id)a3 forceProcess:(BOOL)a4
{
  id v6 = a3;
  reconnectQueue = (dispatch_queue_s *)self->_reconnectQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000265C;
  block[3] = &unk_100014720;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(reconnectQueue, block);
}

- (void)queueDeviceConnection:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = AXLogBrailleHW();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Queuing connect BT device: %@", buf, 0xCu);
    }

    reconnectQueue = (dispatch_queue_s *)self->_reconnectQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100002A1C;
    block[3] = &unk_100014748;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(reconnectQueue, block);
  }
}

- (void).cxx_destruct
{
}

@end