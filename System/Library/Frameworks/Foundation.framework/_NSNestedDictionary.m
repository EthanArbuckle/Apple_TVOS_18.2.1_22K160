@interface _NSNestedDictionary
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (uint64_t)_recursiveAllKeys;
- (uint64_t)_recursiveAllValues;
- (unint64_t)count;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _NSNestedDictionary

- (uint64_t)_recursiveAllKeys
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  Class = (__objc2_class *)object_getClass(*(id *)(a1 + 16));
  v3 = *(void **)(a1 + 16);
  if (Class == &OBJC_CLASS____NSNestedDictionary) {
    uint64_t v4 = -[_NSNestedDictionary _recursiveAllKeys](v3);
  }
  else {
    uint64_t v4 = [v3 allKeys];
  }
  uint64_t v5 = v4;
  if (*(void *)(a1 + 8))
  {
    if (v4) {
      id v6 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:v4];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
    }
    v7 = v6;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = *(void **)(a1 + 8);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }

      while (v10);
    }

    uint64_t v5 = [v7 allObjects];
  }

  if (!v5) {
    return [MEMORY[0x189603F18] array];
  }
  return v5;
}

- (uint64_t)_recursiveAllValues
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  Class = (__objc2_class *)object_getClass(*(id *)(a1 + 16));
  v3 = *(void **)(a1 + 16);
  if (Class == &OBJC_CLASS____NSNestedDictionary) {
    uint64_t v4 = -[_NSNestedDictionary _recursiveAllValues](v3);
  }
  else {
    uint64_t v4 = [v3 allValues];
  }
  uint64_t v5 = v4;
  if (*(void *)(a1 + 8))
  {
    if (v4) {
      id v6 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:v4];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
    }
    v7 = v6;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = *(void **)(a1 + 8);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( v7,  "addObject:",  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i)));
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }

      while (v10);
    }

    uint64_t v5 = [v7 allObjects];
  }

  if (!v5) {
    return [MEMORY[0x189603F18] array];
  }
  return v5;
}

- (unint64_t)count
{
  id bindings = self->_bindings;
  if (bindings && self->_locals) {
    return [(id)-[_NSNestedDictionary _recursiveAllKeys]((uint64_t)self) count];
  }
  uint64_t v5 = [bindings count];
  return [self->_locals count] + v5;
}

- (id)objectForKey:(id)a3
{
  id result = (id)objc_msgSend(self->_locals, "objectForKey:");
  if (!result) {
    return (id)[self->_bindings objectForKey:a3];
  }
  return result;
}

- (id)keyEnumerator
{
  return (id)[(id)-[_NSNestedDictionary _recursiveAllKeys]((uint64_t)self) objectEnumerator];
}

- (id)objectEnumerator
{
  return (id)[(id)-[_NSNestedDictionary _recursiveAllValues]((uint64_t)self) objectEnumerator];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id locals = self->_locals;
  if (!locals)
  {
    id locals = objc_alloc_init(MEMORY[0x189603FC8]);
    self->_id locals = locals;
  }

  [locals setObject:a3 forKey:a4];
}

- (void)removeObjectForKey:(id)a3
{
}

@end