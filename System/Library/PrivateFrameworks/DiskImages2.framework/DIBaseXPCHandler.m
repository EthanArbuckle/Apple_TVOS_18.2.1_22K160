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
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIBaseXPCHandler;
  v2 = -[DIBaseXPCHandler init](&v11, sel_init);
  if (v2
    && (dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL),
        -[DIBaseXPCHandler setSemaphore:](v2, "setSemaphore:", v3),
        v3,
        -[DIBaseXPCHandler semaphore](v2, "semaphore"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    int v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v13 = 24;
      __int16 v14 = 2080;
      v15 = "-[DIBaseXPCHandler init]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v8);
        free(v8);
      }
    }

    else
    {
      getDIOSLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v13 = 24;
        __int16 v14 = 2080;
        v15 = "-[DIBaseXPCHandler init]";
        _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_ERROR, "%.*s: Failed creating semaphore", buf, 0x12u);
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
  -[DIBaseXPCHandler dealloc](&v4, sel_dealloc);
}

- (id)serviceName
{
  return 0LL;
}

- (BOOL)connectWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DIBaseXPCHandler connection](self, "connection");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 resume];
    v7 = -[DIBaseXPCHandler connection](self, "connection");
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 3221225472LL;
    int v13 = __37__DIBaseXPCHandler_connectWithError___block_invoke;
    __int16 v14 = &unk_18A1CA5D0;
    objc_copyWeak(&v15, &location);
    [v7 remoteObjectProxyWithErrorHandler:&v11];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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

void __37__DIBaseXPCHandler_connectWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

- (void)signalCommandCompletedWithXpcError:(id)a3
{
  objc_super v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);
}

- (BOOL)completeCommandWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[DIBaseXPCHandler semaphore](self, "semaphore");
  v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[DIBaseXPCHandler xpcError](self, "xpcError");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", 0LL);
  v7 = -[DIBaseXPCHandler connection](self, "connection");
  if (v7)
  {
    if (v6)
    {
      int v8 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        int v15 = 45;
        __int16 v16 = 2080;
        v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
        __int16 v18 = 2114;
        v19 = v6;
        v10 = (char *)_os_log_send_and_compose_impl();

        if (v10)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
          free(v10);
        }
      }

      else
      {
        getDIOSLog();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v15 = 45;
          __int16 v16 = 2080;
          v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
          __int16 v18 = 2114;
          v19 = v6;
          _os_log_impl( &dword_188046000,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Got error from last XPC command: %{public}@",  buf,  0x1Cu);
        }
      }

      *__error() = v8;
      LOBYTE(v11) = 0;
      if (a3) {
        *a3 = v6;
      }
    }

    else
    {
      LOBYTE(v11) = 1;
    }
  }

  else
  {
    BOOL v11 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  151LL,  @"XPC connection failed",  a3);
  }

  return v11;
}

- (void)closeConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  -[DIBaseXPCHandler setConnection:](self, "setConnection:", 0LL);
}

- (BOOL)dupStderrWithError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x189607898]);
  int v6 = (void *)[v5 initWithFileDescriptor:fileno((FILE *)*MEMORY[0x1895F89D0])];
  v7 = -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  BOOL v11 = __39__DIBaseXPCHandler_dupStderrWithError___block_invoke;
  uint64_t v12 = &unk_18A1CA5D0;
  objc_copyWeak(&v13, &location);
  [v7 dupWithStderrHandle:v6 reply:&v9];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return (char)a3;
}

void __39__DIBaseXPCHandler_dupStderrWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

- (void)createConnection
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    -[DIBaseXPCHandler serviceName](self, "serviceName");
    *(_DWORD *)buf = 68158210;
    int v14 = 36;
    __int16 v15 = 2080;
    __int16 v16 = "-[DIBaseXPCHandler createConnection]";
    __int16 v17 = 2114;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v5);
      free(v5);
    }
  }

  else
  {
    getDIOSLog();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[DIBaseXPCHandler serviceName](self, "serviceName");
      *(_DWORD *)buf = 68158210;
      int v14 = 36;
      __int16 v15 = 2080;
      __int16 v16 = "-[DIBaseXPCHandler createConnection]";
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_188046000, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection with %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v3;
  id v8 = objc_alloc(MEMORY[0x189607B30]);
  -[DIBaseXPCHandler serviceName](self, "serviceName");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)[v8 initWithServiceName:v9];
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v10);

  -[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler connection](self, "connection");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setRemoteObjectInterface:v11];
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