@interface NWResolver
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (NSArray)internalResolvedEndpointArray;
- (NSArray)resolvedEndpointArray;
- (NSSet)internalResolvedEndpoints;
- (NSSet)resolvedEndpoints;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWResolver)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWResolver)initWithPath:(id)a3;
- (OS_nw_resolver)internalResolver;
- (id)copyResolvedEndpointArray;
- (id)copyResolvedEndpoints;
- (int64_t)internalStatus;
- (int64_t)status;
- (void)dealloc;
- (void)setInternalResolvedEndpointArray:(id)a3;
- (void)setInternalResolvedEndpoints:(id)a3;
- (void)setInternalStatus:(int64_t)a3;
- (void)setUpdateHandler;
@end

@implementation NWResolver

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"status"] & 1) != 0
    || ([v4 isEqualToString:@"resolvedEndpoints"] & 1) != 0
    || ([v4 isEqualToString:@"resolvedEndpointArray"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWResolver;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setUpdateHandler
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
  }
  id v4 = (id)NWCopyInternalQueue_nwQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __30__NWResolver_setUpdateHandler__block_invoke;
  v5[3] = &unk_189BC85D8;
  objc_copyWeak(&v6, &location);
  nw_resolver_set_update_handler(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NWResolver)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NWResolver;
  v9 = -[NWResolver init](&v27, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWResolver initWithEndpoint:parameters:]";
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
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
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
            v29 = "-[NWResolver initWithEndpoint:parameters:]";
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
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }

      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }

- (NWResolver)initWithPath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NWResolver;
  unsigned __int8 v5 = -[NWResolver init](&v34, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWResolver initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_181A5C000, v27, v28, v29, buf, 0xCu);
      }
    }

    else
    {
      if (v32)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v28 = type;
        BOOL v31 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWResolver initWithPath:]";
            __int16 v37 = 2082;
            v38 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v27,  v28,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          v22 = (char *)backtrace_string;
LABEL_13:
          free(v22);
          goto LABEL_14;
        }

        if (!v31) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }

      __nwlog_obj();
      objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_resolver_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWResolver;
  -[NWResolver dealloc](&v4, sel_dealloc);
}

- (int64_t)status
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = -[NWResolver internalStatus](v2, "internalStatus");
  objc_sync_exit(v2);

  return v3;
}

- (id)copyResolvedEndpoints
{
  v2 = self;
  objc_sync_enter(v2);
  -[NWResolver internalResolvedEndpoints](v2, "internalResolvedEndpoints");
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)resolvedEndpoints
{
  return (NSSet *)-[NWResolver copyResolvedEndpoints](self, "copyResolvedEndpoints");
}

- (id)copyResolvedEndpointArray
{
  v2 = self;
  objc_sync_enter(v2);
  -[NWResolver internalResolvedEndpointArray](v2, "internalResolvedEndpointArray");
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)resolvedEndpointArray
{
  return (NSArray *)-[NWResolver copyResolvedEndpointArray](self, "copyResolvedEndpointArray");
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8LL, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16LL, 1);
}

- (OS_nw_resolver)internalResolver
{
  return (OS_nw_resolver *)objc_getProperty(self, a2, 24LL, 1);
}

- (int64_t)internalStatus
{
  return self->_internalStatus;
}

- (void)setInternalStatus:(int64_t)a3
{
  self->_internalStatus = a3;
}

- (NSSet)internalResolvedEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInternalResolvedEndpoints:(id)a3
{
}

- (NSArray)internalResolvedEndpointArray
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setInternalResolvedEndpointArray:(id)a3
{
}

- (void).cxx_destruct
{
}

void __30__NWResolver_setUpdateHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  object = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    objc_sync_enter(v7);
    uint64_t v8 = [v7 internalStatus];
    if (v8 != a2)
    {
      [v7 willChangeValueForKey:@"status"];
      [v7 setInternalStatus:a2];
    }

    objc_msgSend(v7, "willChangeValueForKey:", @"resolvedEndpoints", object);
    [v7 willChangeValueForKey:@"resolvedEndpointArray"];
    if (object)
    {
      [MEMORY[0x189603FA8] array];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __30__NWResolver_setUpdateHandler__block_invoke_2;
      v13[3] = &unk_189BC85B0;
      id v10 = v9;
      id v14 = v10;
      nw_array_apply(object, (uint64_t)v13);
      [v7 setInternalResolvedEndpointArray:v10];
      [MEMORY[0x189604010] setWithArray:v10];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setInternalResolvedEndpoints:v11];
    }

    else
    {
      [v7 setInternalResolvedEndpointArray:0];
      [v7 setInternalResolvedEndpoints:0];
    }

    objc_sync_exit(v7);

    [v7 didChangeValueForKey:@"resolvedEndpointArray"];
    [v7 didChangeValueForKey:@"resolvedEndpoints"];
    if (v8 != a2) {
      [v7 didChangeValueForKey:@"status"];
    }
  }
}

uint64_t __30__NWResolver_setUpdateHandler__block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1LL;
}

@end