@interface RBBundlePropertiesLSProvider
- (NSString)debugDescription;
- (RBBundlePropertiesLSProvider)init;
- (RBBundlePropertiesLSProviderDelegate)delegate;
- (id)propertiesForIdentity:(id)a3;
- (void)_removeCachedValuesForAppProxies:(uint64_t)a1;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation RBBundlePropertiesLSProvider

- (RBBundlePropertiesLSProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBBundlePropertiesLSProvider;
  v2 = -[RBBundlePropertiesLSProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x189603F30]);
    propertiesByIdentity = v3->_propertiesByIdentity;
    v3->_propertiesByIdentity = v4;

    -[NSCache setCountLimit:](v3->_propertiesByIdentity, "setCountLimit:", 5LL);
    dispatch_get_global_queue(25LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __36__RBBundlePropertiesLSProvider_init__block_invoke;
    block[3] = &unk_18A255C70;
    v9 = v3;
    dispatch_async(v6, block);
  }

  return v3;
}

void __36__RBBundlePropertiesLSProvider_init__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189605750] defaultWorkspace];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObserver:*(void *)(a1 + 32)];
}

- (RBBundlePropertiesLSProviderDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (RBBundlePropertiesLSProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)propertiesForIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [v4 embeddedApplicationIdentifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
  }

  else
  {
    [v4 xpcServiceIdentifier];
    v6 = (RBLSBundleProperties *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      goto LABEL_12;
    }
  }

  -[NSCache objectForKey:](self->_propertiesByIdentity, "objectForKey:", v4);
  v6 = (RBLSBundleProperties *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if ([v4 isEmbeddedApplication])
    {
      v7 = (void *)MEMORY[0x189605730];
      [v4 embeddedApplicationIdentifier];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 applicationProxyForIdentifier:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = -[RBLSBundleProperties initWithApplicationProxy:]( (uint64_t)objc_alloc(&OBJC_CLASS___RBLSBundleProperties),  v9);
    }

    else
    {
      if (![v4 isXPCService])
      {
        v6 = objc_alloc_init(&OBJC_CLASS___RBLSBundleProperties);
        goto LABEL_11;
      }

      v11 = (void *)MEMORY[0x189605758];
      [v4 xpcServiceIdentifier];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 bundleProxyForIdentifier:v12];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = -[RBLSBundleProperties initWithBundleProxy:]((uint64_t)objc_alloc(&OBJC_CLASS___RBLSBundleProperties), v9);
    }

    v6 = (RBLSBundleProperties *)v10;

LABEL_11:
    -[NSCache setObject:forKey:](self->_propertiesByIdentity, "setObject:forKey:", v6, v4);
  }

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RBBundlePropertiesLSProvider;
  -[RBBundlePropertiesLSProvider dealloc](&v4, sel_dealloc);
}

- (NSString)debugDescription
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  os_unfair_lock_lock(&self->_lock);
  -[NSCache mapTableRepresentation](self->_propertiesByIdentity, "mapTableRepresentation");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v4 objectForKey:v9];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 description];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 appendFormat:@"%@=%@\n\t\t", v11, v10];
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v12 initWithFormat:@"<%@| propertiesByIdentity:{\n\t\t%@}>", v13, v3];

  return (NSString *)v14;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)_removeCachedValuesForAppProxies:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x189603FE0] set];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x1896122E8];
          [*(id *)(*((void *)&v15 + 1) + 8 * v9) bundleIdentifier];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 identityForEmbeddedApplicationIdentifier:v11];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();

          [*(id *)(a1 + 8) removeObjectForKey:v12];
          [v4 addObject:v12];

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    [WeakRetained bundlePropertiesProvider:a1 didChangePropertiesForProcessIdentities:v4];

    id v3 = v14;
  }
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void).cxx_destruct
{
}

@end