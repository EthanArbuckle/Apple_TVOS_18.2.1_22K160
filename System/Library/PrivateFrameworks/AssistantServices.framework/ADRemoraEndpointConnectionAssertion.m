@interface ADRemoraEndpointConnectionAssertion
- (ADRemoraEndpointConnectionAssertion)initWithConnection:(id)a3 queue:(id)a4;
- (HMConnectivityNetworkConnection)connection;
- (OS_dispatch_queue)queue;
- (unsigned)assertionState;
- (void)acquireAssertion:(id)a3;
- (void)releaseAssertion:(id)a3;
@end

@implementation ADRemoraEndpointConnectionAssertion

- (ADRemoraEndpointConnectionAssertion)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnectionAssertion;
  v9 = -[ADRemoraEndpointConnectionAssertion init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_assertionState = 3;
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)acquireAssertion:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    id v7 = v5;
    id v8 = objc_retainBlock(v4);
    int assertionState = self->_assertionState;
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[ADRemoraEndpointConnectionAssertion acquireAssertion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = connection;
    *(_WORD *)&buf[22] = 2048;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = assertionState;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection connection: %p, completion: %p, current assertion status: %d",  buf,  0x26u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v20) = 0;
  int v10 = self->_assertionState;
  if (!self->_assertionState)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFRemoraEndpointConnectionErrorDomain,  1LL,  0LL));
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }

  if (v10 != 1)
  {
    self->_int assertionState = 1;
    objc_initWeak(&location, self);
    objc_super v12 = self->_connection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100130CA4;
    v13[3] = &unk_1004F2880;
    v13[4] = self;
    objc_copyWeak(&v16, &location);
    id v14 = v4;
    v15 = buf;
    char v17 = v10;
    -[HMConnectivityNetworkConnection beginBoostWithCompletion:](v12, "beginBoostWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    v11 = 0LL;
    goto LABEL_10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFRemoraEndpointConnectionErrorDomain,  0LL,  0LL));
  if (v4) {
LABEL_6:
  }
    (*((void (**)(id, void, void *))v4 + 2))(v4, *(unsigned __int8 *)(*(void *)&buf[8] + 24LL), v11);
LABEL_10:
  _Block_object_dispose(buf, 8);
}

- (void)releaseAssertion:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    id v7 = v5;
    id v8 = objc_retainBlock(v4);
    int assertionState = self->_assertionState;
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[ADRemoraEndpointConnectionAssertion releaseAssertion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = connection;
    *(_WORD *)&buf[22] = 2048;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = assertionState;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #ADRemoraEndpointConnection connection: %p, completion: %p, current assertion status: %d",  buf,  0x26u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v20) = 0;
  int v10 = self->_assertionState;
  if (v10 == 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFRemoraEndpointConnectionErrorDomain,  5LL,  0LL));
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }

  if (v10 != 2)
  {
    self->_int assertionState = 2;
    objc_initWeak(&location, self);
    objc_super v12 = self->_connection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100130ACC;
    v13[3] = &unk_1004F2880;
    v13[4] = self;
    objc_copyWeak(&v16, &location);
    id v14 = v4;
    v15 = buf;
    char v17 = v10;
    -[HMConnectivityNetworkConnection endBoostWithCompletion:](v12, "endBoostWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    v11 = 0LL;
    goto LABEL_10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFRemoraEndpointConnectionErrorDomain,  3LL,  0LL));
  if (v4) {
LABEL_6:
  }
    (*((void (**)(id, void, void *))v4 + 2))(v4, *(unsigned __int8 *)(*(void *)&buf[8] + 24LL), v11);
LABEL_10:
  _Block_object_dispose(buf, 8);
}

- (unsigned)assertionState
{
  return self->_assertionState;
}

- (HMConnectivityNetworkConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end