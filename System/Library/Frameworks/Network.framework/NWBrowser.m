@interface NWBrowser
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (NSSet)discoveredEndpoints;
- (NSSet)internalDiscoveredEndpoints;
- (NWBrowseDescriptor)descriptor;
- (NWBrowser)initWithDescriptor:(id)a3 parameters:(id)a4;
- (NWParameters)parameters;
- (OS_nw_browser)internalBrowser;
- (id)copyDiscoveredEndpoints;
- (void)cancel;
- (void)dealloc;
- (void)setInternalDiscoveredEndpoints:(id)a3;
- (void)setUpdateHandler;
@end

@implementation NWBrowser

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"discoveredEndpoints"])
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWBrowser;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setUpdateHandler
{
  v3 = (nw_browser *)objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
  }
  id v4 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
  nw_browser_set_queue(v3, v4);

  -[NWBrowser internalBrowser](self, "internalBrowser");
  unsigned __int8 v5 = (nw_browser *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __29__NWBrowser_setUpdateHandler__block_invoke;
  handler[3] = &unk_189BC4D10;
  objc_copyWeak(&v8, &location);
  handler[4] = self;
  nw_browser_set_browse_results_changed_handler(v5, handler);

  -[NWBrowser internalBrowser](self, "internalBrowser");
  v6 = (nw_browser *)objc_claimAutoreleasedReturnValue();
  nw_browser_start(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NWBrowser)initWithDescriptor:(id)a3 parameters:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NWBrowser;
  v9 = -[NWBrowser init](&v27, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWBrowser initWithDescriptor:parameters:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_181A5C000, v20, v21, v22, buf, 0xCu);
      }
    }

    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        BOOL v24 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWBrowser initWithDescriptor:parameters:]";
            __int16 v30 = 2082;
            v31 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v20,  v21,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }

        if (!v24) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }

      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWBrowser internalBrowser](self, "internalBrowser");
    id v4 = (nw_browser *)objc_claimAutoreleasedReturnValue();
    nw_browser_cancel(v4);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWBrowser;
  -[NWBrowser dealloc](&v3, sel_dealloc);
}

- (id)copyDiscoveredEndpoints
{
  v2 = self;
  objc_sync_enter(v2);
  -[NWBrowser internalDiscoveredEndpoints](v2, "internalDiscoveredEndpoints");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)discoveredEndpoints
{
  return (NSSet *)-[NWBrowser copyDiscoveredEndpoints](self, "copyDiscoveredEndpoints");
}

- (NWBrowseDescriptor)descriptor
{
  return (NWBrowseDescriptor *)objc_getProperty(self, a2, 8LL, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16LL, 1);
}

- (OS_nw_browser)internalBrowser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSSet)internalDiscoveredEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInternalDiscoveredEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
}

void __29__NWBrowser_setUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v16 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained && a4)
  {
    id v10 = WeakRetained;
    objc_sync_enter(v10);
    objc_msgSend(v10, "willChangeValueForKey:", @"discoveredEndpoints", v16);
    [MEMORY[0x189603FA8] array];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) internalBrowser];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    nw_browser_copy_browse_results(v12);
    nw_browser_t v13 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __29__NWBrowser_setUpdateHandler__block_invoke_2;
      v17[3] = &unk_189BC85B0;
      id v14 = v11;
      id v18 = v14;
      nw_array_apply(v13, (uint64_t)v17);
      [MEMORY[0x189604010] setWithArray:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setInternalDiscoveredEndpoints:v15];
    }

    else
    {
      [v10 setInternalDiscoveredEndpoints:0];
    }

    [v10 didChangeValueForKey:@"discoveredEndpoints"];

    objc_sync_exit(v10);
  }
}

uint64_t __29__NWBrowser_setUpdateHandler__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id endpoint = nw_browse_result_get_endpoint(a3);
  +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", endpoint);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1LL;
}

@end