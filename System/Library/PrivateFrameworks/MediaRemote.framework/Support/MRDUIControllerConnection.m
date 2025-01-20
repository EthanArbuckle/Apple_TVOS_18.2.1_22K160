@interface MRDUIControllerConnection
+ (BSServiceInterface)serviceInterface;
- (BSServiceConnectionClient)serviceConnection;
- (MRDUIControllerConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4;
- (MRUIClientProtocol)client;
- (MRUIServerProtocol)server;
- (id)invalidationHandler;
- (os_unfair_lock_s)lock;
- (void)dealloc;
@end

@implementation MRDUIControllerConnection

- (MRDUIControllerConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDUIControllerConnection;
  v10 = -[MRDUIControllerConnection init](&v16, "init");
  if (v10)
  {
    uint64_t v11 = _MRLogForCategory(11LL, v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRUIControllerConnection] <%p> Initializing.",  buf,  0xCu);
    }

    id v13 = objc_retainBlock(v8);
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = v13;

    objc_storeStrong((id *)&v10->_client, a3);
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = _MRLogForCategory(11LL, v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MRUIControllerConnection] <%p> Dealloc.",  buf,  0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDUIControllerConnection;
  -[MRDUIControllerConnection dealloc](&v6, "dealloc");
}

- (MRUIServerProtocol)server
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIControllerConnection serviceConnection](self, "serviceConnection"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  id v7 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteTargetWithLaunchingAssertionAttributes:v4]);

  return (MRUIServerProtocol *)v5;
}

- (BSServiceConnectionClient)serviceConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    uint64_t v6 = _MRLogForCategory(11LL, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRUIControllerConnection] <%p> Creating service connection.",  buf,  0xCu);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionEndpoint endpointForMachName:service:instance:]( &OBJC_CLASS___BSServiceConnectionEndpoint,  "endpointForMachName:service:instance:",  @"com.apple.mediaremoteui.services",  @"com.apple.mediaremoteui.ui-service",  0LL));
    if (v9)
    {
      objc_initWeak((id *)buf, self);
      v10 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue( +[BSServiceConnection connectionWithEndpoint:]( &OBJC_CLASS___BSServiceConnection,  "connectionWithEndpoint:",  v9));
      uint64_t v11 = self->_serviceConnection;
      self->_serviceConnection = v10;

      v12 = self->_serviceConnection;
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      v19 = sub_1000737E4;
      v20 = &unk_10039CDD8;
      v21 = self;
      objc_copyWeak(&v22, (id *)buf);
      -[BSServiceConnectionClient configureConnection:](v12, "configureConnection:", &v17);
      -[BSServiceConnectionClient activate](self->_serviceConnection, "activate", v17, v18, v19, v20, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      uint64_t v13 = _MRLogForCategory(11LL, v8);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002B66C8((uint64_t)self, v14);
      }
    }

    serviceConnection = self->_serviceConnection;
  }

  v15 = serviceConnection;
  os_unfair_lock_unlock(p_lock);
  return v15;
}

+ (BSServiceInterface)serviceInterface
{
  if (qword_1003FDD60 != -1) {
    dispatch_once(&qword_1003FDD60, &stru_10039CDF8);
  }
  return (BSServiceInterface *)(id)qword_1003FDD58;
}

- (MRUIClientProtocol)client
{
  return self->_client;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
}

@end