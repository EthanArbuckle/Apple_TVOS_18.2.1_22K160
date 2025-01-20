@interface TKCtkdRunner
- (BOOL)hasRegistry;
- (OS_dispatch_source)sigTermSource;
- (TKCtkdRunner)initWithArgc:(int)a3 argv:(const char *)a4;
- (TKHostTokenDriverCache)tokenDriverCache;
- (TKHostTokenRegistry)tokenRegistry;
- (TKSlotServer)slotServer;
- (TKSlotWatcher)slotWatcher;
- (TKTokenServer)tokenServer;
- (void)ensureSlotWatcherIsRunning;
- (void)run;
@end

@implementation TKCtkdRunner

- (TKHostTokenDriverCache)tokenDriverCache
{
  tokenDriverCache = self->_tokenDriverCache;
  if (!tokenDriverCache)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TKHostTokenDriverCache);
    v5 = self->_tokenDriverCache;
    self->_tokenDriverCache = v4;

    tokenDriverCache = self->_tokenDriverCache;
  }

  return tokenDriverCache;
}

- (TKHostTokenRegistry)tokenRegistry
{
  tokenRegistry = self->_tokenRegistry;
  if (!tokenRegistry)
  {
    v4 = objc_alloc(&OBJC_CLASS___TKHostTokenRegistry);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenDriverCache](self, "tokenDriverCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    v7 = objc_alloc_init(&OBJC_CLASS___TKHostKeychainHandler);
    v8 = -[TKHostTokenRegistry initWithDriverCache:listener:keychain:]( v4,  "initWithDriverCache:listener:keychain:",  v5,  v6,  v7);
    v9 = self->_tokenRegistry;
    self->_tokenRegistry = v8;

    tokenRegistry = self->_tokenRegistry;
  }

  return tokenRegistry;
}

- (BOOL)hasRegistry
{
  return self->_tokenRegistry != 0LL;
}

- (TKCtkdRunner)initWithArgc:(int)a3 argv:(const char *)a4
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TKCtkdRunner;
  v6 = -[TKCtkdRunner init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    -[TKCtkdRunner initializeSandBox](v6, "initializeSandBox");
    uint64_t v8 = TKClientTokenServerPortName;
    uint64_t v9 = TKProtocolSlotRegistryName;
    uint64_t v10 = TKProtocolSlotClientName;
    do
    {
      while (1)
      {
        int v11 = getopt(a3, (char *const *)a4, "stw");
        if (v11 <= 115) {
          break;
        }
        if (v11 == 116)
        {
          v13 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v8);
          v19 = -[TKTokenServer initWithTokenServer:]( objc_alloc(&OBJC_CLASS___TKTokenServer),  "initWithTokenServer:",  v13);
          tokenServer = v7->_tokenServer;
          v7->_tokenServer = v19;

          id v21 = -[TKCtkdRunner tokenRegistry](v7, "tokenRegistry");
LABEL_10:
        }

        else if (v11 == 119)
        {
          v12 = objc_alloc(&OBJC_CLASS___TKSlotWatcher);
          v13 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenRegistry](v7, "tokenRegistry"));
          v14 = -[TKSlotWatcher initWithTokenRegistry:](v12, "initWithTokenRegistry:", v13);
          slotWatcher = v7->_slotWatcher;
          v7->_slotWatcher = v14;

          goto LABEL_10;
        }
      }

      if (v11 == 115)
      {
        v13 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v9);
        v16 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v10);
        v17 = -[TKSlotServer initWithRegistryListener:clientListener:]( objc_alloc(&OBJC_CLASS___TKSlotServer),  "initWithRegistryListener:clientListener:",  v13,  v16);
        slotServer = v7->_slotServer;
        v7->_slotServer = v17;

        goto LABEL_10;
      }
    }

    while (v11 != -1);
  }

  return v7;
}

- (void)ensureSlotWatcherIsRunning
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v5 = -[NSXPCConnection initWithMachServiceName:options:]( v3,  "initWithMachServiceName:options:",  TKProtocolSlotClientName,  4096LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner slotWatcher](self, "slotWatcher"));
  [v4 startWithSlotServer:v5];
}

- (void)run
{
  id v3 = sub_10000318C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010214(self, v4);
  }

  v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  &_dispatch_main_q);
  sigTermSource = self->_sigTermSource;
  self->_sigTermSource = v5;

  v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner sigTermSource](self, "sigTermSource"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000031CC;
  handler[3] = &unk_10001C5E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  uint64_t v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner sigTermSource](self, "sigTermSource"));
  dispatch_activate(v8);

  signal(15, (void (__cdecl *)(int))1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner slotServer](self, "slotServer"));

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner slotServer](self, "slotServer"));
    [v10 start];

    LODWORD(out_token) = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000032B8;
    v22[3] = &unk_10001C610;
    v22[4] = self;
    notify_register_dispatch( (const char *)[@"com.apple.system.loginwindow.desktopUp" UTF8String],  (int *)&out_token,  &_dispatch_main_q,  v22);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenServer](self, "tokenServer"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenServer](self, "tokenServer"));
    [v12 start];
  }

  if (-[TKCtkdRunner hasRegistry](self, "hasRegistry"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003314;
    block[3] = &unk_10001C5E8;
    block[4] = self;
    dispatch_async(v14, block);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner slotWatcher](self, "slotWatcher"));

  if (v15)
  {
    -[TKCtkdRunner ensureSlotWatcherIsRunning](self, "ensureSlotWatcherIsRunning");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenServer](self, "tokenServer"));

    if (v16)
    {
      objc_initWeak(&out_token, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100003388;
      v18[3] = &unk_10001C638;
      objc_copyWeak(&v19, &out_token);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TKCtkdRunner tokenServer](self, "tokenServer"));
      [v17 setEnsureSlotWatcherIsRunning:v18];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&out_token);
    }
  }

- (TKTokenServer)tokenServer
{
  return self->_tokenServer;
}

- (TKSlotServer)slotServer
{
  return self->_slotServer;
}

- (TKSlotWatcher)slotWatcher
{
  return self->_slotWatcher;
}

- (OS_dispatch_source)sigTermSource
{
  return self->_sigTermSource;
}

- (void).cxx_destruct
{
}

@end