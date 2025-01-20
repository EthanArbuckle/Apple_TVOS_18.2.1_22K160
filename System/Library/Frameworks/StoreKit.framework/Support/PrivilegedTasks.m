@interface PrivilegedTasks
+ (id)copyIAPProductAtPath:(id)a3 toPath:(id)a4;
+ (id)installReceiptData:(id)a3 atBundlePath:(id)a4;
+ (id)removeIAPProductAtPath:(id)a3;
+ (id)sharedInstance;
- (id)_copyIAPProductAtPath:(id)a3 toPath:(id)a4;
- (id)_installReceiptData:(id)a3 atBundlePath:(id)a4;
- (id)_removeIAPProductAtPath:(id)a3;
- (id)_serviceConnection;
@end

@implementation PrivilegedTasks

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000771B8;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032EFC0[0] != -1) {
    dispatch_once(qword_10032EFC0, block);
  }
  return (id)qword_10032EFB8;
}

+ (id)copyIAPProductAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v9 = [v8 _copyIAPProductAtPath:v7 toPath:v6];

  return v9;
}

+ (id)installReceiptData:(id)a3 atBundlePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _installReceiptData:v7 atBundlePath:v6]);

  return v9;
}

+ (id)removeIAPProductAtPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _removeIAPProductAtPath:v4]);

  return v6;
}

- (id)_serviceConnection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.AppStoreDaemon.StorePrivilegedTaskService");
    v5 = self->_connection;
    self->_connection = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StorePrivilegedTaskInterface));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }

  return connection;
}

- (id)_copyIAPProductAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1000774F8;
  v18 = sub_100077508;
  id v19 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PrivilegedTasks _serviceConnection](self, "_serviceConnection"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100077510;
  v13[3] = &unk_1002EA020;
  v13[4] = &v14;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 synchronousRemoteObjectProxyWithErrorHandler:v13]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100077520;
  v12[3] = &unk_1002EA020;
  v12[4] = &v14;
  [v9 copyIAPProductAtPath:v6 toPath:v7 withReplyHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (id)_installReceiptData:(id)a3 atBundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1000774F8;
  v18 = sub_100077508;
  id v19 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PrivilegedTasks _serviceConnection](self, "_serviceConnection"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100077684;
  v13[3] = &unk_1002EA020;
  v13[4] = &v14;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 synchronousRemoteObjectProxyWithErrorHandler:v13]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100077694;
  v12[3] = &unk_1002EA020;
  v12[4] = &v14;
  [v9 installReceiptData:v6 atBundlePath:v7 withReplyHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (id)_removeIAPProductAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_1000774F8;
  v15 = sub_100077508;
  id v16 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PrivilegedTasks _serviceConnection](self, "_serviceConnection"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000777DC;
  v10[3] = &unk_1002EA020;
  v10[4] = &v11;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v10]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000777EC;
  v9[3] = &unk_1002EA020;
  v9[4] = &v11;
  [v6 removeIAPProductAtPath:v4 withReplyHandler:v9];
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void).cxx_destruct
{
}

@end