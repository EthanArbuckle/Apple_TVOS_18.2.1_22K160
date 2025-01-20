@interface ADPeerConnectionProvider
+ (void)getMetricsContext:(id)a3;
- (BOOL)isMultipath;
- (BOOL)isPeerConnectionError:(id)a3;
- (BOOL)isPeerNotNearbyError:(id)a3;
- (BOOL)shouldFallbackFromError:(id)a3;
- (BOOL)shouldFallbackQuickly;
- (BOOL)supportsInitialPayload;
- (id)_peerConnection;
- (id)analysisInfo;
- (id)connectionType;
- (id)headerDataWithForceReconnect:(BOOL)a3;
- (id)initListenerWithQueue:(id)a3;
- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4;
- (void)close;
- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPeerStreamConnection:(id)a3;
- (void)updateConnectionMetrics:(id)a3 completion:(id)a4;
@end

@implementation ADPeerConnectionProvider

- (id)initListenerWithQueue:(id)a3
{
  id result = -[ADPeerConnectionProvider initWithQueue:](self, "initWithQueue:", a3);
  if (result) {
    *((_BYTE *)result + 24) = 1;
  }
  return result;
}

- (void)setPeerStreamConnection:(id)a3
{
}

- (id)_peerConnection
{
  peerConnection = self->_peerConnection;
  if (!peerConnection)
  {
    v4 = -[ADPeerStreamConnection initWithServiceIdentifier:delegate:listener:]( objc_alloc(&OBJC_CLASS___ADPeerStreamConnection),  "initWithServiceIdentifier:delegate:listener:",  @"com.apple.private.alloy.siri.proxy",  self,  self->_isListener);
    v5 = self->_peerConnection;
    self->_peerConnection = v4;

    peerConnection = self->_peerConnection;
  }

  return peerConnection;
}

- (void)setDelegate:(id)a3
{
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "-[ADPeerConnectionProvider headerDataWithForceReconnect:]";
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s forceReconnect %d", (uint8_t *)&v12, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnectionProvider _url](self, "_url"));
  id v7 = objc_claimAutoreleasedReturnValue([v6 absoluteString]);
  v8 = (char *)[v7 UTF8String];

  if (v8)
  {
    size_t v9 = strlen(v8);
    v10 = (char *)malloc(v9 + 6);
    *(_WORD *)v10 = 17233;
    v10[2] = -1;
    *((_WORD *)v10 + 2) = bswap32(v9) >> 16;
    memmove(v10 + 6, v8, v9);
    v8 = (char *)dispatch_data_create(v10, v9 + 6, 0LL, _dispatch_data_destructor_free);
  }

  return v8;
}

- (BOOL)shouldFallbackQuickly
{
  return 1;
}

- (BOOL)supportsInitialPayload
{
  return 0;
}

- (BOOL)isPeerConnectionError:(id)a3
{
  return _objc_msgSend(a3, "ad_isPeerConnectionError");
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return _objc_msgSend(a3, "ad_isPeerNotNearbyError");
}

- (BOOL)isMultipath
{
  return 0;
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v4 isEqualToString:@"ADPeerStreamConnectionErrorDomain"]
    && ![v3 code])
  {
    if (qword_1005780A8 != -1) {
      dispatch_once(&qword_1005780A8, &stru_1004F5FE0);
    }
    BOOL v5 = byte_1005780A1 != 0;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  kdebug_trace(722470292LL, 0LL, 0LL, 0LL, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnectionProvider _peerConnection](self, "_peerConnection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011DCF4;
  v8[3] = &unk_1004F1F88;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 getSocket:v8];
}

- (void)close
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADPeerConnectionProvider;
  -[ADPeerConnectionProvider close](&v3, "close");
  -[ADPeerStreamConnection close](self->_peerConnection, "close");
}

- (id)connectionType
{
  return  -[SiriCoreConnectionType initWithTechnology:]( objc_alloc(&OBJC_CLASS___SiriCoreConnectionType),  "initWithTechnology:",  3002LL);
}

- (id)analysisInfo
{
  return 0LL;
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
  v10[1] = 3221225472LL;
  v10[2] = sub_10011DB0C;
  v10[3] = &unk_1004FD9E0;
  id v11 = a3;
  int v12 = self;
  id v13 = a4;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADPeerConnectionProvider;
  v10[0] = _NSConcreteStackBlock;
  id v6 = v13;
  id v7 = v11;
  -[ADPeerConnectionProvider updateConnectionMetrics:completion:](&v9, "updateConnectionMetrics:completion:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnectionProvider _peerConnection](self, "_peerConnection"));
  [v8 getLocalMetrics:&stru_1004F1FF0];
}

- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connectionProvider:self receivedError:v6];
}

- (void).cxx_destruct
{
}

+ (void)getMetricsContext:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if ((AFIsNano(v4) & 1) != 0)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:listener:]( &OBJC_CLASS___ADSharedPeerStreamConnection,  "sharedPeerStreamConnectionWithServiceIdentifier:listener:",  @"com.apple.private.alloy.siri.proxy",  0LL));
    [v3 getMetricsContext:v4];
  }

  else
  {
    v4[2](v4, 0LL);
  }
}

@end