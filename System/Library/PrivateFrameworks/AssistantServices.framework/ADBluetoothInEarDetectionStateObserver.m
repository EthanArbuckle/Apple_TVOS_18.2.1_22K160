@interface ADBluetoothInEarDetectionStateObserver
+ (id)sharedObserver;
- (id)_init;
- (void)_invalidate;
- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
- (void)startObservingForBTAddress:(id)a3 forObserverID:(unint64_t)a4;
- (void)stopObservingForObserverID:(unint64_t)a3;
@end

@implementation ADBluetoothInEarDetectionStateObserver

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADBluetoothInEarDetectionStateObserver;
  v2 = -[ADBluetoothInEarDetectionStateObserver init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("ADBluetoothInEarDetectionStateObserver", v6);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(&OBJC_CLASS___AFNotifyStatePublisher);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothInEarDetectionStateChanged));
    v11 = -[AFNotifyStatePublisher initWithName:queue:](v9, "initWithName:queue:", v10, v2->_queue);
    publisher = v2->_publisher;
    v2->_publisher = v11;
  }

  return v2;
}

- (void)startObservingForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100342584;
  block[3] = &unk_1004FDA80;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)stopObservingForObserverID:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100342300;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_invalidate
{
  bluetoothDevice = self->_bluetoothDevice;
  if (bluetoothDevice)
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      dispatch_queue_t v7 = "-[ADBluetoothInEarDetectionStateObserver _invalidate]";
      __int16 v8 = 2112;
      v9 = bluetoothDevice;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Invallidating bluetooth device: %@",  (uint8_t *)&v6,  0x16u);
      bluetoothDevice = self->_bluetoothDevice;
    }

    -[AFBluetoothDevice removeObserver:](bluetoothDevice, "removeObserver:", self);
    dispatch_queue_attr_t v5 = self->_bluetoothDevice;
    self->_bluetoothDevice = 0LL;
  }

- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[ADBluetoothInEarDetectionStateObserver bluetoothDevice:headphoneInEarDetectionStateDidChangeFrom:to:]";
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s headphoneInEarDetectionStateDidChangeFrom from: %@ to: %@",  (uint8_t *)&v14,  0x20u);
  }

  if (v9 != v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unint64_t v13 = +[AFBluetoothHeadphoneInEarDetectionState encodeForBTAddress:headphoneInEarDetectionStateDidChangeFrom:to:]( &OBJC_CLASS___AFBluetoothHeadphoneInEarDetectionState,  "encodeForBTAddress:headphoneInEarDetectionStateDidChangeFrom:to:",  v12,  v9,  v10);

    -[AFNotifyStatePublisher publishState:](self->_publisher, "publishState:", v13);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedObserver
{
  if (qword_100578668 != -1) {
    dispatch_once(&qword_100578668, &stru_1004FD078);
  }
  return (id)qword_100578670;
}

@end