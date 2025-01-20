@interface NSActivityAssertion
@end

@implementation NSActivityAssertion

dispatch_queue_t __57___NSActivityAssertion__expiringAssertionManagementQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expiringAssertionManagementQueue", 0LL);
  qword_18C496718 = (uint64_t)result;
  return result;
}

dispatch_queue_t __51___NSActivityAssertion__expiringTaskExecutionQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expiringTaskExecutionQueue", MEMORY[0x1895F8AF8]);
  qword_18C496728 = (uint64_t)result;
  return result;
}

dispatch_queue_t __56___NSActivityAssertion__expirationHandlerExecutionQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expirationHandlerExecutionQueue", MEMORY[0x1895F8AF8]);
  qword_18C496738 = (uint64_t)result;
  return result;
}

NSHashTable *__43___NSActivityAssertion__expiringActivities__block_invoke()
{
  dispatch_queue_t result = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  0LL,  0LL);
  qword_18C496748 = (uint64_t)result;
  return result;
}

uint64_t __48___NSActivityAssertion__dumpExpiringActivitives__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v0 = +[_NSActivityAssertion _expiringActivities](&OBJC_CLASS____NSActivityAssertion, "_expiringActivities");
  uint64_t result = [v0 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0LL;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v0);
        }
        NSLog( (NSString *)@"%lull: %@",  v3 + v5,  [*(id *)(*((void *)&v7 + 1) + 8 * v5) debugDescription]);
        ++v5;
      }

      while (v2 != v5);
      uint64_t result = [v0 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v2 = result;
      v3 += v5;
    }

    while (result);
  }

  return result;
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v0 = (void *)objc_msgSend( +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"),  "allObjects");
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v1 = [v0 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v9;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v0);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v4++) _fireExpirationHandler];
      }

      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }

    while (v2);
  }

  uint64_t v5 = +[_NSActivityAssertion _expirationHandlerExecutionQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expirationHandlerExecutionQueue");
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_2;
  block[3] = &unk_189C9A030;
  block[4] = v0;
  dispatch_barrier_async(v5, block);
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke_2(uint64_t a1)
{
  v3[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[_NSActivityAssertion _expiringAssertionManagementQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringAssertionManagementQueue");
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_3;
  v3[3] = &unk_189C9A030;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(v2, v3);
}

uint64_t __42___NSActivityAssertion__expireAllActivies__block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend( +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"),  "removeObject:",  *(void *)(*((void *)&v7 + 1) + 8 * v5++));
      }

      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }

    while (result);
  }

  return result;
}

uint64_t __38___NSActivityAssertion__bundleVersion__block_invoke()
{
  id v0 = -[NSBundle infoDictionary](+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"), "infoDictionary");
  qword_18C496750 = (uint64_t)-[NSDictionary objectForKey:](v0, "objectForKey:", *MEMORY[0x189604E18]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v1 = objc_alloc(&OBJC_CLASS___NSString);
    [(id)qword_18C496750 doubleValue];
    uint64_t result = -[NSString initWithFormat:](v1, "initWithFormat:", @"%f", v2);
  }

  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if ((result & 1) != 0) {
      return result;
    }
    uint64_t result = (uint64_t)@"unknown";
  }

  qword_18C496750 = result;
  return result;
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  return softLinkBKSProcessAssertionSetExpirationHandler((uint64_t)global_queue, (uint64_t)&__block_literal_global_38);
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_2()
{
  return +[_NSActivityAssertion _expireAllActivies](&OBJC_CLASS____NSActivityAssertion, "_expireAllActivies");
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_3( uint64_t a1)
{
  v6[5] = *MEMORY[0x1895F89C0];
  objc_msgSend( +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"),  "addObject:",  *(void *)(a1 + 32));
  id v2 = objc_alloc(getBKSProcessAssertionClass());
  uint64_t v3 = getpid();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4;
  v6[3] = &unk_189C9E870;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  uint64_t result = [v2 initWithPID:v3 flags:1 reason:4 name:v4 withHandler:v6];
  *(void *)(*(void *)(a1 + 32) + 72LL) = result;
  return result;
}

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4( uint64_t a1,  char a2)
{
  v4[5] = *MEMORY[0x1895F89C0];
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) _fireExpirationHandler];
    uint64_t v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringAssertionManagementQueue");
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5;
    v4[3] = &unk_189C9A030;
    v4[4] = *(void *)(a1 + 32);
    dispatch_async(v3, v4);
  }

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5( uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72LL))
  {
    objc_msgSend( +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"),  "removeObject:",  *(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];

    *(void *)(*(void *)(a1 + 32) + 72LL) = 0LL;
  }

void __40___NSActivityAssertion__endFromDealloc___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72LL))
  {
    objc_msgSend( +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"),  "removeObject:",  *(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];

    *(void *)(*(void *)(a1 + 32) + 72LL) = 0LL;
  }

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88LL));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88LL));
  uint64_t v4 = +[_NSActivityAssertion _expirationHandlerExecutionQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expirationHandlerExecutionQueue");
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2;
  block[3] = &unk_189C9E898;
  block[4] = *(void *)(a1 + 32);
  void block[5] = v3;
  dispatch_async(v4, block);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2(uint64_t a1)
{
  v5[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void **)(a1 + 40);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  uint64_t v4 = +[_NSActivityAssertion _expiringAssertionManagementQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringAssertionManagementQueue");
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3;
  v5[3] = &unk_189C9A030;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72LL) = 0LL;
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _endFromDealloc:0];
}

@end