@interface SHAPSConnection
- (APSConnection)connection;
- (OS_dispatch_queue)connectionQueue;
- (SHAPSConnection)init;
- (SHMediaLibraryController)libraryController;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)fetchAPSEnvironmentWithCompletionHandler:(id)a3;
- (void)finishLibrarySync;
- (void)registerForPushNotifications;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)startListeningForPushNotifications;
- (void)stopListeningForPushNotifications;
@end

@implementation SHAPSConnection

- (SHAPSConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SHAPSConnection;
  v2 = -[SHAPSConnection init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.aps.shazamd.queue", 0LL);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)registerForPushNotifications
{
  if (self->_connection)
  {
    uint64_t v2 = sh_log_object(self);
    dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Already listening for APS push",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    objc_initWeak(buf, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAPSConnection libraryInfoFetcher](self, "libraryInfoFetcher"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100028370;
    v6[3] = &unk_10006D7B8;
    objc_copyWeak(&v7, buf);
    [v5 fetchLibraryInfoWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }

- (void)startListeningForPushNotifications
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100028488;
  v3[3] = &unk_10006D7E0;
  objc_copyWeak(&v4, &location);
  -[SHAPSConnection fetchAPSEnvironmentWithCompletionHandler:](self, "fetchAPSEnvironmentWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)stopListeningForPushNotifications
{
  if (self->_connection)
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAPSConnection connection](self, "connection"));
    [v3 _setEnabledTopics:&__NSArray0__struct];

    uint64_t v5 = sh_log_object(v4);
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "APS Push stop listening", v8, 2u);
    }

    connection = self->_connection;
    self->_connection = 0LL;
  }

- (void)fetchAPSEnvironmentWithCompletionHandler:(id)a3
{
  dispatch_queue_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = xpc_copy_entitlement_for_self("aps-environment");
  uint64_t v5 = (void *)v4;
  if (v4) {
    objc_super v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  }
  else {
    objc_super v6 = 0LL;
  }
  id v7 = [v6 compare:CKPushEnvironmentServerPreferred options:1];
  if (!v6 || v7)
  {
    v3[2](v3, 0LL);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHCloudContainer sharedContainer](&OBJC_CLASS___SHCloudContainer, "sharedContainer"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100028820;
    v9[3] = &unk_10006D808;
    v10 = v3;
    [v8 serverPreferredPushEnvironmentWithCompletionHandler:v9];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = sh_log_object(v6, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Received public token '%@' on connection %@",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sh_log_object(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    int v17 = 138412290;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "APS push received for topic: '%@'",  (uint8_t *)&v17,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v9));

  id v11 = [v10 notificationType];
  if (v11 == (id)2)
  {
    __int16 v12 = objc_alloc(&OBJC_CLASS___SHMediaLibraryContext);
    id v13 = objc_opt_new(&OBJC_CLASS___SHMediaLibrarySnapshot);
    v14 = -[SHMediaLibraryContext initWithSnapshot:startCondition:]( v12,  "initWithSnapshot:startCondition:",  v13,  SHMediaLibrarySyncStartConditionRemotePush);

    -[SHMediaLibraryContext setDelegate:](v14, "setDelegate:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHAPSConnection libraryController](self, "libraryController"));
    [v15 synchronizeWithContext:v14];
  }

  else
  {
    uint64_t v16 = sh_log_object(v11);
    v14 = (SHMediaLibraryContext *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEBUG,  "Ignoring APS push message, not a CloudKit update",  (uint8_t *)&v17,  2u);
    }
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter",  a3));
  [v4 postNotificationName:SHMediaLibraryRemoteChangeNotification object:0 userInfo:0 deliverImmediately:1];

  -[SHAPSConnection finishLibrarySync](self, "finishLibrarySync");
}

- (void)finishLibrarySync
{
  libraryController = self->_libraryController;
  self->_libraryController = 0LL;
}

- (SHMediaLibraryController)libraryController
{
  libraryController = self->_libraryController;
  if (!libraryController)
  {
    uint64_t v4 = -[SHMediaLibraryController initWithBundleIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryController),  "initWithBundleIdentifier:clientType:",  @"com.apple.aps.shazamd",  1LL);
    id v5 = self->_libraryController;
    self->_libraryController = v4;

    libraryController = self->_libraryController;
  }

  return libraryController;
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  libraryInfoFetcher = self->_libraryInfoFetcher;
  if (!libraryInfoFetcher)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryInfoFetcher);
    id v5 = self->_libraryInfoFetcher;
    self->_libraryInfoFetcher = v4;

    libraryInfoFetcher = self->_libraryInfoFetcher;
  }

  return libraryInfoFetcher;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end