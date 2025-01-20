@interface VMUDominatorCallTreeCreator
- (NSNumber)desiredAddress;
- (VMUCallTreeRoot)callTreeRoot;
- (VMUClassPatternMatcher)desiredClassesPattern;
- (VMUDominatorGraph)dominatorGraph;
- (VMUProcessObjectGraph)processObjectGraph;
- (id)_addNodeWithNodeName:(unsigned int)a3 nodeInfo:(id)a4 callTreeParentNode:(id)a5 parentNodeName:parentNodeType:reference:;
- (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 debugTimer:(id)a6;
- (id)groupByNodeNameForNode:(unsigned int)a3 parentNodeName:(unsigned int)a4 parentNodeType:(unsigned int)a5 reference:(id *)a6;
- (id)groupByTypeNameForNode:(unsigned int)a3;
- (id)referenceDecriptionForSourceNodeAddress:(unint64_t)a3 referenceInfo:(id *)a4;
- (id)remainingNodeNames;
- (unint64_t)sizeForNodeName:(unsigned int)a3 nodeInfo:(id)a4;
- (void)buildCallTreeWithNodeName:(unsigned int)a3 callTreeParentNode:(id)a4 parentNodeName:(unsigned int)a5 parentNodeType:(unsigned int)a6 reference:(id *)a7 rootNodeFilter:(id)a8;
- (void)buildCallTreeWithRootNodeNames:(id)a3;
- (void)removeJunkEdges;
- (void)removeJunkNodes;
- (void)setCallTreeRoot:(id)a3;
- (void)setDesiredAddress:(id)a3;
- (void)setDesiredClassesPattern:(id)a3;
- (void)setDominatorGraph:(id)a3;
- (void)setProcessObjectGraph:(id)a3;
@end

@implementation VMUDominatorCallTreeCreator

- (void)removeJunkEdges
{
  unsigned int v3 = -[VMUDirectedGraph edgeNamespaceSize](self->_processObjectGraph, "edgeNamespaceSize");
  v4 = calloc(1uLL, ((v3 + 7) >> 3) + 4);
  _DWORD *v4 = v3;
  v5 = -[VMUDirectedGraph invertedGraph](self->_processObjectGraph, "invertedGraph");
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  int v25 = 0;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke;
  v23[3] = &unk_189E003B8;
  v23[4] = v26;
  v23[5] = v24;
  v23[6] = v4;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2;
  v20[3] = &unk_189E003E0;
  v22 = v4;
  v20[4] = self;
  id v7 = (id)MEMORY[0x186E33044](v23);
  id v21 = v7;
  v8 = (void *)MEMORY[0x186E33044](v20);
  processObjectGraph = self->_processObjectGraph;
  uint64_t v12 = v6;
  uint64_t v13 = 3221225472LL;
  v14 = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3;
  v15 = &unk_189E00408;
  v18 = v24;
  v19 = v26;
  id v10 = v5;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  -[VMUDirectedGraph enumerateNodesWithBlock:](processObjectGraph, "enumerateNodesWithBlock:", &v12);
  -[VMUDirectedGraph removeMarkedEdges:](self->_processObjectGraph, "removeMarkedEdges:", v4, v12, v13, v14, v15);
  free(v4);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke(void *a1, int a2, unsigned int a3)
{
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    else {
      int v4 = dword_18616BEA0[a2 - 1];
    }
    if ((*(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) & v4) != 0)
    {
      uint64_t v6 = (unsigned int *)a1[6];
      uint64_t result = 1LL;
      if (*v6 > a3) {
        *((_BYTE *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) |= a2;
  }

  return result;
}

void __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  if ((_DWORD)a4 == (_DWORD)a3) {
    goto LABEL_4;
  }
  id v7 = *(void **)(a1[4] + 32LL);
  if (!v7)
  {
    unint64_t v29 = 0LL;
    v30 = 0LL;
LABEL_7:
    id v9 = v30;
    id v10 = *(void **)(a1[4] + 32LL);
    if (v10)
    {
      [v10 nodeDetails:a3];
      id v11 = v28;
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = v11;
    if (v9)
    {
      [v9 className];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v13 isEqualToString:@"NSConcreteMutableData (Bytes Storage)"];

      if (v14) {
        goto LABEL_28;
      }
      [v9 className];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v15 isEqualToString:@"@autoreleasepool content"])
      {
        [v12 className];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        char v17 = [v16 isEqualToString:@"@autoreleasepool content"];

        if ((v17 & 1) == 0)
        {
          v18 = *(void (**)(void))(a1[5] + 16LL);
LABEL_22:
          v18();
LABEL_32:

          return;
        }
      }

      else
      {
      }
    }

    [v12 className];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v19 isEqualToString:@"@autoreleasepool content"];

    if (v20)
    {
      [v9 className];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v21 isEqualToString:@"@autoreleasepool content"])
      {
      }

      else
      {
        BOOL IsRoot = VMUGraphNodeType_IsRoot(v29 >> 60);

        if (!IsRoot) {
          goto LABEL_28;
        }
      }
    }

    if (VMUGraphNodeType_IsVMRegion(v29 >> 60))
    {
      v18 = *(void (**)(void))(a1[5] + 16LL);
      goto LABEL_22;
    }

    v23 = *(void **)(a1[4] + 32LL);
    if (!v23 || ([v23 referenceInfoWithName:a2], LODWORD(v23) = v26, !v27))
    {
      if ((_DWORD)v23 != 4)
      {
        else {
          uint64_t v24 = 4LL;
        }
        (*(void (**)(void, uint64_t, uint64_t))(a1[5] + 16LL))(a1[5], v24, a2);
        goto LABEL_32;
      }
    }

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  [*(id *)(a1 + 32) enumerateEdgesOfNode:a2 withBlock:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  return [*(id *)(a1 + 32) enumerateEdgesOfNode:a2 withBlock:*(void *)(a1 + 40)];
}

- (void)removeJunkNodes
{
  unsigned int v3 = -[VMUDirectedGraph nodeNamespaceSize](self->_processObjectGraph, "nodeNamespaceSize");
  int v4 = calloc(1uLL, ((v3 + 7) >> 3) + 4);
  _DWORD *v4 = v3;
  processObjectGraph = self->_processObjectGraph;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2;
  v7[3] = &unk_189E00470;
  v7[4] = self;
  id v8 = &__block_literal_global_19;
  id v9 = v4;
  -[VMUDirectedGraph enumerateNodesWithBlock:](processObjectGraph, "enumerateNodesWithBlock:", v7);
  -[VMUDirectedGraph removeMarkedNodes:](self->_processObjectGraph, "removeMarkedNodes:", v4);

  return v4;
}

BOOL __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if ([v2 isSubmap]) {
    goto LABEL_17;
  }
  [v2 type];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 type];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 hasSuffix:@"Kernel Alloc Once"])
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }

  [v2 type];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v5 hasSuffix:@"MALLOC metadata"] & 1) != 0
    || ([v2 isOwnedUnmappedMemory] & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }

  [v2 type];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 hasSuffix:@"SQLite page cache"])
  {
LABEL_13:

    goto LABEL_14;
  }

  [v2 type];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 hasSuffix:@"__AUTH"])
  {
LABEL_12:

    goto LABEL_13;
  }

  [v2 type];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 hasSuffix:@"__AUTH_CONST"])
  {
LABEL_11:

    goto LABEL_12;
  }

  [v2 type];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v9 hasSuffix:@"mapped file"])
  {

    goto LABEL_11;
  }

  [v2 type];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v12 hasSuffix:@"shared memory"];

  if ((v13 & 1) == 0 && ([v2 protection] & 2) != 0)
  {
    BOOL v10 = (v2[13] - 1) < 2;
    goto LABEL_18;
  }

void __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2(void *a1, uint64_t a2)
{
  int v4 = *(void **)(a1[4] + 32LL);
  if (v4)
  {
    [v4 nodeDetails:a2];
    int v4 = (void *)(v9 >> 60);
  }

  else
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  if (VMUGraphNodeType_IsVMRegion((int)v4))
  {
    [*(id *)(a1[4] + 32) vmuVMRegionForNode:a2];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (*(unsigned int (**)(void))(a1[5] + 16LL))())
    {
      uint64_t v6 = (_DWORD *)a1[6];
    }
  }

  else if (v9 == 0x1000000000000000LL)
  {
    id v7 = (_DWORD *)a1[6];
  }

- (unint64_t)sizeForNodeName:(unsigned int)a3 nodeInfo:(id)a4
{
  unint64_t v5 = *(void *)(a4.var0 + 8);
  if (self->_showRegionVirtualSize) {
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)&a3;
  if (!VMUGraphNodeType_IsVMRegion(v5 >> 60)) {
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  }
  -[VMUProcessObjectGraph vmuVMRegionForNode:](self->_processObjectGraph, "vmuVMRegionForNode:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v8[22] + v8[23];
  unint64_t v10 = v8[24];
  BOOL v11 = v9 >= v10;
  unint64_t v12 = v9 - v10;
  if (v11) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 0LL;
  }

  return v13;
}

- (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 debugTimer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = (void *)MEMORY[0x186E32E40]();
  -[VMUDominatorCallTreeCreator setProcessObjectGraph:](self, "setProcessObjectGraph:", v10);
  self->_showRegionVirtualSize = a5;
  self->_groupByType = a4;
  objc_storeStrong((id *)&self->_debugTimer, a6);
  [v11 startWithMessage:"remove junk nodes from object graph"];
  self->_visitedNodes = -[VMUDominatorCallTreeCreator removeJunkNodes](self, "removeJunkNodes");
  [v11 startWithMessage:"remove junk edges from object graph"];
  -[VMUDominatorCallTreeCreator removeJunkEdges](self, "removeJunkEdges");
  [v11 startWithMessage:"create dominator graph"];
  unint64_t v13 = -[VMUDominatorGraph initWithGraph:debugTimer:]( objc_alloc(&OBJC_CLASS___VMUDominatorGraph),  "initWithGraph:debugTimer:",  v10,  v11);
  -[VMUDominatorCallTreeCreator setDominatorGraph:](self, "setDominatorGraph:", v13);

  -[VMUDebugTimer startWithMessage:]( self->_debugTimer,  "startWithMessage:",  "select all dominator roots as roots of the tree");
  id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
  dominatorGraph = self->_dominatorGraph;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke;
  v22[3] = &unk_189E00498;
  id v16 = v14;
  id v23 = v16;
  -[VMUDominatorGraph enumerateDominatorRootsWithBlock:](dominatorGraph, "enumerateDominatorRootsWithBlock:", v22);
  char v17 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( objc_alloc(&OBJC_CLASS___VMUCallTreeRoot),  "initWithSymbolicator:sampler:options:",  0LL,  0LL,  0LL,  0LL);
  -[VMUDominatorCallTreeCreator setCallTreeRoot:](self, "setCallTreeRoot:", v17);

  -[VMUDebugTimer startWithMessage:](self->_debugTimer, "startWithMessage:", "build tree from selected nodes");
  -[VMUDominatorCallTreeCreator buildCallTreeWithRootNodeNames:](self, "buildCallTreeWithRootNodeNames:", v16);
  v18 = -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
  if (!v18)
  {
    v19 = -[VMUDominatorCallTreeCreator desiredClassesPattern](self, "desiredClassesPattern");
    if (v19) {
      goto LABEL_4;
    }
    -[VMUDebugTimer startWithMessage:](self->_debugTimer, "startWithMessage:", "add remaining nodes to tree");
    v18 = -[VMUDominatorCallTreeCreator remainingNodeNames](self, "remainingNodeNames");
    -[VMUDominatorCallTreeCreator buildCallTreeWithRootNodeNames:](self, "buildCallTreeWithRootNodeNames:", v18);
  }

LABEL_4:
  free(self->_visitedNodes);
  [v11 startWithMessage:"add child counts"];
  -[VMUCallTreeRoot addChildCountsIntoNode](self->_callTreeRoot, "addChildCountsIntoNode");
  int v20 = self->_callTreeRoot;

  objc_autoreleasePoolPop(v12);
  return v20;
}

void __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke( uint64_t a1,  uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedInt:a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)buildCallTreeWithRootNodeNames:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 unsignedIntegerValue];

    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke;
    v23[3] = &__block_descriptor_40_e21_B36__0I8___Qb60b4__12l;
    v23[4] = v7;
    uint64_t v8 = v23;
  }

  else
  {
    -[VMUDominatorCallTreeCreator desiredClassesPattern](self, "desiredClassesPattern");
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_6;
    }
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2;
    v22[3] = &unk_189E004E0;
    void v22[4] = self;
    uint64_t v8 = v22;
  }

  unint64_t v9 = (void *)MEMORY[0x186E33044](v8);
LABEL_6:
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntValue];
        processObjectGraph = self->_processObjectGraph;
        if (!processObjectGraph)
        {
          uint64_t v17 = 0LL;
LABEL_15:
          if (!-[VMUDominatorGraph hasAnyDirectDomineesForNodeName:]( self->_dominatorGraph,  "hasAnyDirectDomineesForNodeName:",  v15)) {
            continue;
          }
          goto LABEL_16;
        }

        -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v15);
        if ((v17 & 0xFFFFFFFFFFFFFFFLL) == 0) {
          goto LABEL_15;
        }
LABEL_16:
        -[VMUDominatorCallTreeCreator buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:]( self,  "buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:",  v15,  self->_callTreeRoot,  0xFFFFFFFFLL,  0LL,  0LL,  v9);
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v12);
  }
}

BOOL __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return *a3 == *(void *)(a1 + 32);
}

uint64_t __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2( uint64_t a1,  uint64_t a2,  __int128 *a3)
{
  if (*((void *)a3 + 1) >> 60 == 1LL)
  {
    unint64_t v5 = 0LL;
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) nodeDescription:a2];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) desiredClassesPattern];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  uint64_t v7 = [v6 matchesNodeDetails:&v9 orNodeDescription:v5];

  return v7;
}

- (id)remainingNodeNames
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  visitedNodes = (unsigned int *)self->_visitedNodes;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  __int128 v19 = __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke;
  __int128 v20 = &unk_189DFEC08;
  __int128 v21 = self;
  id v5 = v3;
  id v22 = v5;
  uint64_t v6 = v18;
  unsigned int v7 = *visitedNodes;
  if (*visitedNodes)
  {
    uint64_t v8 = 0LL;
    unsigned int v9 = 8;
    do
    {
      if (v7 >= v9) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v7;
      }
      unsigned int v11 = *((unsigned __int8 *)visitedNodes + (v8 >> 3) + 4);
      uint64_t v12 = (v8 + 8);
      else {
        unsigned int v13 = v8 + 8;
      }
      if (v11 != 255 && v8 < v13)
      {
        do
        {
          if ((v11 & 1) == 0) {
            v19((uint64_t)v6, v8);
          }
          uint64_t v8 = (v8 + 1);
          v11 >>= 1;
        }

        while (v10 != (_DWORD)v8);
      }

      v9 += 8;
      uint64_t v8 = v12;
    }

    while (v12 < v7);
  }

  uint64_t v15 = v22;
  id v16 = v5;

  return v16;
}

void __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) isNodePresent:a2])
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 32LL);
    if (v4)
    {
      [v4 nodeDetails:a2];
      id v4 = (void *)(v8 >> 60);
      if (v8 >> 60 == 1)
      {
LABEL_7:
        id v5 = *(void **)(a1 + 40);
        [MEMORY[0x189607968] numberWithUnsignedInt:a2];
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v6];

        return;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
      unint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
    }

    goto LABEL_7;
  }

- (id)_addNodeWithNodeName:(unsigned int)a3 nodeInfo:(id)a4 callTreeParentNode:(id)a5 parentNodeName:parentNodeType:reference:
{
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = *(void *)&a3;
  __int128 v18 = *(_OWORD *)a4.var0;
  uint64_t v19 = *(void *)(a4.var0 + 16);
  id v13 = a5;
  unint64_t v14 = -[VMUDominatorCallTreeCreator sizeForNodeName:nodeInfo:](self, "sizeForNodeName:nodeInfo:", v11, &v18);
  if (self->_groupByType)
  {
    -[VMUDominatorCallTreeCreator groupByTypeNameForNode:](self, "groupByTypeNameForNode:", v11, v18, v19);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeRoot addChildWithName:address:count:numBytes:toNode:]( self->_callTreeRoot,  "addChildWithName:address:count:numBytes:toNode:",  v15,  0LL,  1LL,  v14,  v13);
  }

  else
  {
    -[VMUDominatorCallTreeCreator groupByNodeNameForNode:parentNodeName:parentNodeType:reference:]( self,  "groupByNodeNameForNode:parentNodeName:parentNodeType:reference:",  v11,  v10,  v9,  v8,  v18,  v19);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:]( self->_callTreeRoot,  "addUniqueChildWithName:address:count:numBytes:toNode:",  v15,  0LL,  1LL,  v14,  v13);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)buildCallTreeWithNodeName:(unsigned int)a3 callTreeParentNode:(id)a4 parentNodeName:(unsigned int)a5 parentNodeType:(unsigned int)a6 reference:(id *)a7 rootNodeFilter:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v14 = a4;
  uint64_t v15 = a8;
  id v16 = (void *)MEMORY[0x186E32E40]();
  if ((_DWORD)v12 == (_DWORD)v11)
  {
    processObjectGraph = self->_processObjectGraph;
    if (processObjectGraph)
    {
      -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v12);
    }

    else
    {
      __int128 v54 = 0uLL;
      uint64_t v55 = 0LL;
    }

    __int128 v52 = v54;
    uint64_t v53 = v55;
    id v22 =  -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:]( self,  "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:",  v12,  &v52,  v14,  v12,  v10,  a7);
    goto LABEL_26;
  }

  visitedNodes = self->_visitedNodes;
  if (*visitedNodes > v12
    && ((*((unsigned __int8 *)visitedNodes + (v12 >> 3) + 4) >> (v12 & 7)) & 1) != 0)
  {
    goto LABEL_26;
  }

  uint64_t v19 = self->_processObjectGraph;
  if (v19)
  {
    -[VMUObjectGraph nodeDetails:](v19, "nodeDetails:", v12);
    if (v15) {
      goto LABEL_8;
    }
LABEL_13:
    __int128 v52 = v54;
    uint64_t v53 = v55;
    -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:]( self,  "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:",  v12,  &v52,  v14,  v11,  v10,  a7);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    __int128 v21 = v23;
    goto LABEL_16;
  }

  __int128 v54 = 0uLL;
  uint64_t v55 = 0LL;
  if (!v15) {
    goto LABEL_13;
  }
LABEL_8:
  __int128 v20 = (unsigned int (*)(void *, uint64_t, __int128 *))v15[2];
  __int128 v52 = v54;
  uint64_t v53 = v55;
  if (!v20(v15, v12, &v52))
  {
    id v23 = v14;
    goto LABEL_15;
  }

  __int128 v52 = v54;
  uint64_t v53 = v55;
  -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:]( self,  "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:",  v12,  &v52,  v14,  v11,  v10,  a7);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0LL;
LABEL_16:
  uint64_t v24 = self->_visitedNodes;
  id v25 = objc_alloc_init(MEMORY[0x189603FE0]);
  dominatorGraph = self->_dominatorGraph;
  uint64_t v27 = MEMORY[0x1895F87A8];
  v50[0] = MEMORY[0x1895F87A8];
  v50[1] = 3221225472LL;
  v50[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke;
  v50[3] = &unk_189E00498;
  id v28 = v25;
  id v51 = v28;
  -[VMUDominatorGraph enumerateDirectDomineesForNodeName:withBlock:]( dominatorGraph,  "enumerateDirectDomineesForNodeName:withBlock:",  v12,  v50);
  unint64_t v29 = self->_processObjectGraph;
  v42[0] = v27;
  v42[1] = 3221225472LL;
  v42[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2;
  v42[3] = &unk_189E00508;
  id v30 = v28;
  id v43 = v30;
  v44 = self;
  id v31 = v21;
  id v45 = v31;
  int v49 = v12;
  __int128 v47 = v54;
  uint64_t v48 = v55;
  uint64_t v15 = v15;
  id v46 = v15;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](v29, "enumerateReferencesOfNode:withBlock:", v12, v42);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v32 = v30;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v38 objects:v56 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v36 = 0LL;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = [*(id *)(*((void *)&v38 + 1) + 8 * v36) unsignedIntValue];
        -[VMUDominatorCallTreeCreator buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:]( self,  "buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:",  v37,  v31,  v12,  *((void *)&v54 + 1) >> 60,  0LL,  v15);
        ++v36;
      }

      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v38 objects:v56 count:16];
    }

    while (v34);
  }

LABEL_26:
  objc_autoreleasePoolPop(v16);
}

void __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke( uint64_t a1,  uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedInt:a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

uint64_t __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  _BYTE *a6)
{
  uint64_t v10 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedInt:a4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = [v10 containsObject:v11];

  if ((_DWORD)v10)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    [MEMORY[0x189607968] numberWithUnsignedInt:a4];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 removeObject:v13];

    [*(id *)(a1 + 40) buildCallTreeWithNodeName:a4 callTreeParentNode:*(void *)(a1 + 48) parentNodeName:*(unsigned int *)(a1 + 88) parentNodeType:*(void *)(a1 + 72) >> 60 reference:a5 rootNodeFilter:*(void *)(a1 + 56)];
  }

  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result) {
    *a6 = 1;
  }
  return result;
}

- (id)referenceDecriptionForSourceNodeAddress:(unint64_t)a3 referenceInfo:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = VMUScanTypeKeywordDescription(a4->var1);
    if (v6 && *v6) {
      uint64_t v7 = (__CFString *)[objc_alloc(NSString) initWithFormat:@"%s " v6];
    }
    else {
      uint64_t v7 = &stru_189E010C8;
    }
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@", v7, v5];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)groupByTypeNameForNode:(unsigned int)a3
{
  processObjectGraph = self->_processObjectGraph;
  if (!processObjectGraph) {
    return @"(unknown)";
  }
  uint64_t v5 = *(void *)&a3;
  -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:");
  uint64_t v6 = @"(kernel)";
  switch(v21 >> 60)
  {
    case 1uLL:
      [v22 className];
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v22 binaryName];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        uint64_t v18 = -[VMUProcessObjectGraph shortNodeDescription:](self->_processObjectGraph, "shortNodeDescription:", v5);
        if (v18) {
          uint64_t v7 = (__CFString *)v18;
        }
        else {
          uint64_t v7 = @"non-object";
        }
      }

      if (v17) {
        uint64_t v19 = (__CFString *)[objc_alloc(NSString) initWithFormat:@"%@ (in %@)", v7, v17];
      }
      else {
        uint64_t v19 = v7;
      }
      uint64_t v6 = v19;

      goto LABEL_19;
    case 2uLL:
    case 5uLL:
      -[VMUProcessObjectGraph vmuVMRegionForNode:](self->_processObjectGraph, "vmuVMRegionForNode:", v5);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[__CFString type](v7, "type");
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"region";
      if (v8) {
        uint64_t v10 = (__CFString *)v8;
      }
      uint64_t v11 = v10;

      -[__CFString path](v7, "path");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 lastPathComponent];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      id v14 = objc_alloc(NSString);
      if (v13) {
        uint64_t v15 = [v14 initWithFormat:@"VM: %@ (in %@)", v11, v13];
      }
      else {
        uint64_t v15 = [v14 initWithFormat:@"VM: %@", v11, v20];
      }
      uint64_t v6 = (__CFString *)v15;

LABEL_19:
      goto LABEL_20;
    case 3uLL:
LABEL_20:
      id result = v6;
      break;
    case 4uLL:
      id result = @"(thread)";
      break;
    default:
      return @"(unknown)";
  }

  return result;
}

- (id)groupByNodeNameForNode:(unsigned int)a3 parentNodeName:(unsigned int)a4 parentNodeType:(unsigned int)a5 reference:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  -[VMUProcessObjectGraph nodeDescription:](self->_processObjectGraph, "nodeDescription:", *(void *)&a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    __int128 v11 = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)int v26 = *(_OWORD *)&a6->var0;
    *(_OWORD *)&v26[16] = v11;
    var2 = a6->var2;
    if (VMUGraphNodeType_IsVMRegion(a5))
    {
      processObjectGraph = self->_processObjectGraph;
      if (processObjectGraph)
      {
        -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v8);
        uint64_t v13 = v23;
      }

      else
      {
        uint64_t v13 = 0LL;
        uint64_t v23 = 0LL;
        uint64_t v24 = 0LL;
        uint64_t v25 = 0LL;
      }

      __int128 v20 = *(_OWORD *)&v26[8];
      *(void *)&__int128 v21 = *(void *)&v26[24];
      -[VMUDominatorCallTreeCreator referenceDecriptionForSourceNodeAddress:referenceInfo:]( self,  "referenceDecriptionForSourceNodeAddress:referenceInfo:",  v13,  &v20);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v16;
      if (v16)
      {
        [v16 stringByAppendingFormat:@" --> %@", v10];
      }

      else
      {
        BOOL v18 = -[VMUProcessObjectGraph is64bit](self->_processObjectGraph, "is64bit");
        __int128 v20 = *(_OWORD *)v26;
        __int128 v21 = *(_OWORD *)&v26[16];
        id v22 = var2;
        +[VMULeakDetector referenceDescription:dstDescription:is64bit:]( &OBJC_CLASS___VMULeakDetector,  "referenceDescription:dstDescription:is64bit:",  &v20,  v10,  v18);
      }
      uint64_t v15 = ;
    }

    else
    {
      BOOL v14 = -[VMUProcessObjectGraph is64bit](self->_processObjectGraph, "is64bit");
      __int128 v20 = *(_OWORD *)v26;
      __int128 v21 = *(_OWORD *)&v26[16];
      id v22 = var2;
      uint64_t v15 = +[VMULeakDetector referenceDescription:dstDescription:is64bit:]( &OBJC_CLASS___VMULeakDetector,  "referenceDescription:dstDescription:is64bit:",  &v20,  v10,  v14);
    }

    uint64_t v10 = (void *)v15;
  }

  return v10;
}

- (VMUProcessObjectGraph)processObjectGraph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProcessObjectGraph:(id)a3
{
}

- (VMUDominatorGraph)dominatorGraph
{
  return (VMUDominatorGraph *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDominatorGraph:(id)a3
{
}

- (VMUCallTreeRoot)callTreeRoot
{
  return (VMUCallTreeRoot *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallTreeRoot:(id)a3
{
}

- (NSNumber)desiredAddress
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDesiredAddress:(id)a3
{
}

- (VMUClassPatternMatcher)desiredClassesPattern
{
  return (VMUClassPatternMatcher *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDesiredClassesPattern:(id)a3
{
}

- (void).cxx_destruct
{
}

@end