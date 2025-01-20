@interface DIBaseServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setupNewConnection:(id)a3;
- (DIBaseServiceDelegate)init;
- (NSXPCListener)listener;
- (OS_dispatch_queue)dispatchQueue;
- (id)serviceName;
- (void)createListener;
- (void)setListener:(id)a3;
- (void)startXPClistener;
@end

@implementation DIBaseServiceDelegate

- (DIBaseServiceDelegate)init
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIBaseServiceDelegate;
  v2 = -[DIBaseServiceDelegate init](&v11, sel_init);
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create(0LL, MEMORY[0x1895F8AF8]),
        dispatchQueue = v2->_dispatchQueue,
        v2->_dispatchQueue = (OS_dispatch_queue *)v3,
        dispatchQueue,
        !v2->_dispatchQueue))
  {
    int v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v13 = 29;
      __int16 v14 = 2080;
      v15 = "-[DIBaseServiceDelegate init]";
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
        int v13 = 29;
        __int16 v14 = 2080;
        v15 = "-[DIBaseServiceDelegate init]";
        _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_ERROR, "%.*s: Failed creating queue", buf, 0x12u);
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

- (BOOL)setupNewConnection:(id)a3
{
  return 0;
}

- (id)serviceName
{
  return 0LL;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  int v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158722;
    int v13 = 60;
    __int16 v14 = 2080;
    v15 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
    __int16 v16 = 1024;
    int v17 = [v5 processIdentifier];
    __int16 v18 = 1024;
    int v19 = [v5 effectiveUserIdentifier];
    __int16 v20 = 1024;
    uid_t v21 = geteuid();
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158722;
      int v13 = 60;
      __int16 v14 = 2080;
      v15 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v16 = 1024;
      int v17 = [v5 processIdentifier];
      __int16 v18 = 1024;
      int v19 = [v5 effectiveUserIdentifier];
      __int16 v20 = 1024;
      uid_t v21 = geteuid();
      _os_log_impl( &dword_188046000,  v9,  OS_LOG_TYPE_DEFAULT,  "%.*s: Received connection from pid %d with euid %d. Our euid is %d",  buf,  0x24u);
    }
  }

  *__error() = v6;
  BOOL v10 = -[DIBaseServiceDelegate setupNewConnection:](self, "setupNewConnection:", v5);
  [v5 resume];
  -[DIBaseServiceDelegate validateConnection](self, "validateConnection");

  return v10;
}

- (void)createListener
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);
}

- (void)startXPClistener
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setDelegate:self];

  -[DIBaseServiceDelegate listener](self, "listener");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 resume];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end