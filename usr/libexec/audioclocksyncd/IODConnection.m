@interface IODConnection
+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10;
- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3;
- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6;
- (IODConnection)init;
- (IODConnection)initWithService:(id)a3;
- (IODConnection)initWithService:(id)a3 andType:(unsigned int)a4;
- (void)dealloc;
@end

@implementation IODConnection

- (IODConnection)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[IODConnection init]"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Do not call %@",  v3);

  return 0LL;
}

- (IODConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IODConnection;
  v7 = -[IODConnection init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_clientID = 0;
    asyncCallbackPort = v7->_asyncCallbackPort;
    v7->_asyncCallbackPort = 0LL;

    asyncCallbackQueue = v8->_asyncCallbackQueue;
    v8->_asyncCallbackQueue = 0LL;

    v8->_asyncCallback = 0LL;
    v8->_refcon = 0LL;
    if (qword_100047C08 != -1) {
      dispatch_once(&qword_100047C08, &stru_10003C510);
    }
    id v11 = [v6 entryID];
    unsigned int v12 = [(id)qword_100047C00 openDaemonClient:dword_100047C10 withRegistryEntryID:v11 clientType:v4 error:0];
    v8->_clientID = v12;
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODConnectionDaemon failed to open service with registryEntryID %llu\n",  buf,  0xCu);
    }
  }

  return v8;
}

- (IODConnection)initWithService:(id)a3
{
  return -[IODConnection initWithService:andType:](self, "initWithService:andType:", a3, 0LL);
}

- (void)dealloc
{
  iokConnection = self->_iokConnection;
  self->_iokConnection = 0LL;

  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    [(id)qword_100047C00 closeDaemonClient:dword_100047C10 daemonClientID:clientID error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IODConnection;
  -[IODConnection dealloc](&v5, "dealloc");
}

+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6
{
  uint64_t v9 = *(void *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
  v10 = (void *)qword_100047C18;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

  if (v12)
  {
    uint64_t v13 = *(void *)(v12 + 40);
    uint64_t v14 = *(void *)(v12 + 48);
    v15 = (dispatch_queue_s *)*(id *)(v12 + 24);
    BOOL v16 = v14 != 0;
  }

  else
  {
    v15 = 0LL;
    uint64_t v13 = 0LL;
    BOOL v16 = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
  if (a6 <= 0x10 && v15 && v13 && v16)
  {
    *(void *)buf = 0LL;
    v24 = buf;
    uint64_t v25 = 0xA010000000LL;
    v26 = &unk_10003A483;
    __memmove_chk(&v27, a5, 8LL * a6, 128LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000060F4;
    v17[3] = &unk_10003C578;
    uint64_t v20 = v13;
    id v18 = (id)v12;
    v19 = buf;
    int v21 = a4;
    unsigned int v22 = a6;
    dispatch_async(v15, v17);

    _Block_object_dispose(buf, 8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODConnection NO CONNECTION callback clientID %u\n",  buf,  8u);
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v14 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection) {
    return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:]( iokConnection,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOut puts:scalarOutputCount:structOutput:structOutputSize:error:",  *(void *)&a3,  a4,  v12,  a6,  a7,  a8,  a9,  0LL,  0LL,  a10);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v14 scalarInputs:a4 scalarInputCount:v12 structInput:a6 s tructInputSize:a7 scalarOutputs:a8 scalarOutputCount:a9 error:a10];
  }
  else {
    return 0;
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection) {
    return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( iokConnection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  *(void *)&a3,  a4,  v8,  a6,  a7,  a8);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v10 scalarInputs:a4 scalarInputCount:v8 structInput:0 s tructInputSize:0 scalarOutputs:a6 scalarOutputCount:a7 error:a8];
  }
  else {
    return 0;
  }
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection) {
    return -[IOKConnection callMethodWithSelector:structInput:structInputSize:structOutput:structOutputSize:error:]( iokConnection,  "callMethodWithSelector:structInput:structInputSize:structOutput:structOutputSize:error:",  *(void *)&a3,  a4,  a5,  0LL,  0LL,  a6);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    return [(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v7 scalarInputs:0 scalarInputCount:0 structInput:a4 s tructInputSize:a5 scalarOutputs:0 scalarOutputCount:0 error:a6];
  }
  else {
    return 0;
  }
}

- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a6;
  objc_storeStrong((id *)&self->_asyncCallbackQueue, a6);
  if (!self->_asyncCallbackQueue) {
    goto LABEL_10;
  }
  if (!self->_iokConnection)
  {
    uint64_t clientID = self->_clientID;
    if ((_DWORD)clientID)
    {
      if ([(id)qword_100047C00 callMethodForDaemonClient:clientID clientMethodSelector:v9 scalarInputs:0 scalarInputCount:0 structInput:0 stru ctInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0])
      {
        os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
        self->_asyncCallback = a4;
        self->_refcon = a5;
        v17 = (void *)qword_100047C18;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_clientID));
        [v17 setObject:self forKey:v18];

        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
        unsigned __int8 v15 = 1;
        goto LABEL_11;
      }

      unsigned __int8 v15 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      unsigned int v19 = self->_clientID;
      *(_DWORD *)buf = 67109634;
      unsigned int v22 = v19;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v9;
      HIWORD(v23) = 2080;
      v24 = "fail";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODConnection::registerAsyncNotificationsWithSelector clientID %u selector %u result %s\n",  buf,  0x18u);
    }

- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
  {
    unsigned __int8 v6 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( iokConnection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  *(void *)&a3,  0LL,  0LL,  0LL,  0LL,  0LL);
  }

  else
  {
    if (!self->_clientID)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }

    os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
    uint64_t v7 = (void *)qword_100047C18;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_clientID));
    [v7 removeObjectForKey:v8];

    self->_asyncCallback = 0LL;
    self->_refcon = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
    unsigned __int8 v6 = [(id)qword_100047C00 callMethodForDaemonClient:self->_clientID clientMethodSelector:v3 scalarInputs:0 scalarInputCount:0 structInput:0 str uctInputSize:0 scalarOutputs:0 scalarOutputCount:0 error:0];
  }

  BOOL v9 = v6;
LABEL_6:
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = 0LL;

  asyncCallbackQueue = self->_asyncCallbackQueue;
  self->_asyncCallbackQueue = 0LL;

  return v9;
}

- (void).cxx_destruct
{
}

@end