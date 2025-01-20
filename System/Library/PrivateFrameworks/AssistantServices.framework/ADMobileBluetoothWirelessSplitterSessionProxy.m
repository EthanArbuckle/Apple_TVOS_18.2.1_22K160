@interface ADMobileBluetoothWirelessSplitterSessionProxy
- (ADMobileBluetoothWirelessSplitterSessionProxy)initWithDataSource:(id)a3 queue:(id)a4;
- (void)_accessBTLocalDeviceUsingBlock:(id)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_fetchWirelessSplitterSessionInfoWithCompletion:(id)a3;
- (void)_getWirelessSplitterSessionInfo:(id)a3;
- (void)_invalidate;
- (void)_reload:(BOOL)a3;
- (void)_updateWirelessSplitterSessionInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)bluetoothWirelessSplitterSessionStateObserver:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5;
- (void)dealloc;
- (void)getSessionInfo:(id)a3;
- (void)invalidate;
- (void)reload;
- (void)removeObserver:(id)a3;
- (void)updateWirelessSplitterSessionInfo:(id)a3;
@end

@implementation ADMobileBluetoothWirelessSplitterSessionProxy

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[ADMobileBluetoothWirelessSplitterSessionProxy dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothWirelessSplitterSessionProxy;
  -[ADMobileBluetoothWirelessSplitterSessionProxy dealloc](&v4, "dealloc");
}

- (ADMobileBluetoothWirelessSplitterSessionProxy)initWithDataSource:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothWirelessSplitterSessionProxy;
  v8 = -[ADMobileBluetoothWirelessSplitterSessionProxy init](&v16, "init");
  if (v8)
  {
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy initWithDataSource:queue:]";
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v8->_queue, a4);
    v10 = -[AFBluetoothWirelessSplitterSessionStateObserver initWithQueue:delegate:]( objc_alloc(&OBJC_CLASS___AFBluetoothWirelessSplitterSessionStateObserver),  "initWithQueue:delegate:",  v8->_queue,  v8);
    observer = v8->_observer;
    v8->_observer = v10;

    queue = (dispatch_queue_s *)v8->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E3D84;
    block[3] = &unk_1004FD940;
    v15 = v8;
    dispatch_async(queue, block);
  }

  return v8;
}

- (void)updateWirelessSplitterSessionInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E3D78;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reload
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E3D6C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)bluetoothWirelessSplitterSessionStateObserver:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    uint64_t Name = AFBluetoothWirelessSplitterSessionStateGetName(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
    uint64_t v13 = AFBluetoothWirelessSplitterSessionStateGetName(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 136315906;
    v21 = "-[ADMobileBluetoothWirelessSplitterSessionProxy bluetoothWirelessSplitterSessionStateObserver:didChangeStateFrom:to:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s observer = %@, fromState = %@, toState = %@",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000E3D50;
  v17[3] = &unk_1004FD968;
  id v18 = v8;
  __int16 v19 = self;
  id v16 = v8;
  dispatch_async(queue, v17);
}

- (void)getSessionInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E3D44;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E3CF0;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E3CE4;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E3CDC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reload:(BOOL)a3
{
  if (self->_wirelessSplitterSessionInfo) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v8 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _reload:]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Reloading Wireless Splitter session info for %@...",  buf,  0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000E3BFC;
    v6[3] = &unk_1004F0A98;
    v6[4] = self;
    -[ADMobileBluetoothWirelessSplitterSessionProxy _fetchWirelessSplitterSessionInfoWithCompletion:]( self,  "_fetchWirelessSplitterSessionInfoWithCompletion:",  v6);
  }

- (void)_getWirelessSplitterSessionInfo:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_wirelessSplitterSessionInfo)
    {
      v4[2](v4);
    }

    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000E3BAC;
      v6[3] = &unk_1004F0AC0;
      v6[4] = self;
      id v7 = v4;
      -[ADMobileBluetoothWirelessSplitterSessionProxy _fetchWirelessSplitterSessionInfoWithCompletion:]( self,  "_fetchWirelessSplitterSessionInfoWithCompletion:",  v6);
    }
  }
}

- (void)_updateWirelessSplitterSessionInfo:(id)a3
{
  id v4 = (AFBluetoothWirelessSplitterSessionInfo *)a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _updateWirelessSplitterSessionInfo:]";
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s wirelessSplitterSessionInfo = %@", buf, 0x16u);
  }

  wirelessSplitterSessionInfo = self->_wirelessSplitterSessionInfo;
  if (wirelessSplitterSessionInfo != v4
    && (-[AFBluetoothWirelessSplitterSessionInfo isEqual:](wirelessSplitterSessionInfo, "isEqual:", v4) & 1) == 0)
  {
    id v7 = self->_wirelessSplitterSessionInfo;
    id v8 = (AFBluetoothWirelessSplitterSessionInfo *)-[AFBluetoothWirelessSplitterSessionInfo copy](v4, "copy");
    __int16 v9 = self->_wirelessSplitterSessionInfo;
    self->_wirelessSplitterSessionInfo = v8;

    v10 = self->_wirelessSplitterSessionInfo;
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _updateWirelessSplitterSessionInfo:]";
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s wirelessSplitterSessionInfo changed from %@ to %@",  buf,  0x20u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000E3B5C;
    v14[3] = &unk_1004F0AE8;
    v14[4] = self;
    v15 = v7;
    id v16 = v10;
    v12 = v10;
    uint64_t v13 = v7;
    -[ADMobileBluetoothWirelessSplitterSessionProxy _enumerateObserversUsingBlock:]( self,  "_enumerateObserversUsingBlock:",  v14);
  }
}

- (void)_fetchWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v9 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _fetchWirelessSplitterSessionInfoWithCompletion:]";
      __int16 v10 = 2112;
      v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Fetching Wireless Splitter session info for %@...",  buf,  0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000E3768;
    v6[3] = &unk_1004F0B10;
    v6[4] = self;
    id v7 = v4;
    -[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]( self,  "_accessBTLocalDeviceUsingBlock:",  v6);
  }
}

- (void)_accessBTLocalDeviceUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
      __int16 v12 = 2112;
      uint64_t v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Getting BTLocalDevice for %@...", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000E3638;
      v8[3] = &unk_1004F0B10;
      v8[4] = self;
      id v9 = v4;
      [WeakRetained getBTLocalDeviceWithCompletion:v8];
    }

    else
    {
      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
        __int16 v12 = 2112;
        uint64_t v13 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Data source of %@ is nil.",  buf,  0x16u);
        id v7 = (os_log_s *)AFSiriLogContextDaemon;
      }

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
        __int16 v12 = 2112;
        uint64_t v13 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed getting BTLocalDevice for %@.",  buf,  0x16u);
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)_invalidate
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  -[AFBluetoothWirelessSplitterSessionStateObserver invalidate](self->_observer, "invalidate");
  observer = self->_observer;
  self->_observer = 0LL;

  objc_storeWeak((id *)&self->_dataSource, 0LL);
  wirelessSplitterSessionInfo = self->_wirelessSplitterSessionInfo;
  self->_wirelessSplitterSessionInfo = 0LL;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E35EC;
  v7[3] = &unk_1004F0B60;
  v7[4] = self;
  -[ADMobileBluetoothWirelessSplitterSessionProxy _enumerateObserversUsingBlock:]( self,  "_enumerateObserversUsingBlock:",  v7);
  observers = self->_observers;
  self->_observers = 0LL;
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      id v7 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](observers, "setRepresentation"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000E35E0;
      v8[3] = &unk_1004F0B88;
      id v9 = v7;
      [v6 enumerateObjectsUsingBlock:v8];

      id v4 = v7;
    }
  }
}

- (void).cxx_destruct
{
}

@end