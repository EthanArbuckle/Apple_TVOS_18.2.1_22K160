@interface RBAssertionCollection
- (BOOL)hasAssertion:(id)a3;
- (BOOL)hasAssertionsForOriginator:(id)a3;
- (BOOL)hasAssertionsForOriginator:(id)a3 exceedingCount:(unint64_t)a4;
- (BOOL)hasResolvedAssertion:(id)a3;
- (RBAssertionCollection)init;
- (id)allAssertions;
- (id)assertionWithIdentifier:(id)a3;
- (id)assertionsForOriginator:(id)a3;
- (id)assertionsForTarget:(id)a3;
- (id)assertionsForTargetIdentity:(id)a3;
- (unint64_t)assertionCountForOriginator:(id)a3;
- (unint64_t)assertionCountForTargetProcessIdentity:(id)a3;
- (unint64_t)count;
- (void)addAssertion:(id)a3;
- (void)enumerateAssertionsForOriginator:(id)a3 withBlock:(id)a4;
- (void)enumerateAssertionsForProcessTargetsWithBlock:(id)a3;
- (void)enumerateAssertionsForSystemTargetWithBlock:(id)a3;
- (void)enumerateAssertionsForTargetProcessIdentity:(id)a3 withBlock:(id)a4;
- (void)enumerateAssertionsWithBlock:(id)a3;
- (void)noteResolvedAssertion:(id)a3;
- (void)removeAssertion:(id)a3;
@end

@implementation RBAssertionCollection

- (RBAssertionCollection)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RBAssertionCollection;
  v2 = -[RBAssertionCollection init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock = 0LL;
    uint64_t v4 = [MEMORY[0x189603FC8] dictionary];
    assertionsByIdentifier = v3->_assertionsByIdentifier;
    v3->_assertionsByIdentifier = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x189603FE0] set];
    processAssertions = v3->_processAssertions;
    v3->_processAssertions = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x189603FE0] set];
    systemAssertions = v3->_systemAssertions;
    v3->_systemAssertions = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x189603FC8] dictionary];
    assertionsByTargetProcessIdentity = v3->_assertionsByTargetProcessIdentity;
    v3->_assertionsByTargetProcessIdentity = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x189603FC8] dictionary];
    assertionsByOriginator = v3->_assertionsByOriginator;
    v3->_assertionsByOriginator = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x189603FE0] set];
    resolvedIdentifiers = v3->_resolvedIdentifiers;
    v3->_resolvedIdentifiers = (NSMutableSet *)v14;
  }

  return v3;
}

- (id)allAssertions
{
  processAssertions = self->_processAssertions;
  if (!self->_systemAssertions) {
    goto LABEL_5;
  }
  if (!processAssertions)
  {
    processAssertions = self->_systemAssertions;
LABEL_5:
    uint64_t v4 = -[NSMutableSet copy](processAssertions, "copy");
    goto LABEL_6;
  }

  uint64_t v4 = -[NSMutableSet setByAddingObjectsFromSet:](processAssertions, "setByAddingObjectsFromSet:");
LABEL_6:
  v5 = (void *)v4;
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)enumerateAssertionsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary allValues](self->_assertionsByIdentifier, "allValues");
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x1895C9F58](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForSystemTargetWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableSet allObjects](self->_systemAssertions, "allObjects");
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x1895C9F58](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForProcessTargetsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableSet allObjects](self->_processAssertions, "allObjects");
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x1895C9F58](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForTargetProcessIdentity:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 allObjects];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  unsigned __int8 v21 = 0;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
      __int128 v16 = (void *)MEMORY[0x1895C9F58](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      objc_autoreleasePoolPop(v16);
      if ((_DWORD)v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v12 = v11;
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForOriginator:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 allObjects];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  unsigned __int8 v21 = 0;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
      __int128 v16 = (void *)MEMORY[0x1895C9F58](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      objc_autoreleasePoolPop(v16);
      if ((_DWORD)v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v12 = v11;
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)assertionWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByIdentifier, "objectForKeyedSubscript:", v4);
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)assertionsForTarget:(id)a3
{
  id v4 = a3;
  if ([v4 isSystem])
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = (void *)-[NSMutableSet copy](self->_systemAssertions, "copy");
    os_unfair_recursive_lock_unlock();
  }

  else
  {
    [v4 identity];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RBAssertionCollection assertionsForTargetIdentity:](self, "assertionsForTargetIdentity:", v6);
  }

  return v5;
}

- (id)assertionsForTargetIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v4);
  id v6 = (void *)[v5 copy];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)assertionsForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v4);
  id v6 = (void *)[v5 copy];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (void)removeAssertion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  [v4 target];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 originator];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 identity];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_assertionsByIdentifier, "removeObjectForKey:", v8);
  -[NSMutableSet removeObject:](self->_resolvedIdentifiers, "removeObject:", v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v10) {
    [v10 removeObject:v4];
  }
  if (![v11 count]) {
    -[NSMutableDictionary removeObjectForKey:](self->_assertionsByOriginator, "removeObjectForKey:", v7);
  }
  rbs_assertion_log();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v23 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v23;
    *(_WORD *)&v28[4] = 2114;
    *(void *)&v28[6] = v7;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = [v11 count];
    _os_log_debug_impl( &dword_188634000,  v12,  OS_LOG_TYPE_DEBUG,  "Now tracking %u assertions (%{public}@ holds %u).",  buf,  0x18u);
  }

  rbs_assertion_log();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    rbs_assertion_log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionCollection removeAssertion:].cold.1((uint64_t)v8, (uint64_t)v5, v15);
    }

    [v11 enumerateObjectsUsingBlock:&__block_literal_global_13];
  }

  if ([v5 isSystem])
  {
    -[NSMutableSet removeObject:](self->_systemAssertions, "removeObject:", v4);
  }

  else
  {
    -[NSMutableSet removeObject:](self->_processAssertions, "removeObject:", v4);
    -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v9);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 removeObject:v4];
    if (![v16 count]) {
      -[NSMutableDictionary removeObjectForKey:](self->_assertionsByTargetProcessIdentity, "removeObjectForKey:", v9);
    }
    v24 = v9;
    rbs_assertion_log();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionsByTargetProcessIdentity,  "objectForKeyedSubscript:",  v9);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 138543618;
      *(void *)v28 = v24;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v19;
      _os_log_impl(&dword_188634000, v17, OS_LOG_TYPE_INFO, "%{public}@ is now targeted by %lu assertions", buf, 0x16u);
    }

    rbs_assertion_log();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

    if (v21)
    {
      v22 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionsByTargetProcessIdentity,  "objectForKeyedSubscript:",  v24);
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __41__RBAssertionCollection_removeAssertion___block_invoke_2;
      v25[3] = &unk_18A255EF0;
      id v26 = v7;
      [v22 enumerateObjectsUsingBlock:v25];
    }

    uint64_t v9 = v24;
  }

  os_unfair_recursive_lock_unlock();
}

void __41__RBAssertionCollection_removeAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  rbs_assertion_log();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(v2);
  }
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  rbs_assertion_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(a1, v3);
  }
}

- (void)addAssertion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  [v4 target];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 originator];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 identity];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_assertionsByIdentifier,  "setObject:forKeyedSubscript:",  v4,  v8);
  -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    [MEMORY[0x189603FE0] set];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_assertionsByOriginator, "setObject:forKey:", v10, v7);
  }

  [v10 addObject:v4];
  rbs_assertion_log();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[RBAssertionCollection addAssertion:].cold.1((uint64_t)v4, v11);
  }

  rbs_assertion_log();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v17 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
    int v18 = 67109634;
    *(_DWORD *)uint64_t v19 = v17;
    *(_WORD *)&v19[4] = 2114;
    *(void *)&v19[6] = v7;
    __int16 v20 = 1024;
    int v21 = [v10 count];
    _os_log_debug_impl( &dword_188634000,  v12,  OS_LOG_TYPE_DEBUG,  "Now tracking %u assertions (%{public}@ holds %u).",  (uint8_t *)&v18,  0x18u);
  }

  if ([v5 isSystem])
  {
    -[NSMutableSet addObject:](self->_systemAssertions, "addObject:", v4);
  }

  else
  {
    -[NSMutableSet addObject:](self->_processAssertions, "addObject:", v4);
    -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v9);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      [MEMORY[0x189603FE0] set];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_assertionsByTargetProcessIdentity, "setObject:forKey:", v13, v9);
    }

    [v13 addObject:v4];
    rbs_assertion_log();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionsByTargetProcessIdentity,  "objectForKeyedSubscript:",  v9);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 count];
      int v18 = 138543618;
      *(void *)uint64_t v19 = v9;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v16;
      _os_log_impl( &dword_188634000,  v14,  OS_LOG_TYPE_INFO,  "%{public}@ is now targeted by %u assertions",  (uint8_t *)&v18,  0x12u);
    }
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)hasAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  assertionsByIdentifier = self->_assertionsByIdentifier;
  [v4 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](assertionsByIdentifier, "objectForKeyedSubscript:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(assertionsByIdentifier) = v7 != 0LL;

  os_unfair_recursive_lock_unlock();
  return (char)assertionsByIdentifier;
}

- (BOOL)hasAssertionsForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v4);
  LOBYTE(v4) = [v5 count] != 0;
  os_unfair_recursive_lock_unlock();
  return (char)v4;
}

- (unint64_t)assertionCountForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionsByTargetProcessIdentity,  "objectForKeyedSubscript:",  v4);
  unint64_t v6 = [v5 count];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (BOOL)hasAssertionsForOriginator:(id)a3 exceedingCount:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 count] <= a4)
  {
    BOOL v14 = 0;
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v6, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isValid])
          {
            if (++v11 > a4)
            {
              BOOL v14 = 1;
              goto LABEL_14;
            }
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 0;
LABEL_14:
  }

  os_unfair_recursive_lock_unlock();

  return v14;
}

- (unint64_t)assertionCountForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v4);
  unint64_t v6 = [v5 count];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (void)noteResolvedAssertion:(id)a3
{
  resolvedIdentifiers = self->_resolvedIdentifiers;
  [a3 identifier];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](resolvedIdentifiers, "addObject:", v4);
}

- (BOOL)hasResolvedAssertion:(id)a3
{
  resolvedIdentifiers = self->_resolvedIdentifiers;
  [a3 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(resolvedIdentifiers) = -[NSMutableSet containsObject:](resolvedIdentifiers, "containsObject:", v4);

  return (char)resolvedIdentifiers;
}

- (unint64_t)count
{
  unint64_t v3 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void).cxx_destruct
{
}

- (void)removeAssertion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( &dword_188634000,  log,  OS_LOG_TYPE_DEBUG,  "Removing assertion %{public}@ on %{public}@",  (uint8_t *)&v3,  0x16u);
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identity];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 explanation];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 identifier];
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_8(&dword_188634000, v6, v7, "> %{public}@ ['%{public}@'] [%{public}@]", v8, v9, v10, v11, v12);
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_8(&dword_188634000, v5, v6, "> %{public}@ ['%{public}@'] [%{public}@]", v7, v8, v9, v10, v11);
}

- (void)addAssertion:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_188634000, a2, OS_LOG_TYPE_DEBUG, "Adding assertion %{public}@", (uint8_t *)&v2, 0xCu);
}

@end