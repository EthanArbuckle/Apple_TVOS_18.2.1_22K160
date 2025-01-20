@interface PBLoretoUserProfilePicturesServiceListener
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBLoretoUserProfilePicturesServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100270FF8(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfilePicturesServiceListener;
    -[PBLoretoUserProfilePicturesServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](&OBJC_CLASS___BSServiceQuality, "userInitiated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](&OBJC_CLASS___BSDispatchQueueAttributes, "serial"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "serviceClass:relativePriority:",  objc_msgSend(v3, "serviceClass"),  objc_msgSend(v3, "relativePriority")));

    v6 = (OS_dispatch_queue *)BSDispatchQueueCreate(@"com.apple.PineBoard.userProfilePictures.service", v5);
    queue = self->_queue;
    self->_queue = v6;

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100022C44;
    v13[3] = &unk_1003D0EC8;
    v13[4] = self;
    v8 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v13));
    listener = self->_listener;
    self->_listener = v8;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v10 = sub_100022CB0();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Listener activated.", v12, 2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  id v4 = sub_100022CB0();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener invalidated.", v6, 2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  v8 = -[PBLoretoUserProfilePicturesClientRecord initWithProcessHandle:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfilePicturesClientRecord),  "initWithProcessHandle:",  v7);
  if (-[PBLoretoUserProfilePicturesClientRecord isEntitled](v8, "isEntitled"))
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_100022F64;
    v20 = &unk_1003D0F18;
    v21 = -[PBLoretoUserProfilePicturesClient initWithRecord:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfilePicturesClient),  "initWithRecord:",  v8);
    v22 = self;
    id v9 = v7;
    id v23 = v9;
    id v10 = v6;
    id v24 = v10;
    v11 = v21;
    [v10 configureConnection:&v17];
    id v12 = sub_100022CB0();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Activating connection {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    objc_msgSend(v10, "activate", v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteTarget]);
    -[PBLoretoUserProfilePicturesClient setDelegate:](v11, "setDelegate:", v14);
  }

  else
  {
    id v15 = sub_100022CB0();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002710F4((uint64_t)v7, v16);
    }

    [v6 invalidate];
  }
}

- (void).cxx_destruct
{
}

@end