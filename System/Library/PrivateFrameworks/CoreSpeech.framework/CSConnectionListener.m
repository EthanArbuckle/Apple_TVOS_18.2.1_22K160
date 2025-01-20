@interface CSConnectionListener
+ (id)createSmartSiriVolumeListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6;
- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6 queue:(id)a7;
- (CSConnectionListener)initWithXpcListener:(id)a3 withMachService:(id)a4 withServiceInterface:(id)a5 withServiceObject:(id)a6 withDelegateInterface:(id)a7 queue:(id)a8;
- (NSMutableArray)clientConnections;
- (NSString)machServiceName;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)notifyClientsWithBlock:(id)a3;
- (void)resumeConnection;
- (void)setClientConnections:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSConnectionListener

+ (id)createSmartSiriVolumeListener
{
  if ((+[CSUtils supportSmartVolume](&OBJC_CLASS___CSUtils, "supportSmartVolume") & 1) != 0)
  {
    if (qword_10027FE28 != -1) {
      dispatch_once(&qword_10027FE28, &stru_10022B918);
    }
    id v2 = (id)qword_10027FE20;
  }

  else
  {
    v3 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "+[CSConnectionListener(SmartSiriVolume) createSmartSiriVolumeListener]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume not supported on this platform - Bailing out",  (uint8_t *)&v5,  0xCu);
    }

    id v2 = 0LL;
  }

  return v2;
}

- (CSConnectionListener)initWithXpcListener:(id)a3 withMachService:(id)a4 withServiceInterface:(id)a5 withServiceObject:(id)a6 withDelegateInterface:(id)a7 queue:(id)a8
{
  id v15 = a3;
  v16 = (NSString *)a4;
  id v33 = a5;
  id v17 = a6;
  id v31 = a7;
  id v32 = a8;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CSConnectionListener;
  v18 = -[CSConnectionListener init](&v34, "init");
  v19 = v18;
  if (!v18)
  {
LABEL_22:
    v23 = v19;
    goto LABEL_23;
  }

  if (!v15)
  {
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v22 = "%s ERR: XPC listener Name is nil - Bailing out";
LABEL_17:
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    goto LABEL_18;
  }

  if (!v16)
  {
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v22 = "%s ERR: Mach Service Name is nil - Bailing out";
    goto LABEL_17;
  }

  if (!v17)
  {
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v22 = "%s ERR: Proxy Object is nil - Bailing out";
    goto LABEL_17;
  }

  if (v33)
  {
    objc_storeStrong((id *)&v18->_listener, a3);
    -[NSXPCListener setDelegate:](v19->_listener, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_machServiceName, a4);
    objc_storeStrong((id *)&v19->_exportedInterface, a5);
    objc_storeStrong(&v19->_proxyObject, a6);
    objc_storeStrong((id *)&v19->_remoteInterface, a7);
    if (v32)
    {
      objc_storeStrong((id *)&v19->_queue, a8);
      v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDele"
              "gateInterface:queue:]";
        __int16 v37 = 2112;
        v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Set up queue for %@", buf, 0x16u);
      }
    }

    else
    {
      dispatch_queue_t v24 = dispatch_queue_create("com.apple.CoreSpeech.Connection.Listener", 0LL);
      queue = v19->_queue;
      v19->_queue = (OS_dispatch_queue *)v24;
    }

    -[NSXPCListener _setQueue:](v19->_listener, "_setQueue:", v19->_queue);
    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    clientConnections = v19->_clientConnections;
    v19->_clientConnections = v26;

    v28 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      machServiceName = v19->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelega"
            "teInterface:queue:]";
      __int16 v37 = 2114;
      v38 = machServiceName;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s Started listening for %{public}@",  buf,  0x16u);
    }

    goto LABEL_22;
  }

  v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v22 = "%s ERR: Exported interface is nil - Bailing out";
    goto LABEL_17;
  }

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6
{
  return -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( self,  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  a3,  a4,  a5,  a6,  0LL);
}

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6 queue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v16);
  v18 = -[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( self,  "initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  v17,  v16,  v15,  v14,  v13,  v12);

  return v18;
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315650;
    v7 = "-[CSConnectionListener dealloc]";
    __int16 v8 = 2114;
    v9 = machServiceName;
    __int16 v10 = 2114;
    v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Service %{public}@ dealloced - %{public}@",  buf,  0x20u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSConnectionListener;
  -[CSConnectionListener dealloc](&v5, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
    __int16 v29 = 2114;
    v30 = machServiceName;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Got connection on service %{public}@",  buf,  0x16u);
  }

  if (self->_listener != v6)
  {
    __int16 v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_machServiceName;
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      __int16 v29 = 2114;
      v30 = v11;
      __int16 v31 = 2114;
      id v32 = v6;
      id v12 = "%s [Service:%{public}@] Invalid listener - %{public}@";
      id v13 = v10;
      uint32_t v14 = 32;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if ((+[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v7,  @"corespeech.corespeechd.xpc") & 1) == 0)
  {
    [v7 invalidate];
    id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      __int16 v29 = 2114;
      v30 = v18;
      id v12 = "%s Rejecting connection to %{public}@ due to entitlement";
      id v13 = v17;
      uint32_t v14 = 22;
      goto LABEL_10;
    }

- (void)notifyClientsWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001286C4;
  block[3] = &unk_10022DF78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)resumeConnection
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSConnectionListener resumeConnection]";
    __int16 v9 = 2114;
    __int16 v10 = machServiceName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@]", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001286B8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end