@interface NSXPCStoreConnectionManager
- (id)initForStore:(id)a3;
- (uint64_t)_checkinConnection:(uint64_t)result;
- (uint64_t)_checkoutConnection:(uint64_t)a1;
- (void)dealloc;
- (void)disconnectAllConnections:(uint64_t)a1;
- (void)sendMessageWithContext:(uint64_t)a1;
@end

@implementation NSXPCStoreConnectionManager

- (id)initForStore:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnectionManager;
  v4 = -[NSXPCStoreConnectionManager init](&v19, sel_init);
  if (!v4) {
    return v4;
  }
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "copy");
  objc_initWeak(&location, a3);
  v6 = (void *)objc_msgSend( (id)objc_msgSend(a3, "options"),  "valueForKey:",  @"NSPersistentStoreConnectionPoolMaxSize");
  unint64_t v7 = +[_PFTask getPhysicalMemory]();
  uint64_t v8 = 2LL;
  if (v7 >= 0x80000001) {
    uint64_t v8 = 3LL;
  }
  if (v6)
  {
    uint64_t v9 = [v6 integerValue];
    if (v9 <= 1) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = v9;
    }
  }

  v4->_maxConnections = v8;
  allConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  v4->_allConnections = allConnections;
  if (v4->_maxConnections)
  {
    unint64_t v11 = 0LL;
    do
    {
      id v12 = -[NSXPCStoreConnection initForStore:](objc_alloc(&OBJC_CLASS___NSXPCStoreConnection), "initForStore:", a3);
      if (v12) {
        -[NSMutableArray addObject:](v4->_allConnections, "addObject:", v12);
      }

      ++v11;
    }

    while (v11 < v4->_maxConnections);
    allConnections = v4->_allConnections;
  }

  if (-[NSMutableArray count](allConnections, "count"))
  {
    v13 = (NSMutableArray *)-[NSMutableArray mutableCopy](v4->_allConnections, "mutableCopy");
    v4->_availableConnections = v13;
    v4->_connectionLock._os_unfair_lock_opaque = 0;
    v4->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[NSMutableArray count](v13, "count"));
    v14 = (const char *)objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"XPCConnectionManager:%p",  a3),  "UTF8String");
    v4->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v14, MEMORY[0x1895F8AF8]);

    objc_destroyWeak(&location);
    return v4;
  }

  uint64_t v16 = [NSString stringWithFormat:@"NSXPCStoreConnection failed to initialize any connections for store at %@", objc_msgSend(a3, "URL")];
  id v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x1896075A8],  4224LL,  v16,  0LL);
  objc_exception_throw(v17);
  __break(1u);
  return result;
}

- (void)dealloc
{
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __38__NSXPCStoreConnectionManager_dealloc__block_invoke;
    block[3] = &unk_189EA7758;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }

  self->_availableConnections = 0LL;
  poolCounter = (dispatch_object_s *)self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnectionManager;
  -[NSXPCStoreConnectionManager dealloc](&v5, sel_dealloc);
}

uint64_t __38__NSXPCStoreConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSXPCStoreConnection disconnect](*(void *)(*((void *)&v9 + 1) + 8 * i));
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
  return [v2 drain];
}

- (uint64_t)_checkoutConnection:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *(dispatch_semaphore_s **)(a1 + 32);
  dispatch_time_t v5 = dispatch_time(0LL, 120000000000LL);
  uint64_t v6 = dispatch_semaphore_wait(v4, v5);
  if (v6)
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@" NSXPCStoreConnectionManager timed out waiting for a connection - %l",  v7,  v8,  v9,  v10,  v11,  v12,  v6);
    return 0LL;
  }

  os_unfair_lock_lock_with_options();
  uint64_t v14 = (void *)[*(id *)(a1 + 8) lastObject];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
    uint64_t v13 = (uint64_t)v15;
    [*(id *)(a1 + 8) removeObject:v15];
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  if (a2) {
    -[NSXPCStoreConnection reconnect](v13);
  }
  return v13;
}

- (uint64_t)_checkinConnection:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t v4 = (os_unfair_lock_s *)(result + 40);
      os_unfair_lock_lock_with_options();
      [*(id *)(v3 + 8) addObject:a2];

      os_unfair_lock_unlock(v4);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 32));
    }
  }

  return result;
}

- (void)sendMessageWithContext:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      id v2 = *(dispatch_queue_s **)(a1 + 48);
      v3[0] = MEMORY[0x1895F87A8];
      v3[1] = 3221225472LL;
      v3[2] = __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke;
      v3[3] = &unk_189EA7648;
      v3[4] = a1;
      v3[5] = a2;
      dispatch_sync(v2, v3);
    }
  }

void __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v10 = -[NSXPCStoreConnectionManager _checkoutConnection:](*(void *)(a1 + 32), 1);
  if (v10)
  {
    id v17 = (void *)v10;
    id v18 = objc_alloc_init(MEMORY[0x1896077E8]);
    -[NSXPCStoreConnection sendMessageWithContext:](v17, *(void *)(a1 + 40));
    uint64_t v19 = *(void *)(a1 + 40);
    if (!v19 || !*(void *)(v19 + 24))
    {
      -[NSXPCStoreConnection disconnect]((uint64_t)v17);
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __33__NSXPCStoreConnection_reconnect__block_invoke;
      v20[3] = &unk_189EA7758;
      v20[4] = v17;
      -[NSXPCStoreConnection performAndWait:]((uint64_t)v17, (uint64_t)v20);
    }

    -[NSXPCStoreConnectionManager _checkinConnection:](*(void *)(a1 + 32), v17);
    [v18 drain];
  }

  else
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"manager sendMessageWithContext: unable to checkout connection.",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

- (void)disconnectAllConnections:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000LL;
    uint64_t v9 = __Block_byref_object_copy__36;
    uint64_t v10 = __Block_byref_object_dispose__36;
    uint64_t v11 = 0LL;
    id v2 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke;
    block[3] = &unk_189EAADC0;
    char v5 = a2;
    block[4] = a1;
    void block[5] = &v6;
    dispatch_barrier_sync(v2, block);
    uint64_t v3 = (void *)v7[5];
    if (v3)
    {
      objc_exception_throw(v3);
      __break(1u);
    }

    else
    {
      _Block_object_dispose(&v6, 8);
    }
  }

uint64_t __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  if (v4)
  {
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = -[NSXPCStoreConnectionManager _checkoutConnection:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
      if (v6)
      {
        [v3 addObject:v6];
      }

      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
      }
    }
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t j = 0LL; j != v7; ++j)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v3);
        }
        -[NSXPCStoreConnection performAndWait:]( *(void *)(*((void *)&v36 + 1) + 8 * j),  (uint64_t)&__block_literal_global_25);
      }

      uint64_t v7 = [v3 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }

    while (v7);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v33;
    uint64_t v12 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t k = 0LL; k != v10; ++k)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * k);
        v31[0] = v12;
        v31[1] = 3221225472LL;
        v31[2] = __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke_3;
        v31[3] = &unk_189EA7758;
        v31[4] = v14;
        -[NSXPCStoreConnection performAndWait:](v14, (uint64_t)v31);
      }

      uint64_t v10 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }

    while (v10);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v15 = [v3 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t m = 0LL; m != v15; ++m)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v3);
          }
          -[NSXPCStoreConnectionManager _checkinConnection:]( *(void *)(a1 + 32),  *(void **)(*((void *)&v27 + 1) + 8 * m));
        }

        uint64_t v15 = [v3 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }

      while (v15);
    }
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t n = 0LL; n != v18; ++n)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v3);
          }
          uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * n);
          if (v21)
          {
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32LL));
          }
        }

        uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v40 count:16];
      }

      while (v18);
    }
  }

  [v3 removeAllObjects];
  return [v2 drain];
}

void __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke_3(uint64_t a1)
{
}

@end