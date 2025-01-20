@interface CSAttendingServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAttendingServiceListener)init;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingUsecaseManager)attendingUsecaseManager;
- (NSMutableArray)proxies;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteInterface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)registerAttendingStatesProvidingProxy:(id)a3;
- (void)registerAttendingUsecaseManager:(id)a3;
- (void)resumeConnection;
- (void)setExportedInterface:(id)a3;
- (void)setListener:(id)a3;
- (void)setProxies:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteInterface:(id)a3;
@end

@implementation CSAttendingServiceListener

- (CSAttendingServiceListener)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSAttendingServiceListener;
  v2 = -[CSAttendingServiceListener init](&v15, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingServiceListener Queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    proxies = v2->_proxies;
    v2->_proxies = (NSMutableArray *)v5;

    v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.corespeech.corespeechd.attending.service");
    listener = v2->_listener;
    v2->_listener = v7;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttendingService));
    exportedInterface = v2->_exportedInterface;
    v2->_exportedInterface = (NSXPCInterface *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttendingServiceDelegate));
    remoteInterface = v2->_remoteInterface;
    v2->_remoteInterface = (NSXPCInterface *)v11;
  }

  v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAttendingServiceListener init]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Started listening for attending", buf, 0xCu);
  }

  return v2;
}

- (void)registerAttendingUsecaseManager:(id)a3
{
}

- (void)registerAttendingStatesProvidingProxy:(id)a3
{
}

- (void)dealloc
{
  uint64_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[CSAttendingServiceListener dealloc]";
    __int16 v7 = 2114;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Attending service dealloced - %{public}@",  buf,  0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAttendingServiceListener;
  -[CSAttendingServiceListener dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  __int16 v7 = (NSXPCListener *)a4;
  v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Got new connection on attending service: %@",  buf,  0x16u);
  }

  if (self->_listener != v6)
  {
    uint64_t v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v31 = 2114;
      v32 = v6;
      v10 = "%s Invalid listener - %{public}@";
      uint64_t v11 = v9;
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
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
      v10 = "%s Rejecting connection due to entitlement";
      uint64_t v11 = v21;
      uint32_t v12 = 12;
      goto LABEL_10;
    }

- (void)resumeConnection
{
  uint64_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v7 = "-[CSAttendingServiceListener resumeConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FCC18;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttendingUsecaseManager)attendingUsecaseManager
{
  return (CSAttendingUsecaseManager *)objc_loadWeakRetained((id *)&self->_attendingUsecaseManager);
}

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  return (CSAttendingStatesProvidingProxy *)objc_loadWeakRetained((id *)&self->_attendingStatesProvidingProxy);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (NSXPCInterface)remoteInterface
{
  return self->_remoteInterface;
}

- (void)setRemoteInterface:(id)a3
{
}

- (NSMutableArray)proxies
{
  return self->_proxies;
}

- (void)setProxies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end