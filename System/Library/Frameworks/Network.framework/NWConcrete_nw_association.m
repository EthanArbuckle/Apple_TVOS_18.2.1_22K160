@interface NWConcrete_nw_association
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_association

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ((*((_BYTE *)self + 76) & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    *(_DWORD *)v17 = 136446466;
    *(void *)&v17[4] = "-[NWConcrete_nw_association dealloc]";
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = self;
    int v12 = 22;
    v11 = v17;
    v4 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v4))
    {
      __break(1u);
      return;
    }

    free(v4);
  }

  deactivation_timer = self->deactivation_timer;
  if (deactivation_timer)
  {
    nw_queue_cancel_source((uint64_t)deactivation_timer, (uint64_t)a2);
    self->deactivation_timer = 0LL;
  }

  handles = self->handles;
  if (handles)
  {
    _nw_hash_table_release((os_unfair_lock_s *)handles, (uint64_t)a2);
    self->handles = 0LL;
  }

  connected_flow_handles = self->connected_flow_handles;
  if (connected_flow_handles)
  {
    _nw_hash_table_release((os_unfair_lock_s *)connected_flow_handles, (uint64_t)a2);
    self->connected_flow_handles = 0LL;
  }

  cache_entries = self->cache_entries;
  if (cache_entries)
  {
    *(void *)v17 = 0LL;
    *(void *)&v17[8] = v17;
    *(void *)&v17[16] = 0x2020000000LL;
    v18 = cache_entries;
    self->cache_entries = 0LL;
    id v9 = nw_path_parameters_copy_context(self->path_parameters);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __36__NWConcrete_nw_association_dealloc__block_invoke;
    v14[3] = &unk_189BC9210;
    id v15 = v9;
    v16 = v17;
    id v10 = v9;
    nw_queue_context_async_if_needed(v10, v14);

    _Block_object_dispose(v17, 8);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_association;
  -[NWConcrete_nw_association dealloc](&v13, sel_dealloc, v11, v12);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = nw_endpoint_get_description(self->endpoint);
  return (NSString *)(id)CFStringCreateWithFormat( v2,  0LL,  @"<nw_association %s>",  description);
}

- (id)redactedDescription
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  logging_description = nw_endpoint_get_logging_description(self->endpoint);
  return (id)(id)CFStringCreateWithFormat( v2,  0LL,  @"<nw_association %s>",  logging_description);
}

@end