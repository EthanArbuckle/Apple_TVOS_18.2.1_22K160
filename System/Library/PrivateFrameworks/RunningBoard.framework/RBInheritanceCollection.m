@interface RBInheritanceCollection
+ (RBInheritanceCollection)collectionWithInheritances:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_initWithCollection:(id)a3;
- (id)_initWithInheritances:(id)a3;
- (id)allEnvironments;
- (id)allInheritances;
- (id)allNamespaces;
- (id)description;
- (id)inheritancesForEnvironment:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation RBInheritanceCollection

+ (RBInheritanceCollection)collectionWithInheritances:(id)a3
{
  id v3 = a3;
  id v4 = -[RBInheritanceCollection _initWithInheritances:]( objc_alloc(&OBJC_CLASS___RBInheritanceCollection),  "_initWithInheritances:",  v3);

  return (RBInheritanceCollection *)v4;
}

- (id)_initWithInheritances:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[RBInheritanceCollection init](self, "init");
  v6 = v5;
  if (v5)
  {
    v26 = v5;
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v25 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "environment", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            [v7 objectForKey:v15];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              [MEMORY[0x189603FE0] set];
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v7 setObject:v16 forKey:v15];
            }

            [v16 addObject:v14];
          }

          [v14 endowmentNamespace];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 addObject:v17];
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v11);
    }

    uint64_t v18 = [objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v7 copyItems:1];
    v6 = v26;
    inheritancesByEnvironment = v26->_inheritancesByEnvironment;
    v26->_inheritancesByEnvironment = (NSDictionary *)v18;

    uint64_t v20 = [v8 copy];
    namespaces = v26->_namespaces;
    v26->_namespaces = (NSSet *)v20;

    uint64_t v22 = [v9 copy];
    inheritances = v26->_inheritances;
    v26->_inheritances = (NSSet *)v22;

    id v4 = v25;
  }

  return v6;
}

- (id)_initWithCollection:(id)a3
{
  id v4 = a3;
  v5 = -[RBInheritanceCollection init](self, "init");
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x189603F68]) initWithDictionary:*((void *)v4 + 1) copyItems:1];
    inheritancesByEnvironment = v5->_inheritancesByEnvironment;
    v5->_inheritancesByEnvironment = (NSDictionary *)v6;

    uint64_t v8 = [*((id *)v4 + 2) copy];
    inheritances = v5->_inheritances;
    v5->_inheritances = (NSSet *)v8;

    [v4 allNamespaces];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 count])
    {
      uint64_t v11 = [MEMORY[0x189604010] setWithSet:v10];
      namespaces = v5->_namespaces;
      v5->_namespaces = (NSSet *)v11;
    }
  }

  return v5;
}

- (id)allEnvironments
{
  v2 = (void *)MEMORY[0x189604010];
  -[NSDictionary allKeys](self->_inheritancesByEnvironment, "allKeys");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setWithArray:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allInheritances
{
  return self->_inheritances;
}

- (id)inheritancesForEnvironment:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  -[NSDictionary objectForKey:](self->_inheritancesByEnvironment, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allNamespaces
{
  return self->_namespaces;
}

- (unint64_t)count
{
  return -[NSSet count](self->_inheritances, "count");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSSet countByEnumeratingWithState:objects:count:]( self->_inheritances,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBMutableInheritanceCollection _initWithCollection:]( objc_alloc(&OBJC_CLASS___RBMutableInheritanceCollection),  "_initWithCollection:",  self);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  inheritancesByEnvironment = self->_inheritancesByEnvironment;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__RBInheritanceCollection_description__block_invoke;
  v10[3] = &unk_18A256270;
  id v11 = v3;
  id v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( inheritancesByEnvironment,  "enumerateKeysAndObjectsUsingBlock:",  v10);
  id v6 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v6 initWithFormat:@"<%@| inheritancesByEnvironment:{\n\t%@\n\t}>", v7, v5];

  return v8;
}

void __38__RBInheritanceCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 allObjects];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 componentsJoinedByString:@",\n\t\t"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"%@=[\n\t\t%@\n\t\t]\n\t\t", v5, v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBInheritanceCollection *)a3;
  id v5 = v4;
  if (self == v4
    || (inheritances = self->_inheritances, id v7 = (const __CFSet *)v4->_inheritances, inheritances == (NSSet *)v7))
  {
    char v8 = 1;
  }

  else
  {
    char v8 = 0;
    if (inheritances && v7)
    {
      CFIndex Count = CFSetGetCount((CFSetRef)inheritances);
      if (Count == CFSetGetCount(v7)) {
        char v8 = -[NSSet isEqualToSet:](inheritances, "isEqualToSet:", v7);
      }
      else {
        char v8 = 0;
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end