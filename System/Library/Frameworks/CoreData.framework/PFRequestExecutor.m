@interface PFRequestExecutor
@end

@implementation PFRequestExecutor

void __53___PFRequestExecutor_executeRequest_inContext_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator", 0), "persistentStores");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v7) isCloudKitEnabled])
        {
          uint64_t v8 = *(void *)(a1 + 40);
          if (v8) {
            v9 = *(dispatch_group_s **)(v8 + 8);
          }
          else {
            v9 = 0LL;
          }
          dispatch_group_enter(v9);
          ++v5;
        }

        ++v7;
      }

      while (v4 != v7);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v4 = v10;
    }

    while (v10);
    if (v5
      && ![*(id *)(a1 + 32) executeRequest:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 56) + 8) + 40])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      id v11 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      do
      {
        uint64_t v12 = *(void *)(a1 + 40);
        if (v12) {
          v13 = *(dispatch_group_s **)(v12 + 8);
        }
        else {
          v13 = 0LL;
        }
        dispatch_group_leave(v13);
        --v5;
      }

      while (v5);
    }
  }

@end