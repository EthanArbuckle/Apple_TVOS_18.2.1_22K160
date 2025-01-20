@interface CSClientXPCConnection
- (BOOL)_getAudioProvideWithContext:(id)a3 streamClientType:(unint64_t)a4;
- (CSAudioAlertProvidingProxy)audioAlertProvidingProxy;
- (CSAudioMeterProvidingProxy)audioMeterProvidingProxy;
- (CSAudioMetricProvidingProxy)audioMetricProvidingProxy;
- (CSAudioSessionInfoProvidingProxy)audioSessionInfoProvidingProxy;
- (CSAudioSessionProvidingProxy)audioSessionProvidingProxy;
- (CSAudioStreamProvidingProxy)audioStreamProvidingProxy;
- (CSClientXPCConnection)initWithConnection:(id)a3;
- (CSClientXPCConnectionDelegate)delegate;
- (CSFallbackAudioSessionReleaseProvidingProxy)fallbackAudioSessionProvidingProxy;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (unint64_t)clientType;
- (void)_handleAudioProvidingMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioProvidingRequestTypeSwitchMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_handlePingPongMessage:(id)a3 client:(id)a4;
- (void)_handleSetXPCClientTypeMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_notifyXPCDisconnectionToProxies;
- (void)_notifyXPCDisconnectionToProxy:(id)a3;
- (void)activateConnection;
- (void)sendMessageToClient:(id)a3;
- (void)setAudioAlertProvidingProxy:(id)a3;
- (void)setAudioMeterProvidingProxy:(id)a3;
- (void)setAudioMetricProvidingProxy:(id)a3;
- (void)setAudioSessionInfoProvidingProxy:(id)a3;
- (void)setAudioSessionProvidingProxy:(id)a3;
- (void)setAudioStreamProvidingProxy:(id)a3;
- (void)setClientType:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackAudioSessionProvidingProxy:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSClientXPCConnection

- (CSClientXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CSClientXPCConnection;
  v6 = -[CSClientXPCConnection init](&v29, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("corespeechd xpc connection client queue", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (dispatch_object_s *)v7->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v10, v12);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
    v13 = -[CSAudioSessionProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioSessionProvidingProxy),  "initWithXPCConnection:",  v7);
    audioSessionProvidingProxy = v7->_audioSessionProvidingProxy;
    v7->_audioSessionProvidingProxy = v13;

    v15 = -[CSFallbackAudioSessionReleaseProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSFallbackAudioSessionReleaseProvidingProxy),  "initWithXPCConnection:",  v7);
    fallbackAudioSessionProvidingProxy = v7->_fallbackAudioSessionProvidingProxy;
    v7->_fallbackAudioSessionProvidingProxy = v15;

    v17 = -[CSAudioStreamProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioStreamProvidingProxy),  "initWithXPCConnection:",  v7);
    audioStreamProvidingProxy = v7->_audioStreamProvidingProxy;
    v7->_audioStreamProvidingProxy = v17;

    v19 = -[CSAudioAlertProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioAlertProvidingProxy),  "initWithXPCConnection:",  v7);
    audioAlertProvidingProxy = v7->_audioAlertProvidingProxy;
    v7->_audioAlertProvidingProxy = v19;

    v21 = -[CSAudioMeterProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioMeterProvidingProxy),  "initWithXPCConnection:",  v7);
    audioMeterProvidingProxy = v7->_audioMeterProvidingProxy;
    v7->_audioMeterProvidingProxy = v21;

    v23 = -[CSAudioMetricProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioMetricProvidingProxy),  "initWithXPCConnection:",  v7);
    audioMetricProvidingProxy = v7->_audioMetricProvidingProxy;
    v7->_audioMetricProvidingProxy = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioSessionInfoProvider sharedInstance]( &OBJC_CLASS___CSAudioSessionInfoProvider,  "sharedInstance"));
    v26 = -[CSAudioSessionInfoProvidingProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___CSAudioSessionInfoProvidingProxy),  "initWithXPCConnection:",  v7);
    audioSessionInfoProvidingProxy = v7->_audioSessionInfoProvidingProxy;
    v7->_audioSessionInfoProvidingProxy = v26;

    [v25 registerObserver:v7->_audioSessionInfoProvidingProxy];
    -[CSAudioSessionInfoProvidingProxy setAudioSessionInfoProvider:]( v7->_audioSessionInfoProvidingProxy,  "setAudioSessionInfoProvider:",  v25);
  }

  return v7;
}

- (BOOL)_getAudioProvideWithContext:(id)a3 streamClientType:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioSessionProvidingProxy audioSessionProvider]( self->_audioSessionProvidingProxy,  "audioSessionProvider"));
  [v7 setAudioSessionDelegate:0];

  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioAlertProvidingProxy audioAlertProvider](self->_audioAlertProvidingProxy, "audioAlertProvider"));
  [v8 setAudioAlertDelegate:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioProviderWithContext:v6 error:0]);

  if (v10)
  {
    id v11 = v10;
    [v11 setAudioSessionDelegate:self->_audioSessionProvidingProxy];
    -[CSAudioSessionProvidingProxy setAudioSessionProvider:]( self->_audioSessionProvidingProxy,  "setAudioSessionProvider:",  v11);
    -[CSAudioSessionProvidingProxy setStreamClientType:](self->_audioSessionProvidingProxy, "setStreamClientType:", a4);
    id v12 = v11;
    -[CSAudioStreamProvidingProxy setAudioStreamProvidingForProxy:]( self->_audioStreamProvidingProxy,  "setAudioStreamProvidingForProxy:",  v12);
    -[CSAudioStreamProvidingProxy setInitialContext:](self->_audioStreamProvidingProxy, "setInitialContext:", v6);
    -[CSAudioStreamProvidingProxy setTriggerInfoProviding:]( self->_audioStreamProvidingProxy,  "setTriggerInfoProviding:",  v12);
    -[CSAudioStreamProvidingProxy setStreamClientType:](self->_audioStreamProvidingProxy, "setStreamClientType:", a4);
    id v13 = v12;
    [v13 setAudioAlertDelegate:self->_audioAlertProvidingProxy];
    -[CSAudioAlertProvidingProxy setAudioAlertProvider:](self->_audioAlertProvidingProxy, "setAudioAlertProvider:", v13);
    -[CSAudioAlertProvidingProxy setStreamClientType:](self->_audioAlertProvidingProxy, "setStreamClientType:", a4);
    id v14 = v13;
    -[CSAudioMeterProvidingProxy setAudioMeterProvider:](self->_audioMeterProvidingProxy, "setAudioMeterProvider:", v14);
    -[CSAudioMeterProvidingProxy setStreamClientType:](self->_audioMeterProvidingProxy, "setStreamClientType:", a4);
    -[CSAudioMetricProvidingProxy setAudioMetricProvider:]( self->_audioMetricProvidingProxy,  "setAudioMetricProvider:",  v14);
    -[CSAudioMetricProvidingProxy setStreamClientType:](self->_audioMetricProvidingProxy, "setStreamClientType:", a4);
  }

  return v10 != 0LL;
}

- (void)activateConnection
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10012063C;
  v4[3] = &unk_10022E2F8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)sendMessageToClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSClientXPCConnection queue](self, "queue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100120534;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }

  else
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSClientXPCConnection sendMessageToClient:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Cannot send nil message", buf, 0xCu);
    }
  }
}

- (void)_handleClientEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_connection)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      -[CSClientXPCConnection _handleClientMessage:client:](self, "_handleClientMessage:client:", v5, self->_connection);
      goto LABEL_12;
    }

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      -[CSClientXPCConnection _handleClientError:client:](self, "_handleClientError:client:", v5, self->_connection);
      goto LABEL_12;
    }

    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      id v14 = "-[CSClientXPCConnection _handleClientEvent:]";
      id v8 = "%s ignore unknown types of message";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }

  else
  {
    id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      id v14 = "-[CSClientXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      v16 = v5;
      __int16 v17 = 2050;
      v18 = connection;
      id v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "type");
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v6, "body");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    switch(int64)
    {
      case 1LL:
        -[CSClientXPCConnection _handlePingPongMessage:client:](self, "_handlePingPongMessage:client:", v6, v8);
        break;
      case 2LL:
        audioSessionProvidingProxy = self->_audioSessionProvidingProxy;
        goto LABEL_21;
      case 4LL:
        audioSessionProvidingProxy = self->_audioStreamProvidingProxy;
        goto LABEL_21;
      case 6LL:
        audioSessionProvidingProxy = self->_audioAlertProvidingProxy;
        goto LABEL_21;
      case 8LL:
        audioSessionProvidingProxy = self->_audioMeterProvidingProxy;
        goto LABEL_21;
      case 9LL:
        audioSessionProvidingProxy = self->_audioMetricProvidingProxy;
        goto LABEL_21;
      case 10LL:
        audioSessionProvidingProxy = self->_audioSessionInfoProvidingProxy;
        goto LABEL_21;
      case 13LL:
        -[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]( self,  "_handleAudioProvidingMessage:messageBody:client:",  v6,  v11,  v8);
        break;
      case 14LL:
        audioStreamProvidingProxy = self->_audioStreamProvidingProxy;
        if (audioStreamProvidingProxy
          && (v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioStreamProvidingProxy audioStreamProviding]( audioStreamProvidingProxy,  "audioStreamProviding")),  v16,  v16))
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioStreamProvidingProxy audioStreamProviding]( self->_audioStreamProvidingProxy,  "audioStreamProviding"));
          uint64_t v18 = (uint64_t)[v17 audioStreamId];
        }

        else
        {
          uint64_t v18 = 1LL;
        }

        v19 = objc_alloc_init(&OBJC_CLASS___CSAudioTimeConversionProvidingProxy);
        -[CSAudioTimeConversionProvidingProxy handleXPCMessage:messageBody:client:audioStreamHandleId:]( v19,  "handleXPCMessage:messageBody:client:audioStreamHandleId:",  v6,  v11,  v8,  v18);

        break;
      case 15LL:
        -[CSClientXPCConnection _handleSetXPCClientTypeMessage:messageBody:client:]( self,  "_handleSetXPCClientTypeMessage:messageBody:client:",  v6,  v11,  v8);
        break;
      case 17LL:
        audioSessionProvidingProxy = self->_fallbackAudioSessionProvidingProxy;
LABEL_21:
        [audioSessionProvidingProxy handleXPCMessage:v6 messageBody:v11 client:v8];
        break;
      default:
        id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315394;
          v21 = "-[CSClientXPCConnection _handleClientMessage:client:]";
          __int16 v22 = 2050;
          int64_t v23 = int64;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Unexpected message type : %{public}lld",  (uint8_t *)&v20,  0x16u);
        }

        break;
    }
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315650;
      v21 = "-[CSClientXPCConnection _handleClientMessage:client:]";
      __int16 v22 = 2050;
      int64_t v23 = (int64_t)v6;
      __int16 v24 = 2050;
      v25 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s message = %{public}p, client = %{public}p, cannot handle message",  (uint8_t *)&v20,  0x20u);
    }
  }
}

- (void)_handleAudioProvidingMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136315138;
    int v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    __int16 v15 = "%s Cannot handle audio providing message";
    v16 = v14;
    uint32_t v17 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
    goto LABEL_11;
  }

  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  int v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    int v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    __int16 v21 = 2050;
    int64_t v22 = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Audio Providing Request Message has arrived : %{public}lld",  (uint8_t *)&v19,  0x16u);
  }

  if (int64 != 1)
  {
    uint64_t v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136315394;
    int v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    __int16 v21 = 2050;
    int64_t v22 = int64;
    __int16 v15 = "%s Unexpected XPC Metric providing request : %{public}lld";
    v16 = v18;
    uint32_t v17 = 22;
    goto LABEL_13;
  }

  -[CSClientXPCConnection _handleAudioProvidingRequestTypeSwitchMessage:messageBody:client:]( self,  "_handleAudioProvidingRequestTypeSwitchMessage:messageBody:client:",  v8,  v9,  v11);
LABEL_11:
}

- (void)_handleAudioProvidingRequestTypeSwitchMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a4;
  id v9 = (_xpc_connection_s *)a5;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v8, "context");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v12)
  {
    uint64_t int64 = xpc_dictionary_get_uint64(v8, "clientType");
    id v14 = -[CSAudioRecordContext initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioRecordContext),  "initWithXPCObject:",  v12);
    xpc_dictionary_set_BOOL( reply,  "result",  -[CSClientXPCConnection _getAudioProvideWithContext:streamClientType:]( self,  "_getAudioProvideWithContext:streamClientType:",  v14,  uint64));
  }

  else
  {
    __int16 v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      uint32_t v17 = "-[CSClientXPCConnection _handleAudioProvidingRequestTypeSwitchMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Unable to handle audio providing switch message : context is nil",  (uint8_t *)&v16,  0xCu);
    }

    xpc_dictionary_set_BOOL(reply, "result", 0);
  }

  xpc_connection_send_message(v9, reply);
}

- (void)_handleSetXPCClientTypeMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    int64_t int64 = xpc_dictionary_get_int64(v9, "xpcClientType");
    int v13 = int64;
    self->_clientType = int64;
    id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      uint32_t v17 = "-[CSClientXPCConnection _handleSetXPCClientTypeMessage:messageBody:client:]";
      __int16 v18 = 1026;
      int v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Setting XPCClientType to %{public}d",  (uint8_t *)&v16,  0x12u);
    }
  }

  else
  {
    __int16 v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      uint32_t v17 = "-[CSClientXPCConnection _handleSetXPCClientTypeMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Cannot handle audio providing message",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (v6 == &_xpc_error_connection_invalid || v6 == &_xpc_error_connection_interrupted)
    {
      id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        int v20 = "-[CSClientXPCConnection _handleClientError:client:]";
        __int16 v21 = 2050;
        int64_t v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Client %{public}p connection disconnected, noticing xpc listener",  (uint8_t *)&v19,  0x16u);
      }

      -[CSClientXPCConnection _notifyXPCDisconnectionToProxies](self, "_notifyXPCDisconnectionToProxies");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        id v12 = WeakRetained;
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector(v13, "CSClientXPCConnectionReceivedClientError:clientError:client:");

        if ((v14 & 1) != 0)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 CSClientXPCConnectionReceivedClientError:self clientError:v6 client:v8];
        }
      }
    }

    else
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      uint32_t v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        int v20 = "-[CSClientXPCConnection _handleClientError:client:]";
        __int16 v21 = 2082;
        int64_t v22 = string;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s connection error: %{public}s",  (uint8_t *)&v19,  0x16u);
      }
    }
  }
}

- (void)_notifyXPCDisconnectionToProxies
{
  if ((id)-[CSClientXPCConnection clientType](self, "clientType") == (id)1)
  {
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioSessionProvidingProxy);
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioStreamProvidingProxy);
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioAlertProvidingProxy);
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioMeterProvidingProxy);
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioMetricProvidingProxy);
  }

  if ((id)-[CSClientXPCConnection clientType](self, "clientType") == (id)2) {
    -[CSClientXPCConnection _notifyXPCDisconnectionToProxy:]( self,  "_notifyXPCDisconnectionToProxy:",  self->_audioSessionInfoProvidingProxy);
  }
}

- (void)_notifyXPCDisconnectionToProxy:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    char v6 = objc_opt_respondsToSelector(v4, "CSClientXPCConnectionReceivedClientError:clientError:client:");
    id v5 = v7;
    if ((v6 & 1) != 0)
    {
      [v7 CSClientXPCConnectionReceivedClientError:self clientError:0 client:0];
      id v5 = v7;
    }
  }
}

- (void)_handlePingPongMessage:(id)a3 client:(id)a4
{
  id v5 = a3;
  char v6 = (_xpc_connection_s *)a4;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSClientXPCConnection _handlePingPongMessage:client:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Handing PingPong message",  (uint8_t *)&v9,  0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  xpc_dictionary_set_BOOL(reply, "result", 1);
  xpc_connection_send_message(v6, reply);
}

- (CSClientXPCConnectionDelegate)delegate
{
  return (CSClientXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CSAudioSessionProvidingProxy)audioSessionProvidingProxy
{
  return self->_audioSessionProvidingProxy;
}

- (void)setAudioSessionProvidingProxy:(id)a3
{
}

- (CSFallbackAudioSessionReleaseProvidingProxy)fallbackAudioSessionProvidingProxy
{
  return self->_fallbackAudioSessionProvidingProxy;
}

- (void)setFallbackAudioSessionProvidingProxy:(id)a3
{
}

- (CSAudioSessionInfoProvidingProxy)audioSessionInfoProvidingProxy
{
  return self->_audioSessionInfoProvidingProxy;
}

- (void)setAudioSessionInfoProvidingProxy:(id)a3
{
}

- (CSAudioStreamProvidingProxy)audioStreamProvidingProxy
{
  return self->_audioStreamProvidingProxy;
}

- (void)setAudioStreamProvidingProxy:(id)a3
{
}

- (CSAudioAlertProvidingProxy)audioAlertProvidingProxy
{
  return self->_audioAlertProvidingProxy;
}

- (void)setAudioAlertProvidingProxy:(id)a3
{
}

- (CSAudioMeterProvidingProxy)audioMeterProvidingProxy
{
  return self->_audioMeterProvidingProxy;
}

- (void)setAudioMeterProvidingProxy:(id)a3
{
}

- (CSAudioMetricProvidingProxy)audioMetricProvidingProxy
{
  return self->_audioMetricProvidingProxy;
}

- (void)setAudioMetricProvidingProxy:(id)a3
{
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
}

@end