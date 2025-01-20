@interface NSSQLDefaultConnectionManager
- (BOOL)handleStoreRequest:(id)a3;
- (NSSQLDefaultConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5;
- (uint64_t)_checkinConnection:(uint64_t)result;
- (void)_checkoutConnectionOfType:(uint64_t)a1;
- (void)dealloc;
- (void)disconnectAllConnections;
- (void)enumerateAvailableConnectionsWithBlock:(id)a3;
- (void)scheduleBarrierBlock:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLDefaultConnectionManager

- (BOOL)handleStoreRequest:(id)a3
{
  if (!a3) {
    return 1;
  }
  [*((id *)a3 + 2) requestType];
  v5 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:]((uint64_t)self);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)a3, v5);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  uint64_t v16 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke;
  v10[3] = &unk_189EA8A08;
  v10[4] = v6;
  v10[5] = a3;
  v10[7] = &v17;
  v10[8] = &v11;
  v10[6] = self;
  -[NSSQLiteConnection performAndWait:](v6, (uint64_t)v10);
  v7 = (void *)v12[5];
  if (!v7)
  {
    BOOL v8 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);
    return v8;
  }

  objc_exception_throw(v7);
  __break(1u);
  return result;
}

- (void)_checkoutConnectionOfType:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v2 = *(dispatch_semaphore_s **)(a1 + 40);
  dispatch_time_t v3 = dispatch_time(0LL, 120000000000LL);
  uint64_t v4 = dispatch_semaphore_wait(v2, v3);
  v5 = 0LL;
  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v6 = (void *)[*(id *)(a1 + 24) lastObject];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
      v5 = v7;
      [*(id *)(a1 + 24) removeLastObject];
    }

    else
    {
      v5 = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }

  return v5;
}

uint64_t __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  dispatch_time_t v3 = *(void **)(a1 + 32);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) executeRequestUsingConnection:v3];
  -[NSSQLStoreRequestContext setConnection:](*(void *)(a1 + 40), 0LL);
  -[NSSQLDefaultConnectionManager _checkinConnection:](*(void *)(a1 + 48), (uint64_t)v3);

  return [v2 drain];
}

- (uint64_t)_checkinConnection:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      os_unfair_lock_lock_with_options();
      [*(id *)(v3 + 24) addObject:a2];
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 40));
    }
  }

  return result;
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke(uint64_t a1)
{
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2(uint64_t a1)
{
}

- (NSSQLDefaultConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  v34[7] = *MEMORY[0x1895F89C0];
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NSSQLDefaultConnectionManager;
  v9 = -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:]( &v32,  sel_initWithSQLCore_priority_seedConnection_);
  if (!v9) {
    return v9;
  }
  v10 = (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"SQLQueue: %@ : %p", objc_msgSend((id)objc_msgSend(a3, "_persistentStoreCoordinator"), "name"), v9), "cStringUsingEncoding:", 1];
  if (a4 == 1)
  {
    dispatch_qos_class_t v11 = QOS_CLASS_USER_INITIATED;
  }

  else
  {
    uint64_t v12 = [a3 _persistentStoreCoordinator];
    if (!v12) {
      goto LABEL_8;
    }
    unsigned int v13 = *(unsigned __int16 *)(v12 + 24);
    dispatch_qos_class_t v11 = (v13 >> 2);
  }

  v14 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1895F8AF8], v11, 0);
  if (!v14)
  {
    Name = sel_getName(a2);
    _NSCoreDataLog( 1LL,  (uint64_t)@"dispatch_queue_attr_make_with_qos_class() returned NULL in %s",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)Name);
LABEL_8:
    v14 = (dispatch_queue_attr_s *)MEMORY[0x1895F8AF8];
  }

  v9->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v10, v14);
  dispatch_release(v14);
  v9->_connectionLock._os_unfair_lock_opaque = 0;
  v9->_availableConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  v22 = (void *)objc_msgSend( (id)objc_msgSend(-[NSSQLConnectionManager sqlCore](v9, "sqlCore"), "options"),  "valueForKey:",  @"NSPersistentStoreConnectionPoolMaxSize");
  else {
    uint64_t v23 = 3LL;
  }
  if (v22)
  {
    uint64_t v24 = [v22 integerValue];
    if (v24 <= 1) {
      uint64_t v23 = 1LL;
    }
    else {
      uint64_t v23 = v24;
    }
  }

  uint64_t v25 = -[NSSQLConnectionManager sqlCore](v9, "sqlCore");
  uint64_t v26 = v23 - (a5 != 0LL);
  if (v25 && (*(_DWORD *)(v25 + 200) & 0x1C) == 8
    || (uint64_t v27 = -[NSSQLConnectionManager sqlCore](v9, "sqlCore")) != 0 && (*(_DWORD *)(v27 + 200) & 0x1C) == 4)
  {
    v26 -= (unint64_t)v26 > 2;
    int v28 = 1;
  }

  else
  {
    int v28 = 0;
  }

  if (-[NSMutableArray count](v9->_availableConnections, "count") < v26)
  {
    uint64_t v29 = MEMORY[0x1895F87A8];
    do
    {
      id v30 = -[NSSQLiteConnection initForSQLCore:]( objc_alloc(&OBJC_CLASS___NSSQLiteConnection),  "initForSQLCore:",  -[NSSQLConnectionManager sqlCore](v9, "sqlCore"));
      -[NSMutableArray addObject:](v9->_availableConnections, "addObject:", v30);
      if (v28)
      {
        v34[0] = v29;
        v34[1] = 3221225472LL;
        v34[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke;
        v34[3] = &unk_189EA7758;
        v34[4] = v30;
        -[NSSQLiteConnection performAndWait:]((uint64_t)v30, (uint64_t)v34);
      }
    }

    while (-[NSMutableArray count](v9->_availableConnections, "count") < v26);
  }

  if (a5)
  {
    -[NSMutableArray addObject:](v9->_availableConnections, "addObject:", a5);
    if (v28)
    {
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2;
      v33[3] = &unk_189EA7758;
      v33[4] = a5;
      -[NSSQLiteConnection performAndWait:]((uint64_t)a5, (uint64_t)v33);
    }
  }

  v9->_allConnections = (NSArray *)-[NSMutableArray copy](v9->_availableConnections, "copy");
  v9->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[NSMutableArray count](v9->_availableConnections, "count"));
  return v9;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke;
    block[3] = &unk_189EA7758;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    allConnections = self->_allConnections;
    uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( allConnections,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      uint64_t v8 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(allConnections);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v13[0] = v8;
          v13[1] = 3221225472LL;
          v13[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3;
          v13[3] = &unk_189EA7758;
          v13[4] = v10;
          -[NSSQLiteConnection performAndWait:](v10, (uint64_t)v13);
        }

        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( allConnections,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
      }

      while (v6);
    }

    self->_allConnections = 0LL;
  }

  self->_availableConnections = 0LL;
  poolCounter = (dispatch_object_s *)self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0LL;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSQLDefaultConnectionManager;
  -[NSSQLConnectionManager dealloc](&v12, sel_dealloc);
}

uint64_t __40__NSSQLDefaultConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10[0] = v6;
        v10[1] = 3221225472LL;
        v10[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2;
        v10[3] = &unk_189EA7758;
        v10[4] = v8;
        -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v10);
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
  uint64_t result = [v2 drain];
  if ((_DWORD)v4)
  {
    objc_exception_rethrow();
    __break(1u);
  }

  return result;
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2(uint64_t a1)
{
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3(uint64_t a1)
{
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke;
  v3[3] = &__block_descriptor_33_e28_v16__0__NSSQLiteConnection_8l;
  BOOL v4 = a3;
  -[NSSQLDefaultConnectionManager scheduleConnectionsBarrier:](self, "scheduleConnectionsBarrier:", v3);
}

uint64_t __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setExclusiveLockingMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)scheduleBarrierBlock:(id)a3
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  uint64_t v11 = 0LL;
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke;
  block[3] = &unk_189EA8A50;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v6;
  dispatch_barrier_sync(processingQueue, block);
  BOOL v4 = (void *)v7[5];
  if (v4)
  {
    objc_exception_throw(v4);
    __break(1u);
  }

  else
  {
    _Block_object_dispose(&v6, 8);
  }

uint64_t __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  if (v4)
  {
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }

      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
      }
    }
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t j = 0LL; j != v7; ++j)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLiteConnection performAndWait:]( *(void *)(*((void *)&v18 + 1) + 8 * j),  (uint64_t)&__block_literal_global_43);
      }

      uint64_t v7 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t k = 0LL; k != v10; ++k)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:]( *(void *)(a1 + 32),  *(void *)(*((void *)&v14 + 1) + 8 * k));
      }

      uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v10);
  }

  [v3 removeAllObjects];
  return [v2 drain];
}

uint64_t __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  if (v4)
  {
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }

      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
      }
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t j = 0LL; j != v7; ++j)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        v21[0] = v9;
        v21[1] = 3221225472LL;
        v21[2] = __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke_2;
        v21[3] = &unk_189EA8A98;
        uint64_t v12 = *(void *)(a1 + 40);
        v21[4] = v11;
        v21[5] = v12;
        -[NSSQLiteConnection performAndWait:](v11, (uint64_t)v21);
      }

      uint64_t v7 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v7);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v13 = [v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t k = 0LL; k != v13; ++k)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:]( *(void *)(a1 + 32),  *(void *)(*((void *)&v17 + 1) + 8 * k));
      }

      uint64_t v13 = [v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }

    while (v13);
  }

  [v3 removeAllObjects];
  return [v2 drain];
}

- (void)disconnectAllConnections
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  uint64_t v8 = __Block_byref_object_copy__15;
  uint64_t v9 = __Block_byref_object_dispose__15;
  uint64_t v10 = 0LL;
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke;
  v4[3] = &unk_189EA7258;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_barrier_sync(processingQueue, v4);
  uint64_t v3 = (void *)v6[5];
  if (v3)
  {
    objc_exception_throw(v3);
    __break(1u);
  }

  else
  {
    _Block_object_dispose(&v5, 8);
  }

uint64_t __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  if (v4)
  {
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }

      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
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
        -[NSSQLiteConnection performAndWait:]( *(void *)(*((void *)&v36 + 1) + 8 * j),  (uint64_t)&__block_literal_global_50);
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
    do
    {
      for (uint64_t k = 0LL; k != v10; ++k)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * k);
        if (v13)
        {

          *(void *)(v13 + 208) = 0LL;
        }
      }

      uint64_t v10 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }

    while (v10);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v14 = [v3 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    uint64_t v16 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t m = 0LL; m != v14; ++m)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v3);
        }
        uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * m);
        v27[0] = v16;
        v27[1] = 3221225472LL;
        v27[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke_3;
        v27[3] = &unk_189EA7758;
        v27[4] = v18;
        -[NSSQLiteConnection performAndWait:](v18, (uint64_t)v27);
      }

      uint64_t v14 = [v3 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }

    while (v14);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v19 = [v3 countByEnumeratingWithState:&v23 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t n = 0LL; n != v19; ++n)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:]( *(void *)(a1 + 32),  *(void *)(*((void *)&v23 + 1) + 8 * n));
      }

      uint64_t v19 = [v3 countByEnumeratingWithState:&v23 objects:v40 count:16];
    }

    while (v19);
  }

  [v3 removeAllObjects];
  return [v2 drain];
}

- (void)enumerateAvailableConnectionsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
  p_connectionLocuint64_t k = &self->_connectionLock;
  os_unfair_lock_lock_with_options();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  availableConnections = self->_availableConnections;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( availableConnections,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(availableConnections);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13[0] = v10;
        v13[1] = 3221225472LL;
        v13[2] = __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke;
        v13[3] = &unk_189EA8A98;
        v13[4] = v12;
        void v13[5] = a3;
        -[NSSQLiteConnection performAndWait:](v12, (uint64_t)v13);
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( availableConnections,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  os_unfair_lock_unlock(p_connectionLock);
  [v5 drain];
}

uint64_t __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

@end