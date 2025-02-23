@interface CSVoiceTriggerXPCConnection
- (CSVoiceTriggerXPCConnection)initWithConnection:(id)a3;
- (CSVoiceTriggerXPCConnectionDelegate)delegate;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_handleEnableVoiceTriggerWithSiriAssertionRequest:(id)a3;
- (void)_handlePhraseSpotterBypassRequest:(id)a3;
- (void)_handleRaiseToSpeakBypassRequest:(id)a3;
- (void)_handleVoiceTriggerStatsFetchEvent:(id)a3 client:(id)a4;
- (void)_handleVoiceTriggerXPCServiceMessage:(id)a3 client:(id)a4;
- (void)_handleVoiceTriggeredSiriSessionCancelled;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)activateConnection;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSVoiceTriggerXPCConnection

- (CSVoiceTriggerXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerXPCConnection;
  v6 = -[CSVoiceTriggerXPCConnection init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("voicetrigger xpc service connection client queue", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (dispatch_object_s *)v7->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v10, v12);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
  }

  return v7;
}

- (void)activateConnection
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001334A8;
  v4[3] = &unk_10022E2F8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
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
      -[CSVoiceTriggerXPCConnection _handleClientMessage:client:]( self,  "_handleClientMessage:client:",  v5,  self->_connection);
      goto LABEL_12;
    }

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      -[CSVoiceTriggerXPCConnection _handleClientError:client:]( self,  "_handleClientError:client:",  v5,  self->_connection);
      goto LABEL_12;
    }

    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      objc_super v14 = "-[CSVoiceTriggerXPCConnection _handleClientEvent:]";
      dispatch_queue_t v8 = "%s ignore unknown types of message";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }

  else
  {
    v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      objc_super v14 = "-[CSVoiceTriggerXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      v16 = v5;
      __int16 v17 = 2050;
      v18 = connection;
      dispatch_queue_t v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = v7;
  if (!v6 || !v7)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v14 = 136315650;
    __int16 v15 = "-[CSVoiceTriggerXPCConnection _handleClientMessage:client:]";
    __int16 v16 = 2050;
    id v17 = v6;
    __int16 v18 = 2050;
    v19 = v8;
    uint32_t v10 = "%s message = %{public}p, client = %{public}p, cannot handle message";
    v11 = v9;
    uint32_t v12 = 32;
LABEL_10:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, v12);
    goto LABEL_8;
  }

  if (xpc_dictionary_get_int64(v6, "type") != 2)
  {
    int v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v14 = 136315138;
    __int16 v15 = "-[CSVoiceTriggerXPCConnection _handleClientMessage:client:]";
    uint32_t v10 = "%s Cannot handle wrong message type";
    v11 = v13;
    uint32_t v12 = 12;
    goto LABEL_10;
  }

  -[CSVoiceTriggerXPCConnection _handleVoiceTriggerXPCServiceMessage:client:]( self,  "_handleVoiceTriggerXPCServiceMessage:client:",  v6,  v8);
LABEL_8:
}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  dispatch_queue_t v8 = v7;
  if (v6 && v7)
  {
    if (v6 == &_xpc_error_connection_invalid || v6 == &_xpc_error_connection_interrupted)
    {
      uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        v20 = "-[CSVoiceTriggerXPCConnection _handleClientError:client:]";
        __int16 v21 = 2050;
        v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Client %{public}p connection disconnected, noticing xpc listener",  (uint8_t *)&v19,  0x16u);
      }

      -[CSVoiceTriggerXPCConnection _handleServiceConnectionLostIfNeeded](self, "_handleServiceConnectionLostIfNeeded");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        uint32_t v12 = WeakRetained;
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector(v13, "CSVoiceTriggerXPCConnectionReceivedClientError:clientError:client:");

        if ((v14 & 1) != 0)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 CSVoiceTriggerXPCConnectionReceivedClientError:self clientError:v6 client:v8];
        }
      }
    }

    else
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        v20 = "-[CSVoiceTriggerXPCConnection _handleClientError:client:]";
        __int16 v21 = 2082;
        v22 = string;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s connection error: %{public}s",  (uint8_t *)&v19,  0x16u);
      }
    }
  }
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  dispatch_queue_t v8 = (_xpc_connection_s *)a4;
  xpc_object_t message = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(message, "result", a5);
  xpc_connection_send_message(v8, message);
}

- (void)_handleVoiceTriggerXPCServiceMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v6, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  uint32_t v10 = v9;
  if (v7 && v6 && v9)
  {
    int64_t int64 = xpc_dictionary_get_int64(v9, "type");
    switch(int64)
    {
      case 1LL:
        -[CSVoiceTriggerXPCConnection _handlePhraseSpotterBypassRequest:]( self,  "_handlePhraseSpotterBypassRequest:",  v10);
        break;
      case 2LL:
        -[CSVoiceTriggerXPCConnection _handleVoiceTriggeredSiriSessionCancelled]( self,  "_handleVoiceTriggeredSiriSessionCancelled");
        break;
      case 3LL:
        -[CSVoiceTriggerXPCConnection _handleEnableVoiceTriggerWithSiriAssertionRequest:]( self,  "_handleEnableVoiceTriggerWithSiriAssertionRequest:",  v10);
        break;
      case 4LL:
        -[CSVoiceTriggerXPCConnection _handleRaiseToSpeakBypassRequest:](self, "_handleRaiseToSpeakBypassRequest:", v10);
        break;
      case 5LL:
        -[CSVoiceTriggerXPCConnection _handleVoiceTriggerStatsFetchEvent:client:]( self,  "_handleVoiceTriggerStatsFetchEvent:client:",  v6,  v7);
        break;
      default:
        int64_t v13 = int64;
        char v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315394;
          int v19 = "-[CSVoiceTriggerXPCConnection _handleVoiceTriggerXPCServiceMessage:client:]";
          __int16 v20 = 2050;
          int64_t v21 = v13;
          id v15 = "%s Unexpected XPC Metric providing request : %{public}lld";
          __int16 v16 = v14;
          uint32_t v17 = 22;
          goto LABEL_15;
        }

        break;
    }
  }

  else
  {
    uint32_t v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      int v19 = "-[CSVoiceTriggerXPCConnection _handleVoiceTriggerXPCServiceMessage:client:]";
      id v15 = "%s Cannot handle audio providing message";
      __int16 v16 = v12;
      uint32_t v17 = 12;
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, v17);
    }
  }
}

- (void)_handlePhraseSpotterBypassRequest:(id)a3
{
  id v3 = a3;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "phraseSpotterBypass");
  double v5 = xpc_dictionary_get_double(v3, "bypassTimeout");

  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[CSVoiceTriggerXPCConnection _handlePhraseSpotterBypassRequest:]";
    __int16 v10 = 1026;
    BOOL v11 = v4;
    __int16 v12 = 2050;
    double v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Request to bypass PhraseSpotter : %{public}d with timeout %{public}lf seconds",  (uint8_t *)&v8,  0x1Cu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
  [v7 setPhraseSpotterBypassing:v4 timeout:v5];
}

- (void)_handleRaiseToSpeakBypassRequest:(id)a3
{
  id v3 = a3;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "raiseToSpeakBypass");
  double v5 = xpc_dictionary_get_double(v3, "bypassTimeout");

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
  [v6 setRaiseToSpeakBypassing:v4 timeout:v5];
}

- (void)_handleVoiceTriggeredSiriSessionCancelled
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[CSVoiceTriggerXPCConnection _handleVoiceTriggeredSiriSessionCancelled]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Received Siri Session did cancelled",  (uint8_t *)&v4,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
  [v3 notifyVoiceTriggeredSiriSessionCancelled];
}

- (void)_handleEnableVoiceTriggerWithSiriAssertionRequest:(id)a3
{
  id v3 = a3;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "enable");
  double v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "assertion"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(v5);
  double v6 = xpc_dictionary_get_double(v3, "timestamp");

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
  [v7 enableVoiceTrigger:v4 withAssertion:v8 timestamp:v6];
}

- (void)_handleVoiceTriggerStatsFetchEvent:(id)a3 client:(id)a4
{
  double v5 = (_xpc_connection_s *)a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 fetchVoiceTriggerStats]);

  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_set_BOOL(reply, "result", v10 != 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_cs_xpcObject"));
  xpc_dictionary_set_value(reply, "triggerStats", v9);

  xpc_connection_send_message(v5, reply);
}

- (CSVoiceTriggerXPCConnectionDelegate)delegate
{
  return (CSVoiceTriggerXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void).cxx_destruct
{
}

@end