@interface LSContextAddChangeObserver
@end

@implementation LSContextAddChangeObserver

void ___LSContextAddChangeObserver_block_invoke(uint64_t a1)
{
  v2 = (unsigned __int8 *)(*(void *)(a1 + 32) + 24LL);
  _LSGetDispatchTokenQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___LSContextAddChangeObserver_block_invoke_2;
  v4[3] = &unk_189D74BF8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  _LSDispatchCoalescedAfterDelay(v2, v3, v4, 0.25);
}

void ___LSContextAddChangeObserver_block_invoke_2(uint64_t a1)
{
  v2 = (void (**)(void))MEMORY[0x186E2A7B8](*(void *)(*(void *)(a1 + 32) + 8LL));
  if (v2)
  {
    id v8 = 0LL;
    id v5 = 0LL;
    id v6 = 0LL;
    char v7 = 0;
    if (LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&v5,  *(_LSDServiceDomain **)(a1 + 40),  0LL))
    {
      v2[2](v2);
    }

    if (v5 && v7) {
      _LSContextDestroy(v5);
    }
    id v3 = v6;
    id v5 = 0LL;
    id v6 = 0LL;

    char v7 = 0;
    id v4 = v8;
    id v8 = 0LL;
  }
}

uint64_t ___LSContextAddChangeObserver_block_invoke_3(uint64_t a1)
{
  v2 = (void *)gChangeObservers;
  if (!gChangeObservers)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v4 = (void *)gChangeObservers;
    gChangeObservers = (uint64_t)v3;

    v2 = (void *)gChangeObservers;
  }

  return [v2 addObject:*(void *)(a1 + 32)];
}

@end