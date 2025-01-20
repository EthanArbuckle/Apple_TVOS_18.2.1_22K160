@interface NEFilterExtensionProviderContext
- (NSString)description;
- (OS_dispatch_queue)queue;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEFilterExtensionProviderContext

- (OS_dispatch_queue)queue
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("NEFilterExtensionProviderContext queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }

  objc_sync_exit(v2);

  return v2->_queue;
}

- (NSString)description
{
  return self->_description;
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  v7 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  [v6 contentFilter];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 provider];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setFilterConfiguration:v9];

  if (v11)
  {
    [NSString stringWithFormat:@"[Extension: %@]", v11];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v10);
  }
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
}

- (void)stopWithReason:(int)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v5 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  else {
    uint64_t v7 = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_18A08D3E8;
  int v9 = a3;
  v8[4] = self;
  [v5 stopFilterWithReason:v7 completionHandler:v8];
}

- (void).cxx_destruct
{
}

uint64_t __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_CLASS___NEFilterExtensionProviderContext;
  objc_msgSendSuper2(&v4, sel_stopWithReason_, v2);
  return [*(id *)(a1 + 32) dispose];
}

@end