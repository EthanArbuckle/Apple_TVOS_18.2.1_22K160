@interface _NSCFServer
+ (BOOL)startSocksServerWithPort:(int64_t)a3;
+ (BOOL)stopAll;
+ (id)adressesForInterface:(id)a3;
+ (id)listeners;
- (BOOL)isCoprocessorInterfaceEnabled;
- (BOOL)start;
- (BOOL)stop;
- (NSDictionary)configuration;
- (NSString)interface;
- (_NSCFServer)init;
- (_NSCFServer)initWithType:(int64_t)a3;
- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4;
- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4 interface:(id)a5;
- (int64_t)listenerPort;
- (int64_t)type;
- (uint64_t)startWithAcceptHandler:(uint64_t)a1;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setEnableCoprocessorInterface:(BOOL)a3;
- (void)setInterface:(id)a3;
- (void)setListenerPort:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _NSCFServer

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4 interface:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____NSCFServer;
  v9 = -[_NSCFServer init](&v13, sel_init);
  if (v9)
  {
    ++_listenerIDCounter;
    uint64_t v10 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
    listenerID = v9->_listenerID;
    v9->_listenerID = (NSNumber *)v10;

    -[_NSCFServer setType:](v9, "setType:", a3);
    -[_NSCFServer setListenerPort:](v9, "setListenerPort:", a4);
    -[_NSCFServer setInterface:](v9, "setInterface:", v8);
  }

  return v9;
}

- (_NSCFServer)initWithType:(int64_t)a3
{
  return -[_NSCFServer initWithType:port:interface:](self, "initWithType:port:interface:", a3, 0LL, 0LL);
}

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4
{
  return -[_NSCFServer initWithType:port:interface:](self, "initWithType:port:interface:", a3, a4, 0LL);
}

- (_NSCFServer)init
{
  return -[_NSCFServer initWithType:](self, "initWithType:", 0LL);
}

- (BOOL)start
{
  if (self->_type == 1)
  {
    uint64_t v3 = objc_opt_class();
    v4 = -[_NSCFServer configuration](self, "configuration");
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __20___NSCFServer_start__block_invoke;
    v8[3] = &unk_189C04990;
    id v9 = v4;
    uint64_t v10 = v3;
    v5 = v4;
    char v6 = -[_NSCFServer startWithAcceptHandler:]((uint64_t)self, v8);
  }

  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v5 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, "Error: Unknown Server Protocol Type", buf, 2u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)stop
{
  listener = self->_listener;
  if (listener)
  {
    tcp_listener_cancel();
    v4 = self->_listener;
    self->_listener = 0LL;
    v5 = +[_NSCFServer listeners]();
    [v5 setObject:0 forKeyedSubscript:self->_listenerID];
  }

  return listener != 0LL;
}

- (void)dealloc
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v3 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18298D000, v3, OS_LOG_TYPE_DEFAULT, "Listener deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSCFServer;
  -[_NSCFServer dealloc](&v4, sel_dealloc);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)listenerPort
{
  return self->_listenerPort;
}

- (void)setListenerPort:(int64_t)a3
{
  self->_listenerPort = a3;
}

- (NSString)interface
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInterface:(id)a3
{
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isCoprocessorInterfaceEnabled
{
  return self->_enableCoprocessorInterface;
}

- (void)setEnableCoprocessorInterface:(BOOL)a3
{
  self->_enableCoprocessorInterface = a3;
}

- (void).cxx_destruct
{
}

+ (id)listeners
{
  v0 = (void *)_listeners;
  if (!_listeners)
  {
    id v1 = objc_alloc_init(MEMORY[0x189603FC8]);
    v2 = (void *)_listeners;
    _listeners = (uint64_t)v1;

    v0 = (void *)_listeners;
  }

  return v0;
}

- (uint64_t)startWithAcceptHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create("listener-queue", v4);

    uint64_t v6 = tcp_listener_create();
    v7 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v6;

    if (*(void *)(a1 + 56))
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
      [MEMORY[0x189607968] numberWithInteger:*(void *)(a1 + 24)];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = [v9 stringValue];
      [v10 UTF8String];
      tcp_listener_set_port();

      location[1] = (id)MEMORY[0x1895F87A8];
      location[2] = (id)3221225472LL;
      location[3] = __38___NSCFServer_startWithAcceptHandler___block_invoke;
      location[4] = &unk_189C049B8;
      v17 = v5;
      id v18 = v3;
      tcp_listener_set_accept_handler();
      objc_initWeak(location, (id)a1);
      v11 = v8;
      objc_copyWeak(&v15, location);
      tcp_listener_set_error_handler();
      [(id)a1 interface];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        [*(id *)(a1 + 32) UTF8String];
        tcp_listener_set_interface();
      }

      tcp_listener_start();
      *(void *)(a1 + 24) = __rev16(tcp_listener_get_port());
      +[_NSCFServer listeners]();
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setObject:a1 forKeyedSubscript:*(void *)(a1 + 48)];

      dispatch_semaphore_signal(v11);
      a1 = *(void *)(a1 + 24) != 0LL;
      objc_destroyWeak(&v15);

      objc_destroyWeak(location);
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

+ (BOOL)startSocksServerWithPort:(int64_t)a3
{
  objc_super v4 = objc_alloc_init(&OBJC_CLASS____NSCFServer);
  -[_NSCFServer setListenerPort:](v4, "setListenerPort:", a3);
  LOBYTE(a3) = -[_NSCFServer startWithAcceptHandler:]((uint64_t)v4, &__block_literal_global_3052);

  return a3;
}

+ (BOOL)stopAll
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  objc_msgSend((id)_listeners, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) stop];
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  v7 = (void *)_listeners;
  _listeners = 0LL;

  return 1;
}

+ (id)adressesForInterface:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (getifaddrs(&v17)) {
    perror("getifaddrs");
  }
  uint64_t v5 = v17;
  if (!v17)
  {
    id v15 = 0LL;
    goto LABEL_23;
  }

  do
  {
    ifa_addr = v5->ifa_addr;
    if (ifa_addr && (v5->ifa_flags & 1) != 0)
    {
      int sa_family = ifa_addr->sa_family;
      if (sa_family == 30)
      {
        dispatch_semaphore_t v8 = &ifa_addr->sa_data[6];
      }

      else
      {
        if (sa_family != 2) {
          goto LABEL_20;
        }
        dispatch_semaphore_t v8 = &ifa_addr->sa_data[2];
      }

      __int128 v9 = inet_ntop(sa_family, v8, v22, 0x40u);
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      __int128 v10 = (os_log_s *)(id)CFNLog::logger;
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          ifa_name = v5->ifa_name;
          *(_DWORD *)buf = 136315394;
          v19 = ifa_name;
          __int16 v20 = 2080;
          v21 = v22;
          _os_log_impl(&dword_18298D000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s\n", buf, 0x16u);
        }

        [NSString stringWithUTF8String:v5->ifa_name];
        __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if ([v3 isEqualToString:v10])
        {
          [NSString stringWithUTF8String:v22];
          objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v13];
        }
      }

      else if (v11)
      {
        uint64_t v14 = v5->ifa_name;
        *(_DWORD *)buf = 136315138;
        v19 = v14;
        _os_log_impl(&dword_18298D000, v10, OS_LOG_TYPE_DEFAULT, "%s: inet_ntop failed!\n", buf, 0xCu);
      }
    }

@end