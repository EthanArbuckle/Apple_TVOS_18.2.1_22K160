@interface DIClient2IODaemonXPCHandler
- (BOOL)addToRefCountWithError:(id *)a3;
- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3;
- (NSXPCListenerEndpoint)xpcListenerEndpoint;
- (id)remoteObjectInterface;
- (void)createConnection;
- (void)setXpcListenerEndpoint:(id)a3;
@end

@implementation DIClient2IODaemonXPCHandler

- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIClient2IODaemonXPCHandler;
  v6 = -[DIBaseXPCHandler init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcListenerEndpoint, a3);
  }

  return v7;
}

- (void)createConnection
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v15 = 47;
    __int16 v16 = 2080;
    v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
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
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v15 = 47;
      __int16 v16 = 2080;
      v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
      _os_log_impl( &dword_188046000,  v6,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creating connection to IO daemon clients listener",  buf,  0x12u);
    }
  }

  *__error() = v3;
  id v7 = objc_alloc(MEMORY[0x189607B30]);
  v8 = -[DIClient2IODaemonXPCHandler xpcListenerEndpoint](self, "xpcListenerEndpoint");
  objc_super v9 = (void *)[v7 initWithListenerEndpoint:v8];
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v9);
  v10 = -[DIClient2IODaemonXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  v11 = -[DIBaseXPCHandler connection](self, "connection");
  [v11 setRemoteObjectInterface:v10];
  v12 = -[DIBaseXPCHandler connection](self, "connection");
  [v12 setInvalidationHandler:&__block_literal_global_2];
  v13 = -[DIBaseXPCHandler connection](self, "connection");
  [v13 setInterruptionHandler:&__block_literal_global_3];
}

int *__47__DIClient2IODaemonXPCHandler_createConnection__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v6 = 60;
    __int16 v7 = 2080;
    v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
    v2 = (char *)_os_log_send_and_compose_impl();

    if (v2)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v2);
      free(v2);
    }
  }

  else
  {
    getDIOSLog();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v6 = 60;
      __int16 v7 = 2080;
      v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
      _os_log_impl( &dword_188046000,  v3,  OS_LOG_TYPE_DEFAULT,  "%.*s: Reached an invalidation handler for the IO daemon connection",  buf,  0x12u);
    }
  }

  result = __error();
  int *result = v0;
  return result;
}

int *__47__DIClient2IODaemonXPCHandler_createConnection__block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v6 = 60;
    __int16 v7 = 2080;
    v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
    v2 = (char *)_os_log_send_and_compose_impl();

    if (v2)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v2);
      free(v2);
    }
  }

  else
  {
    getDIOSLog();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v6 = 60;
      __int16 v7 = 2080;
      v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
      _os_log_impl( &dword_188046000,  v3,  OS_LOG_TYPE_DEFAULT,  "%.*s: Reached an interruption handler for the IO daemon connection",  buf,  0x12u);
    }
  }

  result = __error();
  int *result = v0;
  return result;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C7095A0];
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = __54__DIClient2IODaemonXPCHandler_addToRefCountWithError___block_invoke;
  v10 = &unk_18A1CA5D0;
  objc_copyWeak(&v11, &location);
  [v5 addToRefCountWithReply:&v7];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __54__DIClient2IODaemonXPCHandler_addToRefCountWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end