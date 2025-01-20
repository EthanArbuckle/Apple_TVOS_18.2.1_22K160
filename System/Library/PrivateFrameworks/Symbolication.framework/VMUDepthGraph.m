@interface VMUDepthGraph
- (VMUDepthGraph)initWithGraph:(id)a3;
- (int64_t)markNodes:(void *)a3 atDepth:(unsigned int)a4;
- (unsigned)depthOfNode:(unsigned int)a3;
- (void)_buildDepthMap;
- (void)_buildNextDepth:(id)a3 into:(id)a4 depth:(unsigned int)a5;
- (void)_processNodes:(void *)a3 withDepth:(unsigned int)a4;
- (void)dealloc;
@end

@implementation VMUDepthGraph

- (VMUDepthGraph)initWithGraph:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUDepthGraph;
  -[VMUDepthGraph dealloc](&v3, sel_dealloc);
}

- (unsigned)depthOfNode:(unsigned int)a3
{
  return self->_depthMap[a3];
}

- (int64_t)markNodes:(void *)a3 atDepth:(unsigned int)a4
{
  int v7 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  if (v7 < 1) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = 0LL;
  int64_t result = 0LL;
  do
  {
    if (self->_depthMap[v9] == a4)
    {
      ++result;
    }

    ++v9;
  }

  while (v8 != v9);
  return result;
}

- (void)_processNodes:(void *)a3 withDepth:(unsigned int)a4
{
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v12 = __41__VMUDepthGraph__processNodes_withDepth___block_invoke;
  v13 = &unk_189DFEBB8;
  v14 = self;
  unsigned int v15 = a4;
  v5 = v11;
  unsigned int v6 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v7 = 0LL;
    do
    {
      int v8 = (char *)a3 + (v7 >> 3);
      unsigned int v9 = v8[4];
      uint64_t v10 = v7;
      if (v8[4])
      {
        do
        {
          if ((v9 & 1) != 0) {
            v12((uint64_t)v5, v10);
          }
          if (v9 < 2) {
            break;
          }
          uint64_t v10 = (v10 + 1);
          v9 >>= 1;
        }

        while (v10 < v6);
      }

      uint64_t v7 = (v7 + 8);
    }

    while (v7 < v6);
  }
}

uint64_t __41__VMUDepthGraph__processNodes_withDepth___block_invoke(uint64_t result, unsigned int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 16LL) + 4LL * a2) = *(_DWORD *)(result + 40);
  return result;
}

- (void)_buildNextDepth:(id)a3 into:(id)a4 depth:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self->_graph;
  [v9 removeAllObjects];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * v14) intValue];
        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 3221225472LL;
        v17[2] = __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke;
        v17[3] = &unk_189DFEBE0;
        v17[4] = self;
        unsigned int v19 = a5;
        id v18 = v9;
        -[VMUDirectedGraph enumerateEdgesOfNode:withBlock:](v10, "enumerateEdgesOfNode:withBlock:", v15, v17);

        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }
}

void __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (*(_DWORD *)(v4 + 4LL * a4) == -1)
  {
    *(_DWORD *)(v4 + 4LL * a4) = *(_DWORD *)(a1 + 48);
    v5 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInt:a4];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 addObject:v6];
  }

- (void)_buildDepthMap
{
  objc_super v3 = self->_graph;
  size_t v4 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](v3, "nodeNamespaceSize");
  v5 = malloc(v4);
  int __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_depthMap = (unsigned int *)v5;
  LODWORD(v4) = -[VMUDirectedGraph nodeNamespaceSize](v3, "nodeNamespaceSize");
  id v6 = (unsigned int *)calloc(1uLL, ((v4 + 7) >> 3) + 4);
  *id v6 = v4;
  -[VMUProcessObjectGraph markRootNodes:](v3, "markRootNodes:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  __int128 v20 = __31__VMUDepthGraph__buildDepthMap__block_invoke;
  __int128 v21 = &unk_189DFEC08;
  id v9 = v7;
  id v22 = v9;
  __int128 v23 = self;
  uint64_t v10 = v19;
  unsigned int v11 = *v6;
  if (*v6)
  {
    uint64_t v12 = 0LL;
    do
    {
      uint64_t v13 = (char *)v6 + (v12 >> 3);
      unsigned int v14 = v13[4];
      uint64_t v15 = v12;
      if (v13[4])
      {
        do
        {
          if ((v14 & 1) != 0) {
            v20((uint64_t)v10, v15);
          }
          if (v14 < 2) {
            break;
          }
          uint64_t v15 = (v15 + 1);
          v14 >>= 1;
        }

        while (v15 < v11);
      }

      uint64_t v12 = (v12 + 8);
    }

    while (v12 < v11);
  }

  free(v6);
  uint64_t v16 = 1LL;
  do
  {
    if ((v16 & 1) != 0)
    {
      id v17 = v9;
      id v18 = v8;
    }

    else
    {
      id v17 = v8;
      id v18 = v9;
    }

    -[VMUDepthGraph _buildNextDepth:into:depth:](self, "_buildNextDepth:into:depth:", v17, v18, v16);
    uint64_t v16 = (v16 + 1);
  }

  while ([v9 count]);
}

void __31__VMUDepthGraph__buildDepthMap__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  size_t v4 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedInt:a2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 16LL) + 4LL * v2) = 0;
}

- (void).cxx_destruct
{
}

@end