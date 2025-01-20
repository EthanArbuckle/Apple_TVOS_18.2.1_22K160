@interface RBBundlePropertiesBSXPCProvider
- (RBBundlePropertiesBSXPCProvider)init;
- (id)debugDescription;
- (id)propertiesForIdentifier:(id)a3;
- (void)removePropertiesForIdentifier:(id)a3;
@end

@implementation RBBundlePropertiesBSXPCProvider

- (RBBundlePropertiesBSXPCProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBBundlePropertiesBSXPCProvider;
  v2 = -[RBBundlePropertiesBSXPCProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x189607920] weakToStrongObjectsMapTable];
    propertiesByIdentifier = v3->_propertiesByIdentifier;
    v3->_propertiesByIdentifier = (NSMapTable *)v4;
  }

  return v3;
}

- (id)propertiesForIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v4);
  v5 = (RBXPCBundleProperties *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[RBXPCBundleProperties initWithPID:]( [RBXPCBundleProperties alloc],  "initWithPID:",  [v4 pid]);
    -[NSMapTable setObject:forKey:](self->_propertiesByIdentifier, "setObject:forKey:", v5, v4);
  }

  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)removePropertiesForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_propertiesByIdentifier, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)debugDescription
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  os_unfair_lock_lock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = self->_propertiesByIdentifier;
  uint64_t v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
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
        v10 = -[NSMapTable objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v9);
        if (v10)
        {
          [v9 description];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 appendFormat:@"%@=%@\n\t\t", v11, v10, (void)v16];
        }
      }

      uint64_t v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v12 initWithFormat:@"<%@| propertiesByIdentifier:{\n\t\t%@}>", v13, v3];

  return v14;
}

- (void).cxx_destruct
{
}

@end