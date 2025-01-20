@interface RBProcessStateChangeSet
- (BOOL)hasChanges;
- (RBProcessStateChangeSet)initWithChanges:(id)a3;
- (RBProcessStateChangeSet)initWithOriginalStatesByIdentity:(id)a3 updatedStatesByIdentity:(id)a4;
- (id)processIdentities;
- (id)processStateChangeForIdentity:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_diffOriginalStatesByIdentity:(void *)a3 withUpdatedStatesByIdentity:;
- (void)applyChanges:(id)a3;
@end

@implementation RBProcessStateChangeSet

- (RBProcessStateChangeSet)initWithChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___RBProcessStateChangeSet;
  v5 = -[RBProcessStateChangeSet init](&v21, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x189603FC8] dictionary];
    stateChangesByIdentity = v5->_stateChangesByIdentity;
    v5->_stateChangesByIdentity = (NSMutableDictionary *)v6;

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = v5->_stateChangesByIdentity;
          objc_msgSend(v13, "identity", (void)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v10);
    }
  }

  return v5;
}

- (RBProcessStateChangeSet)initWithOriginalStatesByIdentity:(id)a3 updatedStatesByIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBProcessStateChangeSet;
  id v8 = -[RBProcessStateChangeSet init](&v12, sel_init);
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x189603FC8] dictionary];
    stateChangesByIdentity = v8->_stateChangesByIdentity;
    v8->_stateChangesByIdentity = (NSMutableDictionary *)v9;

    -[RBProcessStateChangeSet _diffOriginalStatesByIdentity:withUpdatedStatesByIdentity:]((uint64_t)v8, v6, v7);
  }

  return v8;
}

- (void)_diffOriginalStatesByIdentity:(void *)a3 withUpdatedStatesByIdentity:
{
  id v8 = a2;
  if (a1)
  {
    v5 = (void *)[a3 mutableCopy];
    uint64_t v6 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke;
    v12[3] = &unk_18A2567B8;
    id v13 = v5;
    uint64_t v14 = a1;
    id v7 = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
    v9[0] = v6;
    v9[1] = 3221225472LL;
    v9[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2;
    v9[3] = &unk_18A2567B8;
    id v10 = v8;
    uint64_t v11 = a1;
    [v7 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

- (BOOL)hasChanges
{
  return -[NSMutableDictionary count](self->_stateChangesByIdentity, "count") != 0;
}

- (void)applyChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        stateChangesByIdentity = self->_stateChangesByIdentity;
        [v9 identity];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](stateChangesByIdentity, "objectForKey:", v11);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          [v12 changeByApplyingChange:v9];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = self->_stateChangesByIdentity;
          [v9 identity];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13) {
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);
          }
          else {
            -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);
          }
        }

        else
        {
          v16 = self->_stateChangesByIdentity;
          [v9 identity];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v9, v13);
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }
}

- (id)processStateChangeForIdentity:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:]( self->_stateChangesByIdentity,  "objectForKeyedSubscript:",  a3);
}

- (id)processIdentities
{
  v2 = (void *)MEMORY[0x189604010];
  v3 = -[NSMutableDictionary allKeys](self->_stateChangesByIdentity, "allKeys");
  [v2 setWithArray:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) removeObjectForKey:v8];
  if (!v6 || ([v6 isEqual:v5] & 1) == 0)
  {
    uint64_t v7 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]( objc_alloc(&OBJC_CLASS___RBProcessStateChange),  "initWithIdentity:originalState:updatedState:",  v8,  v5,  v6);
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v7 forKeyedSubscript:v8];
  }
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v7 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]( objc_alloc(&OBJC_CLASS___RBProcessStateChange),  "initWithIdentity:originalState:updatedState:",  v8,  0LL,  v5);
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v7 forKeyedSubscript:v8];
  }
}

- (void).cxx_destruct
{
}

@end