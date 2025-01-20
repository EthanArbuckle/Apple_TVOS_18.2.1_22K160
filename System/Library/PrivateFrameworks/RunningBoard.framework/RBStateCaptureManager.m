@interface RBStateCaptureManager
- (RBStateCaptureManager)init;
- (id)identifiers;
- (id)stateForSubsystem:(id)a3;
- (void)addItem:(id)a3;
- (void)addItem:(id)a3 withIdentifier:(id)a4;
- (void)addItemWithTitle:(id)a3 identifier:(id)a4 block:(id)a5;
- (void)removeItem:(id)a3;
- (void)removeItemWithIdentifier:(id)a3;
@end

@implementation RBStateCaptureManager

- (RBStateCaptureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBStateCaptureManager;
  v2 = -[RBStateCaptureManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___RBSStateCaptureSet);
    itemsWithoutIdentifiers = v2->_itemsWithoutIdentifiers;
    v2->_itemsWithoutIdentifiers = v3;

    uint64_t v5 = [MEMORY[0x189603FC8] dictionary];
    itemsByIdentifier = v2->_itemsByIdentifier;
    v2->_itemsByIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1896123B0] createBackgroundQueue:@"RBStateCaptureManager"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (id)stateForSubsystem:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189607940] string];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&_stateCaptureLock);
  itemsByIdentifier = self->_itemsByIdentifier;
  if (!v4)
  {
    uint64_t v7 = (void *)-[NSMutableDictionary copy](itemsByIdentifier, "copy");
    v9 = -[RBSStateCaptureSet itemsCopy](self->_itemsWithoutIdentifiers, "itemsCopy");
    os_unfair_lock_unlock(&_stateCaptureLock);
    uint64_t v10 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke;
    v15[3] = &unk_18A256CF8;
    id v11 = v5;
    id v16 = v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v15];
    v13[0] = v10;
    v13[1] = 3221225472LL;
    v13[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2;
    v13[3] = &unk_18A256D20;
    id v14 = v11;
    [v9 enumerateObjectsUsingBlock:v13];

    goto LABEL_5;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](itemsByIdentifier, "objectForKeyedSubscript:", v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&_stateCaptureLock);
  if (v7)
  {
    [v7 block];
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 appendString:v9];
LABEL_5:
  }

  return v5;
}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@",\n"];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@",\n"];
  }
  [*(id *)(a1 + 32) appendString:v3];
}

- (void)addItem:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 stateCaptureTitle];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke;
  v10[3] = &unk_18A256D48;
  id v11 = v6;
  id v9 = v6;
  -[RBStateCaptureManager addItemWithTitle:identifier:block:](self, "addItemWithTitle:identifier:block:", v8, v7, v10);
}

uint64_t __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) captureState];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__RBStateCaptureManager_addItem___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __33__RBStateCaptureManager_addItem___block_invoke(uint64_t a1)
{
}

- (void)addItemWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    rbs_state_log();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBStateCaptureManager addItemWithTitle:identifier:block:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  v19 = -[RBStateCaptureItem initWithTitle:identifier:block:]( objc_alloc(&OBJC_CLASS___RBStateCaptureItem),  "initWithTitle:identifier:block:",  v10,  v8,  v9);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByIdentifier, "setObject:forKeyedSubscript:", v19, v8);
  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (void)removeItemWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByIdentifier, "setObject:forKeyedSubscript:", 0LL, v4);

  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__RBStateCaptureManager_removeItem___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __36__RBStateCaptureManager_removeItem___block_invoke(uint64_t a1)
{
}

- (id)identifiers
{
  id v3 = (void *)MEMORY[0x189604010];
  -[NSMutableDictionary allKeys](self->_itemsByIdentifier, "allKeys");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setWithArray:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&_stateCaptureLock);
  return v5;
}

- (void).cxx_destruct
{
}

- (void)addItemWithTitle:(uint64_t)a3 identifier:(uint64_t)a4 block:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end