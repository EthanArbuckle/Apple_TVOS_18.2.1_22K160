@interface NWPathEvaluator
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)copySavedPathEvaluatorForEndpoint:(id)a3 parameters:(id)a4;
+ (id)sharedDefaultEvaluator;
+ (void)initialize;
+ (void)savePathEvaluator:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesEndpoint:(id)a3 parameters:(id)a4;
- (BOOL)requestNexus;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWPath)internalPath;
- (NWPath)path;
- (NWPathEvaluator)init;
- (NWPathEvaluator)initWithBrowseDescriptor:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithEvaluator:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithListenParameters:(id)a3;
- (OS_nw_path_evaluator)internalEvaluator;
- (id)copyPath;
- (unint64_t)hash;
- (void)dealloc;
- (void)satisfyPathAgentsWithCompletionHandler:(id)a3;
- (void)setInternalPath:(id)a3;
- (void)triggerPathAgentsIncludingVoluntary:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)triggerVoluntaryPathAgentsWithCompletionHandler:(id)a3;
@end

@implementation NWPathEvaluator

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWPathEvaluator;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    v3 = (void *)savedPathEvaluators;
    savedPathEvaluators = v2;

    uint64_t v4 = objc_opt_new();
    unsigned __int8 v5 = (void *)savedPathEvaluatorsLock;
    savedPathEvaluatorsLock = v4;
  }

+ (id)copySavedPathEvaluatorForEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v7);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (id)savedPathEvaluators;
  id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "matchesEndpoint:parameters:", v5, v6, (void)v14))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }

      id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

+ (void)savePathEvaluator:(id)a3
{
  id v4 = a3;
  id v3 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v3);
  [(id)savedPathEvaluators addObject:v4];
  objc_sync_exit(v3);
}

+ (id)sharedDefaultEvaluator
{
  if (sharedDefaultEvaluator_initEvaluator != -1) {
    dispatch_once(&sharedDefaultEvaluator_initEvaluator, &__block_literal_global_86488);
  }
  return (id)sharedDefaultEvaluator_sharedEvaluator;
}

void __41__NWPathEvaluator_sharedDefaultEvaluator__block_invoke()
{
  v0 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  0LL,  0LL);
  v1 = (void *)sharedDefaultEvaluator_sharedEvaluator;
  sharedDefaultEvaluator_sharedEvaluator = (uint64_t)v0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWPathEvaluator;
  -[NWPathEvaluator dealloc](&v3, sel_dealloc);
}

- (NWPathEvaluator)initWithEvaluator:(id)a3 parameters:(id)a4
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __nwlog_obj();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v52 = 0;
    if (__nwlog_fault(v34, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_181A5C000, v35, v36, "%{public}s called with null evaluator", location, 0xCu);
        }
      }

      else if (v52)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v42 = type;
        BOOL v43 = os_log_type_enabled(v35, type);
        if (backtrace_string)
        {
          if (v43)
          {
            *(_DWORD *)location = 136446466;
            *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            __int16 v55 = 2082;
            v56 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v35,  v42,  "%{public}s called with null evaluator, dumping backtrace:%{public}s",  location,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_58;
        }

        if (v43)
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl( &dword_181A5C000,  v35,  v42,  "%{public}s called with null evaluator, no backtrace",  location,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v47 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl( &dword_181A5C000,  v35,  v47,  "%{public}s called with null evaluator, backtrace limit exceeded",  location,  0xCu);
        }
      }
    }

- (NWPathEvaluator)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NWPathEvaluator copySavedPathEvaluatorForEndpoint:parameters:]( &OBJC_CLASS___NWPathEvaluator,  "copySavedPathEvaluatorForEndpoint:parameters:",  v7,  v8);
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v13 = [v8 copy];
    uint64_t v14 = (void *)v13;
    if (!v8 || v13)
    {
      [v7 internalEndpoint];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 internalParameters];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v20, v21);
      self = -[NWPathEvaluator initWithEvaluator:parameters:]( self,  "initWithEvaluator:parameters:",  evaluator_for_endpoint,  v14);

      if (self)
      {
        objc_storeStrong((id *)&self->_endpoint, a3);
        +[NWPathEvaluator savePathEvaluator:](&OBJC_CLASS___NWPathEvaluator, "savePathEvaluator:", self);
        self = self;
        v12 = self;
LABEL_24:

        goto LABEL_25;
      }

- (NWPathEvaluator)initWithBrowseDescriptor:(id)a3 parameters:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 copy];
  id v9 = (void *)v8;
  if (v7 && !v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
    __int16 v29 = 2114;
    id v30 = v7;
    id v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (__nwlog_fault(v11, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        os_log_type_t v23 = v12;
        os_log_type_t v24 = v13;
        goto LABEL_20;
      }

      if (!v25)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v20 = type;
      BOOL v21 = os_log_type_enabled(v12, type);
      if (!backtrace_string)
      {
        if (!v21)
        {
LABEL_21:

          if (!v11) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }

        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed, no backtrace";
        os_log_type_t v23 = v12;
        os_log_type_t v24 = v20;
LABEL_20:
        _os_log_impl(&dword_181A5C000, v23, v24, v14, buf, 0x16u);
        goto LABEL_21;
      }

      if (v21)
      {
        *(_DWORD *)buf = 136446722;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        __int16 v31 = 2082;
        v32 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v12,  v20,  "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s",  buf,  0x20u);
      }

      free(backtrace_string);
    }

    if (!v11)
    {
LABEL_15:
      os_log_type_t v18 = 0LL;
      goto LABEL_16;
    }

- (NWPathEvaluator)initWithListenParameters:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  id v6 = v5;
  if (v4 && !v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
    __int16 v25 = 2114;
    id v26 = v4;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v21 = 0;
    if (__nwlog_fault(v8, &type, &v21))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        id v19 = v9;
        os_log_type_t v20 = v10;
        goto LABEL_20;
      }

      if (!v21)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v17)
        {
LABEL_21:

          if (!v8) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }

        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed, no backtrace";
        id v19 = v9;
        os_log_type_t v20 = v16;
LABEL_20:
        _os_log_impl(&dword_181A5C000, v19, v20, v11, buf, 0x16u);
        goto LABEL_21;
      }

      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        __int16 v27 = 2082;
        BOOL v28 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v9,  v16,  "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s",  buf,  0x20u);
      }

      free(backtrace_string);
    }

    if (!v8)
    {
LABEL_15:
      uint64_t v14 = 0LL;
      goto LABEL_16;
    }

- (NWPathEvaluator)init
{
  return -[NWPathEvaluator initWithEndpoint:parameters:](self, "initWithEndpoint:parameters:", 0LL, 0LL);
}

- (id)copyPath
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  -[NWPathEvaluator internalPath](v2, "internalPath");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NWPath)path
{
  return (NWPath *)-[NWPathEvaluator copyPath](self, "copyPath");
}

- (void)triggerPathAgentsIncludingVoluntary:(BOOL)a3 withCompletionHandler:(id)a4
{
  os_log_type_t v13 = (void (**)(id, id, void))a4;
  xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  -[NWPathEvaluator internalEvaluator](self, "internalEvaluator");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = nw_path_evaluator_trigger_agents(v7, a3, 0, v6);

  switch(v8)
  {
    case 2:
      id v11 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v12 = 2LL;
LABEL_7:
      id v10 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", @"NWPathEvaluatorErrorDomain", v12, 0, v13);
      v13[2](v13, v10, 0LL);
      goto LABEL_8;
    case 1:
      id v11 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v12 = 1LL;
      goto LABEL_7;
    case 0:
      [MEMORY[0x189603FE0] set];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke;
      applier[3] = &unk_189BC8CB8;
      id v15 = v9;
      id v10 = v9;
      xpc_array_apply(v6, applier);
      ((void (**)(id, id, id))v13)[2](v13, 0LL, v10);

LABEL_8:
      break;
  }
}

- (void)satisfyPathAgentsWithCompletionHandler:(id)a3
{
}

- (void)triggerVoluntaryPathAgentsWithCompletionHandler:(id)a3
{
}

- (BOOL)requestNexus
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = nw_path_evaluator_request_nexus(v2);

  return v3;
}

- (BOOL)matchesEndpoint:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NWPathEvaluator endpoint](self, "endpoint");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  id v10 = v9;
  int v11 = v8 == v9;
  if (v8 != v9 && v8 && v9)
  {
    if (![v8 isMemberOfClass:objc_opt_class()])
    {

      char v13 = 0;
      uint64_t v14 = v8;
LABEL_16:

      goto LABEL_17;
    }

    int v11 = [v8 isEqual:v10];
  }

  if (v11)
  {
    -[NWPathEvaluator parameters](self, "parameters");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v6;
    id v8 = v12;
    char v13 = v10 == v12;
    if (v10 != v12 && v10 && v12)
    {
      else {
        char v13 = 0;
      }
    }

    uint64_t v14 = v10;
    goto LABEL_16;
  }

  char v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    [v5 endpoint];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 parameters];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v8 = -[NWPathEvaluator matchesEndpoint:parameters:](self, "matchesEndpoint:parameters:", v6, v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[NWPathEvaluator parameters](self, "parameters");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (OS_nw_path_evaluator)internalEvaluator
{
  return (OS_nw_path_evaluator *)objc_getProperty(self, a2, 16LL, 1);
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInternalPath:(id)a3
{
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

uint64_t __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = (objc_class *)MEMORY[0x189607AB8];
  id v5 = a3;
  id v6 = objc_alloc(v4);
  bytes = xpc_uuid_get_bytes(v5);

  BOOL v8 = (void *)[v6 initWithUUIDBytes:bytes];
  if (v8) {
    [*(id *)(a1 + 32) addObject:v8];
  }

  return 1LL;
}

void __48__NWPathEvaluator_initWithEvaluator_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    [v5 willChangeValueForKey:@"path"];
    id v6 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v7);
    [v5 setInternalPath:v6];

    objc_sync_exit(v5);
    [v5 didChangeValueForKey:@"path"];
  }
}

@end