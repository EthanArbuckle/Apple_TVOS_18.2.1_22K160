@interface DIBaseXPCHandler
- (BOOL)completeCommandWithError:(id *)a3;
- (BOOL)connectWithError:(id *)a3;
- (BOOL)dupStderrWithError:(id *)a3;
- (BOOL)isPrivileged;
- (DIBaseXPCHandler)init;
- (NSError)xpcError;
- (NSXPCConnection)connection;
- (OS_dispatch_semaphore)semaphore;
- (id)remoteObjectInterface;
- (id)remoteProxy;
- (id)serviceName;
- (void)closeConnection;
- (void)createConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setIsPrivileged:(BOOL)a3;
- (void)setRemoteProxy:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)setXpcError:(id)a3;
- (void)signalCommandCompletedWithXpcError:(id)a3;
@end

@implementation DIBaseXPCHandler

- (DIBaseXPCHandler)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIBaseXPCHandler;
  v2 = -[DIBaseXPCHandler init](&v16, "init");
  if (v2
    && (dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL),
        -[DIBaseXPCHandler setSemaphore:](v2, "setSemaphore:", v3),
        v3,
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](v2, "semaphore")),
        v4,
        !v4))
  {
    int v6 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v15 = 0LL;
      uint64_t v7 = sub_1000BE278();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v18 = 24;
      __int16 v19 = 2080;
      v20 = "-[DIBaseXPCHandler init]";
      LODWORD(v14) = 18;
      v10 = (char *)_os_log_send_and_compose_impl( v9,  &v15,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "%.*s: Failed creating semaphore",  (int)buf,  v14);

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      uint64_t v11 = sub_1000BE278();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v18 = 24;
        __int16 v19 = 2080;
        v20 = "-[DIBaseXPCHandler init]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed creating semaphore", buf, 0x12u);
      }
    }

    v5 = 0LL;
    *__error() = v6;
  }

  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    -[NSXPCConnection invalidate](connection, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DIBaseXPCHandler;
  -[DIBaseXPCHandler dealloc](&v4, "dealloc");
}

- (id)serviceName
{
  return 0LL;
}

- (BOOL)connectWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
    [v6 resume];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    v13 = sub_1000540F4;
    v14 = &unk_10017A420;
    objc_copyWeak(&v15, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:&v11]);
    -[DIBaseXPCHandler setRemoteProxy:](self, "setRemoteProxy:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  151LL,  @"Failed to create XPC connection object",  a3);
  }

  objc_destroyWeak(&location);
  return v9;
}

- (void)signalCommandCompletedWithXpcError:(id)a3
{
  objc_super v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v4);
}

- (BOOL)completeCommandWithError:(id *)a3
{
  v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler xpcError](self, "xpcError"));
  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));

  if (v7)
  {
    if (v6)
    {
      int v8 = *__error();
      if (sub_1000BE2F0())
      {
        uint64_t v17 = 0LL;
        uint64_t v9 = sub_1000BE278();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v11 = 3LL;
        }
        else {
          uint64_t v11 = 2LL;
        }
        *(_DWORD *)buf = 68158210;
        int v19 = 45;
        __int16 v20 = 2080;
        v21 = "-[DIBaseXPCHandler completeCommandWithError:]";
        __int16 v22 = 2114;
        v23 = v6;
        uint64_t v12 = (char *)_os_log_send_and_compose_impl( v11,  &v17,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: Got error from last XPC command: %{public}@",  buf,  28);

        if (v12)
        {
          fprintf(__stderrp, "%s\n", v12);
          free(v12);
        }
      }

      else
      {
        uint64_t v14 = sub_1000BE278();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v19 = 45;
          __int16 v20 = 2080;
          v21 = "-[DIBaseXPCHandler completeCommandWithError:]";
          __int16 v22 = 2114;
          v23 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%.*s: Got error from last XPC command: %{public}@",  buf,  0x1Cu);
        }
      }

      *__error() = v8;
      LOBYTE(v13) = 0;
      if (a3) {
        *a3 = v6;
      }
    }

    else
    {
      LOBYTE(v13) = 1;
    }
  }

  else
  {
    BOOL v13 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  151LL,  @"XPC connection failed",  a3);
  }

  return v13;
}

- (void)closeConnection
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v3 invalidate];

  -[DIBaseXPCHandler setConnection:](self, "setConnection:", 0LL);
}

- (BOOL)dupStderrWithError:(id *)a3
{
  v5 = objc_alloc(&OBJC_CLASS___NSFileHandle);
  int v6 = -[NSFileHandle initWithFileDescriptor:](v5, "initWithFileDescriptor:", fileno(__stderrp));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100054530;
  uint64_t v12 = &unk_10017A420;
  objc_copyWeak(&v13, &location);
  [v7 dupWithStderrHandle:v6 reply:&v9];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return (char)a3;
}

- (void)createConnection
{
  int v3 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    uint64_t v4 = sub_1000BE278();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
    *(_DWORD *)buf = 68158210;
    int v20 = 36;
    __int16 v21 = 2080;
    __int16 v22 = "-[DIBaseXPCHandler createConnection]";
    __int16 v23 = 2114;
    v24 = v7;
    int v17 = 28;
    int v8 = (char *)_os_log_send_and_compose_impl( v6,  &v18,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "%.*s: Creating connection with %{public}@",  buf,  v17);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    uint64_t v9 = sub_1000BE278();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
      *(_DWORD *)buf = 68158210;
      int v20 = 36;
      __int16 v21 = 2080;
      __int16 v22 = "-[DIBaseXPCHandler createConnection]";
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creating connection with %{public}@",  buf,  0x1Cu);
    }
  }

  *__error() = v3;
  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
  uint64_t v14 = -[NSXPCConnection initWithServiceName:](v12, "initWithServiceName:", v13);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v16 setRemoteObjectInterface:v15];
}

- (id)remoteObjectInterface
{
  return 0LL;
}

- (id)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (void)setIsPrivileged:(BOOL)a3
{
  self->_isPrivileged = a3;
}

- (void).cxx_destruct
{
}

@end