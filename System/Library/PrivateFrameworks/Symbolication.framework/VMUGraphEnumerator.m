@interface VMUGraphEnumerator
- (VMUGraphEnumerator)initWithGraph:(id)a3;
- (VMUProcessObjectGraph)graph;
- (id)statusDisplayDescription;
- (unsigned)buildReversePostOrderWithRoots:(void *)a3;
- (void)destinationsOfGroup:(id)a3;
- (void)destinationsOfNodes:(void *)a3;
- (void)enumerateDestinationsOfGroup:(id)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateDestinationsOfNode:(unsigned int)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateDestinationsOfNodes:(void *)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUGraphEnumerator

- (VMUGraphEnumerator)initWithGraph:(id)a3
{
  v4 = (VMUProcessObjectGraph *)a3;
  v5 = -[VMUGraphEnumerator init](self, "init");
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateDestinationsOfNode:(unsigned int)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  graph = self->_graph;
  id v9 = a5;
  id v10 = a4;
  LODWORD(graph) = -[VMUDirectedGraph nodeNamespaceSize](graph, "nodeNamespaceSize");
  v11 = calloc(1uLL, (((_DWORD)graph + 7) >> 3) + 4);
  uint64_t v12 = MEMORY[0x1895F87A8];
  _DWORD *v11 = (_DWORD)graph;
  v13[0] = v12;
  v13[1] = 3221225472LL;
  v13[2] = __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke;
  v13[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v13[4] = v11;
  -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](self, "enumerateEdgesOfNode:withBlock:", v6, v13);
  [v10 enumerateGroups:v11 withBlock:v9];

  free(v11);
}

uint64_t __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (void)enumerateDestinationsOfNodes:(void *)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = -[VMUGraphEnumerator destinationsOfNodes:](self, "destinationsOfNodes:", a3);
  [v9 enumerateGroups:v10 withBlock:v8];

  free(v10);
}

- (void)enumerateDestinationsOfGroup:(id)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = -[VMUGraphEnumerator destinationsOfGroup:](self, "destinationsOfGroup:", a3);
  [v9 enumerateGroups:v10 withBlock:v8];

  free(v10);
}

- (void)destinationsOfNodes:(void *)a3
{
  unsigned int v5 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  uint64_t v6 = calloc(1uLL, ((v5 + 7) >> 3) + 4);
  *uint64_t v6 = v5;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v15 = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke;
  v16 = &unk_189DFE338;
  v17 = self;
  v18 = v6;
  v7 = v14;
  unsigned int v8 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v9 = 0LL;
    do
    {
      id v10 = (char *)a3 + (v9 >> 3);
      unsigned int v11 = v10[4];
      uint64_t v12 = v9;
      if (v10[4])
      {
        do
        {
          if ((v11 & 1) != 0) {
            v15((uint64_t)v7, v12);
          }
          if (v11 < 2) {
            break;
          }
          uint64_t v12 = (v12 + 1);
          v11 >>= 1;
        }

        while (v12 < v8);
      }

      uint64_t v9 = (v9 + 8);
    }

    while (v9 < v8);
  }

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 enumerateEdgesOfNode:a2 withBlock:v4];
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (void)destinationsOfGroup:(id)a3
{
  graph = self->_graph;
  id v5 = a3;
  LODWORD(graph) = -[VMUDirectedGraph nodeNamespaceSize](graph, "nodeNamespaceSize");
  uint64_t v6 = calloc(1uLL, (((_DWORD)graph + 7) >> 3) + 4);
  *uint64_t v6 = (_DWORD)graph;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke;
  v8[3] = &unk_189DFE360;
  v8[4] = self;
  v8[5] = v6;
  [v5 enumerateNodesWithBlock:v8];

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 enumerateEdgesOfNode:a2 withBlock:v4];
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (id)statusDisplayDescription
{
  return @"forward";
}

- (unsigned)buildReversePostOrderWithRoots:(void *)a3
{
  id v5 = self->_graph;
  uint64_t v6 = self;
  unsigned int v7 = -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  unsigned int v8 = calloc(1uLL, ((v7 + 7) >> 3) + 4);
  *unsigned int v8 = v7;
  size_t v9 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  id v10 = malloc(v9);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v10, __pattern4, v9);
  v24 = v5;
  size_t v11 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  uint64_t v12 = malloc(v11);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v12, __pattern4, v11);
  __pattern4[0] = 0LL;
  __pattern4[1] = __pattern4;
  __pattern4[2] = 0x2020000000LL;
  int v34 = 0;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v26 = __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke;
  v27 = &unk_189DFE3B0;
  v23 = v8;
  v31 = v8;
  v32 = v12;
  v29 = __pattern4;
  v30 = v10;
  v13 = v6;
  v28 = v13;
  v14 = v25;
  unsigned int v15 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    unsigned int v16 = 0;
    int v17 = 1;
    do
    {
      v18 = (char *)a3 + (v16 >> 3);
      unsigned int v19 = v18[4];
      unsigned int v20 = v17;
      if (v18[4])
      {
        do
        {
          if ((v19 & 1) != 0) {
            v26((uint64_t)v14, v20 - 1);
          }
          if (v19 < 2) {
            break;
          }
          v19 >>= 1;
        }

        while (v20++ < v15);
      }

      v16 += 8;
      v17 += 8;
    }

    while (v16 < v15);
  }

  free(v10);
  free(v23);

  _Block_object_dispose(__pattern4, 8);
  return (unsigned int *)v12;
}

void __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  v2 = *(_DWORD **)(a1 + 48);
  int v20 = 1;
  _DWORD *v2 = a2;
  v3 = v18;
  int v4 = *((_DWORD *)v18 + 6);
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      unsigned int v8 = v4 - 1;
      *((_DWORD *)v3 + 6) = v8;
      unint64_t v9 = *(unsigned int *)(v7 + 4LL * v8);
      id v10 = *(_DWORD **)(a1 + 56);
      uint64_t v11 = (v9 >> 3) + 4;
      int v12 = *((unsigned __int8 *)v10 + v11);
      int v13 = 1 << (v9 & 7);
      if ((v13 & v12) == 0) {
        break;
      }
LABEL_7:
      int v4 = *((_DWORD *)v3 + 6);
      if (!v4) {
        goto LABEL_8;
      }
    }

    *((_BYTE *)v10 + v11) = v12 | v13;
    uint64_t v7 = *(void *)(a1 + 48);
LABEL_6:
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v16 = *(unsigned int *)(v15 + 24);
    *(_DWORD *)(v15 + 24) = v16 + 1;
    *(_DWORD *)(v14 + 4 * v16) = v9;
    [*(id *)(a1 + 32) enumerateEdgesOfNode:v6 withBlock:3221225472, __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke_2, &unk_189DFE388, &v17, v7];
    v3 = v18;
    goto LABEL_7;
  }

uint64_t __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  int a4)
{
  uint64_t v4 = *(void *)(result + 40);
  uint64_t v5 = *(void *)(*(void *)(result + 32) + 8LL);
  uint64_t v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end