@interface VMUGroupType
- (void)enumerateGroups:(void *)a3 withBlock:(id)a4;
@end

@implementation VMUGroupType

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v29 = __42__VMUGroupType_enumerateGroups_withBlock___block_invoke;
  v30 = &unk_189DFEC08;
  v31 = self;
  id v8 = v7;
  id v32 = v8;
  v9 = v28;
  unsigned int v10 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v11 = 0LL;
    do
    {
      v12 = (char *)a3 + (v11 >> 3);
      unsigned int v13 = v12[4];
      uint64_t v14 = v11;
      if (v12[4])
      {
        do
        {
          if ((v13 & 1) != 0) {
            v29((uint64_t)v9, v14);
          }
          if (v13 < 2) {
            break;
          }
          uint64_t v14 = (v14 + 1);
          v13 >>= 1;
        }

        while (v14 < v10);
      }

      uint64_t v11 = (v11 + 8);
    }

    while (v11 < v10);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  [v8 allKeys];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 sortedArrayUsingSelector:sel_compare_];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x186E32E40]();
        [v8 objectForKeyedSubscript:v21];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v23);

        objc_autoreleasePoolPop(v22);
        ++v20;
      }

      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }

    while (v18);
  }
}

void __42__VMUGroupType_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x186E32E40]();
  [*(id *)(a1 + 32) typeNameForNode:a2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  v6 = (VMUNodeGroup *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___VMUNodeGroup);
    [*(id *)(a1 + 32) graph];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VMUNodeGroup initWithName:graph:](v7, "initWithName:graph:", v5, v8);

    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }

  -[VMUNodeGroup addNode:](v6, "addNode:", a2);

  objc_autoreleasePoolPop(v4);
}

@end