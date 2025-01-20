@interface NSSQLRowCache
+ (void)initialize;
- (NSSQLRowCache)initWithPersistentStore:(id)a3;
- (id)sqlCore;
- (void)dealloc;
@end

@implementation NSSQLRowCache

+ (void)initialize
{
}

- (NSSQLRowCache)initWithPersistentStore:(id)a3
{
  v6[0] = 0LL;
  v6[1] = _PFfastRowRetain;
  v6[2] = _PFfastRowRelease;
  __int128 v7 = *(_OWORD *)(MEMORY[0x189605250] + 24LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLRowCache;
  result = -[NSPersistentStoreCache initWithValueCallbacks:preserveToManyRelationships:]( &v5,  sel_initWithValueCallbacks_preserveToManyRelationships_,  v6,  1LL);
  if (result) {
    result->_sqlCore = (NSSQLCore *)a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_sqlCore)
  {
    self->_sqlCore = 0LL;
    externalData = (const __CFDictionary *)self->super._externalData;
    unint64_t Count = CFDictionaryGetCount(externalData);
    objc_super v5 = 0LL;
    v6 = 0LL;
    if (Count >= 0x12C)
    {
      unint64_t v7 = Count;
      v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v8 = malloc_default_zone();
      }
      v9 = (const void **)malloc_zone_malloc(v8, 8 * v7);
      CFDictionaryGetKeysAndValues(externalData, 0LL, v9);
      v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v10 = malloc_default_zone();
      }
      v6 = malloc_zone_malloc(v10, 0x20uLL);
      void *v6 = v9;
      v6[1] = v7;
      v6[2] = 0LL;
      objc_super v5 = -[_PFTask initWithFunction:withArgument:andPriority:]( objc_alloc(&OBJC_CLASS____PFTask),  "initWithFunction:withArgument:andPriority:",  _deallocateSQLRowCacheOnBackgroundThread,  v6,  0LL);
      do
      {
        v11 = *v9++;
        v11[4] |= 2u;
        --v7;
      }

      while (v7);
    }

    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NSSQLRowCache;
    -[NSPersistentStoreCache dealloc](&v13, sel_dealloc);
    if (v5)
    {
      pthread_mutex_lock(&v5->lock);
      v6[2] = 1LL;
      pthread_cond_broadcast(&v5->condition);
      pthread_mutex_unlock(&v5->lock);
    }
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSSQLRowCache;
    -[NSPersistentStoreCache dealloc](&v12, sel_dealloc);
  }

- (id)sqlCore
{
  return self->_sqlCore;
}

@end