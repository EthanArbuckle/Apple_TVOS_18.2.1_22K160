@interface RBSStateCaptureSet
- (NSSet)itemsCopy;
- (RBSStateCaptureSet)init;
- (void)addItem:(id)a3;
- (void)removeItem:(id)a3;
@end

@implementation RBSStateCaptureSet

- (RBSStateCaptureSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSStateCaptureSet;
  v2 = -[RBSStateCaptureSet init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FE0] set];
    stateCaptureSegments = v2->_stateCaptureSegments;
    v2->_stateCaptureSegments = (NSMutableSet *)v3;
  }

  return v2;
}

- (void)addItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 captureState];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 length];

  os_unfair_lock_assert_owner(&_stateCaptureLock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v7 = self->_stateCaptureSegments;
  uint64_t v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (!v8)
  {

LABEL_15:
    v10 = objc_alloc_init(&OBJC_CLASS___RBSStateCaptureSetSegment);
    -[NSMutableSet addObject:](self->_stateCaptureSegments, "addObject:", v10);
    goto LABEL_16;
  }

  uint64_t v9 = v8;
  v10 = 0LL;
  uint64_t v11 = *(void *)v17;
  do
  {
    for (uint64_t i = 0LL; i != v9; ++i)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if ((unint64_t)objc_msgSend(v13, "count", (void)v16) <= 0x18)
      {
        if (!v10 || (unint64_t v14 = -[RBSStateCaptureSetSegment count](v10, "count"), v14 < [v13 count]))
        {
          v15 = v13;

          v10 = v15;
        }
      }
    }

    uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  }

  while (v9);

  if (!v10) {
    goto LABEL_15;
  }
LABEL_16:
  -[RBSStateCaptureSetSegment addItem:withLength:](v10, "addItem:withLength:", v4, v6, (void)v16);
}

- (void)removeItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = self->_stateCaptureSegments;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      if (objc_msgSend(v10, "containsItem:", v4, (void)v19)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v11 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    [v11 removeItem:v4];
    if (![v11 count]) {
      -[NSMutableSet removeObject:](self->_stateCaptureSegments, "removeObject:", v11);
    }
  }

  else
  {
LABEL_9:

LABEL_13:
    rbs_general_log();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBSStateCaptureSet removeItem:].cold.1((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
    }

    id v11 = 0LL;
  }
}

- (NSSet)itemsCopy
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  [MEMORY[0x189603FE0] set];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_stateCaptureSegments;
  uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "items", (void)v12);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 allObjects];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObjectsFromArray:v10];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (void).cxx_destruct
{
}

- (void)removeItem:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end