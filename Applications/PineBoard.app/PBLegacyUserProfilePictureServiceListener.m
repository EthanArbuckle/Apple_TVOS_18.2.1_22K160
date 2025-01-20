@interface PBLegacyUserProfilePictureServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBLegacyUserProfilePictureServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287FC0(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBLegacyUserProfilePictureServiceListener;
    -[PBLegacyUserProfilePictureServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100164D20;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_1000846F8();
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

  id v4 = sub_1000846F8();
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
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  if ([v6 hasEntitlement:@"com.apple.appletv.pbs.user-profiles"])
  {
    v7 = objc_alloc(&OBJC_CLASS___PBUserProfilePictureService);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 profilePictureStore]);
    v10 = -[PBUserProfilePictureService initWithProfilePictureStore:](v7, "initWithProfilePictureStore:", v9);

    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    v23 = sub_100165090;
    v24 = &unk_1003D1070;
    v11 = v10;
    v25 = v11;
    id v12 = v6;
    id v26 = v12;
    [v5 configureConnection:&v21];
    id v13 = sub_1000846F8();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = v12;
      __int16 v29 = 2048;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
    }

    objc_msgSend(v5, "activate", v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTarget]);
    -[PBUserProfilePictureService setObserver:](v11, "setObserver:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfilePictureService observer](v11, "observer"));
    if (!v16)
    {
      id v17 = sub_1000846F8();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v28 = v12;
        __int16 v29 = 2048;
        v30 = v11;
        __int16 v31 = 2112;
        id v32 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Client didn't set a remote target to receive updates, invalidating the connection. {client=%{public}@, service _ptr=%p, connection=%@}",  buf,  0x20u);
      }

      [v5 invalidate];
    }
  }

  else
  {
    id v19 = sub_1000846F8();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v6, v20);
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