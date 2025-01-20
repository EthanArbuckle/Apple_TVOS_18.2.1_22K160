@interface CSVoiceIdXPCListener
- (CSVoiceIdXPCListener)init;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_handleNewRemoteConnection:(id)a3;
- (void)listen;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSVoiceIdXPCListener

- (CSVoiceIdXPCListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSVoiceIdXPCListener;
  id v2 = -[CSVoiceIdXPCListener init](&v13, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceIdXPCListener", 0LL);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = (dispatch_object_s *)*((void *)v2 + 1);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v5, v7);

    xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.corespeech.corespeechd.voiceid.xpc",  *((dispatch_queue_t *)v2 + 1),  1uLL);
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = mach_service;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;
  }

  return (CSVoiceIdXPCListener *)v2;
}

- (void)listen
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSVoiceIdXPCListener listen]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceIdXPCListener start listening",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  listener = self->_listener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100113F6C;
  handler[3] = &unk_10022E2F8;
  objc_copyWeak(&v6, (id *)buf);
  xpc_connection_set_event_handler(listener, handler);
  xpc_connection_activate(self->_listener);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSVoiceIdXPCListener _handleListenerEvent:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Received new remote control connection request",  (uint8_t *)&v7,  0xCu);
  }

  if (v4)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error) {
      -[CSVoiceIdXPCListener _handleListenerError:](self, "_handleListenerError:", v4);
    }
    else {
      -[CSVoiceIdXPCListener _handleNewRemoteConnection:](self, "_handleNewRemoteConnection:", v4);
    }
  }

  else
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[CSVoiceIdXPCListener _handleListenerEvent:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Connection request is nil",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)_handleListenerError:(id)a3
{
  id v4 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    int v6 = 136315394;
    int v7 = "-[CSVoiceIdXPCListener _handleListenerError:]";
    __int16 v8 = 2082;
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Error = %{public}s",  (uint8_t *)&v6,  0x16u);
  }

- (void)_handleNewRemoteConnection:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v4)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      __int16 v8 = "-[CSVoiceIdXPCListener _handleNewRemoteConnection:]";
      __int16 v9 = 2050;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Getting new client connection : %{public}p",  (uint8_t *)&v7,  0x16u);
    }

    if (+[CSUtils machXPCConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "machXPCConnection:hasEntitlement:",  v4,  @"corespeech.corespeechd.voiceid.xpc"))
    {
      int v6 = -[CSVoiceIdXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___CSVoiceIdXPCConnection),  "initWithConnection:",  v4);
      -[CSVoiceIdXPCConnection activateConnection](v6, "activateConnection");
      if (v6) {
        -[NSMutableArray addObject:](self->_connections, "addObject:", v6);
      }
    }
  }

  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    __int16 v8 = "-[CSVoiceIdXPCListener _handleNewRemoteConnection:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Connection request is nil",  (uint8_t *)&v7,  0xCu);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end