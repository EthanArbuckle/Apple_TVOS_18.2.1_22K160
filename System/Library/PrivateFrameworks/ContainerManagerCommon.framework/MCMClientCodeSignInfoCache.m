@interface MCMClientCodeSignInfoCache
- (MCMCache)cache;
- (MCMClientCodeSignInfoCache)init;
- (id)codeSignInfoForCDHash:(id)a3 identifier:(id)a4 error:(id *)a5 generator:(id)a6;
- (void)flush;
@end

@implementation MCMClientCodeSignInfoCache

- (MCMClientCodeSignInfoCache)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMClientCodeSignInfoCache;
  v2 = -[MCMClientCodeSignInfoCache init](&v6, sel_init);
  if (v2)
  {
    v3 = -[MCMLRUCache initWithName:maxCount:]( objc_alloc(&OBJC_CLASS___MCMLRUCache),  "initWithName:maxCount:",  @"clientCodeSignInfo",  30LL);
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

- (id)codeSignInfoForCDHash:(id)a3 identifier:(id)a4 error:(id *)a5 generator:(id)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  v11 = (void (**)(id, id *))a6;
  id v12 = a3;
  v13 = -[MCMClientCodeSignIndex initWithCDHash:identifier:]( objc_alloc(&OBJC_CLASS___MCMClientCodeSignIndex),  "initWithCDHash:identifier:",  v12,  v10);

  if (v13)
  {
    v14 = -[MCMClientCodeSignInfoCache cache](self, "cache");
    [v14 objectForKey:v13];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      id v16 = 0LL;
LABEL_13:
      v18 = 0LL;
      goto LABEL_14;
    }

    id v24 = 0LL;
    v11[2](v11, &v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v24;
    if (v15)
    {
      [v15 clientCodeSignInfoByChangingCached:1];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v19;
      if (v19)
      {
        [v19 entitlements];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 prune];
        v21 = -[MCMClientCodeSignInfoCache cache](self, "cache");
        [v21 setObject:v18 forKey:v13];
      }

      goto LABEL_14;
    }
  }

  else
  {
    container_log_handle_for_category();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Could not generate code sign index for [%@]",  buf,  0xCu);
    }

    id v16 = 0LL;
  }

  if (!a5)
  {
    v15 = 0LL;
    goto LABEL_13;
  }

  id v16 = v16;
  v15 = 0LL;
  v18 = 0LL;
  *a5 = v16;
LABEL_14:
  id v22 = v15;

  return v22;
}

- (MCMCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

@end