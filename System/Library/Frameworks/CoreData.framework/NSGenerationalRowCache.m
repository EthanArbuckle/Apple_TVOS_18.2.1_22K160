@interface NSGenerationalRowCache
- (NSGenerationalRowCache)initWithStore:(id)a3;
- (id)rowCacheForGeneration:(uint64_t)a1;
- (void)dealloc;
- (void)forgetAllGenerationalExternalData;
- (void)removeRowCacheForGenerationWithIdentifier:(uint64_t)a1;
@end

@implementation NSGenerationalRowCache

- (id)rowCacheForGeneration:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  if (([a2 _isEnabled] & 1) == 0) {
    return *(id *)(a1 + 16);
  }
  v4 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, *(id *)(a1 + 8));
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = *((void *)v4 + 3);
  if (!v5) {
    return 0LL;
  }
  os_unfair_lock_lock_with_options();
  v6 = (void *)[*(id *)(a1 + 24) objectForKey:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    v7 = (void *)objc_msgSend( objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rowCacheClass")),  "initWithPersistentStore:",  *(void *)(a1 + 8));
    [*(id *)(a1 + 24) setObject:v7 forKey:v5];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  id v10 = v7;
  return v7;
}

- (NSGenerationalRowCache)initWithStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSGenerationalRowCache;
  v4 = -[NSGenerationalRowCache init](&v7, sel_init);
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_store = (NSPersistentStore *)a3;
    v4->_primaryCache = (NSPersistentStoreCache *)objc_msgSend( objc_alloc((Class)objc_msgSend( (id)objc_opt_class(),  "rowCacheClass")),  "initWithPersistentStore:",  a3);
    v5->_rowCachesByGenerationToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)dealloc
{
  self->_primaryCache = 0LL;
  self->_rowCachesByGenerationToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSGenerationalRowCache;
  -[NSGenerationalRowCache dealloc](&v3, sel_dealloc);
}

- (void)removeRowCacheForGenerationWithIdentifier:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      v4 = (os_unfair_lock_s *)(a1 + 32);
      os_unfair_lock_lock_with_options();
      [*(id *)(a1 + 24) removeObjectForKey:a2];
      os_unfair_lock_unlock(v4);
    }
  }

- (void)forgetAllGenerationalExternalData
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    uint64_t v3 = os_unfair_lock_lock_with_options();
    v4 = (void *)MEMORY[0x186E3E5D8](v3);
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          -[NSPersistentStoreCache forgetAllExternalData](*(void *)(*((void *)&v9 + 1) + 8 * v8++));
        }

        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    objc_autoreleasePoolPop(v4);
    os_unfair_lock_unlock(v2);
  }

@end