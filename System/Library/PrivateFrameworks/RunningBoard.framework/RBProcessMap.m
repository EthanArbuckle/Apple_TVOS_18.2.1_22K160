@interface RBProcessMap
- (BOOL)containsIdentity:(id)a3;
- (RBProcessMap)init;
- (id)allIdentities;
- (id)allValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)removeValueForIdentity:(id)a3;
- (id)removeValueForIdentity:(id)a3 withPredicate:(id)a4;
- (id)setValue:(id)a3 forIdentity:(id)a4;
- (id)valueForIdentity:(id)a3;
- (unint64_t)count;
- (void)addIdentity:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeIdentity:(id)a3;
@end

@implementation RBProcessMap

- (RBProcessMap)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBProcessMap;
  v2 = -[RBProcessMap init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    valueMap = v3->_valueMap;
    v3->_valueMap = v4;
  }

  return v3;
}

- (id)allIdentities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableDictionary allKeys](self->_valueMap, "allKeys");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addIdentity:(id)a3
{
  id v11 = a3;
  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607A40] callStackSymbols];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, self, @"RBProcessMap.m", 47, @"identity cannot be nil %@", v10 object file lineNumber description];
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v11);
  if (!v6)
  {
    valueMap = self->_valueMap;
    [MEMORY[0x189603FE8] null];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v8, v11);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)removeIdentity:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"RBProcessMap.m" lineNumber:57 description:@"identity cannot be nil"];
  }

  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)containsIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)allValue
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [MEMORY[0x189603FA8] array];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = -[NSMutableDictionary allValues](self->_valueMap, "allValues", 0LL);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          [MEMORY[0x189603FE8] null];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v11) {
            [v4 addObject:v10];
          }
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = -[NSMutableDictionary count](self->_valueMap, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)valueForIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!v4) {
    goto LABEL_5;
  }
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [MEMORY[0x189603FE8] null];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {

LABEL_5:
      uint64_t v6 = 0LL;
    }
  }

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)removeValueForIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (!v4) {
    goto LABEL_6;
  }
  v5 = -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
  if (v5)
  {
    [MEMORY[0x189603FE8] null];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v4);
      goto LABEL_7;
    }

LABEL_6:
    v5 = 0LL;
  }

- (id)removeValueForIdentity:(id)a3 withPredicate:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void *))a4;
  os_unfair_lock_lock_with_options();
  if (!v6) {
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8) {
    goto LABEL_8;
  }
  [MEMORY[0x189603FE8] null];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {

LABEL_7:
    uint64_t v8 = 0LL;
    goto LABEL_8;
  }

  if (v7[2](v7, v8)) {
    -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v6);
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (id)setValue:(id)a3 forIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607A40] callStackSymbols];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, self, @"RBProcessMap.m", 128, @"identity cannot be nil %@", v16 object file lineNumber description];
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v8);
  if (v10)
  {
    [MEMORY[0x189603FE8] null];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {

      v10 = 0LL;
    }
  }

  valueMap = self->_valueMap;
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v7, v8);
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v13, v8);
  }

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)enumerateWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = (id)-[NSMutableDictionary copy](self->_valueMap, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__RBProcessMap_enumerateWithBlock___block_invoke;
  v7[3] = &unk_18A2568F8;
  id v8 = v4;
  id v5 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __35__RBProcessMap_enumerateWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)MEMORY[0x189603FE8];
  id v8 = a3;
  id v9 = a2;
  [v7 null];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v8) {
    id v10 = 0LL;
  }
  else {
    id v10 = v8;
  }
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v9, v10, a4);
}

- (id)dictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)-[NSMutableDictionary copy](self->_valueMap, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeAllObjects](self->_valueMap, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary addEntriesFromDictionary:](v4->_valueMap, "addEntriesFromDictionary:", self->_valueMap);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end