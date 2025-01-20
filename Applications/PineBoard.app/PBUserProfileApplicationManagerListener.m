@interface PBUserProfileApplicationManagerListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBUserProfileApplicationManagerListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002869D8(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBUserProfileApplicationManagerListener;
    -[PBUserProfileApplicationManagerListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100157238;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_100084680();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "User profile application listener activated.",  v7,  2u);
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
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User profile application listener invalidated.",  v6,  2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  if ([v6 hasEntitlement:@"com.apple.appletv.pbs.user-profile-application"])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100157480;
    v12[3] = &unk_1003D2DF0;
    id v7 = v6;
    id v13 = v7;
    [v5 configureConnection:v12];
    id v8 = sub_100084680();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Activating user profile application connection. {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    [v5 activate];
  }

  else
  {
    id v10 = sub_100084680();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100286AD4((uint64_t)v6, v11);
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