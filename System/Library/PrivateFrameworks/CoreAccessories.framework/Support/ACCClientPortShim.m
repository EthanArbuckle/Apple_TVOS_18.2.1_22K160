@interface ACCClientPortShim
- (ACCClientPortShim)initWithUID:(id)a3 xpcConnection:(id)a4 delegate:(id)a5;
- (ACCClientPortShimDelegate)delegate;
- (NSString)portUID;
- (NSString)transportClientConnectionID;
- (NSString)transportClientEndpointID;
- (OS_xpc_object)xpcConnection;
- (id)description;
- (void)receiveData:(char *)a3 length:(unint64_t)a4;
- (void)sendData:(char *)a3 length:(unint64_t)a4;
- (void)sendData:(id)a3;
- (void)setTransportClientConnectionID:(id)a3;
- (void)setTransportClientEndpointID:(id)a3;
- (void)shutdown;
@end

@implementation ACCClientPortShim

- (ACCClientPortShim)initWithUID:(id)a3 xpcConnection:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ACCClientPortShim;
  v12 = -[ACCClientPortShim init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_portUID, a3);
    objc_storeStrong((id *)&v13->_xpcConnection, a4);
    objc_storeStrong((id *)&v13->_delegate, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 createConnectionWithType:5 andIdentifier:v9]);
    transportClientConnectionID = v13->_transportClientConnectionID;
    v13->_transportClientConnectionID = (NSString *)v15;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __56__ACCClientPortShim_initWithUID_xpcConnection_delegate___block_invoke;
    v21[3] = &unk_1001FA478;
    v17 = v13;
    v22 = v17;
    uint64_t v18 = objc_claimAutoreleasedReturnValue( [v14 createEndpointWithTransportType:4 andProtocol:4 andIdentifier:v9 andDataOutHandler:v21 forConnectionWithUUID:v13->_transportClientConnectionID publishConnection:1]);
    transportClientEndpointID = v17->_transportClientEndpointID;
    v17->_transportClientEndpointID = (NSString *)v18;
  }

  return v13;
}

id __56__ACCClientPortShim_initWithUID_xpcConnection_delegate___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) sendData:a4];
}

- (void)shutdown
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCClientPortShim description](self, "description"));
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ACCClientPortShims shutDown:  %@",  (uint8_t *)&v10,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
  [v7 destroyEndpointWithUUID:self->_transportClientEndpointID];
  [v7 destroyConnectionWithUUID:self->_transportClientConnectionID];
  transportClientConnectionID = self->_transportClientConnectionID;
  self->_transportClientConnectionID = 0LL;

  transportClientEndpointID = self->_transportClientEndpointID;
  self->_transportClientEndpointID = 0LL;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACCClientPortShim<%@ connection=%@>",  self->_portUID,  self->_xpcConnection);
}

- (void)receiveData:(char *)a3 length:(unint64_t)a4
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
  [v8 processIncomingData:v7 forEndpointWithUUID:self->_transportClientEndpointID];
}

- (void)sendData:(char *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    -[ACCClientPortShimDelegate sendData:length:forConnection:portUID:]( self->_delegate,  "sendData:length:forConnection:portUID:");
  }

  else
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 7;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v6 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    else
    {
      v6 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ACCClientPortShim: ERROR: NULL transport data",  v7,  2u);
    }
  }

- (void)sendData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 bytes];
    id v6 = [v4 length];

    -[ACCClientPortShim sendData:length:](self, "sendData:length:", v5, v6);
  }

- (NSString)portUID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (ACCClientPortShimDelegate)delegate
{
  return (ACCClientPortShimDelegate *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)transportClientConnectionID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTransportClientConnectionID:(id)a3
{
}

- (NSString)transportClientEndpointID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTransportClientEndpointID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end