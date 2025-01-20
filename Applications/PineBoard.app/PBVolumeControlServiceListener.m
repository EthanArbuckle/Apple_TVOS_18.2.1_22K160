@interface PBVolumeControlServiceListener
- (BSServiceConnectionListener)listener;
- (PBVolumeControlServiceListener)init;
- (os_unfair_lock_s)lock;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation PBVolumeControlServiceListener

- (PBVolumeControlServiceListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBVolumeControlServiceListener;
  result = -[PBVolumeControlServiceListener init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100279CF0(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBVolumeControlServiceListener;
    -[PBVolumeControlServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009E674;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    objc_super v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_1000848D8();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Listener activated.", v7, 2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  id v4 = sub_1000848D8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener invalidated.", v6, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  if ((IsVolumeControlServiceEnabled() & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
    if ([v6 hasEntitlement:@"com.apple.appletv.pbs.volume-control"])
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      v15 = sub_10009E90C;
      v16 = &unk_1003D1070;
      v7 = objc_alloc_init(&OBJC_CLASS___PBVolumeControlService);
      v17 = v7;
      id v8 = v6;
      id v18 = v8;
      [v5 configureConnection:&v13];
      id v9 = sub_1000848D8();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = v8;
        __int16 v21 = 2048;
        v22 = v7;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
      }

      objc_msgSend(v5, "activate", v13, v14, v15, v16);
    }

    else
    {
      id v11 = sub_1000848D8();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100276E6C((uint64_t)v6, v12);
      }

      [v5 invalidate];
    }
  }

  else
  {
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end