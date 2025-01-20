@interface PBLegacyUserProfileManagerServiceListener
- (BSServiceConnectionListener)listener;
- (NSMutableArray)connectedClients;
- (PBLegacyUserProfileManagerServiceListener)init;
- (os_unfair_lock_s)lock;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setConnectedClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation PBLegacyUserProfileManagerServiceListener

- (PBLegacyUserProfileManagerServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBLegacyUserProfileManagerServiceListener;
  v2 = -[PBLegacyUserProfileManagerServiceListener init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    connectedClients = v2->_connectedClients;
    v2->_connectedClients = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100286758(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBLegacyUserProfileManagerServiceListener;
    -[PBLegacyUserProfileManagerServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001542D4;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_100084680();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
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

  id v4 = sub_100084680();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener invalidated.", v6, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v24 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteProcess]);
  unsigned int v10 = [v9 hasEntitlement:@"com.apple.appletv.pbs.user-profiles"];
  if ((v10 | [v9 hasEntitlement:@"com.apple.appletv.pbs.user-profiles.account-notification"]))
  {
    v11 = objc_alloc_init(&OBJC_CLASS____PBUserProfileManagerConnectedClientInfo);
    -[_PBUserProfileManagerConnectedClientInfo setPid:](v11, "setPid:", [v9 pid]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    -[_PBUserProfileManagerConnectedClientInfo setBundleIdentifier:](v11, "setBundleIdentifier:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10015472C;
    v29[3] = &unk_1003D95D0;
    id v14 = v13;
    id v30 = v14;
    objc_copyWeak(&v33, &location);
    id v15 = v9;
    id v31 = v15;
    v16 = v11;
    v32 = v16;
    [v8 configureConnection:v29];
    id v17 = sub_100084680();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    [v8 activate];
    if (v10)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10015499C;
      v27[3] = &unk_1003D95F8;
      id v19 = (id)objc_claimAutoreleasedReturnValue([v8 remoteTarget]);
      id v28 = v19;
      -[_PBUserProfileManagerConnectedClientInfo setDidUpdateHandler:](v16, "setDidUpdateHandler:", v27);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001549B4;
      v25[3] = &unk_1003D9620;
      id v20 = v19;
      id v26 = v20;
      -[_PBUserProfileManagerConnectedClientInfo setDidUpdateGroupSessionHandler:]( v16,  "setDidUpdateGroupSessionHandler:",  v25);
      [v14 addObserver:v16];
    }

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_connectedClients, "addObject:", v16);
    os_unfair_lock_unlock(&self->_lock);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  else
  {
    id v21 = sub_100084680();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100276E6C((uint64_t)v9, v22);
    }

    [v8 invalidate];
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

- (NSMutableArray)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end