@interface NWUDPSession
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)hasBetterPath;
- (BOOL)isViable;
- (NSString)localPort;
- (NSString)privateDescription;
- (NSUInteger)maximumDatagramLength;
- (NWDatagramConnection)connection;
- (NWEndpoint)endpoint;
- (NWEndpoint)resolvedEndpoint;
- (NWParameters)parameters;
- (NWPath)currentPath;
- (NWUDPSession)initWithConnection:(id)a3;
- (NWUDPSession)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWUDPSession)initWithUpgradeForSession:(NWUDPSession *)session;
- (NWUDPSessionState)state;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)readHandler;
- (unint64_t)internalMTU;
- (unint64_t)maxReadDatagrams;
- (void)cancel;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readInternal;
- (void)setConnection:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setHasBetterPath:(BOOL)a3;
- (void)setInternalMTU:(unint64_t)a3;
- (void)setMaxReadDatagrams:(unint64_t)a3;
- (void)setReadHandler:(id)a3;
- (void)setReadHandler:(void *)handler maxDatagrams:(NSUInteger)maxDatagrams;
- (void)setResolvedEndpoint:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setViable:(BOOL)a3;
- (void)setupEventHandler;
- (void)tryNextResolvedEndpoint;
- (void)writeDatagram:(NSData *)datagram completionHandler:(void *)completionHandler;
- (void)writeMultipleDatagrams:(NSArray *)datagramArray completionHandler:(void *)completionHandler;
@end

@implementation NWUDPSession

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"maximumDatagramLength"])
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWUDPSession;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (NWUDPSession)initWithConnection:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWUDPSession initWithConnection:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v17, v18, v19, buf, 0xCu);
      }
    }

    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v18 = type;
        BOOL v26 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWUDPSession initWithConnection:]";
            __int16 v35 = 2082;
            v36 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v17,  v18,  "%{public}s called with null internalConnection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_31;
        }

        if (!v26) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v22 isEqualToString:@"connectionState"])
  {
    v11 = -[NWUDPSession connection](self, "connection");
    uint64_t v12 = [v11 connectionState];

    if (v12 == 3)
    {
      v13 = -[NWUDPSession connection](self, "connection");
      [v13 connectedRemoteEndpoint];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWUDPSession setResolvedEndpoint:](self, "setResolvedEndpoint:", v14);

      -[NWUDPSession setState:](self, "setState:", 3LL);
      -[NWUDPSession readInternal](self, "readInternal");
    }

    else
    {
      -[NWUDPSession setState:](self, "setState:", v12);
    }
  }

  else if ([v22 isEqualToString:@"hasBetterPath"])
  {
    v15 = -[NWUDPSession connection](self, "connection");
    -[NWUDPSession setHasBetterPath:](self, "setHasBetterPath:", [v15 hasBetterPath]);
  }

  else if ([v22 isEqualToString:@"viable"])
  {
    v16 = -[NWUDPSession connection](self, "connection");
    -[NWUDPSession setViable:](self, "setViable:", [v16 isViable]);
  }

  else if ([v22 isEqualToString:@"currentPath"])
  {
    v17 = -[NWUDPSession connection](self, "connection");
    [v17 currentPath];
    os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWUDPSession setCurrentPath:](self, "setCurrentPath:", v18);
    v19 = -[NWUDPSession currentPath](self, "currentPath");
    uint64_t v20 = [v19 maximumDatagramSize];

    v21 = self;
    objc_sync_enter(v21);
    if (v20 == -[NWUDPSession internalMTU](v21, "internalMTU"))
    {
      objc_sync_exit(v21);
    }

    else
    {
      -[NWUDPSession willChangeValueForKey:](v21, "willChangeValueForKey:", @"maximumDatagramLength");
      -[NWUDPSession setInternalMTU:](v21, "setInternalMTU:", v20);
      objc_sync_exit(v21);

      -[NWUDPSession didChangeValueForKey:](v21, "didChangeValueForKey:", @"maximumDatagramLength");
    }
  }
}

- (void)setupEventHandler
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObserver:self forKeyPath:@"connectionState" options:5 context:0];

  -[NWUDPSession connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self forKeyPath:@"hasBetterPath" options:5 context:0];

  -[NWUDPSession connection](self, "connection");
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObserver:self forKeyPath:@"viable" options:5 context:0];

  -[NWUDPSession connection](self, "connection");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObserver:self forKeyPath:@"currentPath" options:5 context:0];
}

- (NWUDPSession)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NWUDPSession;
  id v9 = -[NWUDPSession init](&v24, sel_init);
  id v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        os_log_type_t v18 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v17 = type;
        BOOL v20 = os_log_type_enabled(v16, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
            __int16 v27 = 2082;
            BOOL v28 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v20) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        os_log_type_t v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        os_log_type_t v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (NWUDPSession)initWithUpgradeForSession:(NWUDPSession *)session
{
  id v4 = session;
  -[NWUDPSession endpoint](v4, "endpoint");
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWUDPSession parameters](v4, "parameters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = -[NWUDPSession initWithEndpoint:parameters:](self, "initWithEndpoint:parameters:", v5, v6);
  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self forKeyPath:@"connectionState"];

  -[NWUDPSession connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self forKeyPath:@"viable"];

  -[NWUDPSession connection](self, "connection");
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeObserver:self forKeyPath:@"hasBetterPath"];

  -[NWUDPSession connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 removeObserver:self forKeyPath:@"currentPath"];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NWUDPSession;
  -[NWUDPSession dealloc](&v7, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  [v7 appendString:@"{"];
  -[NWUDPSession parameters](self, "parameters");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"parameters" indent:v5 showFullContent:v4];

  -[NWUDPSession endpoint](self, "endpoint");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"endpoint" indent:v5 showFullContent:v4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (id)description
{
  return  -[NWUDPSession descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWUDPSession descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (void)tryNextResolvedEndpoint
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 cancelCurrentEndpoint];
}

- (NSUInteger)maximumDatagramLength
{
  id v2 = self;
  objc_sync_enter(v2);
  NSUInteger v3 = -[NWUDPSession internalMTU](v2, "internalMTU");
  objc_sync_exit(v2);

  return v3;
}

- (void)readInternal
{
  uint64_t v3 = -[NWUDPSession readHandler](self, "readHandler");
  if (v3)
  {
    BOOL v4 = (void *)v3;
    -[NWUDPSession connection](self, "connection");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 connectionState];

    if (v6 == 3)
    {
      -[NWUDPSession connection](self, "connection");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v8 = -[NWUDPSession maxReadDatagrams](self, "maxReadDatagrams");
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __28__NWUDPSession_readInternal__block_invoke;
      v9[3] = &unk_189BBE158;
      v9[4] = self;
      [v7 readDatagramsWithMinimumCount:0 maximumCount:v8 completionHandler:v9];
    }
  }

- (void)setReadHandler:(void *)handler maxDatagrams:(NSUInteger)maxDatagrams
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (handler)
  {
    -[NWUDPSession setReadHandler:](self, "setReadHandler:");
    -[NWUDPSession setMaxReadDatagrams:](self, "setMaxReadDatagrams:", maxDatagrams);
    -[NWUDPSession readInternal](self, "readInternal");
    return;
  }

  __nwlog_obj();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
  id v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        id v10 = "%{public}s called with null handler";
LABEL_16:
        _os_log_impl(&dword_181A5C000, v8, v9, v10, buf, 0xCu);
      }
    }

    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
            __int16 v17 = 2082;
            os_log_type_t v18 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_18;
        }

        if (!v12) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        id v10 = "%{public}s called with null handler, no backtrace";
        goto LABEL_16;
      }

      __nwlog_obj();
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        id v10 = "%{public}s called with null handler, backtrace limit exceeded";
        goto LABEL_16;
      }
    }

- (void)writeMultipleDatagrams:(NSArray *)datagramArray completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  id v7 = datagramArray;
  -[NWUDPSession connection](self, "connection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 writeDatagrams:v7 completionHandler:v6];
}

- (void)writeDatagram:(NSData *)datagram completionHandler:(void *)completionHandler
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = completionHandler;
  id v7 = datagram;
  -[NWUDPSession connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 writeDatagrams:v9 completionHandler:v6];
}

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 cancel];
}

- (NSString)localPort
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 connectedLocalEndpoint];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 port];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NWUDPSessionState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 24LL, 1);
}

- (NWEndpoint)resolvedEndpoint
{
  return self->_resolvedEndpoint;
}

- (void)setResolvedEndpoint:(id)a3
{
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (NWPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
}

- (NWDatagramConnection)connection
{
  return (NWDatagramConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (unint64_t)maxReadDatagrams
{
  return self->_maxReadDatagrams;
}

- (void)setMaxReadDatagrams:(unint64_t)a3
{
  self->_maxReadDatagrams = a3;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setReadHandler:(id)a3
{
}

- (unint64_t)internalMTU
{
  return self->_internalMTU;
}

- (void)setInternalMTU:(unint64_t)a3
{
  self->_internalMTU = a3;
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

void __28__NWUDPSession_readInternal__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) readHandler];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [*(id *)(a1 + 32) readHandler];
    id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v7)[2](v7, v8, v5);

    [*(id *)(a1 + 32) readInternal];
  }
}

@end