@interface PBScheduledSleepServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBScheduledSleepServiceListener

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10009A5D8;
    v5[3] = &unk_1003D0EC8;
    v5[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v5));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
  }

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  if ([v6 hasEntitlement:@"com.apple.appletv.pbs.scheduled-sleep-service-access"])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10009A7C8;
    v12[3] = &unk_1003D2DF0;
    v7 =  -[PBScheduledSleepService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBScheduledSleepService),  "initWithRemoteConnection:",  v5);
    v13 = v7;
    [v5 configureConnection:v12];
    id v8 = sub_100083F00();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v15 = v6;
      __int16 v16 = 2048;
      v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
    }

    [v5 activate];
  }

  else
  {
    id v10 = sub_100083F00();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v6, v11);
    }

    [v5 invalidate];
  }
}

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;
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