@interface CSDCallProviderManagerXPCServer
- (CSDCallProviderManager)providerManager;
- (CSDCallProviderManagerXPCServer)initWithProviderManager:(id)a3;
- (CSDClientManager)clientManager;
- (OS_dispatch_queue)queue;
- (id)localProvidersByIdentifierForClient:(id)a3;
- (id)pairedHostDeviceProvidersByIdentifierForClient:(id)a3;
- (id)providersByIdentifierForClient:(id)a3;
- (void)defaultAppProvider:(id)a3;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)invalidate;
- (void)launchAppForDialRequest:(id)a3 reply:(id)a4;
- (void)providersByIdentifier:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)registerClient:(id)a3;
- (void)sortedProviders:(id)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSDCallProviderManagerXPCServer

- (CSDCallProviderManagerXPCServer)initWithProviderManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSDCallProviderManagerXPCServer;
  v6 = -[CSDCallProviderManagerXPCServer init](&v19, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callprovidermanagerxpcserver", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_providerManager, a3);
    -[CSDCallProviderManager addDelegate:queue:](v6->_providerManager, "addDelegate:queue:", v6, v6->_queue);
    v9 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v6->_queue);
    clientManager = v6->_clientManager;
    v6->_clientManager = v9;

    v11 = (dispatch_queue_s *)v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000664F4;
    block[3] = &unk_1003D7730;
    v12 = v6;
    v18 = v12;
    dispatch_sync(v11, block);
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](v12, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000667BC;
    v15[3] = &unk_1003D7730;
    v16 = v12;
    dispatch_async(v13, v15);
  }

  return v6;
}

- (void)invalidate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066860;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)providersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  id v7 = [v4 isRemote];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 providersByIdentifierForRemoteClients:v7]);
  return v8;
}

- (id)localProvidersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  id v7 = [v4 isRemote];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localProvidersByIdentifierForRemoteClients:v7]);
  return v8;
}

- (id)pairedHostDeviceProvidersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  id v7 = [v4 isRemote];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedHostDeviceProvidersByIdentifierForRemoteClients:v7]);
  return v8;
}

- (void)providersByIdentifier:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer clientManager](self, "clientManager"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 currentClient]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerXPCServer providersByIdentifierForClient:]( self,  "providersByIdentifierForClient:",  v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerXPCServer localProvidersByIdentifierForClient:]( self,  "localProvidersByIdentifierForClient:",  v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerXPCServer pairedHostDeviceProvidersByIdentifierForClient:]( self,  "pairedHostDeviceProvidersByIdentifierForClient:",  v10));
  v4[2](v4, v7, v8, v9);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "callProviderIdentifier: %@",  (uint8_t *)&v9,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  [v8 donateUserIntentForProviderWithIdentifier:v4];
}

- (void)launchAppForDialRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  [v11 launchAppForDialRequest:v6 completion:v7];
}

- (void)sortedProviders:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching sortedProviders", v12, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer clientManager](self, "clientManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentClient]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedProvidersForRemoteClients:v10 != 0]);
  v4[2](v4, v11);
}

- (void)defaultAppProvider:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching default app provider", v12, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer providerManager](self, "providerManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer clientManager](self, "clientManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentClient]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultAppProviderForRemoteClients:v10 != 0]);
  v4[2](v4, v11);
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100066F60;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100067038;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerXPCServer clientManager](self, "clientManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006711C;
  v8[3] = &unk_1003D8518;
  v8[4] = self;
  id v6 = NSStringFromSelector("updateProvidersByIdentifier:localProvidersByIdentifier:pairedHostDeviceProvidersByIdentifier:");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 performBlockOnClients:v8 coalescedByIdentifier:v7];
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallProviderManager)providerManager
{
  return self->_providerManager;
}

- (void).cxx_destruct
{
}

@end