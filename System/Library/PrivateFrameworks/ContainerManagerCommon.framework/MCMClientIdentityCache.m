@interface MCMClientIdentityCache
- (MCMCache)cache;
- (MCMClientIdentityCache)init;
- (id)clientIdentityWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5 error:(id *)a6 generator:(id)a7;
- (void)flush;
@end

@implementation MCMClientIdentityCache

- (MCMClientIdentityCache)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMClientIdentityCache;
  v2 = -[MCMClientIdentityCache init](&v6, sel_init);
  if (v2)
  {
    v3 = -[MCMLRUCache initWithName:maxCount:]( objc_alloc(&OBJC_CLASS___MCMLRUCache),  "initWithName:maxCount:",  @"perPersonaClients",  30LL);
    cache = v2->_cache;
    v2->_cache = (MCMCache *)v3;
  }

  return v2;
}

- (void)flush
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeAllObjects];
}

- (id)clientIdentityWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5 error:(id *)a6 generator:(id)a7
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v12 = (void (**)(id, id *))a7;
  id v13 = a5;
  v14 = objc_alloc(&OBJC_CLASS___MCMClientIdentityIndex);
  __int128 v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  __int128 v31 = v15;
  __int128 v16 = *(_OWORD *)&a4->var0[4];
  v29[0] = *(_OWORD *)a4->var0;
  v29[1] = v16;
  v17 = -[MCMClientIdentityIndex initWithAuditToken:proximateAuditToken:personaUniqueString:]( v14,  "initWithAuditToken:proximateAuditToken:personaUniqueString:",  buf,  v29,  v13);

  if (v17)
  {
    v18 = -[MCMClientIdentityCache cache](self, "cache");
    [v18 objectForKey:v17];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      id v20 = 0LL;
LABEL_13:
      v22 = 0LL;
      goto LABEL_14;
    }

    id v28 = 0LL;
    v12[2](v12, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v28;
    if (v19)
    {
      [v19 clientIdentityByChangingCached:1];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = -[MCMClientIdentityCache cache](self, "cache");
        [v23 setObject:v22 forKey:v17];
      }

      goto LABEL_14;
    }
  }

  else
  {
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int128 v26 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)buf = *(_OWORD *)a3->var0;
      __int128 v31 = v26;
      int pid = container_audit_token_get_pid();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Could not generate client identity index for pid %d",  buf,  8u);
    }

    id v20 = 0LL;
  }

  if (!a6)
  {
    v19 = 0LL;
    goto LABEL_13;
  }

  id v20 = v20;
  v19 = 0LL;
  v22 = 0LL;
  *a6 = v20;
LABEL_14:
  id v24 = v19;

  return v24;
}

- (MCMCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

@end