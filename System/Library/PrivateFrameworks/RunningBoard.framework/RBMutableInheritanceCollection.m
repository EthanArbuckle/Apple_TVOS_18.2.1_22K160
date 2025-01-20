@interface RBMutableInheritanceCollection
+ (id)collectionWithInheritances:(id)a3;
- (id)_initWithCollection:(id)a3;
- (id)allNamespaces;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addInheritance:(id)a3;
- (void)removeInheritance:(id)a3;
- (void)unionCollection:(id)a3;
@end

@implementation RBMutableInheritanceCollection

+ (id)collectionWithInheritances:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___RBMutableInheritanceCollection);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___RBMutableInheritanceCollection;
  objc_msgSendSuper2(&v9, sel_collectionWithInheritances_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = -[RBMutableInheritanceCollection _initWithCollection:](v5, "_initWithCollection:", v6);
  return v7;
}

- (id)_initWithCollection:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = (id *)a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___RBMutableInheritanceCollection;
  v5 = -[RBMutableInheritanceCollection init](&v29, sel_init);
  if (v5)
  {
    id v6 = v4[1];
    if ([v6 count])
    {
      id v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      inheritancesByEnvironment = v5->super._inheritancesByEnvironment;
      v5->super._inheritancesByEnvironment = v7;

      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __54__RBMutableInheritanceCollection__initWithCollection___block_invoke;
      v27[3] = &unk_18A256270;
      v28 = v5;
      [v6 enumerateKeysAndObjectsUsingBlock:v27];
    }

    id v9 = v4[2];
    if ([v9 count])
    {
      id v22 = v6;
      uint64_t v10 = [v9 mutableCopy];
      inheritances = v5->super._inheritances;
      v5->super._inheritances = (NSSet *)v10;

      v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x189607838]);
      countedNamespaces = v5->_countedNamespaces;
      v5->_countedNamespaces = v12;

      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = v5->_countedNamespaces;
            [*(id *)(*((void *)&v23 + 1) + 8 * v18) endowmentNamespace];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSCountedSet addObject:](v19, "addObject:", v20);

            ++v18;
          }

          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }

        while (v16);
      }

      id v6 = v22;
    }
  }

  return v5;
}

void __54__RBMutableInheritanceCollection__initWithCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (id)allNamespaces
{
  return (id)[MEMORY[0x189604010] setWithSet:self->_countedNamespaces];
}

- (void)addInheritance:(id)a3
{
  id v5 = a3;
  id v18 = v5;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"RBInheritanceCollection.m", 161, @"Invalid parameter not satisfying: %@", @"inheritance != nil" object file lineNumber description];

    id v5 = 0LL;
  }

  if (!self->super._inheritances)
  {
    id v6 = (NSSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    inheritances = self->super._inheritances;
    self->super._inheritances = v6;

    id v5 = v18;
  }

  if (!self->_countedNamespaces)
  {
    v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x189607838]);
    countedNamespaces = self->_countedNamespaces;
    self->_countedNamespaces = v8;

    id v5 = v18;
  }

  [v5 environment];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    if (!inheritancesByEnvironment)
    {
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      v13 = self->super._inheritancesByEnvironment;
      self->super._inheritancesByEnvironment = v12;

      inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    }

    -[NSDictionary objectForKey:](inheritancesByEnvironment, "objectForKey:", v10);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      [MEMORY[0x189603FE0] set];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](self->super._inheritancesByEnvironment, "setObject:forKey:", v14, v10);
    }

    [v14 addObject:v18];
  }

  -[NSSet addObject:](self->super._inheritances, "addObject:", v18);
  uint64_t v15 = self->_countedNamespaces;
  [v18 endowmentNamespace];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](v15, "addObject:", v16);
}

- (void)removeInheritance:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"RBInheritanceCollection.m", 188, @"Invalid parameter not satisfying: %@", @"inheritance != nil" object file lineNumber description];

    id v5 = 0LL;
  }

  [v5 environment];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDictionary objectForKey:](self->super._inheritancesByEnvironment, "objectForKey:", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 removeObject:v13];
    if (![v7 count]) {
      -[NSDictionary removeObjectForKey:](self->super._inheritancesByEnvironment, "removeObjectForKey:", v6);
    }
  }

  -[NSSet removeObject:](self->super._inheritances, "removeObject:", v13);
  countedNamespaces = self->_countedNamespaces;
  [v13 endowmentNamespace];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet removeObject:](countedNamespaces, "removeObject:", v9);

  if (!-[NSSet count](self->super._inheritances, "count"))
  {
    inheritances = self->super._inheritances;
    self->super._inheritances = 0LL;
  }

  if (!-[NSCountedSet count](self->_countedNamespaces, "count"))
  {
    v11 = self->_countedNamespaces;
    self->_countedNamespaces = 0LL;
  }
}

- (void)unionCollection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[RBMutableInheritanceCollection addInheritance:]( self,  "addInheritance:",  *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBInheritanceCollection _initWithCollection:]( objc_alloc(&OBJC_CLASS___RBInheritanceCollection),  "_initWithCollection:",  self);
}

- (void).cxx_destruct
{
}

@end