@interface PBHomeUIServiceListener
- (BSServiceConnectionListener)listener;
- (FBServiceClientAuthenticator)clientAuthenticator;
- (PBHomeUIServiceListener)init;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBHomeUIServiceListener

- (PBHomeUIServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBHomeUIServiceListener;
  v2 = -[PBHomeUIServiceListener init](&v6, "init");
  if (v2)
  {
    v3 = -[FBServiceClientAuthenticator initWithEntitlement:]( objc_alloc(&OBJC_CLASS___FBServiceClientAuthenticator),  "initWithEntitlement:",  @"com.apple.appletv.pbs.homeui-service.read-only");
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = v3;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276598(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBHomeUIServiceListener;
    -[PBHomeUIServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006C008;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_10008312C();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Listener activated", v7, 2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  id v4 = sub_10008312C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener invalidated", v6, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  if (_os_feature_enabled_impl("TVHomeUI", "HomeKitCameraPIP"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
    clientAuthenticator = self->_clientAuthenticator;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 auditToken]);
    LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:]( clientAuthenticator,  "authenticateAuditToken:",  v9);

    if ((_DWORD)clientAuthenticator)
    {
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472LL;
      v21 = sub_10006C314;
      v22 = &unk_1003D1070;
      v10 = objc_alloc_init(&OBJC_CLASS____PBHomeUIServiceClientConduit);
      v23 = v10;
      id v11 = v7;
      id v24 = v11;
      [v6 configureConnection:&v19];
      id v12 = sub_10008312C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v26 = v11;
        __int16 v27 = 2048;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Activating connection {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
      }

      objc_msgSend(v6, "activate", v19, v20, v21, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteTarget]);
      -[_PBHomeUIServiceClientConduit setDelegate:](v10, "setDelegate:", v14);
    }

    else
    {
      id v17 = sub_10008312C();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100276694((uint64_t)v7, v18);
      }

      [v6 invalidate];
    }
  }

  else
  {
    id v15 = sub_10008312C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100276708(v16);
    }

    [v6 invalidate];
  }
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (FBServiceClientAuthenticator)clientAuthenticator
{
  return self->_clientAuthenticator;
}

- (void).cxx_destruct
{
}

@end