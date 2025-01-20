@interface PDSharingChannelHandle_Server
- (PDSharingChannelHandle_Server)initWithConnection:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)configureHandleWithDescriptor:(id)a3 completion:(id)a4;
- (void)didReceiveMessages:(id)a3;
- (void)didReceiveUpdatedTransportIdentifier:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)invalidateFromRemoteWithReply:(id)a3;
- (void)invalidateWithRemoteWithCompletion:(id)a3;
- (void)transportIdentifierWithCompletion:(id)a3;
@end

@implementation PDSharingChannelHandle_Server

- (PDSharingChannelHandle_Server)initWithConnection:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  v11 = -[PDSharingChannelHandle _initWithQueue:delegate:dataSource:]( self,  "_initWithQueue:delegate:dataSource:",  a4,  a5,  a6);
  v12 = (PDSharingChannelHandle_Server *)v11;
  if (v11)
  {
    id v13 = objc_storeWeak(v11 + 4, v10);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100167040;
    v19[3] = &unk_100639300;
    v14 = v12;
    v20 = v14;
    [v10 setInvalidationHandler:v19];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_connection);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100167050;
    v17[3] = &unk_100639300;
    v18 = v14;
    [WeakRetained setInterruptionHandler:v17];
  }

  return v12;
}

- (void)invalidate
{
}

- (void)invalidateWithRemoteWithCompletion:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10016713C;
  v9[3] = &unk_1006424D0;
  id v4 = a3;
  id v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelHandle_Server _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100167150;
  v7[3] = &unk_10063A830;
  id v8 = v4;
  id v6 = v4;
  [v5 invalidateFromRemoteWithReply:v7];
}

- (void)configureHandleWithDescriptor:(id)a3 completion:(id)a4
{
  id v10 = (void (**)(id, void))a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelHandle delegate](self, "delegate"));
  LOBYTE(self) = [v7 configureHandle:self forDescriptor:v6];

  if ((self & 1) != 0)
  {
    v10[2](v10, 0LL);
  }

  else
  {
    uint64_t v8 = PDBasicError(@"unable to configure handle with descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(id, void *))v10)[2](v10, v9);
  }
}

- (void)transportIdentifierWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDSharingChannelHandle transportIdentifier](self, "transportIdentifier"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)invalidateFromRemoteWithReply:(id)a3
{
}

- (void)didReceiveMessages:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[PDSharingChannelHandle_Server _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  0LL));
  [v5 didReceiveMessages:v4 reply:&stru_100646FB0];
}

- (void)didReceiveUpdatedTransportIdentifier:(id)a3 reply:(id)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001673C4;
  v12[3] = &unk_1006424D0;
  id v6 = a4;
  id v13 = v6;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelHandle_Server _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  v12));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001673D8;
  v10[3] = &unk_10063A830;
  id v11 = v6;
  id v9 = v6;
  [v8 didReceiveUpdatedTransportIdentifier:v7 reply:v10];
}

- (id)_remoteObjectProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);

  return v3;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v4]);

  return v6;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained synchronousRemoteObjectProxyWithErrorHandler:v4]);

  return v6;
}

- (void).cxx_destruct
{
}

@end