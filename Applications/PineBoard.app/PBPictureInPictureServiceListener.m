@interface PBPictureInPictureServiceListener
- (BSServiceConnectionListener)listener;
- (PBPictureInPictureServiceListener)init;
- (PBSXPCServiceConfiguration)configuration;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation PBPictureInPictureServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281254(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBPictureInPictureServiceListener;
    -[PBPictureInPictureServiceListener dealloc](&v5, "dealloc");
  }

- (PBPictureInPictureServiceListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBPictureInPictureServiceListener;
  v2 = -[PBPictureInPictureServiceListener init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = PBSPictureInPictureServiceConfiguration();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    configuration = v2->_configuration;
    v2->_configuration = (PBSXPCServiceConfiguration *)v4;
  }

  return v2;
}

- (void)activate
{
  if (!self->_listener)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001069F8;
    v7[3] = &unk_1003D0EC8;
    v7[4] = self;
    uint64_t v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v7));
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

  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Listener invalidated.", v5, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 auditToken]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100106CA0;
  v14[3] = &unk_1003D69F0;
  v14[4] = self;
  v10 =  -[PBPictureInPictureService initWithClientBundleIdentifier:auditToken:]( objc_alloc(&OBJC_CLASS___PBPictureInPictureService),  "initWithClientBundleIdentifier:auditToken:",  v8,  v9);
  v15 = v10;
  id v11 = v7;
  id v16 = v11;
  [v6 configureConnection:v14];
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSXPCServiceConfiguration logGroup](self->_configuration, "logGroup"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v18 = v11;
    __int16 v19 = 2048;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
  }

  [v6 activate];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteTarget]);
  -[PBPictureInPictureService setServiceClient:](v10, "setServiceClient:", v13);
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

- (void).cxx_destruct
{
}

@end