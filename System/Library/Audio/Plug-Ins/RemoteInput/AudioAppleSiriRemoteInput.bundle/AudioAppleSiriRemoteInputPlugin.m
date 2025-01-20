@interface AudioAppleSiriRemoteInputPlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (AudioAppleSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (NSMutableSet)inputDevices;
- (OS_xpc_object)xpcConnection;
- (id)_inputDeviceForArgs:(id)a3;
- (id)sendSyncMsg:(id)a3 args:(id)a4;
- (void)_RequestSiriAudioConnection;
- (void)_checkIn;
- (void)_handleAudioFrameMsg:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handleMsg:(id)a3;
- (void)_handlePublishMsg:(id)a3;
- (void)_handleStreamDidCancelMsg:(id)a3;
- (void)_handleTransportDidStartMsg:(id)a3;
- (void)_handleTransportDidStopMsg:(id)a3;
- (void)_handleUnpublishMsg:(id)a3;
- (void)invalidate;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation AudioAppleSiriRemoteInputPlugin

- (AudioAppleSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AudioAppleSiriRemoteInputPlugin;
  v5 = -[AudioAppleSiriRemoteInputPlugin init](&v11, "init");
  if (v5)
  {
    sub_1F78("AudioAppleSiriRemoteInputPlugin");
    v6 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Initializing siri remote plugin", v10, 2u);
    }

    -[AudioAppleSiriRemoteInputPlugin setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    inputDevices = v5->_inputDevices;
    v5->_inputDevices = v7;
  }

  return v5;
}

- (NSArray)devices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin xpcConnection](v2, "xpcConnection"));

  if (!v3) {
    -[AudioAppleSiriRemoteInputPlugin _RequestSiriAudioConnection](v2, "_RequestSiriAudioConnection");
  }
  objc_sync_exit(v2);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](v2, "inputDevices"));
  objc_sync_enter(v4);
  v5 = (os_log_s *)(id)qword_D420;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](v2, "inputDevices"));
    int v10 = 138412290;
    objc_super v11 = v6;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "AudioAppleSiriRemoteInputPlugin Get devices %@",  (uint8_t *)&v10,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](v2, "inputDevices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  objc_sync_exit(v4);
  return (NSArray *)v8;
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    xpcConnection = self->_xpcConnection;
    int v7 = 134217984;
    v8 = xpcConnection;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "AudioAppleSiriRemoteInputPlugin invalidate xpc connection %p",  (uint8_t *)&v7,  0xCu);
  }

  v5 = self->_xpcConnection;
  if (v5)
  {
    xpc_connection_cancel(v5);
    v6 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

  os_unfair_lock_unlock(&stru_D428);
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  *(_OWORD *)keys = *(_OWORD *)off_82C0;
  v19[0] = xpc_string_create((const char *)[a3 UTF8String]);
  v19[1] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v6);
  if (v6) {
    size_t v7 = 2LL;
  }
  else {
    size_t v7 = 1LL;
  }
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, v19, v7);
  os_unfair_lock_lock(&stru_D428);
  if (self->_xpcConnection)
  {
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin xpcConnection](self, "xpcConnection"));
    xpc_connection_send_message(v9, v8);
  }

  else
  {
    int v10 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4DE0(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  os_unfair_lock_unlock(&stru_D428);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (id)sendSyncMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  *(_OWORD *)keys = *(_OWORD *)off_82C0;
  xpc_object_t v22 = xpc_string_create((const char *)[a3 UTF8String]);
  uint64_t v23 = _CFXPCCreateXPCObjectFromCFObject(v6);
  if (v6) {
    size_t v7 = 2LL;
  }
  else {
    size_t v7 = 1LL;
  }
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, &v22, v7);
  os_unfair_lock_lock(&stru_D428);
  if (self->_xpcConnection)
  {
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputPlugin xpcConnection]( self,  "xpcConnection",  v22,  v23,  keys[0],  keys[1]));
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v9, v8);

    os_unfair_lock_unlock(&stru_D428);
  }

  else
  {
    os_unfair_lock_unlock(&stru_D428);
    uint64_t v11 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4E14(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    xpc_object_t v10 = &_xpc_error_connection_invalid;
    id v19 = &_xpc_error_connection_invalid;
  }

  for (uint64_t i = 8LL; i != -8; i -= 8LL)
  return v10;
}

- (void)_checkIn
{
  v3 = (os_log_s *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    xpcConnection = self->_xpcConnection;
    *(_DWORD *)buf = 134217984;
    v25 = xpcConnection;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Send CheckIn to xpc connection %p", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin sendSyncMsg:args:](self, "sendSyncMsg:args:", @"CheckIn", 0LL));
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v5, "kMsgArgs");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v13 = v12;
    if (v12)
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v20;
        do
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            -[AudioAppleSiriRemoteInputPlugin _handlePublishMsg:]( self,  "_handlePublishMsg:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v18),  (void)v19);
            uint64_t v18 = (char *)v18 + 1;
          }

          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v16);
      }
    }
  }

  else
  {
    os_unfair_lock_lock(&stru_D428);
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4E48();
    }
    id v6 = self->_xpcConnection;
    if (v6)
    {
      xpc_connection_cancel(v6);
      size_t v7 = (os_log_s *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
      {
        xpc_object_t v8 = self->_xpcConnection;
        *(_DWORD *)buf = 134217984;
        v25 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Canceling xpc connection: %p", buf, 0xCu);
      }

      v9 = self->_xpcConnection;
      self->_xpcConnection = 0LL;
    }

    os_unfair_lock_unlock(&stru_D428);
  }
}

- (void)_handlePublishMsg:(id)a3
{
  id v4 = a3;
  v5 = -[AudioAppleSiriRemoteInputDevice initWithInfo:]( objc_alloc(&OBJC_CLASS___AudioAppleSiriRemoteInputDevice),  "initWithInfo:",  v4);
  if (v5)
  {
    id v6 = (void *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      size_t v7 = v6;
      xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](v5, "identifier"));
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Publishing remote %@", (uint8_t *)&v12, 0xCu);
    }

    -[AudioAppleSiriRemoteInputDevice setPlugin:](v5, "setPlugin:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
    objc_sync_enter(v9);
    xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
    [v10 addObject:v5];

    objc_sync_exit(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin delegate](self, "delegate"));
    [v11 inputPlugin:self didPublishDevice:v5];
  }
}

- (void)_handleUnpublishMsg:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Unpublishing remote %@", (uint8_t *)&v12, 0xCu);
  }

  [v5 invalidate];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  objc_sync_enter(v9);
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  [v10 removeObject:v5];

  objc_sync_exit(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin delegate](self, "delegate"));
  [v11 inputPlugin:self didUnpublishDevice:v5];
}

- (void)_handleTransportDidStartMsg:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Transport did start to remote %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 handleTransportDidStartMsg:v4];
}

- (void)_handleTransportDidStopMsg:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Transport did stop to remote %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 handleTransportDidStopMsg:v4];
}

- (void)_handleAudioFrameMsg:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  [v5 handleAudioFrameMsg:v4];
}

- (void)_handleStreamDidCancelMsg:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin _inputDeviceForArgs:](self, "_inputDeviceForArgs:", v4));
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Stream did cancel to remote %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 handleStreamDidCancelMsg:v4];
}

- (void)_RequestSiriAudioConnection
{
  mach_service = xpc_connection_create_mach_service("com.apple.BTLEAudioController.xpc", 0LL, 0LL);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  id v5 = (os_log_s *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self->_xpcConnection;
    *(_DWORD *)buf = 134217984;
    xpc_object_t v10 = v6;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "AudioAppleSiriRemoteInputPlugin xpc connection created at %p",  buf,  0xCu);
  }

  size_t v7 = self->_xpcConnection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_2EFC;
  handler[3] = &unk_82D8;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->_xpcConnection);
  os_unfair_lock_unlock(&stru_D428);
  -[AudioAppleSiriRemoteInputPlugin _checkIn](self, "_checkIn");
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[AudioAppleSiriRemoteInputPlugin _handleMsg:](self, "_handleMsg:", v4);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    -[AudioAppleSiriRemoteInputPlugin _handleError:](self, "_handleError:", v4);
  }

  else
  {
    id v6 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4EAC((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)_handleMsg:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
  id v10 = (id)objc_claimAutoreleasedReturnValue(value);

  uint64_t v7 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_handle%sMsg:",  string));
  uint64_t v9 = NSSelectorFromString(v8);

  objc_msgSend(self, v9, v7);
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  objc_sync_enter(v5);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        [v10 invalidate];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin delegate](self, "delegate"));
        [v11 inputPlugin:self didUnpublishDevice:v10];
      }

      id v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v7);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  [v12 removeAllObjects];

  objc_sync_exit(v5);
  os_unfair_lock_lock(&stru_D428);
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
    sub_4F74();
  }
  if (v4 == &_xpc_error_connection_interrupted || v4 == &_xpc_error_connection_invalid)
  {
    if (self->_xpcConnection)
    {
      __int128 v20 = (os_log_s *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
      {
        xpcConnection = self->_xpcConnection;
        *(_DWORD *)buf = 134217984;
        v30 = xpcConnection;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Canceling xpc connection: %p", buf, 0xCu);
      }

      uint64_t v23 = self->_xpcConnection;
      p_xpcConnection = &self->_xpcConnection;
      xpc_connection_cancel(v23);
      v24 = *p_xpcConnection;
      *p_xpcConnection = 0LL;
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4F10((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  os_unfair_lock_unlock(&stru_D428);
}

- (id)_inputDeviceForArgs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices"));
  objc_sync_enter(v6);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputPlugin inputDevices](self, "inputDevices", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned int v13 = [v12 isEqual:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
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

- (void).cxx_destruct
{
}

@end