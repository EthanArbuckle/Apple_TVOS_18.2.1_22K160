@interface NEProviderServer
+ (NEProviderServer)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEExtensionProviderContext)firstContext;
- (void)generateProviderEndpointInfoInMessage:(id)a3 extensionPoint:(id)a4;
- (void)removeProviderContext:(id)a3;
- (void)start;
@end

@implementation NEProviderServer

- (void)generateProviderEndpointInfoInMessage:(id)a3 extensionPoint:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  xpc_object_t xdict = a3;
  id v6 = a4;
  v7 = v6;
  if (!self) {
    goto LABEL_20;
  }
  if (([v6 isEqualToString:@"com.apple.networkextension.filter-data"] & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", @"com.apple.networkextension.app-proxy", xdict) & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.packet-tunnel"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.dns-proxy"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.filter-packet"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.networkextension.app-push"] & 1) != 0)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSMutableArray count](self->_listeners, "count")) {
      goto LABEL_10;
    }
    listeners = self->_listeners;
    uint64_t v21 = MEMORY[0x1895F87A8];
    uint64_t v22 = 3221225472LL;
    v23 = __49__NEProviderServer_getListenerForExtensionPoint___block_invoke;
    v24 = &unk_18A0901F8;
    id v11 = v9;
    id v25 = v11;
    uint64_t v12 = -[NSMutableArray indexOfObjectPassingTest:](listeners, "indexOfObjectPassingTest:", &v21);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_listeners, "objectAtIndexedSubscript:", v12);
      self = (NEProviderServer *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
LABEL_10:
      v13 = objc_alloc(&OBJC_CLASS___NEProviderXPCListener);
      id v11 = v9;
      if (v13
        && (v26.receiver = v13,
            v26.super_class = (Class)&OBJC_CLASS___NEProviderXPCListener,
            (v14 = -[NEProviderServer initWithServiceName:](&v26, sel_initWithServiceName_, &stru_18A0915E8)) != 0LL))
      {
        v15 = v14;
        objc_storeStrong((id *)&v14[2]._listeners, v9);

        -[NEProviderServer setDelegate:](v15, "setDelegate:", self);
        -[NEProviderServer resume](v15, "resume");
        v16 = self->_listeners;
        if (!v16)
        {
          v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
          v18 = self->_listeners;
          self->_listeners = v17;

          v16 = self->_listeners;
        }

        -[NSMutableArray addObject:](v16, "addObject:", v15, xdict, v21, v22, v23, v24);
        self = v15;
      }

      else
      {

        self = 0LL;
      }
    }
  }

  else
  {
    ne_log_obj();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v26.receiver) = 138412290;
      *(id *)((char *)&v26.receiver + 4) = v7;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Failed to create a listener, extension point is not supported: %@",  (uint8_t *)&v26,  0xCu);
    }

    self = 0LL;
  }

  if (self)
  {
    v7 = -[NEProviderServer endpoint](self, "endpoint");
    [v7 _endpoint];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(xdict, "listener-endpoint", v19);

LABEL_20:
  }
}

- (NEExtensionProviderContext)firstContext
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableArray firstObject](v2->_contexts, "firstObject");
  objc_sync_exit(v2);

  return (NEExtensionProviderContext *)v3;
}

- (void)start
{
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __25__NEProviderServer_start__block_invoke;
  handler[3] = &unk_18A090220;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.networkextension.provider.matching", MEMORY[0x1895F8AE0], handler);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      uint64_t v22 = "Got a non-provider listener";
      v23 = (os_log_s *)v16;
      uint32_t v24 = 2;
LABEL_16:
      _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&buf, v24);
    }

- (void)removeProviderContext:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_contexts, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

void __25__NEProviderServer_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, "extension-point");
  if (string && (id v5 = string, *string))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    id v7 = *(void **)(a1 + 32);
    [NSString stringWithUTF8String:v5];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 generateProviderEndpointInfoInMessage:reply extensionPoint:v8];

    xpc_dictionary_send_reply();
  }

  else
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "com.apple.networkextension.provider.matching";
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Received a %s event without an extension point",  (uint8_t *)&v10,  0xCu);
    }
  }
}

uint64_t __49__NEProviderServer_getListenerForExtensionPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 56);
  }
  else {
    v2 = 0LL;
  }
  return [v2 isEqualToString:*(void *)(a1 + 32)];
}

+ (NEProviderServer)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_23163);
  }
  return (NEProviderServer *)(id)sharedServer_g_server;
}

void __32__NEProviderServer_sharedServer__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NEProviderServer);
  v1 = (void *)sharedServer_g_server;
  sharedServer_g_server = (uint64_t)v0;
}

@end