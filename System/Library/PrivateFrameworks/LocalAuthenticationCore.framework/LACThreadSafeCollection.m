@interface LACThreadSafeCollection
+ (id)strongObjectsCollection;
+ (id)weakObjectsCollection;
- (LACThreadSafeCollection)initWithWeakObjects:(BOOL)a3;
- (int64_t)count;
- (void)_synchronizedObjects:(id)a3;
- (void)append:(id)a3;
- (void)forEach:(id)a3;
- (void)remove:(id)a3;
@end

@implementation LACThreadSafeCollection

+ (id)weakObjectsCollection
{
  return  -[LACThreadSafeCollection initWithWeakObjects:]( objc_alloc(&OBJC_CLASS___LACThreadSafeCollection),  "initWithWeakObjects:",  1LL);
}

+ (id)strongObjectsCollection
{
  return  -[LACThreadSafeCollection initWithWeakObjects:]( objc_alloc(&OBJC_CLASS___LACThreadSafeCollection),  "initWithWeakObjects:",  0LL);
}

- (LACThreadSafeCollection)initWithWeakObjects:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACThreadSafeCollection;
  v4 = -[LACThreadSafeCollection init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_weakObjects = a3;
    if (a3)
    {
      [MEMORY[0x1896078B8] weakObjectsHashTable];
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v6 = (NSHashTable *)objc_alloc_init(MEMORY[0x1896078B8]);
    }

    objects = v5->_objects;
    v5->_objects = v6;

    v5->_objectsLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)append:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__LACThreadSafeCollection_append___block_invoke;
  v6[3] = &unk_18A3698F0;
  id v7 = v4;
  id v5 = v4;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v6);
}

uint64_t __34__LACThreadSafeCollection_append___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)remove:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__LACThreadSafeCollection_remove___block_invoke;
  v6[3] = &unk_18A3698F0;
  id v7 = v4;
  id v5 = v4;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v6);
}

uint64_t __34__LACThreadSafeCollection_remove___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (int64_t)count
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __32__LACThreadSafeCollection_count__block_invoke;
  v4[3] = &unk_18A369EB0;
  v4[4] = self;
  v4[5] = &v5;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__LACThreadSafeCollection_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (*(_BYTE *)(*(void *)(a1 + 32) + 20LL))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (*(void *)(*((void *)&v9 + 1) + 8 * i)) {
            ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
  }
}

- (void)forEach:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __35__LACThreadSafeCollection_forEach___block_invoke;
  v13[3] = &unk_18A369878;
  v13[4] = &v14;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v13);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = (id)v15[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }

    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

void __35__LACThreadSafeCollection_forEach___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_synchronizedObjects:(id)a3
{
  p_objectsLock = &self->_objectsLock;
  id v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_objectsLock);
  v5[2](v5, self->_objects);

  os_unfair_lock_unlock(p_objectsLock);
}

- (void).cxx_destruct
{
}

@end