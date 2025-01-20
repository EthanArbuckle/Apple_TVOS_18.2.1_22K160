@interface HomeKitSiriRemoteInputPlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (HomeKitSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (NSMutableSet)inputDevices;
- (OS_dispatch_queue)queue;
- (OS_dispatch_workloop)audioWorkloop;
- (OS_xpc_object)xpcConnection;
- (id)_inputDeviceForArgs:(id)a3;
- (void)_cancelXpcConnection;
- (void)_checkIn;
- (void)_createXpcConnection;
- (void)_handleAddDeviceWithArgs:(id)a3;
- (void)_handleAudioFrameWithArgs:(id)a3;
- (void)_handleRemoveDeviceWithArgs:(id)a3;
- (void)_handleTransportDidStartWithArgs:(id)a3;
- (void)_handleTransportDidStopWithArgs:(id)a3;
- (void)_handleXpcError:(id)a3;
- (void)_handleXpcEvent:(id)a3;
- (void)_handleXpcMessage:(id)a3;
- (void)_updateServerRunningStatus;
- (void)invalidate;
- (void)sendMessage:(id)a3 args:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation HomeKitSiriRemoteInputPlugin

- (HomeKitSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___HomeKitSiriRemoteInputPlugin;
  id v5 = -[HomeKitSiriRemoteInputPlugin init](&v26, "init");
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.HomeKit", "HomeKitRemoteInputPlugin");
    v7 = (void *)qword_CFB0;
    qword_CFB0 = (uint64_t)v6;

    v8 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Initializing siri remote plugin", (uint8_t *)buf, 2u);
    }

    [v5 setDelegate:v4];
    *((_DWORD *)v5 + 2) = -1;
    *((_WORD *)v5 + 6) = 0;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v10 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v9;

    if (MGGetBoolAnswer(@"DeviceSupportsSiriHub"))
    {
      inactive = dispatch_workloop_create_inactive("HomeKitSiriRemoteInputPlugin-Audio");
      dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_workloop_set_scheduler_priority(inactive, 60LL, 1LL);
      dispatch_workloop_set_cpupercent(inactive, 90LL, 50LL);
      dispatch_set_qos_class_fallback(inactive, 33LL);
      dispatch_activate(inactive);
      v12 = (void *)*((void *)v5 + 6);
      *((void *)v5 + 6) = inactive;
    }

    v13 = (void *)*((void *)v5 + 6);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v13;

    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("HMDSiriServer", v17, v18);
    v20 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v19;

    [v5 _createXpcConnection];
    objc_initWeak(buf, v5);
    v21 = (dispatch_queue_s *)*((void *)v5 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_4B7C;
    handler[3] = &unk_82E0;
    objc_copyWeak(&v24, buf);
    notify_register_dispatch("com.apple.homekit.audio.running", (int *)v5 + 2, v21, handler);
    [v5 _updateServerRunningStatus];
    if (*((_BYTE *)v5 + 12)) {
      [v5 _checkIn];
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }

  return (HomeKitSiriRemoteInputPlugin *)v5;
}

- (void)_updateServerRunningStatus
{
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(self->_xpcServerNotifyToken, &state64);
  if (state)
  {
    uint32_t v4 = state;
    id v5 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v12 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed to check server running status (got error %u)", buf, 8u);
    }
  }

  else
  {
    uint32_t isXpcServerRunning = self->_isXpcServerRunning;
    uint64_t v7 = state64;
    int v8 = state64 != 0;
    self->_uint32_t isXpcServerRunning = v8;
    v9 = (os_log_s *)qword_CFB0;
    if (isXpcServerRunning == v8)
    {
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v12 = isXpcServerRunning;
        _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "Server status did not change; still %d", buf, 8u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      uint32_t v12 = isXpcServerRunning;
      __int16 v13 = 1024;
      BOOL v14 = v7 != 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Server status changed from %d to %d", buf, 0xEu);
    }

    if (!self->_isXpcServerRunning) {
      self->_isCheckedInWithServer = 0;
    }
  }

- (NSArray)devices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (void)invalidate
{
  if (self->_xpcServerNotifyToken != -1)
  {
    self->_xpcServerNotifyToken = -1;
    notify_cancel(-1);
    self->_xpcServerNotifyToken = -1;
  }

  v3 = (os_log_s *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "HomeKitSiriRemoteInputPlugin told to invalidate; closing XPC connection if present",
      v4,
      2u);
  }

  -[HomeKitSiriRemoteInputPlugin _cancelXpcConnection](self, "_cancelXpcConnection");
}

- (void)_cancelXpcConnection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4ADC;
  block[3] = &unk_8308;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)sendMessage:(id)a3 args:(id)a4
{
  id v6 = a4;
  *(_OWORD *)keys = *(_OWORD *)off_8328;
  v11[0] = xpc_string_create((const char *)[a3 UTF8String]);
  v11[1] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v6);
  if (v6) {
    size_t v7 = 2LL;
  }
  else {
    size_t v7 = 1LL;
  }
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, v11, v7);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin xpcConnection](self, "xpcConnection"));
  xpc_connection_send_message(v9, v8);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)_createXpcConnection
{
  v3 = (os_log_s *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "HomeKitSiriRemoteInputPlugin creating new XPC connection", buf, 2u);
  }

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.homekit.audio.xpc", (dispatch_queue_t)self->_queue, 0LL);
  objc_storeStrong((id *)&self->_xpcConnection, mach_service);
  xpcConnection = self->_xpcConnection;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_49B8;
  v7[3] = &unk_8340;
  v7[4] = self;
  xpc_connection_t v8 = mach_service;
  id v6 = mach_service;
  xpc_connection_set_event_handler(xpcConnection, v7);
  xpc_connection_resume(self->_xpcConnection);
}

- (void)_checkIn
{
  if (self->_isCheckedInWithServer)
  {
    v2 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Skipping checkin (already checked in)", buf, 2u);
    }
  }

  else
  {
    self->_isCheckedInWithServer = 1;
    if (!self->_xpcConnection)
    {
      uint32_t v4 = (os_log_s *)qword_CFB0;
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)size_t v7 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Creating new XPC connection.", v7, 2u);
      }

      -[HomeKitSiriRemoteInputPlugin _createXpcConnection](self, "_createXpcConnection");
    }

    id v5 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Checking in with server.", v6, 2u);
    }

    -[HomeKitSiriRemoteInputPlugin sendMessage:args:](self, "sendMessage:args:", @"CheckIn", 0LL);
  }

- (void)_handleAddDeviceWithArgs:(id)a3
{
  id v4 = a3;
  id v5 = -[HomeKitSiriRemoteInputDevice initWithInfo:]( objc_alloc(&OBJC_CLASS___HomeKitSiriRemoteInputDevice),  "initWithInfo:",  v4);
  if (objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4))) {
    __assert_rtn( "-[HomeKitSiriRemoteInputPlugin _handleAddDeviceWithArgs:]",  "HomeKitSiriRemoteInputPlugin.m",  233,  "[self _inputDeviceForArgs:args] == nil");
  }
  id v6 = (void *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_connection_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceIdentifier](v5, "deviceIdentifier"));
    int v11 = 138412290;
    uint32_t v12 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Publishing remote %@", (uint8_t *)&v11, 0xCu);
  }

  -[HomeKitSiriRemoteInputDevice setPlugin:](v5, "setPlugin:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  [v9 addObject:v5];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin delegate](self, "delegate"));
  [v10 inputPlugin:self didPublishDevice:v5];
}

- (void)_handleRemoveDeviceWithArgs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  if (!v5) {
    __assert_rtn( "-[HomeKitSiriRemoteInputPlugin _handleRemoveDeviceWithArgs:]",  "HomeKitSiriRemoteInputPlugin.m",  245,  "inputDevice");
  }
  id v6 = (void *)v5;
  size_t v7 = (void *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    xpc_connection_t v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    int v12 = 138412290;
    __int16 v13 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Unpublishing remote %@", (uint8_t *)&v12, 0xCu);
  }

  [v6 invalidate];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin delegate](self, "delegate"));
  [v10 inputPlugin:self didUnpublishDevice:v6];

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  [v11 removeObject:v6];
}

- (void)_handleTransportDidStartWithArgs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  if (!v5) {
    __assert_rtn( "-[HomeKitSiriRemoteInputPlugin _handleTransportDidStartWithArgs:]",  "HomeKitSiriRemoteInputPlugin.m",  257,  "inputDevice");
  }
  id v6 = (void *)v5;
  size_t v7 = (void *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    xpc_connection_t v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Transport did start to remote %@", (uint8_t *)&v10, 0xCu);
  }

  [v6 handleTransportDidStartWithArgs:v4];
}

- (void)_handleTransportDidStopWithArgs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  if (!v5) {
    __assert_rtn( "-[HomeKitSiriRemoteInputPlugin _handleTransportDidStopWithArgs:]",  "HomeKitSiriRemoteInputPlugin.m",  266,  "inputDevice");
  }
  id v6 = (void *)v5;
  size_t v7 = (void *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
  {
    xpc_connection_t v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Transport did stop to remote %@", (uint8_t *)&v10, 0xCu);
  }

  [v6 handleTransportDidStopWithArgs:v4];
}

- (void)_handleAudioFrameWithArgs:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:"));
  if (!v4) {
    __assert_rtn( "-[HomeKitSiriRemoteInputPlugin _handleAudioFrameWithArgs:]",  "HomeKitSiriRemoteInputPlugin.m",  275,  "inputDevice");
  }
  uint64_t v5 = v4;
  [v4 handleAudioFrameWithArgs:v6];
}

- (void)_handleXpcEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[HomeKitSiriRemoteInputPlugin _handleXpcMessage:](self, "_handleXpcMessage:", v4);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    -[HomeKitSiriRemoteInputPlugin _handleXpcError:](self, "_handleXpcError:", v4);
  }

  else
  {
    id v6 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Unexpected XPC event: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleXpcMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
  int v7 = (void *)objc_claimAutoreleasedReturnValue(value);

  id v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    int v10 = v8;
  }
  else {
    int v10 = 0LL;
  }
  id v11 = v10;

  if (!strcmp(string, "AudioFrame"))
  {
    -[HomeKitSiriRemoteInputPlugin _handleAudioFrameWithArgs:](self, "_handleAudioFrameWithArgs:", v11);
  }

  else if (!strcmp(string, "Publish"))
  {
    -[HomeKitSiriRemoteInputPlugin _handleAddDeviceWithArgs:](self, "_handleAddDeviceWithArgs:", v11);
  }

  else if (!strcmp(string, "Unpublish"))
  {
    -[HomeKitSiriRemoteInputPlugin _handleRemoveDeviceWithArgs:](self, "_handleRemoveDeviceWithArgs:", v11);
  }

  else if (!strcmp(string, "TransportDidStart"))
  {
    -[HomeKitSiriRemoteInputPlugin _handleTransportDidStartWithArgs:](self, "_handleTransportDidStartWithArgs:", v11);
  }

  else if (!strcmp(string, "TransportDidStop"))
  {
    -[HomeKitSiriRemoteInputPlugin _handleTransportDidStopWithArgs:](self, "_handleTransportDidStopWithArgs:", v11);
  }

  else
  {
    int v12 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      BOOL v14 = string;
      _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Unexpected message: '%s'", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_handleXpcError:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        [v10 invalidate];
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin delegate](self, "delegate"));
        [v11 inputPlugin:self didUnpublishDevice:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v7);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  [v12 removeAllObjects];

  int v13 = (os_log_s *)qword_CFB0;
  if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Received error: %@", buf, 0xCu);
  }

  *(_WORD *)&self->_uint32_t isXpcServerRunning = 0;
  if (v4 != &_xpc_error_connection_interrupted)
  {
    BOOL v14 = (os_log_s *)qword_CFB0;
    if (v4 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "XPC connection invalidated; canceling if still present", buf, 2u);
      }

      -[HomeKitSiriRemoteInputPlugin _cancelXpcConnection](self, "_cancelXpcConnection");
    }

    else if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Unexpected XPC error: %@", buf, 0xCu);
    }
  }
}

- (id)_inputDeviceForArgs:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputPlugin inputDevices](self, "inputDevices", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceIdentifier]);
        unsigned __int8 v14 = [v13 isEqual:v7];

        if ((v14 & 1) != 0)
        {
          id v9 = v12;
          goto LABEL_14;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (AVAudioRemoteInputPluginDelegate)delegate
{
  return (AVAudioRemoteInputPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)inputDevices
{
  return self->_inputDevices;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_workloop)audioWorkloop
{
  return self->_audioWorkloop;
}

- (void).cxx_destruct
{
}

@end