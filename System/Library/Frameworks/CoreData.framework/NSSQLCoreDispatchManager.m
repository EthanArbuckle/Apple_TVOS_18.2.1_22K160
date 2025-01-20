@interface NSSQLCoreDispatchManager
- (NSSQLCoreDispatchManager)initWithSQLCore:(id)a3 seedConnection:(id)a4;
- (uint64_t)disconnectAllConnections;
- (uint64_t)enumerateAvailableConnectionsWithBlock:(uint64_t)result;
- (uint64_t)routeStoreRequest:(uint64_t)result;
- (void)dealloc;
- (void)scheduleBarrierBlock:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLCoreDispatchManager

- (uint64_t)routeStoreRequest:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          ++v6;
        }

        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v4 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (NSSQLCoreDispatchManager)initWithSQLCore:(id)a3 seedConnection:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSSQLCoreDispatchManager;
  uint64_t v6 = -[NSSQLCoreDispatchManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_sqlCore = (NSSQLCore *)a3;
    v6->_connectionManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    if (a3)
    {
      uint64_t v8 = objc_msgSend( (id)objc_msgSend(a3, "options"),  "objectForKey:",  @"NSPersistentStoreUbiquitousContentNameKey");
      __int128 v9 = off_189EA55A0;
      if (!v8) {
        __int128 v9 = off_189EA5568;
      }
      __int128 v10 = (objc_class *)*v9;
    }

    else
    {
      __int128 v10 = (objc_class *)&OBJC_CLASS___NSSQLDefaultConnectionManager;
    }

    __int128 v11 = (void *)[[v10 alloc] initWithSQLCore:a3 seedConnection:a4];
    if (v11)
    {
      -[NSMutableArray addObject:](v7->_connectionManagers, "addObject:", v11);
    }

    else
    {

      return 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  self->_sqlCore = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLCoreDispatchManager;
  -[NSSQLCoreDispatchManager dealloc](&v3, sel_dealloc);
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSMutableArray count](self->_connectionManagers, "count") == 1) {
    objc_msgSend( (id)-[NSMutableArray firstObject](self->_connectionManagers, "firstObject"),  "setExclusiveLockingMode:",  v3);
  }
}

- (uint64_t)disconnectAllConnections
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    v1 = *(void **)(result + 16);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          [*(id *)(*((void *)&v5 + 1) + 8 * v4++) disconnectAllConnections];
        }

        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)scheduleBarrierBlock:(id)a3
{
}

- (uint64_t)enumerateAvailableConnectionsWithBlock:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    uint64_t v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) enumerateAvailableConnectionsWithBlock:a2];
        }

        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }

      while (result);
    }
  }

  return result;
}

@end