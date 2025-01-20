@interface CSAttendingServiceClient
- (BOOL)_isAttendingAllowedForUseCase:(int64_t)a3;
- (CSAttendingServiceClient)init;
- (CSAttendingServiceDelegate)delegate;
- (NSXPCConnection)attendingConnection;
- (OS_dispatch_queue)xpcConnectionQueue;
- (id)remoteObjectProxy;
- (void)_createClientConnection;
- (void)_setupRemoteServiceProxyObject;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAttendingConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)speechPauseDetected;
- (void)speechStartDetectedWithEventInfo:(id)a3;
- (void)startAttendingWithOptions:(id)a3 completion:(id)a4;
- (void)stopAttendingWithReason:(int64_t)a3;
@end

@implementation CSAttendingServiceClient

- (CSAttendingServiceClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAttendingServiceClient;
  v2 = -[CSAttendingServiceClient init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    CSLogInitIfNeeded(v2);
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.corespeech.attending.xpc.connection",  33LL));
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v4;
  }

  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSAttendingServiceClient init]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  return v3;
}

- (void)invalidate
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSAttendingServiceClient invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[NSXPCConnection invalidate](self->_attendingConnection, "invalidate");
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = 0LL;

  id remoteObjectProxy = self->_remoteObjectProxy;
  self->_id remoteObjectProxy = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAttendingServiceClient;
  -[CSAttendingServiceClient dealloc](&v3, "dealloc");
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  objc_super v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (!-[CSAttendingServiceClient _isAttendingAllowedForUseCase:]( self,  "_isAttendingAllowedForUseCase:",  [v6 attendingType]))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Attending is not allowed for usecase: %lu",  [v6 attendingType]));
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    if (v7)
    {
      uint64_t v14 = CSErrorDomain;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      v19 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  2108LL,  v15));

      v7[2](v7, 0LL, v16);
    }

    goto LABEL_15;
  }

  -[CSAttendingServiceClient _setupRemoteServiceProxyObject](self, "_setupRemoteServiceProxyObject");
  if (!self->_remoteObjectProxy)
  {
    v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Cannot start attending since unable to setup remoteObjectProxy",  buf,  0xCu);
      if (!v7) {
        goto LABEL_16;
      }
    }

    else if (!v7)
    {
      goto LABEL_16;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  2101LL,  0LL));
    v7[2](v7, 0LL, v12);
LABEL_15:

    goto LABEL_16;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakListenerDeviceManager sharedManager]( &OBJC_CLASS___CSOpportuneSpeakListenerDeviceManager,  "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
    [v10 setDeviceId:v11];
  }

  [self->_remoteObjectProxy startAttendingWithOptions:v6 completion:v7];
LABEL_16:
}

- (void)stopAttendingWithReason:(int64_t)a3
{
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id remoteObjectProxy = self->_remoteObjectProxy;
    int v9 = 136315394;
    v10 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
    __int16 v11 = 2112;
    id v12 = remoteObjectProxy;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = self->_remoteObjectProxy;
  if (v7)
  {
    [v7 stopAttendingWithReason:a3];
  }

  else
  {
    objc_super v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Cannot stop attending since _remoteObjectProxy is nil",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)attendingStoppedWithReason:(int64_t)a3
{
  v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    else {
      id v7 = *(&off_10022BD50 + a3 - 1);
    }
    objc_super v8 = v7;
    int v10 = 136315394;
    __int16 v11 = "-[CSAttendingServiceClient attendingStoppedWithReason:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s [reason = %@]", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained attendingStoppedWithReason:a3];
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[CSAttendingServiceClient speechStartDetectedWithEventInfo:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechStartDetectedWithEventInfo:v4];
}

- (void)speechPauseDetected
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttendingServiceClient speechPauseDetected]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechPauseDetected];
}

- (void)_setupRemoteServiceProxyObject
{
  if (!self->_remoteObjectProxy || !self->_attendingConnection)
  {
    objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }

    attendingConnection = self->_attendingConnection;
    if (attendingConnection
      || (-[CSAttendingServiceClient _createClientConnection](self, "_createClientConnection"),
          (attendingConnection = self->_attendingConnection) != 0LL))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100104A70;
      v8[3] = &unk_10022E408;
      v8[4] = self;
      int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( attendingConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v8));
      id remoteObjectProxy = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = v5;
    }

    else
    {
      int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v10 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s ERR: _attendingConnection is nil",  buf,  0xCu);
      }

      id remoteObjectProxy = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = 0LL;
    }
  }

- (void)_createClientConnection
{
  objc_super v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.corespeech.corespeechd.attending.service",  0LL);
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = v3;

  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttendingService));
  -[NSXPCConnection setRemoteObjectInterface:](self->_attendingConnection, "setRemoteObjectInterface:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttendingServiceDelegate));
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___CSAttendingTriggerInfo, v7);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v6 setClasses:v9 forSelector:"speechStartDetectedWithEventInfo:" argumentIndex:0 ofReply:0];

  -[NSXPCConnection setExportedInterface:](self->_attendingConnection, "setExportedInterface:", v6);
  -[NSXPCConnection setExportedObject:](self->_attendingConnection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_attendingConnection, "_setQueue:", self->_xpcConnectionQueue);
  objc_initWeak(&location, self);
  id v10 = self->_attendingConnection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100104710;
  v16[3] = &unk_10022E920;
  objc_copyWeak(&v17, &location);
  -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v16);
  __int16 v11 = self->_attendingConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100104884;
  v14[3] = &unk_10022E920;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v14);
  __int16 v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_attendingConnection;
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSAttendingServiceClient _createClientConnection]";
    __int16 v21 = 2112;
    __int16 v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Setup connection: %@", buf, 0x16u);
  }

  -[NSXPCConnection resume](self->_attendingConnection, "resume");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)_isAttendingAllowedForUseCase:(int64_t)a3
{
  if (a3 != 6 && a3 != 1) {
    return 1;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMagusSupportedPolicy sharedInstance]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "sharedInstance",  v4,  v3,  v5,  v6));
  unsigned __int8 v8 = [v7 getIsAssetMagusSupported];

  return v8;
}

- (CSAttendingServiceDelegate)delegate
{
  return (CSAttendingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (NSXPCConnection)attendingConnection
{
  return self->_attendingConnection;
}

- (void)setAttendingConnection:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end