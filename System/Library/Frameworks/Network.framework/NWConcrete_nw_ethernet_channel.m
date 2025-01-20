@interface NWConcrete_nw_ethernet_channel
- (id).cxx_construct;
- (uint64_t)createChannel;
- (unsigned)initWithEtherType:(void *)a3 interface:(void *)a4 parameters:;
- (void)close;
- (void)closeChannel:(uint64_t)a1;
- (void)dealloc;
- (void)updateClientState:(void *)a3 error:;
@end

@implementation NWConcrete_nw_ethernet_channel

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self && *((void *)self + 19))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (NWConcrete_nw_ethernet_channel *)*((void *)self + 3);
      int v5 = *((_DWORD *)self + 42);
      *(_DWORD *)buf = 136447234;
      v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      __int16 v12 = 2080;
      v13 = v4;
      __int16 v14 = 1042;
      int v15 = 16;
      __int16 v16 = 2098;
      v17 = (char *)self + 115;
      __int16 v18 = 1024;
      int v19 = v5;
      v6 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] dealloc";
      v7 = v3;
      uint32_t v8 = 44;
LABEL_7:
      _os_log_impl(&dword_181A5C000, v7, OS_LOG_TYPE_DEBUG, v6, buf, v8);
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      __int16 v12 = 2114;
      v13 = self;
      v6 = "%{public}s [%{public}@] dealloc";
      v7 = v3;
      uint32_t v8 = 22;
      goto LABEL_7;
    }
  }

  -[NWConcrete_nw_ethernet_channel close]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_ethernet_channel;
  -[NWConcrete_nw_ethernet_channel dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void)close
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      int v6 = *(_DWORD *)(a1 + 168);
      int v17 = 136447234;
      __int16 v18 = "-[NWConcrete_nw_ethernet_channel close]";
      __int16 v19 = 2080;
      uint64_t v20 = v5;
      __int16 v21 = 1042;
      int v22 = 16;
      __int16 v23 = 2098;
      uint64_t v24 = a1 + 115;
      __int16 v25 = 1024;
      int v26 = v6;
      v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close";
      uint32_t v8 = v3;
      uint32_t v9 = 44;
LABEL_7:
      _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v17, v9);
    }
  }

  else if (v4)
  {
    int v17 = 136446466;
    __int16 v18 = "-[NWConcrete_nw_ethernet_channel close]";
    __int16 v19 = 2114;
    uint64_t v20 = a1;
    v7 = "%{public}s [%{public}@] close";
    uint32_t v8 = v3;
    uint32_t v9 = 22;
    goto LABEL_7;
  }

  v10 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0LL;

  v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0LL;

  __int16 v12 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0LL;

  -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    nw_path_evaluator_cancel(v13);
    __int16 v14 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0LL;
  }

  int v15 = *(void **)(a1 + 80);
  if (v15)
  {
    nw_path_flow_registration_close(v15);
    __int16 v16 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0LL;
  }

- (void)closeChannel:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v5 = (os_log_s *)(id)gLogObj;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)(a1 + 24);
    int v8 = *(_DWORD *)(a1 + 168);
    int v27 = 136447234;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v29 = 2080;
    uint64_t v30 = v7;
    __int16 v31 = 1042;
    int v32 = 16;
    __int16 v33 = 2098;
    uint64_t v34 = a1 + 115;
    __int16 v35 = 1024;
    int v36 = v8;
    uint32_t v9 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] closeChannel";
    v10 = v5;
    uint32_t v11 = 44;
  }

  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    int v27 = 136446466;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v29 = 2114;
    uint64_t v30 = a1;
    uint32_t v9 = "%{public}s [%{public}@] closeChannel";
    v10 = v5;
    uint32_t v11 = 22;
  }

  _os_log_impl(&dword_181A5C000, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v27, v11);
LABEL_8:

  if (!*(_BYTE *)(a1 + 113))
  {
    if (a2) {
      posix_error = nw_error_create_posix_error(a2);
    }
    else {
      posix_error = 0LL;
    }
    -[NWConcrete_nw_ethernet_channel updateClientState:error:](a1, 4, posix_error);
  }

  if (!*(void *)(a1 + 104)) {
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  __int16 v14 = (os_log_s *)(id)gLogObj;
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 24);
      int v17 = *(_DWORD *)(a1 + 168);
      int v27 = 136447234;
      v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      __int16 v29 = 2080;
      uint64_t v30 = v16;
      __int16 v31 = 1042;
      int v32 = 16;
      __int16 v33 = 2098;
      uint64_t v34 = a1 + 115;
      __int16 v35 = 1024;
      int v36 = v17;
      __int16 v18 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel input";
      __int16 v19 = v14;
      uint32_t v20 = 44;
LABEL_19:
      _os_log_impl(&dword_181A5C000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v27, v20);
    }
  }

  else if (v15)
  {
    int v27 = 136446466;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v29 = 2114;
    uint64_t v30 = a1;
    __int16 v18 = "%{public}s [%{public}@] close: cancel input";
    __int16 v19 = v14;
    uint32_t v20 = 22;
    goto LABEL_19;
  }

  nw_queue_cancel_source(*(void *)(a1 + 104), v21);
  *(void *)(a1 + 104) = 0LL;
  *(_BYTE *)(a1 + 112) = 0;
LABEL_21:
  if (*(void *)(a1 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v22 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 24);
      int v24 = *(_DWORD *)(a1 + 168);
      int v27 = 136447234;
      v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      __int16 v29 = 2080;
      uint64_t v30 = v23;
      __int16 v31 = 1042;
      int v32 = 16;
      __int16 v33 = 2098;
      uint64_t v34 = a1 + 115;
      __int16 v35 = 1024;
      int v36 = v24;
      _os_log_impl( &dword_181A5C000,  v22,  OS_LOG_TYPE_DEBUG,  "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel channel",  (uint8_t *)&v27,  0x2Cu);
    }

    os_channel_destroy();
    *(void *)(a1 + 152) = 0LL;
  }

  *(_DWORD *)(a1 + 168) = -1;
  *(void *)(a1 + 176) = 0LL;
  *(void *)(a1 + 184) = 0LL;
  if (*(void *)(a1 + 160))
  {
    os_channel_attr_destroy();
    *(void *)(a1 + 160) = 0LL;
  }

  __int16 v25 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0LL;

  *(_DWORD *)(a1 + 132) = 0;
  uuid_clear((unsigned __int8 *)(a1 + 115));
  uuid_clear((unsigned __int8 *)(a1 + 136));
  int v26 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0LL;

  *(_WORD *)(a1 + 100) = 0;
  *(_DWORD *)(a1 + 96) = 0;
}

- (void)updateClientState:(void *)a3 error:
{
  id v5 = a3;
  BOOL v6 = *(const void **)(a1 + 48);
  if (v6 && *(void *)(a1 + 40))
  {
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x3032000000LL;
    v12[3] = __Block_byref_object_copy__1953;
    v12[4] = __Block_byref_object_dispose__1954;
    id v13 = _Block_copy(v6);
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 40);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke;
    block[3] = &unk_189BC7870;
    v10 = v12;
    int v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);

    _Block_object_dispose(v12, 8);
  }
}

- (unsigned)initWithEtherType:(void *)a3 interface:(void *)a4 parameters:
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  int v8 = a3;
  nw_parameters_t v9 = a4;
  if (!a1) {
    goto LABEL_17;
  }
  v56.receiver = a1;
  v56.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_ethernet_channel;
  v10 = (char *)objc_msgSendSuper2(&v56, sel_init);
  int v11 = (unsigned __int16 *)v10;
  if (!v10)
  {
    __nwlog_obj();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v39 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v54 = 0;
    if (__nwlog_fault(v39, &type, &v54))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v41 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_181A5C000, v40, v41, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v54)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v43 = type;
        BOOL v44 = os_log_type_enabled(v40, type);
        if (backtrace_string)
        {
          if (v44)
          {
            *(_DWORD *)buf = 136446466;
            v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
            __int16 v59 = 2082;
            v60 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v40,  v43,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_61;
        }

        if (v44)
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_181A5C000, v40, v43, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v52 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl( &dword_181A5C000,  v40,  v52,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (uint64_t)createChannel
{
  uint64_t v138 = *MEMORY[0x1895F89C0];
  int v128 = 0;
  if (!*(void *)(a1 + 152))
  {
    BOOL v6 = *(void **)(a1 + 88);
    if (!v6)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v13 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl( &dword_181A5C000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s [%{public}@] createChannel: no flow",  buf,  0x16u);
      }

      return 0LL;
    }

    id v7 = v6;
    *(_DWORD *)(a1 + 132) = *((_DWORD *)v7 + 42);
    if (uuid_is_null((const unsigned __int8 *)v7 + 128))
    {

      uint64_t v8 = *(void *)(a1 + 152);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      nw_parameters_t v9 = (os_log_s *)(id)gLogObj;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 24);
          int v12 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2080;
          *(void *)v132 = v11;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(void *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v12;
          _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no nexus instance / port",  buf,  0x2Cu);
        }
      }

      else if (v10)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s [%{public}@] createChannel: no nexus instance / port",  buf,  0x16u);
      }

@end