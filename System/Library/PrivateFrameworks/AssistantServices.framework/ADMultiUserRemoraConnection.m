@interface ADMultiUserRemoraConnection
- (ADMultiUserRemoraConnection)init;
- (ADMultiUserRemoraConnection)initWithInstanceContext:(id)a3;
- (id)_connection;
- (id)_multiUserRemoraServiceWithErrorHandler:(id)a3;
- (void)_clearConnection;
- (void)addCommunalDeviceUser:(id)a3 withAttribute:(id)a4 completion:(id)a5;
- (void)addDeviceOwner:(id)a3 withAttribute:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)removeCommunalDeviceUserBySharedUserID:(id)a3 completion:(id)a4;
- (void)setLocalMeCard:(id)a3 completion:(id)a4;
@end

@implementation ADMultiUserRemoraConnection

- (ADMultiUserRemoraConnection)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADMultiUserRemoraConnection;
  v5 = -[ADMultiUserRemoraConnection init](&v13, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistant.remora.multiuser.connection", v7);

    targetQueue = v5->_targetQueue;
    v5->_targetQueue = (OS_dispatch_queue *)v8;

    if (v4) {
      v10 = (AFInstanceContext *)v4;
    }
    else {
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;
  }

  return v5;
}

- (ADMultiUserRemoraConnection)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
  id v4 = -[ADMultiUserRemoraConnection initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_attr_t v6 = "-[ADMultiUserRemoraConnection dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  -[ADMultiUserRemoraConnection _clearConnection](self, "_clearConnection");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADMultiUserRemoraConnection;
  -[ADMultiUserRemoraConnection dealloc](&v4, "dealloc");
}

- (void)addDeviceOwner:(id)a3 withAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADMultiUserRemoraConnection addDeviceOwner:withAttribute:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s userDictionary:%@", buf, 0x16u);
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100154B50;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(targetQueue, v16);
}

- (void)addCommunalDeviceUser:(id)a3 withAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADMultiUserRemoraConnection addCommunalDeviceUser:withAttribute:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s userDictionary:%@", buf, 0x16u);
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100154AB0;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(targetQueue, v16);
}

- (void)removeCommunalDeviceUserBySharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ADMultiUserRemoraConnection removeCommunalDeviceUserBySharedUserID:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154A14;
  block[3] = &unk_1004FD9E0;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

- (void)setLocalMeCard:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ADMultiUserRemoraConnection setLocalMeCard:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154978;
  block[3] = &unk_1004FD9E0;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

- (void)_clearConnection
{
  v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[ADMultiUserRemoraConnection _clearConnection]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0LL;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    objc_super v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCConnectionWithMachServiceName:options:]( self->_instanceContext,  "createXPCConnectionWithMachServiceName:options:",  kAssistantMultiUserUpdateServiceName,  0LL));
    int v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_targetQueue);
    objc_initWeak(&location, self);
    id v6 = self->_connection;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100154920;
    v19[3] = &unk_1004FAF58;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v19);
    __int16 v7 = self->_connection;
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_10015494C;
    id v17 = &unk_1004FAF58;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", &v14);
    id v8 = self->_connection;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ADMultiUserRemoraService,  v14,  v15,  v16,  v17));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100300B3C;
    block[3] = &unk_1004FD940;
    id v10 = v9;
    id v11 = v10;
    id v23 = v10;
    if (qword_1005785D0 == -1)
    {
      v12 = v10;
    }

    else
    {
      dispatch_once(&qword_1005785D0, block);
      v12 = v23;
    }

    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (id)_multiUserRemoraServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (!self->_connection)
  {
    int v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[ADMultiUserRemoraConnection _multiUserRemoraServiceWithErrorHandler:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s No connection.", (uint8_t *)&v9, 0xCu);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserRemoraConnection _connection](self, "_connection"));
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:v4]);

  return v7;
}

- (void).cxx_destruct
{
}

@end