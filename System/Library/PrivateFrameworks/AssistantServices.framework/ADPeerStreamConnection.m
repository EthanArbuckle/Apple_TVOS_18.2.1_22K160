@interface ADPeerStreamConnection
- (ADPeerStreamConnection)initWithServiceIdentifier:(id)a3 delegate:(id)a4 listener:(BOOL)a5;
- (BOOL)hasNearbyPeer;
- (BOOL)peerSupportsExtendedHeader;
- (void)close;
- (void)getAWDMetrics:(id)a3 completion:(id)a4;
- (void)getLocalMetrics:(id)a3;
- (void)getRemoteMetrics:(id)a3;
- (void)getSocket:(id)a3;
@end

@implementation ADPeerStreamConnection

- (ADPeerStreamConnection)initWithServiceIdentifier:(id)a3 delegate:(id)a4 listener:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADPeerStreamConnection;
  v10 = -[ADPeerStreamConnection init](&v17, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:listener:]( &OBJC_CLASS___ADSharedPeerStreamConnection,  "sharedPeerStreamConnectionWithServiceIdentifier:listener:",  v8,  v5));
    sharedConnection = v10->_sharedConnection;
    v10->_sharedConnection = (ADSharedPeerStreamConnection *)v11;

    id v13 = objc_storeWeak((id *)&v10->_delegate, v9);
    if (v9)
    {
      v14 = v10->_sharedConnection;
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      -[ADSharedPeerStreamConnection addDelegate:](v14, "addDelegate:", WeakRetained);
    }
  }

  return v10;
}

- (void)getSocket:(id)a3
{
  id v4 = a3;
  vendedDeviceConnection = self->_vendedDeviceConnection;
  self->_vendedDeviceConnection = 0LL;

  sharedConnection = self->_sharedConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000717BC;
  v8[3] = &unk_1004EEF80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[ADSharedPeerStreamConnection getSocketForConnection:completion:]( sharedConnection,  "getSocketForConnection:completion:",  self,  v8);
}

- (void)getLocalMetrics:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[ADPeerStreamConnection getLocalMetrics:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
    }

    vendedDeviceConnection = self->_vendedDeviceConnection;
    if (vendedDeviceConnection)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceConnection metrics](vendedDeviceConnection, "metrics"));
      v4[2](v4, v7);
    }

    else
    {
      id v8 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        v10 = "-[ADPeerStreamConnection getLocalMetrics:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s No current IDS device connection",  (uint8_t *)&v9,  0xCu);
      }

      v4[2](v4, 0LL);
    }
  }
}

- (void)getRemoteMetrics:(id)a3
{
}

- (void)getAWDMetrics:(id)a3 completion:(id)a4
{
}

- (BOOL)peerSupportsExtendedHeader
{
  return -[ADSharedPeerStreamConnection peerSupportsExtendedHeader]( self->_sharedConnection,  "peerSupportsExtendedHeader");
}

- (void)close
{
}

- (BOOL)hasNearbyPeer
{
  return -[ADSharedPeerStreamConnection hasNearbyPeer](self->_sharedConnection, "hasNearbyPeer");
}

- (void).cxx_destruct
{
}

@end