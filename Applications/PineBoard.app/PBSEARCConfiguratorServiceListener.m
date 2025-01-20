@interface PBSEARCConfiguratorServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBSEARCConfiguratorServiceListener

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1001C5000;
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
  v7 = objc_alloc_init(&OBJC_CLASS___PBEARCConfiguratorService);
  if ([v6 hasEntitlement:@"com.apple.appletv.pbs.display-manager-service-access"])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001C5248;
    v14[3] = &unk_1003D2DF0;
    v8 = v7;
    v15 = v8;
    [v5 configureConnection:v14];
    id v9 = sub_100082B14();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v6;
      __int16 v18 = 2048;
      v19 = v8;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
    }

    [v5 activate];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTarget]);
    -[PBEARCConfiguratorService setDelegate:](v8, "setDelegate:", v11);
  }

  else
  {
    id v12 = sub_100082B14();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v6, v13);
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