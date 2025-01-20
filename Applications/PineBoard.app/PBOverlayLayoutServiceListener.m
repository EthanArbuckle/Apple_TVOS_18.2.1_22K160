@interface PBOverlayLayoutServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBOverlayLayoutServiceListener

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000718B8;
    v5[3] = &unk_1003D0EC8;
    v5[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v5));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  if ([v6 hasEntitlement:@"com.apple.appletv.pbs.overlay-layout-service-access"])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100071AF8;
    v13[3] = &unk_1003D2DF0;
    v7 =  -[PBOverlayLayoutService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutService),  "initWithRemoteConnection:",  v5);
    v14 = v7;
    [v5 configureConnection:v13];
    id v8 = sub_10008330C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v16 = v6;
      __int16 v17 = 2048;
      v18 = v7;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
    }

    [v5 activate];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTarget]);
    -[PBOverlayLayoutService setServiceClient:](v7, "setServiceClient:", v10);
  }

  else
  {
    id v11 = sub_10008330C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v6, v12);
    }

    [v5 invalidate];
  }
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end