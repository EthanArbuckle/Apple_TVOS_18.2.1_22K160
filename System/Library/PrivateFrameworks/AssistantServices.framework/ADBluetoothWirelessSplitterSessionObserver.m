@interface ADBluetoothWirelessSplitterSessionObserver
+ (id)sharedWirelessSplitterSessionObserver;
- (id)_init;
- (void)_invalidate;
- (void)bluetoothWirelessSplitterSession:(id)a3 sessionInfoDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothWirelessSplitterSessionDidInvalidate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation ADBluetoothWirelessSplitterSessionObserver

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADBluetoothWirelessSplitterSessionObserver;
  v2 = -[ADBluetoothWirelessSplitterSessionObserver init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADBluetoothWirelessSplitterSessionObserver", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___AFNotifyStatePublisher);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothWirelessSplitterSessionStateChanged));
    v9 = -[AFNotifyStatePublisher initWithName:queue:](v7, "initWithName:queue:", v8, v2->_queue);
    publisher = v2->_publisher;
    v2->_publisher = v9;
  }

  return v2;
}

- (void)startObserving
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100341DD0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopObserving
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100341DA4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  wirelessSplitterSession = self->_wirelessSplitterSession;
  self->_wirelessSplitterSession = 0LL;
}

- (void)bluetoothWirelessSplitterSession:(id)a3 sessionInfoDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    v14 = "-[ADBluetoothWirelessSplitterSessionObserver bluetoothWirelessSplitterSession:sessionInfoDidChangeFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Wireless Splitter session info changed from %@ to %@",  (uint8_t *)&v13,  0x20u);
  }

  id v12 = [v9 state];
  if (v12 != [v10 state]) {
    -[AFNotifyStatePublisher publishState:](self->_publisher, "publishState:", [v10 state] == (id)2);
  }
}

- (void)bluetoothWirelessSplitterSessionDidInvalidate:(id)a3
{
  v4 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[ADBluetoothWirelessSplitterSessionObserver bluetoothWirelessSplitterSessionDidInvalidate:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Wireless Splitter session invalidated",  (uint8_t *)&v5,  0xCu);
  }

  -[ADBluetoothWirelessSplitterSessionObserver _invalidate](self, "_invalidate");
  -[AFNotifyStatePublisher publishState:]( self->_publisher,  "publishState:",  AFBluetoothWirelessSplitterSessionStateUnknown);
}

- (void).cxx_destruct
{
}

+ (id)sharedWirelessSplitterSessionObserver
{
  if (qword_100578658 != -1) {
    dispatch_once(&qword_100578658, &stru_1004FD058);
  }
  return (id)qword_100578660;
}

@end