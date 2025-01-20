@interface PBLoretoSuggestedUserProfileManagerServiceListener
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBLoretoSuggestedUserProfileManagerServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281AC8(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerServiceListener;
    -[PBLoretoSuggestedUserProfileManagerServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](&OBJC_CLASS___BSServiceQuality, "userInitiated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](&OBJC_CLASS___BSDispatchQueueAttributes, "serial"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "serviceClass:relativePriority:",  objc_msgSend(v3, "serviceClass"),  objc_msgSend(v3, "relativePriority")));

    v6 = (OS_dispatch_queue *)BSDispatchQueueCreate(@"com.apple.PineBoard.suggestedUserProfiles.service", v5);
    queue = self->_queue;
    self->_queue = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___PBLoretoSuggestedUserProfileManager);
    manager = self->_manager;
    self->_manager = v8;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10010D994;
    v15[3] = &unk_1003D0EC8;
    v15[4] = self;
    v10 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v15));
    listener = self->_listener;
    self->_listener = v10;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v12 = sub_10010D9F8();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Listener activated.", v14, 2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  id v4 = sub_10010D9F8();
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
  v8 = -[PBLoretoSuggestedUserProfileManagerClientRecord initWithProcessHandle:]( objc_alloc(&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerClientRecord),  "initWithProcessHandle:",  v7);
  if (-[PBLoretoSuggestedUserProfileManagerClientRecord isEntitled](v8, "isEntitled"))
  {
    v9 = -[PBLoretoSuggestedUserProfileManagerClient initWithRecord:suggestedUserProfileManager:]( objc_alloc(&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerClient),  "initWithRecord:suggestedUserProfileManager:",  v8,  self->_manager);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_10010DCB0;
    v21 = &unk_1003D0F18;
    v22 = v9;
    v23 = self;
    id v10 = v7;
    id v24 = v10;
    id v11 = v6;
    id v25 = v11;
    id v12 = v9;
    [v11 configureConnection:&v18];
    id v13 = sub_10010D9F8();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Activating connection {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    objc_msgSend(v11, "activate", v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteTarget]);
    -[PBLoretoSuggestedUserProfileManagerClient setDelegate:](v12, "setDelegate:", v15);
  }

  else
  {
    id v16 = sub_10010D9F8();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002710F4((uint64_t)v7, v17);
    }

    [v6 invalidate];
  }
}

- (void).cxx_destruct
{
}

@end