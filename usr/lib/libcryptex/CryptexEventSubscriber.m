@interface CryptexEventSubscriber
+ (NSMutableDictionary)subscribers;
+ (OS_dispatch_queue)streamQueue;
+ (void)attachToStream:(id)a3 withRegistration:(id)a4;
+ (void)detachFromStream:(id)a3;
+ (void)initializeEventStream;
- (BOOL)active;
- (CryptexEventSubscriber)initWithFlags:(unint64_t)a3 name:(id)a4;
- (NSString)xpcEventName;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)_handleXPCEvent:(id)a3;
- (id)callback;
- (id)registerForEvents:(unint64_t)a3 onQueue:(id)a4 withCompletion:(id)a5;
- (unint64_t)flags;
- (void)cancel;
- (void)dealloc;
- (void)handleXPCEvent:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCallback:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CryptexEventSubscriber

+ (OS_dispatch_queue)streamQueue
{
  if (streamQueue_onceToken != -1) {
    dispatch_once(&streamQueue_onceToken, &__block_literal_global_0);
  }
  return (OS_dispatch_queue *)(id)_streamQueue;
}

void __37__CryptexEventSubscriber_streamQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.security.libcryptex.com.apple.security.cryptex.events", 0LL);
  v1 = (void *)_streamQueue;
  _streamQueue = (uint64_t)v0;
}

+ (NSMutableDictionary)subscribers
{
  if (subscribers_onceToken != -1) {
    dispatch_once(&subscribers_onceToken, &__block_literal_global_5);
  }
  +[CryptexEventSubscriber streamQueue](&OBJC_CLASS___CryptexEventSubscriber, "streamQueue");
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return (NSMutableDictionary *)(id)_subscribers;
}

void __37__CryptexEventSubscriber_subscribers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  v1 = (void *)_subscribers;
  _subscribers = (uint64_t)v0;
}

+ (void)initializeEventStream
{
  if (initializeEventStream_onceToken != -1) {
    dispatch_once(&initializeEventStream_onceToken, &__block_literal_global_7);
  }
}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke()
{
  id v0 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  xpc_set_event_stream_handler("com.apple.security.cryptex.events", v0, &__block_literal_global_10);
}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x1895F91D0];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, v2);
  v5 = +[CryptexEventSubscriber subscribers](&OBJC_CLASS___CryptexEventSubscriber, "subscribers");
  [NSString stringWithUTF8String:string];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v6];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 handleXPCEvent:v3];
}

+ (void)attachToStream:(id)a3 withRegistration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[CryptexEventSubscriber initializeEventStream](&OBJC_CLASS___CryptexEventSubscriber, "initializeEventStream");
  +[CryptexEventSubscriber streamQueue](&OBJC_CLASS___CryptexEventSubscriber, "streamQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke;
  v10[3] = &unk_18A207468;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[CryptexEventSubscriber subscribers](&OBJC_CLASS___CryptexEventSubscriber, "subscribers");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) xpcEventName];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = [*(id *)(a1 + 32) xpcEventName];
  [v5 UTF8String];
  xpc_set_event();
}

+ (void)detachFromStream:(id)a3
{
  id v3 = a3;
  +[CryptexEventSubscriber initializeEventStream](&OBJC_CLASS___CryptexEventSubscriber, "initializeEventStream");
  +[CryptexEventSubscriber streamQueue](&OBJC_CLASS___CryptexEventSubscriber, "streamQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CryptexEventSubscriber_detachFromStream___block_invoke;
  block[3] = &unk_18A207490;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __43__CryptexEventSubscriber_detachFromStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) xpcEventName];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectForKey:v3];

  id v4 = [*(id *)(a1 + 32) xpcEventName];
  [v4 UTF8String];
  xpc_set_event();
}

- (CryptexEventSubscriber)initWithFlags:(unint64_t)a3 name:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___CryptexEventSubscriber;
    id v8 = -[CryptexEventSubscriber init](&v14, sel_init);
    if (v8)
    {
      os_log_t v9 = os_log_create("com.apple.libcryptex", "event_subscriber");
      log = v8->_log;
      v8->_log = v9;

      v8->_flags = a3;
      v8->_active = 0;
      queue = v8->_queue;
      v8->_queue = 0LL;

      objc_storeStrong((id *)&v8->_xpcEventName, a4);
    }

    self = v8;
    id v12 = self;
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)registerForEvents:(unint64_t)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = (dispatch_queue_s *)a4;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v8)
  {
    v18 = -[CryptexEventSubscriber log](self, "log");
    if (v18)
    {
      -[CryptexEventSubscriber log](self, "log");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]",  "event.m",  118,  "com.apple.security.cryptex",  3LL,  0LL,  v20);
    goto LABEL_12;
  }

  if (!v9)
  {
    v21 = -[CryptexEventSubscriber log](self, "log");
    if (v21)
    {
      -[CryptexEventSubscriber log](self, "log");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]",  "event.m",  125,  "com.apple.security.cryptex",  3LL,  0LL,  v20);
LABEL_12:
    CFErrorRef v17 = Error;
    free(v20);
    goto LABEL_13;
  }

  -[CryptexEventSubscriber setCallback:](self, "setCallback:", v9);
  dispatch_queue_attr_make_initially_inactive(0LL);
  id v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.security.libcryptex.event_subscriber", v11);

  -[CryptexEventSubscriber setQueue:](self, "setQueue:", v12);
  -[CryptexEventSubscriber queue](self, "queue");
  v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v13, v8);

  -[CryptexEventSubscriber queue](self, "queue");
  objc_super v14 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  dispatch_activate(v14);

  -[CryptexEventSubscriber setActive:](self, "setActive:", 1LL);
  uint64_t v15 = cryptex_event_mask_ext_to_int(a3);
  xpc_dictionary_set_uint64(v10, "CryptexEventMask", v15);
  v16 = getprogname();
  xpc_dictionary_set_string(v10, "CryptexEventClientName", v16);
  +[CryptexEventSubscriber attachToStream:withRegistration:]( &OBJC_CLASS___CryptexEventSubscriber,  "attachToStream:withRegistration:",  self,  v10);
  CFErrorRef v17 = 0LL;
LABEL_13:

  return v17;
}

- (void)cancel
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __32__CryptexEventSubscriber_cancel__block_invoke;
    block[3] = &unk_18A207490;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __32__CryptexEventSubscriber_cancel__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) active])
  {
    [*(id *)(a1 + 32) setActive:0];
    [*(id *)(a1 + 32) setCallback:0];
    [*(id *)(a1 + 32) setQueue:0];
    +[CryptexEventSubscriber detachFromStream:]( &OBJC_CLASS___CryptexEventSubscriber,  "detachFromStream:",  *(void *)(a1 + 32));
    if (v2) {
      (*((void (**)(id, void, void, void))v2 + 2))(v2, 0LL, 0LL, 0LL);
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CryptexEventSubscriber;
  -[CryptexEventSubscriber dealloc](&v3, sel_dealloc);
}

- (id)_handleXPCEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v29 = 0LL;
  uint64_t v30 = 0LL;
  size_t length = 0LL;
  -[CryptexEventSubscriber queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[CryptexEventSubscriber active](self, "active"))
  {
    xpc_object_t v10 = 0LL;
    CFErrorRef v11 = 0LL;
    goto LABEL_23;
  }

  -[CryptexEventSubscriber callback](self, "callback");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CryptexEventSubscriber log](self, "log");
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CryptexEventSubscriber log](self, "log");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      LOWORD(v31) = 0;
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      LOWORD(v31) = 0;
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexEventSubscriber _handleXPCEvent:]",  "event.m",  201,  "com.apple.security.cryptex",  3LL,  0LL,  v9);
    goto LABEL_22;
  }

  if (_xpc_dictionary_try_get_uint64(v4, "CRYPTEX_EVENT_TYPE", (uint64_t *)&v30))
  {
    -[CryptexEventSubscriber log](self, "log");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CryptexEventSubscriber log](self, "log");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexEventSubscriber _handleXPCEvent:]",  "event.m",  210,  "com.apple.security.cryptex",  3LL,  0LL,  v9);
LABEL_22:
    CFErrorRef v11 = Error;
    free(v9);
    xpc_object_t v10 = 0LL;
    goto LABEL_23;
  }

  if (_xpc_dictionary_try_get_string(v4, "CRYPTEX_EVENT_CRYPTEX_NAME", &v29))
  {
    -[CryptexEventSubscriber log](self, "log");
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CryptexEventSubscriber log](self, "log");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexEventSubscriber _handleXPCEvent:]",  "event.m",  219,  "com.apple.security.cryptex",  3LL,  0LL,  v9);
    goto LABEL_22;
  }

  data = xpc_dictionary_get_data(v4, "CRYPTEX_EVENT_INFO", &length);
  if (!data)
  {
    xpc_object_t v10 = 0LL;
    CFErrorRef v11 = 0LL;
    goto LABEL_25;
  }

  v18 = (void *)MEMORY[0x1896079E8];
  [MEMORY[0x189603F48] dataWithBytes:data length:length];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  [v18 propertyListWithData:v19 options:0 format:0 error:&v27];
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFErrorRef v11 = (CFErrorRef)v27;

  if (v10)
  {
LABEL_25:
    uint64_t v24 = cryptex_event_type_int_to_ext(v30);
    -[CryptexEventSubscriber callback](self, "callback");
    v25 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, uint64_t, const char *, void *))v25)[2](v25, v24, v29, v10);

    goto LABEL_23;
  }
  v20 = -[CryptexEventSubscriber log](self, "log");
  if (v20)
  {
    -[CryptexEventSubscriber log](self, "log");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    LOWORD(v31) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();
  }

  else
  {
    LOWORD(v31) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();
  }

  CFErrorRef v26 = createError( "-[CryptexEventSubscriber _handleXPCEvent:]",  "event.m",  232,  "com.apple.security.cryptex",  3LL,  v11,  v22);
  free(v22);

  xpc_object_t v10 = 0LL;
  CFErrorRef v11 = v26;
LABEL_23:

  return v11;
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  -[CryptexEventSubscriber queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__CryptexEventSubscriber_handleXPCEvent___block_invoke;
  v7[3] = &unk_18A207468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__CryptexEventSubscriber_handleXPCEvent___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) _handleXPCEvent:*(void *)(a1 + 40)];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    int v3 = *__error();
    [*(id *)(a1 + 32) log];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 138543618;
      id v6 = v2;
      __int16 v7 = 1024;
      int v8 = 72;
      _os_log_impl( &dword_1881FF000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to handle XPC event: %{public}@: %{darwin.errno}d",  (uint8_t *)&v5,  0x12u);
    }

    *__error() = v3;
  }
}

- (NSString)xpcEventName
{
  return self->_xpcEventName;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end