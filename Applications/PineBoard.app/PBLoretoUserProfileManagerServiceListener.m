@interface PBLoretoUserProfileManagerServiceListener
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBLoretoUserProfileManagerServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F66C(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerServiceListener;
    -[PBLoretoUserProfileManagerServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000ED60C;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_1000ED678();
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

  id v4 = sub_1000ED678();
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
  v7 = -[PBLoretoUserProfileManagerClientRecord initWithProcessHandle:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientRecord),  "initWithProcessHandle:",  v6);
  if (-[PBLoretoUserProfileManagerClientRecord isEntitled](v7, "isEntitled"))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000ED928;
    v16[3] = &unk_1003D69F0;
    v17 = -[PBLoretoUserProfileManagerClient initWithRecord:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClient),  "initWithRecord:",  v7);
    id v8 = v6;
    id v18 = v8;
    id v9 = v5;
    id v19 = v9;
    v10 = v17;
    [v9 configureConnection:v16];
    id v11 = sub_1000ED678();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Activating connection {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    [v9 activate];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteTarget]);
    -[PBLoretoUserProfileManagerClient setDelegate:](v10, "setDelegate:", v13);
  }

  else
  {
    id v14 = sub_1000ED678();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002710F4((uint64_t)v6, v15);
    }

    [v5 invalidate];
  }
}

- (void).cxx_destruct
{
}

@end