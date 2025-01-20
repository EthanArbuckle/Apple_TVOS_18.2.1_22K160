@interface CSAttendingStatesServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingStatesServiceListener)init;
- (NSXPCConnection)activeConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)_cleanupConnection:(id)a3 shouldInvalidate:(BOOL)a4;
- (void)listen;
- (void)registerAttendingStatesProvidingProxy:(id)a3;
- (void)setActiveConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAttendingStatesServiceListener

- (CSAttendingStatesServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttendingStatesServiceListener;
  v2 = -[CSAttendingStatesServiceListener init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingStatesServiceListener Queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)listen
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", LBAttendingStatesServiceName);
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  objc_super v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSAttendingStatesServiceListener listen]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSAttendingStatesServiceListener start listening",  (uint8_t *)&v7,  0xCu);
  }

- (void)registerAttendingStatesProvidingProxy:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001036B8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_cleanupConnection:(id)a3 shouldInvalidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[CSAttendingStatesServiceListener _cleanupConnection:shouldInvalidate:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Cleaning up connection: %@",  (uint8_t *)&v12,  0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSAttendingStatesServiceListener activeConnection](self, "activeConnection"));

    if (v8 == v6)
    {
      -[CSAttendingStatesServiceListener setActiveConnection:](self, "setActiveConnection:", 0LL);
      p_attendingStatesProvidingProxy = &self->_attendingStatesProvidingProxy;
      id WeakRetained = objc_loadWeakRetained((id *)p_attendingStatesProvidingProxy);
      [WeakRetained setRemoteObjectProxy:0];

      id v11 = objc_loadWeakRetained((id *)p_attendingStatesProvidingProxy);
      [v11 attendingStatesXPCDisconnected];

      if (!v4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }

    if (v4)
    {
LABEL_6:
      [v6 setInvalidationHandler:0];
      [v6 setInterruptionHandler:0];
      [v6 invalidate];
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  int v7 = (NSXPCListener *)a4;
  id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v34 = 2112;
    v35 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Got new connection on attending service: %@",  buf,  0x16u);
  }

  if (self->_listener != v6)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v34 = 2114;
      v35 = v6;
      v10 = "%s Invalid listener - %{public}@";
      id v11 = v9;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if ((+[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v7,  @"corespeech.corespeechd.attending.service") & 1) == 0)
  {
    -[NSXPCListener invalidate](v7, "invalidate");
    v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
      v10 = "%s Rejecting connection due to entitlement";
      id v11 = v20;
      uint32_t v12 = 12;
      goto LABEL_10;
    }

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  return (CSAttendingStatesProvidingProxy *)objc_loadWeakRetained((id *)&self->_attendingStatesProvidingProxy);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end