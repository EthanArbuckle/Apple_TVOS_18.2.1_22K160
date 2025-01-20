@interface PBBasicServiceListener
- (BOOL)_checkEntitlementsForProcess:(id)a3;
- (BSServiceConnectionListener)listener;
- (PBBasicServiceListener)initWithConfiguration:(id)a3 serviceBuilder:(id)a4;
- (PBSXPCServiceConfiguration)configuration;
- (id)serviceBuilder;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setListener:(id)a3;
- (void)setServiceBuilder:(id)a3;
@end

@implementation PBBasicServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281C94(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBBasicServiceListener;
    -[PBBasicServiceListener dealloc](&v5, "dealloc");
  }

- (PBBasicServiceListener)initWithConfiguration:(id)a3 serviceBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBBasicServiceListener;
  v9 = -[PBBasicServiceListener init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    id v11 = objc_retainBlock(v8);
    id serviceBuilder = v10->_serviceBuilder;
    v10->_id serviceBuilder = v11;
  }

  return v10;
}

- (void)activate
{
  if (!self->_listener)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10010F3CC;
    v7[3] = &unk_1003D0EC8;
    v7[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v7));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener activated.", v6, 2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Listener invalidated.", v5, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  if (-[PBBasicServiceListener _checkEntitlementsForProcess:](self, "_checkEntitlementsForProcess:", v7))
  {
    uint64_t v8 = (*((uint64_t (**)(void))self->_serviceBuilder + 2))();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10010F6A8;
    v14[3] = &unk_1003D69F0;
    v14[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    id v15 = v9;
    id v10 = v7;
    id v16 = v10;
    [v6 configureConnection:v14];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = v10;
      __int16 v19 = 2048;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
    }

    [v6 activate];
    if ((objc_opt_respondsToSelector(v9, "setServiceClient:") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteTarget]);
      [v9 setServiceClient:v12];
    }
  }

  else
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v7, v13);
    }

    [v6 invalidate];
  }
}

- (BOOL)_checkEntitlementsForProcess:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSXPCServiceConfiguration onConnectBooleanEntitlement]( self->_configuration,  "onConnectBooleanEntitlement"));
  if (v5) {
    unsigned __int8 v6 = [v4 hasEntitlement:v5];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (PBSXPCServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)serviceBuilder
{
  return self->_serviceBuilder;
}

- (void)setServiceBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end