@interface ICHostedSharedListeningConnectionController
- (ICHostedSharedListeningConnectionController)initWithConnection:(id)a3 bundleID:(id)a4;
- (ICSharedListeningConnectionController)connectionController;
- (NSString)bundleID;
- (NSXPCConnection)xpcConnection;
- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4;
- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4;
- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4;
- (void)connectionControllerConnectionDidStart:(id)a3;
- (void)populateSessionIdentifier:(id)a3 identity:(id)a4;
- (void)sendMessageData:(id)a3;
- (void)setConnectionController:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICHostedSharedListeningConnectionController

- (ICHostedSharedListeningConnectionController)initWithConnection:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICHostedSharedListeningConnectionController;
  v9 = -[ICHostedSharedListeningConnectionController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_bundleID, a4);
  }

  return v10;
}

- (void)populateSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));

  if (!v8)
  {
    id v9 = sub_100002678();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[ICSharedListeningConnectionController][H] <%p> Populating with session identifier %@.",  buf,  0x16u);
    }

    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2050000000LL;
    v11 = (void *)qword_100008BE0;
    uint64_t v19 = qword_100008BE0;
    if (!qword_100008BE0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1000026E8;
      v21 = &unk_1000042D8;
      v22 = &v16;
      sub_1000026E8((uint64_t)buf);
      v11 = (void *)v17[3];
    }

    id v12 = v11;
    _Block_object_dispose(&v16, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController bundleID](self, "bundleID", v16));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedListeningConnectionWithSessionIdentifier:v6 identity:v7 bundleID:v13]);
    -[ICHostedSharedListeningConnectionController setConnectionController:](self, "setConnectionController:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
    [v15 setDelegate:self];
  }
}

- (void)start
{
  id v3 = sub_100002678();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[ICSharedListeningConnectionController][H] <%p> Will start connection controller.",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  [v5 start];
}

- (void)stop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  [v2 stop];
}

- (void)sendMessageData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2050000000LL;
  v5 = (void *)qword_100008BF0;
  uint64_t v13 = qword_100008BF0;
  if (!qword_100008BF0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000024B4;
    v9[3] = &unk_1000042D8;
    v9[4] = &v10;
    sub_1000024B4((uint64_t)v9);
    v5 = (void *)v11[3];
  }

  int v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [[v6 alloc] initWithData:v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  [v8 sendMessage:v7];
}

- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController xpcConnection](self, "xpcConnection"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:&stru_100004210]);
  [v6 receiveConnectionError:v5];
}

- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4
{
  id v5 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController xpcConnection](self, "xpcConnection"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:&stru_100004230]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);

  [v6 receiveMessageData:v7];
}

- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController xpcConnection](self, "xpcConnection"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:&stru_100004250]);
  [v6 receiveFatalError:v5];
}

- (void)connectionControllerConnectionDidStart:(id)a3
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController xpcConnection](self, "xpcConnection", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteObjectProxyWithErrorHandler:&stru_100004270]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionToken]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICHostedSharedListeningConnectionController connectionController](self, "connectionController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 inviteURL]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
  [v4 receiveStartWithSessionIdentifier:v6 sessionToken:v8 inviteURLString:v11];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (ICSharedListeningConnectionController)connectionController
{
  return self->_connectionController;
}

- (void)setConnectionController:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
}

@end