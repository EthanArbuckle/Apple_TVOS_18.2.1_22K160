@interface CDServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDServiceListener)init;
- (CDServiceListenerDelegate)delegate;
- (OS_dispatch_queue)dispatchQueue;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidated;
- (void)_languageNotificationEnsureStarted;
- (void)_languageNotificationEnsureStopped;
- (void)activate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDServiceListener

- (CDServiceListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDServiceListener;
  v2 = -[CDServiceListener init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
    v3->_languageNotificationToken = -1;
  }

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  uint64_t v3 = cps_service_listener_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001F534(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011A88;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  uint64_t v3 = cps_service_listener_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001F568(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011B24;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activated
{
  uint64_t v5 = cps_service_listener_log(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "activated", v9, 2u);
  }

  -[CDServiceListener _languageNotificationEnsureStarted](self, "_languageNotificationEnsureStarted");
  uint64_t v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.companiond.xpc");
  listener = self->_listener;
  self->_listener = v7;

  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_dispatchQueue);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    uint64_t v5 = cps_service_listener_log(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invalidated", v8, 2u);
    }

    -[CDServiceListener _languageNotificationEnsureStopped](self, "_languageNotificationEnsureStopped");
    -[NSXPCListener invalidate](self->_listener, "invalidate");
    listener = self->_listener;
    self->_listener = 0LL;

    objc_storeWeak((id *)&self->_delegate, 0LL);
    self->_invalidateDone = 1;
  }

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceListener:self connectionInvalidated:v5];
}

- (void)_languageNotificationEnsureStarted
{
  if (self->_languageNotificationToken == -1) {
    notify_register_dispatch( "AppleLanguagePreferencesChangedNotification",  &self->_languageNotificationToken,  (dispatch_queue_t)self->_dispatchQueue,  &stru_100030D58);
  }
}

- (void)_languageNotificationEnsureStopped
{
  int languageNotificationToken = self->_languageNotificationToken;
  if (languageNotificationToken != -1)
  {
    notify_cancel(languageNotificationToken);
    self->_int languageNotificationToken = -1;
  }

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011E6C;
  v8[3] = &unk_100030938;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v9 = v5;
  uint64_t v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CDServiceListener descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceListener succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v7 = -[CDServiceConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___CDServiceConnection),  "initWithConnection:",  v6);
  [v6 _setQueue:self->_dispatchQueue];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPSAuthenticationServiceInterface daemonInterface]( &OBJC_CLASS___CPSAuthenticationServiceInterface,  "daemonInterface"));
  [v6 setExportedInterface:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPSAuthenticationServiceInterface clientInterface]( &OBJC_CLASS___CPSAuthenticationServiceInterface,  "clientInterface"));
  [v6 setRemoteObjectInterface:v9];

  [v6 setExportedObject:v7];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100012054;
  v16 = &unk_100030938;
  v17 = self;
  v18 = v7;
  uint64_t v10 = v7;
  [v6 setInvalidationHandler:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serviceListener:willAcceptConnection:", self, v10, v13, v14, v15, v16, v17);

  [v6 resume];
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (CDServiceListenerDelegate)delegate
{
  return (CDServiceListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end