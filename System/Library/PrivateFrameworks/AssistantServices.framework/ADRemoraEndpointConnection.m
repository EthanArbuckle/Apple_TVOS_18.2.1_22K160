@interface ADRemoraEndpointConnection
- (ADRemoraEndpointConnection)initWithEndpointIdentifier:(id)a3 applicationProtocolName:(id)a4 queue:(id)a5 serviceClass:(int64_t)a6 trafficClass:(int64_t)a7 delegate:(id)a8;
- (id)_endpointConnectionAssertion;
- (int)_connectionServiceClass;
- (unsigned)_connectionTrafficClass;
- (void)_createConnection:(id)a3;
- (void)_didReceiveMessage:(id)a3 error:(id)a4;
- (void)_endpointConnectionStateChanged:(int)a3 error:(id)a4;
- (void)_readNextMessage;
- (void)_setupEndpointConnection;
- (void)_teardownEndpointConnection;
- (void)acquireEndpointConnectionAssertion:(id)a3;
- (void)dealloc;
- (void)releaseEndpointConnectionAssertion:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setupConnection;
- (void)teardownConnection;
@end

@implementation ADRemoraEndpointConnection

- (ADRemoraEndpointConnection)initWithEndpointIdentifier:(id)a3 applicationProtocolName:(id)a4 queue:(id)a5 serviceClass:(int64_t)a6 trafficClass:(int64_t)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnection;
  v18 = -[ADRemoraEndpointConnection init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a5);
    objc_storeWeak((id *)&v19->_delegate, v17);
    v20 = (NSString *)[v15 copy];
    endpointApplicationProtocolName = v19->_endpointInfo.endpointApplicationProtocolName;
    v19->_endpointInfo.endpointApplicationProtocolName = v20;

    v22 = (NSUUID *)[v14 copy];
    endpointIdentifier = v19->_endpointInfo.endpointIdentifier;
    v19->_endpointInfo.endpointIdentifier = v22;

    v19->_endpointInfo.endpointConnectionServiceClass = a6;
    v19->_endpointInfo.endpointConnectionTrafficClass = a7;
  }

  return v19;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    endpointIdentifier = self->_endpointInfo.endpointIdentifier;
    *(_DWORD *)buf = 136315394;
    v7 = "-[ADRemoraEndpointConnection dealloc]";
    __int16 v8 = 2112;
    v9 = endpointIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection accessory with identifier: %@",  buf,  0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnection;
  -[ADRemoraEndpointConnection dealloc](&v5, "dealloc");
}

- (id)_endpointConnectionAssertion
{
  endpointConnectionAssertion = self->_endpointConnectionAssertion;
  if (!endpointConnectionAssertion)
  {
    v4 = -[ADRemoraEndpointConnectionAssertion initWithConnection:queue:]( objc_alloc(&OBJC_CLASS___ADRemoraEndpointConnectionAssertion),  "initWithConnection:queue:",  self->_endpointInfo.endpointConnection,  self->_queue);
    objc_super v5 = self->_endpointConnectionAssertion;
    self->_endpointConnectionAssertion = v4;

    endpointConnectionAssertion = self->_endpointConnectionAssertion;
  }

  return endpointConnectionAssertion;
}

- (void)_setupEndpointConnection
{
  endpointConnection = self->_endpointInfo.endpointConnection;
  if (endpointConnection || (v6 = self->_endpointInfo.endpointIdentifier) == 0LL)
  {
    v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      endpointIdentifier = self->_endpointInfo.endpointIdentifier;
      int v10 = 136315650;
      v11 = "-[ADRemoraEndpointConnection _setupEndpointConnection]";
      __int16 v12 = 2048;
      v13 = endpointConnection;
      __int16 v14 = 2112;
      id v15 = endpointIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection Not initializing connection (current connection: %p) to endpoint accessory with identifier %@",  (uint8_t *)&v10,  0x20u);
    }
  }

  else
  {
    v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADRemoraEndpointConnection _setupEndpointConnection]";
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection Initializing connection to endpoint accessory with identifier %@",  (uint8_t *)&v10,  0x16u);
      v6 = self->_endpointInfo.endpointIdentifier;
    }

    self->_endpointInfo.connectionState.endpointNWConnectionState = 0;
    __int16 v8 = (HMConnectivityEndpoint *)objc_claimAutoreleasedReturnValue( +[HMConnectivityEndpoint endpointWithSiriEndpointIdentifier:applicationName:]( &OBJC_CLASS___HMConnectivityEndpoint,  "endpointWithSiriEndpointIdentifier:applicationName:",  v6,  self->_endpointInfo.endpointApplicationProtocolName));
    connectivityEndpoint = self->_endpointInfo.connectivityEndpoint;
    self->_endpointInfo.connectivityEndpoint = v8;

    -[ADRemoraEndpointConnection _createConnection:]( self,  "_createConnection:",  self->_endpointInfo.connectivityEndpoint);
  }

- (void)_teardownEndpointConnection
{
  endpointConnection = self->_endpointInfo.endpointConnection;
  if (endpointConnection)
  {
    -[HMConnectivityNetworkConnection setInvalidationHandler:](endpointConnection, "setInvalidationHandler:", 0LL);
    -[HMConnectivityNetworkConnection cancel](self->_endpointInfo.endpointConnection, "cancel");
    v4 = self->_endpointInfo.endpointConnection;
    self->_endpointInfo.endpointConnection = 0LL;

    endpointConnectionAssertion = self->_endpointConnectionAssertion;
    self->_endpointConnectionAssertion = 0LL;
  }

- (int)_connectionServiceClass
{
  else {
    return 0;
  }
}

- (unsigned)_connectionTrafficClass
{
  int64_t endpointConnectionTrafficClass = self->_endpointInfo.endpointConnectionTrafficClass;
  else {
    unsigned int v3 = 0;
  }
  else {
    return v3;
  }
}

- (void)_endpointConnectionStateChanged:(int)a3 error:(id)a4
{
  id v6 = a4;
  v7 = v6;
  int64_t endpointConnectionState = self->_endpointInfo.connectionState.endpointConnectionState;
  int endpointNWConnectionState = self->_endpointInfo.connectionState.endpointNWConnectionState;
  self->_endpointInfo.connectionState.int endpointNWConnectionState = a3;
  if (endpointNWConnectionState != a3)
  {
    int v10 = (os_log_s *)AFSiriLogContextConnection;
    id v6 = (id)os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if ((_DWORD)v6)
    {
      int v18 = 136315906;
      v19 = "-[ADRemoraEndpointConnection _endpointConnectionStateChanged:error:]";
      __int16 v20 = 1024;
      *(_DWORD *)v21 = endpointNWConnectionState;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = a3;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection connection state changed from %d to %d with error %@",  (uint8_t *)&v18,  0x22u);
    }
  }

  switch(a3)
  {
    case 0:
    case 4:
      int64_t v11 = 0LL;
      self->_endpointInfo.connectionState.int64_t endpointConnectionState = 0LL;
      break;
    case 1:
    case 2:
      int64_t v11 = 1LL;
      goto LABEL_9;
    case 3:
      int64_t v11 = 2LL;
LABEL_9:
      self->_endpointInfo.connectionState.int64_t endpointConnectionState = v11;
      break;
    default:
      int64_t v11 = self->_endpointInfo.connectionState.endpointConnectionState;
      break;
  }

  if (endpointConnectionState != v11)
  {
    if (AFIsInternalInstall(v6))
    {
      __int16 v12 = (nw_connection *)objc_claimAutoreleasedReturnValue( -[HMConnectivityNetworkConnection networkConnection]( self->_endpointInfo.endpointConnection,  "networkConnection"));
      v13 = nw_connection_copy_description(v12);
      if (v13)
      {
        __int16 v14 = v13;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
        id v16 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315394;
          v19 = "-[ADRemoraEndpointConnection _endpointConnectionStateChanged:error:]";
          __int16 v20 = 2112;
          *(void *)v21 = v15;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s #ADRemoraEndpointConnection connection_info= %@",  (uint8_t *)&v18,  0x16u);
        }

        free(v14);
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained endpointConnection:self didChangeState:self->_endpointInfo.connectionState.endpointConnectionState error:v7];
  }
}

- (void)_createConnection:(id)a3
{
  id v4 = a3;
  -[ADRemoraEndpointConnection _teardownEndpointConnection](self, "_teardownEndpointConnection");
  objc_super v5 = nw_parameters_create();
  nw_parameters_set_service_class( v5,  (nw_service_class_t)-[ADRemoraEndpointConnection _connectionServiceClass](self, "_connectionServiceClass"));
  nw_parameters_set_traffic_class( v5,  -[ADRemoraEndpointConnection _connectionTrafficClass](self, "_connectionTrafficClass"));
  objc_initWeak(&location, self);
  id v6 = -[HMConnectivityNetworkConnection initWithEndpoint:nwParameters:]( objc_alloc(&OBJC_CLASS___HMConnectivityNetworkConnection),  "initWithEndpoint:nwParameters:",  self->_endpointInfo.connectivityEndpoint,  v5);
  endpointConnection = self->_endpointInfo.endpointConnection;
  self->_endpointInfo.endpointConnection = v6;

  __int16 v8 = self->_endpointInfo.endpointConnection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10016C064;
  v13[3] = &unk_1004F3870;
  objc_copyWeak(&v14, &location);
  -[HMConnectivityNetworkConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v13);
  v9 = self->_endpointInfo.endpointConnection;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10016C214;
  v11[3] = &unk_1004F3898;
  objc_copyWeak(&v12, &location);
  -[HMConnectivityNetworkConnection startWithQueue:stateChangedHandler:]( v9,  "startWithQueue:stateChangedHandler:",  queue,  v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_didReceiveMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int64_t v11 = "-[ADRemoraEndpointConnection _didReceiveMessage:error:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection",  (uint8_t *)&v10,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointConnection:self didReceiveMessage:v6 error:v7];
}

- (void)_readNextMessage
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[ADRemoraEndpointConnection _readNextMessage]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s #ADRemoraEndpointConnection", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  endpointConnection = self->_endpointInfo.endpointConnection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10016BFEC;
  v5[3] = &unk_1004F38C0;
  objc_copyWeak(&v6, (id *)buf);
  -[HMConnectivityNetworkConnection receiveMessageDictionaryWithCompletion:]( endpointConnection,  "receiveMessageDictionaryWithCompletion:",  v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016BE9C;
  block[3] = &unk_1004FD808;
  block[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  objc_copyWeak(&v14, &location);
  dispatch_async(queue, block);
  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)setupConnection
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016BE94;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)teardownConnection
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016BE8C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)acquireEndpointConnectionAssertion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016BC94;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)releaseEndpointConnectionAssertion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016BA9C;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0LL);
}

@end