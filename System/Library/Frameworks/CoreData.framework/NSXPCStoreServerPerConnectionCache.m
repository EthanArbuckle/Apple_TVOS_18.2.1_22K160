@interface NSXPCStoreServerPerConnectionCache
- (NSPersistentStoreCoordinator)coordinator;
- (NSXPCStoreServerPerConnectionCache)initWithCoordinator:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)releaseQueryGenerationForRemoteGeneration:(id *)result;
- (uint64_t)localGenerationForRemoteGeneration:(id *)a1;
- (void)dealloc;
- (void)registerQueryGeneration:(uint64_t)a3 forRemoteGeneration:;
- (void)setClientIdentifier:(void *)result;
@end

@implementation NSXPCStoreServerPerConnectionCache

- (NSXPCStoreServerPerConnectionCache)initWithCoordinator:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSXPCStoreServerPerConnectionCache;
  v4 = -[NSXPCStoreServerPerConnectionCache init](&v7, sel_init);
  if (v4)
  {
    v4->_coordinator = (NSPersistentStoreCoordinator *)a3;
    v5 = -[NSSQLitePrefetchRequestCache initWithSQLCore:]( [NSSQLitePrefetchRequestCache alloc],  "initWithSQLCore:",  objc_msgSend((id)objc_msgSend(a3, "persistentStores"), "lastObject"));
    v4->_generationTokenMap = 0LL;
    v4->_transaction = 0LL;
    v4->_prefetchRequestCache = v5;
  }

  return v4;
}

- (void)dealloc
{
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0LL;
  }

  self->_coordinator = 0LL;
  self->_generationTokenMap = 0LL;

  self->_prefetchRequestCache = 0LL;
  self->_clientIdentifier = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSXPCStoreServerPerConnectionCache;
  -[NSXPCStoreServerPerConnectionCache dealloc](&v4, sel_dealloc);
}

- (uint64_t)localGenerationForRemoteGeneration:(id *)a1
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    objc_sync_enter(a1);
    uint64_t v5 = [a1[3] objectForKey:a2];
    if (v5) {
      uint64_t v2 = *(void *)(v5 + 8);
    }
    else {
      uint64_t v2 = 0LL;
    }
    objc_sync_exit(a1);
  }

  return v2;
}

- (void)registerQueryGeneration:(uint64_t)a3 forRemoteGeneration:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_sync_enter(result);
    id v6 = (id)*((void *)v5 + 3);
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      *((void *)v5 + 3) = v6;
    }

    if (![v6 count] && !*((void *)v5 + 4)) {
      *((void *)v5 + 4) = os_transaction_create();
    }
    objc_super v7 = (char *)[*((id *)v5 + 3) objectForKey:a3];
    if (v7) {
      goto LABEL_12;
    }
    v8 = objc_alloc(&OBJC_CLASS____NSGenerationTokenMapEntry);
    if (v8)
    {
      v11.receiver = v8;
      v11.super_class = (Class)&OBJC_CLASS____NSGenerationTokenMapEntry;
      objc_super v7 = (char *)objc_msgSendSuper2(&v11, sel_init);
      if (v7)
      {
        *((void *)v7 + 1) = a2;
        *((_DWORD *)v7 + 4) = 0;
      }
    }

    else
    {
      objc_super v7 = 0LL;
    }

    [*((id *)v5 + 3) setObject:v7 forKey:a3];

    if (v7)
    {
LABEL_12:
      v9 = (unsigned int *)(v7 + 16);
      do
        unsigned int v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    return (void *)objc_sync_exit(v5);
  }

  return result;
}

- (id)releaseQueryGenerationForRemoteGeneration:(id *)result
{
  if (result)
  {
    v3 = result;
    objc_sync_enter(result);
    uint64_t v4 = [v3[3] objectForKey:a2];
    if (v4)
    {
      uint64_t v5 = (unsigned int *)(v4 + 16);
      do
        unsigned int v6 = __ldxr(v5);
      while (__stxr(v6 - 1, v5));
      unsigned int v7 = *v5;
      if (v7)
      {
        if ((v7 & 0x80000000) != 0)
        {
          uint64_t v8 = [NSString stringWithUTF8String:"refCount can't be negative"];
          _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, v16);
          v15 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v16) = 0;
            _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: refCount can't be negative",  (uint8_t *)&v16,  2u);
          }
        }
      }

      else
      {
        [v3[3] removeObjectForKey:a2];
      }
    }

    if (v3[4])
    {
      if (![v3[3] count])
      {

        v3[4] = 0LL;
      }
    }

    return (id *)objc_sync_exit(v3);
  }

  return result;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:]( self->_prefetchRequestCache,  "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache manyToOnePrefetchRequestForRelationshipNamed:onEntity:]( self->_prefetchRequestCache,  "manyToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache manyToManyPrefetchRequestsForRelationshipNamed:onEntity:]( self->_prefetchRequestCache,  "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:",  a3,  a4);
}

- (void)setClientIdentifier:(void *)result
{
  if (result)
  {
    v3 = result;
    uint64_t v4 = (void *)result[6];
    if (v4)
    {

      v3[6] = 0LL;
    }

    result = a2;
    v3[6] = result;
  }

  return result;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

@end