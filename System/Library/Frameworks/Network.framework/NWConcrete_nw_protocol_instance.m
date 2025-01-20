@interface NWConcrete_nw_protocol_instance
- (NWConcrete_nw_protocol_instance)init;
- (nw_protocol)getProtocolStructure;
- (void)destroy;
@end

@implementation NWConcrete_nw_protocol_instance

- (NWConcrete_nw_protocol_instance)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_instance;
  v2 = -[NWConcrete_nw_protocol_instance init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->empty_frame_pool.tqh_first = 0LL;
    v2->empty_frame_pool.tqh_last = &v2->empty_frame_pool.tqh_first;
    v2->pending_inbound_frames.tqh_last = 0LL;
    *(void *)&v2->pending_inbound_frame_count = &v2->pending_inbound_frames.tqh_last;
    v2->handle = 0LL;
    v2->context = (OS_nw_context *)&v2->handle;
    v2->inbound_frames.tqh_first = 0LL;
    v2->inbound_frames.tqh_last = &v2->inbound_frames.tqh_first;
    v2->outbound_frames.tqh_last = 0LL;
    *(void *)&v2->empty_frame_pool_count = &v2->outbound_frames.tqh_last;
    LODWORD(v2->outbound_frames.tqh_first) = 0;
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_protocol_instance init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_protocol_instance init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)destroy
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  tqh_last = self->outbound_frames.tqh_last;
  if (tqh_last)
  {
    do
    {
      v4 = (nw_frame **)tqh_last[2];

      tqh_last = v4;
    }

    while (v4);
  }

  v5 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
  if (v5)
  {
    uint32_t os_unfair_lock_opaque = v5[10]._os_unfair_lock_opaque;
    if (!os_unfair_lock_opaque)
    {
LABEL_13:
      _nw_hash_table_release(v5, (uint64_t)a2);
      self->pending_outbound_frames.tqh_last = 0LL;
      goto LABEL_14;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v84 = "-[NWConcrete_nw_protocol_instance destroy]";
    __int16 v85 = 1024;
    *(_DWORD *)v86 = os_unfair_lock_opaque;
    *(_WORD *)&v86[4] = 2048;
    *(void *)&v86[6] = self;
    v8 = (void *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_paths_log_id_num) = 0;
    if (__nwlog_fault((const char *)v8, type, &p_paths_log_id_num))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(void *)&v86[6] = self;
          _os_log_impl( &dword_181A5C000,  v9,  v10,  "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated",  buf,  0x1Cu);
        }
      }

      else if ((_BYTE)p_paths_log_id_num)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v39 = type[0];
        BOOL v40 = os_log_type_enabled(v9, type[0]);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446978;
            v84 = "-[NWConcrete_nw_protocol_instance destroy]";
            __int16 v85 = 1024;
            *(_DWORD *)v86 = os_unfair_lock_opaque;
            *(_WORD *)&v86[4] = 2048;
            *(void *)&v86[6] = self;
            *(_WORD *)&v86[14] = 2082;
            *(void *)&v86[16] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v9,  v39,  "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, dumping backtrace:%{public}s",  buf,  0x26u);
          }

          free(backtrace_string);
          if (!v8)
          {
LABEL_12:
            v5 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
            if (!v5) {
              goto LABEL_14;
            }
            goto LABEL_13;
          }

- (nw_protocol)getProtocolStructure
{
  if (self) {
    return (nw_protocol *)&self[-1].paths_log_id_num;
  }
  else {
    return 0LL;
  }
}

- (void).cxx_destruct
{
}

@end