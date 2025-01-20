@interface PBRestrictionServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBRestrictionServiceListener

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100211F44;
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
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10021211C;
  v10[3] = &unk_1003D2DF0;
  v7 =  -[PBRestrictionService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBRestrictionService),  "initWithRemoteConnection:",  v5);
  v11 = v7;
  [v5 configureConnection:v10];
  id v8 = sub_100083654();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v13 = v6;
    __int16 v14 = 2048;
    v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Activating connection. {client=%{public}@, service_ptr=%p, connection=%@}",  buf,  0x20u);
  }

  [v5 activate];
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