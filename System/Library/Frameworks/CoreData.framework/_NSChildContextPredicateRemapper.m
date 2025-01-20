@interface _NSChildContextPredicateRemapper
- (_NSChildContextPredicateRemapper)init;
- (_NSChildContextPredicateRemapper)initWithContext:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4;
- (id)replacementValueForValue:(uint64_t)a1;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSChildContextPredicateRemapper

- (_NSChildContextPredicateRemapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSChildContextPredicateRemapper;
  return -[_NSChildContextPredicateRemapper init](&v3, sel_init);
}

- (_NSChildContextPredicateRemapper)initWithContext:(id)a3
{
  v4 = -[_NSChildContextPredicateRemapper init](self, "init");
  if (v4) {
    v4->_context = (NSManagedObjectContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSChildContextPredicateRemapper;
  -[_NSChildContextPredicateRemapper dealloc](&v3, sel_dealloc);
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  if (!a3 || !a4) {
    return (id)[a3 copy];
  }
  v5 = (void *)[a3 copy];
  [v5 acceptVisitor:self flags:1];
  return v5;
}

- (id)replacementValueForValue:(uint64_t)a1
{
  id v2 = 0LL;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (!a1 || !a2) {
    return v2;
  }
  obuint64_t j = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    obuint64_t j = (id)[obj objectID];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([obj isNSArray])
    {
      id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v34;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v34 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:]( a1,  *(void *)(*((void *)&v33 + 1) + 8 * i));
            [v2 addObject:v12];
          }

          uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
        }

        while (v9);
      }
    }

    else if ([obj isNSSet])
    {
      id v2 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        do
        {
          for (uint64_t j = 0LL; j != v14; ++j)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:]( a1,  *(void *)(*((void *)&v29 + 1) + 8 * j));
            [v2 addObject:v17];
          }

          uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
        }

        while (v14);
      }
    }

    else
    {
      if (![obj isNSOrderedSet])
      {
        else {
          return obj;
        }
      }

      id v2 = objc_alloc_init(MEMORY[0x189603FD0]);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t k = 0LL; k != v20; ++k)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:]( a1,  *(void *)(*((void *)&v25 + 1) + 8 * k));
            [v2 addObject:v23];
          }

          uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
        }

        while (v20);
      }
    }

    return v2;
  }

  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    v5 = *(id **)(*(void *)(v4 + 168) + 8LL);
    v6 = obj;
    if (v5)
    {
      uint64_t v7 = [*v5 objectForKey:obj];
      v6 = obj;
      if (v7) {
        v6 = (void *)v7;
      }
    }
  }

  else
  {
    v6 = obj;
  }

  return v6;
}

- (void)visitPredicateExpression:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)[a3 constantValue];
    if (v5)
    {
      id v6 = v5;
      id v7 = -[_NSChildContextPredicateRemapper replacementValueForValue:]((uint64_t)self, v5);
      uint64_t v8 = v7;
      if (v7)
      {
        if (v7 != v6)
        {
          id v9 = v7;
          object_setInstanceVariableWithStrongDefault(a3, "constantValue", v7);
          uint64_t v8 = v9;
        }
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

@end