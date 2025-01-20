@interface VMUGroupByNode
- (void)enumerateGroups:(void *)a3 withBlock:(id)a4;
@end

@implementation VMUGroupByNode

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v15 = __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke;
  v16 = &unk_189DFFF60;
  v17 = self;
  id v7 = v6;
  id v18 = v7;
  v8 = v14;
  unsigned int v9 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v10 = 0LL;
    do
    {
      v11 = (char *)a3 + (v10 >> 3);
      unsigned int v12 = v11[4];
      uint64_t v13 = v10;
      if (v11[4])
      {
        do
        {
          if ((v12 & 1) != 0) {
            v15((uint64_t)v8, v13);
          }
          if (v12 < 2) {
            break;
          }
          uint64_t v13 = (v13 + 1);
          v12 >>= 1;
        }

        while (v13 < v9);
      }

      uint64_t v10 = (v10 + 8);
    }

    while (v10 < v9);
  }
}

void __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x186E32E40]();
  [*(id *)(a1 + 32) typeNameForNode:a2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc(&OBJC_CLASS___VMUNodeGroup);
  [*(id *)(a1 + 32) graph];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VMUNodeGroup initWithName:graph:](v6, "initWithName:graph:", v5, v7);

  -[VMUNodeGroup addNode:](v8, "addNode:", a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

  objc_autoreleasePoolPop(v4);
}

@end