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
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIBaseServiceDelegate;
  v2 = -[DIBaseServiceDelegate init](&v16, "init");
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create(0LL, &_dispatch_queue_attr_concurrent),
        dispatchQueue = v2->_dispatchQueue,
        v2->_dispatchQueue = (OS_dispatch_queue *)v3,
        dispatchQueue,
        !v2->_dispatchQueue))
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
      int v18 = 29;
      __int16 v19 = 2080;
      v20 = "-[DIBaseServiceDelegate init]";
      LODWORD(v14) = 18;
      v10 = (char *)_os_log_send_and_compose_impl( v9,  &v15,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "%.*s: Failed creating queue",  (int)buf,  v14);

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
        int v18 = 29;
        __int16 v19 = 2080;
        v20 = "-[DIBaseServiceDelegate init]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed creating queue", buf, 0x12u);
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
  id v5 = a4;
  int v6 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v17 = 0LL;
    uint64_t v7 = sub_1000BE278();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    *(_DWORD *)buf = 68158722;
    int v19 = 60;
    __int16 v20 = 2080;
    v21 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
    __int16 v22 = 1024;
    unsigned int v23 = [v5 processIdentifier];
    __int16 v24 = 1024;
    unsigned int v25 = [v5 effectiveUserIdentifier];
    __int16 v26 = 1024;
    uid_t v27 = geteuid();
    LODWORD(v15) = 36;
    v10 = (char *)_os_log_send_and_compose_impl( v9,  &v17,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Received connection from pid %d with euid %d. Our euid is %d",  (int)buf,  v15,  v16);

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
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158722;
      int v19 = 60;
      __int16 v20 = 2080;
      v21 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v22 = 1024;
      unsigned int v23 = [v5 processIdentifier];
      __int16 v24 = 1024;
      unsigned int v25 = [v5 effectiveUserIdentifier];
      __int16 v26 = 1024;
      uid_t v27 = geteuid();
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Received connection from pid %d with euid %d. Our euid is %d",  buf,  0x24u);
    }
  }

  *__error() = v6;
  BOOL v13 = -[DIBaseServiceDelegate setupNewConnection:](self, "setupNewConnection:", v5);
  [v5 resume];
  -[DIBaseServiceDelegate validateConnection](self, "validateConnection");

  return v13;
}

- (void)createListener
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);
}

- (void)startXPClistener
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
  [v3 setDelegate:self];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
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