@interface PushConnection
+ (id)_newConnectionForEnvironment:(id)a3 dispatchQueue:(id)a4;
- (NSString)description;
- (NSString)environment;
- (PushConnection)init;
- (PushConnection)initWithEnvironment:(id)a3;
- (PushConnection)initWithEnvironment:(id)a3 queue:(id)a4;
- (PushConnectionDelegate)delegate;
- (id)publicToken;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)setDelegate:(id)a3;
- (void)shutdown;
@end

@implementation PushConnection

- (PushConnection)init
{
  return -[PushConnection initWithEnvironment:](self, "initWithEnvironment:", APSEnvironmentProduction);
}

- (PushConnection)initWithEnvironment:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.PushConnection", 0LL);
  v6 = -[PushConnection initWithEnvironment:queue:](self, "initWithEnvironment:queue:", v4, v5);

  return v6;
}

- (PushConnection)initWithEnvironment:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PushConnection;
  v9 = -[PushConnection init](&v19, "init");
  if (v9)
  {
    v10 = objc_opt_new(&OBJC_CLASS___UnfairLock);
    historyLock = v9->_historyLock;
    v9->_historyLock = v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    logKey = v9->_logKey;
    v9->_logKey = (NSString *)v12;

    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    objc_storeStrong((id *)&v9->_environment, a3);
    v14 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    taskQueue = v9->_taskQueue;
    v9->_taskQueue = v14;

    -[TaskQueue setName:](v9->_taskQueue, "setName:", @"com.apple.storekit.PushConnectionTaskQueue");
    v16 = +[PushConnection _newConnectionForEnvironment:dispatchQueue:]( &OBJC_CLASS___PushConnection,  "_newConnectionForEnvironment:dispatchQueue:",  v7,  v8);
    connection = v9->_connection;
    v9->_connection = v16;

    -[APSConnection setDelegate:](v9->_connection, "setDelegate:", v9);
    -[APSConnection setEnabledTopics:ignoredTopics:]( v9->_connection,  "setEnabledTopics:ignoredTopics:",  &off_100302930,  &__NSArray0__struct);
  }

  return v9;
}

- (NSString)environment
{
  return self->_environment;
}

- (id)publicToken
{
  return -[APSConnection publicToken](self->_connection, "publicToken");
}

- (void)shutdown
{
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  v9 = -[PushMessage initWithMessage:](objc_alloc(&OBJC_CLASS___PushMessage), "initWithMessage:", v8);

  if (qword_10032E4E0 != -1) {
    dispatch_once(&qword_10032E4E0, &stru_1002E8BA0);
  }
  v10 = (os_log_s *)qword_10032E4B8;
  if (os_log_type_enabled((os_log_t)qword_10032E4B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v6;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Connection: %{public}@ received incoming message: %{public}@",  buf,  0x16u);
  }

  historyLock = self->_historyLock;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100040D3C;
  v18 = &unk_1002E78B8;
  objc_super v19 = self;
  uint64_t v12 = v9;
  v20 = v12;
  sub_100046160(historyLock, &v15);
  if (-[PushMessage actionType](v12, "actionType", v15, v16, v17, v18, v19) == -1LL)
  {
    if (qword_10032E4E0 != -1) {
      dispatch_once(&qword_10032E4E0, &stru_1002E8BA0);
    }
    v14 = (os_log_s *)qword_10032E4B8;
    if (os_log_type_enabled((os_log_t)qword_10032E4B8, OS_LOG_TYPE_ERROR)) {
      sub_10025FC78((uint64_t)v12, v14);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pushConnection:self didRecieveMessage:v12];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (qword_10032E4E0 != -1) {
    dispatch_once(&qword_10032E4E0, &stru_1002E8BA0);
  }
  id v6 = (void *)qword_10032E4B8;
  if (os_log_type_enabled((os_log_t)qword_10032E4B8, OS_LOG_TYPE_INFO))
  {
    logKey = self->_logKey;
    id v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lib_digestMD5"));
    environment = self->_environment;
    int v11 = 138543874;
    uint64_t v12 = logKey;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = environment;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[%{public}@] Received new public token: %{public}@ for environment: %{public}@",  (uint8_t *)&v11,  0x20u);
  }
}

- (NSString)description
{
  environment = self->_environment;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](self->_connection, "publicToken"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lib_shortDigestMD5"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  environment,  v4));

  return (NSString *)v5;
}

+ (id)_newConnectionForEnvironment:(id)a3 dispatchQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( objc_alloc(&OBJC_CLASS___APSConnection),  "initWithEnvironmentName:namedDelegatePort:queue:",  v6,  @"com.apple.aps.storekitservice",  v5);

  return v7;
}

- (PushConnectionDelegate)delegate
{
  return (PushConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end