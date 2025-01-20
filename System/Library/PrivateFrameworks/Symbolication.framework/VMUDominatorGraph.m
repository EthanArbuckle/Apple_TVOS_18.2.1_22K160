@interface VMUDominatorGraph
+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredAddress:(id)a6 debugTimer:(id)a7;
+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredClassesPattern:(id)a6 debugTimer:(id)a7;
+ (id)consolidate:(id)a3;
- (BOOL)hasAnyDirectDomineesForNodeName:(unsigned int)a3;
- (NSData)dominators_data;
- (NSData)firstDominates_data;
- (NSData)nextDominates_data;
- (VMUDominatorGraph)initWithDict:(id)a3;
- (VMUDominatorGraph)initWithGraph:(id)a3;
- (VMUDominatorGraph)initWithGraph:(id)a3 debugTimer:(id)a4;
- (id)_computeDominators:(id)a3 roots:(void *)a4 reversePostOrder:(unsigned int *)a5 debugTimer:(id)a6;
- (id)copyDict;
- (id)export:(id)a3;
- (id)fastDFS:(id)a3 graph:(id)a4;
- (id)iterDirectDomineesForNodeName:(unsigned int)a3;
- (id)iterDominatorRoots;
- (unsigned)dominator:(unsigned int)a3;
- (unsigned)dominators;
- (unsigned)firstDominates;
- (unsigned)nextDominates;
- (unsigned)nodeNamespaceSize;
- (void)_computeDominees:(id)a3;
- (void)enumerateDirectDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateDominatorRootsWithBlock:(id)a3;
- (void)enumerateDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4;
- (void)setDominators:(unsigned int *)a3;
- (void)setDominators_data:(id)a3;
- (void)setFirstDominates:(unsigned int *)a3;
- (void)setFirstDominates_data:(id)a3;
- (void)setNextDominates:(unsigned int *)a3;
- (void)setNextDominates_data:(id)a3;
- (void)setNodeNamespaceSize:(unsigned int)a3;
@end

@implementation VMUDominatorGraph

- (VMUDominatorGraph)initWithDict:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"dominators"];
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  dominators_data = self->_dominators_data;
  self->_dominators_data = v5;

  [v4 objectForKeyedSubscript:@"firstDominates"];
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  firstDominates_data = self->_firstDominates_data;
  self->_firstDominates_data = v7;

  [v4 objectForKeyedSubscript:@"nextDominates"];
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();

  nextDominates_data = self->_nextDominates_data;
  self->_nextDominates_data = v9;

  v11 = self->_dominators_data;
  if (v11 && self->_firstDominates_data && self->_nextDominates_data)
  {
    self->_dominators = (unsigned int *)-[NSData bytes](v11, "bytes");
    self->_firstDominates = (unsigned int *)-[NSData bytes](self->_firstDominates_data, "bytes");
    self->_nextDominates = (unsigned int *)-[NSData bytes](self->_nextDominates_data, "bytes");
    self->_nodeNamespaceSize = -[NSData length](self->_firstDominates_data, "length") >> 2;
    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)copyDict
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  __int128 v2 = *(_OWORD *)&self->_dominators_data;
  v4[0] = @"dominators";
  v4[1] = @"firstDominates";
  __int128 v5 = v2;
  v4[2] = @"nextDominates";
  nextDominates_data = self->_nextDominates_data;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v5 forKeys:v4 count:3];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)consolidate:(id)a3
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v63 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  obuint64_t j = v3;
  uint64_t v61 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v61)
  {
    id v59 = *(id *)v90;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(id *)v90 != v59) {
          objc_enumerationMutation(obj);
        }
        v71 = (void *)NSString;
        v67 = v4;
        id v5 = *(id *)(*((void *)&v89 + 1) + 8LL * (void)v4);
        uint64_t v6 = [v5 objectForKeyedSubscript:@"className"];
        v75 = (void *)v6;
        if (v6) {
          uint64_t v7 = (__CFString *)v6;
        }
        else {
          uint64_t v7 = &stru_189E010C8;
        }
        v8 = v7;
        uint64_t v9 = [v5 objectForKeyedSubscript:@"binary"];
        v73 = (void *)v9;
        if (v9) {
          v10 = (__CFString *)v9;
        }
        else {
          v10 = &stru_189E010C8;
        }
        v65 = v10;
        uint64_t v11 = [v5 objectForKeyedSubscript:@"stackid"];
        v69 = (void *)v11;
        if (v11) {
          v12 = (__CFString *)v11;
        }
        else {
          v12 = &stru_189E010C8;
        }
        v13 = v12;
        uint64_t v14 = [v5 objectForKeyedSubscript:@"region"];
        v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = &stru_189E010C8;
        }
        v17 = v16;
        uint64_t v18 = [v5 objectForKeyedSubscript:@"path"];
        v19 = (void *)v18;
        if (v18) {
          v20 = (__CFString *)v18;
        }
        else {
          v20 = &stru_189E010C8;
        }
        v21 = v20;
        [v5 objectForKeyedSubscript:@"description"];
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v22) {
          v23 = v22;
        }
        else {
          v23 = &stru_189E010C8;
        }
        v24 = v8;
        [v71 stringWithFormat:@"%@\x00%@\x00%@\x00%@\x00%@\x00%@", v8, v65, v13, v17, v21, v23];
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        [v63 objectForKeyedSubscript:v25];
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x189603FA8]);
          [v63 setObject:v26 forKeyedSubscript:v25];
        }

        [v26 addObject:v5];

        id v4 = v67 + 1;
      }

      while ((char *)v61 != v67 + 1);
      uint64_t v61 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
    }

    while (v61);
  }

  id v60 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v64 = v63;
  uint64_t v62 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v62)
  {
    uint64_t v58 = *(void *)v86;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v86 != v58) {
          objc_enumerationMutation(v64);
        }
        uint64_t v66 = v27;
        [v64 objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * v27)];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v30 = objc_alloc_init(MEMORY[0x189603FC8]);
        for (uint64_t i = 0LL; i != 6; ++i)
        {
          v32 = name_keys[i];
          [v28 objectAtIndexedSubscript:0];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 objectForKeyedSubscript:v32];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 setObject:v34 forKeyedSubscript:v32];
        }

        v72 = v30;
        memset(v95, 0, sizeof(v95));
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        id v68 = v28;
        uint64_t v74 = [v68 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v74)
        {
          uint64_t v70 = *(void *)v82;
          do
          {
            uint64_t v35 = 0LL;
            do
            {
              if (*(void *)v82 != v70) {
                objc_enumerationMutation(v68);
              }
              uint64_t v76 = v35;
              v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35);
              [v36 objectForKeyedSubscript:@"children"];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (v37)
              {
                __int128 v79 = 0u;
                __int128 v80 = 0u;
                __int128 v77 = 0u;
                __int128 v78 = 0u;
                uint64_t v39 = [v37 countByEnumeratingWithState:&v77 objects:v93 count:16];
                if (v39)
                {
                  uint64_t v40 = v39;
                  uint64_t v41 = *(void *)v78;
                  do
                  {
                    for (uint64_t j = 0LL; j != v40; ++j)
                    {
                      if (*(void *)v78 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      [v29 addObject:*(void *)(*((void *)&v77 + 1) + 8 * j)];
                    }

                    uint64_t v40 = [v38 countByEnumeratingWithState:&v77 objects:v93 count:16];
                  }

                  while (v40);
                }
              }

              uint64_t v43 = 0LL;
              v44 = 0LL;
              do
              {
                uint64_t v45 = 0LL;
                char v46 = 1;
                do
                {
                  v47 = v44;
                  char v48 = v46;
                  [v36 objectForKeyedSubscript:*(&stat_keys[2 * v43] + v45)];
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v44) {
                    *((void *)&v95[v43] + v45) += [v44 unsignedLongLongValue];
                  }
                  char v46 = 0;
                  uint64_t v45 = 1LL;
                }

                while ((v48 & 1) != 0);
                ++v43;
              }

              while (v43 != 4);

              uint64_t v35 = v76 + 1;
            }

            while (v76 + 1 != v74);
            uint64_t v74 = [v68 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }

          while (v74);
        }

        for (uint64_t k = 0LL; k != 4; ++k)
        {
          uint64_t v50 = 0LL;
          char v51 = 1;
          do
          {
            char v52 = v51;
            if (*((void *)&v95[k] + v50))
            {
              [MEMORY[0x189607968] numberWithUnsignedLongLong:];
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              [v72 setObject:v53 forKeyedSubscript:*(&stat_keys[2 * k] + v50)];
            }

            char v51 = 0;
            uint64_t v50 = 1LL;
          }

          while ((v52 & 1) != 0);
        }
        v54 = +[VMUDominatorGraph consolidate:](&OBJC_CLASS___VMUDominatorGraph, "consolidate:", v29);
        v55 = v54;
        if (v54 && [v54 count]) {
          [v72 setObject:v55 forKeyedSubscript:@"children"];
        }
        [v60 addObject:v72];

        uint64_t v27 = v66 + 1;
      }

      while (v66 + 1 != v62);
      uint64_t v62 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
    }

    while (v62);
  }

  return v60;
}

- (id)export:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __28__VMUDominatorGraph_export___block_invoke;
  v9[3] = &unk_189E00340;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x186E33044](v9);
  -[VMUDominatorGraph fastDFS:graph:](self, "fastDFS:graph:", v6, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __28__VMUDominatorGraph_export___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  int a5,  void *a6,  void *a7,  uint64_t a8,  void *a9)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  if (a5 == 5 || a5 == 2)
  {
    *((void *)&v57 + 1) = 1LL;
    if (v16)
    {
      [v16 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v23 length]) {
        v24 = v23;
      }
      else {
        v24 = 0LL;
      }
      id v21 = v24;

      int v25 = *((_DWORD *)v16 + 13);
      if (v25 == 3 || v25 == 0) {
        *((void *)&v56 + 1) = *((void *)v16 + 22) + *((void *)v16 + 23);
      }
      id v27 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v16 type];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 setObject:v28 forKeyedSubscript:@"region"];

      id v19 = v27;
      if (!v21)
      {
LABEL_19:

        if (v19) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }

      v22 = @"path";
LABEL_18:
      [v19 setObject:v21 forKeyedSubscript:v22];
      goto LABEL_19;
    }

- (id)fastDFS:(id)a3 graph:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v24 = a3;
  id v23 = a4;
  uint64_t v6 = -[VMUVMRegionIdentifier initWithGraph:options:]( objc_alloc(&OBJC_CLASS___VMUVMRegionIdentifier),  "initWithGraph:options:",  v23,  0LL);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v8 = -[VMUVMRegionIdentifier regions](v6, "regions");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (([v12 isSubmap] & 1) == 0)
        {
          [MEMORY[0x189607968] numberWithUnsignedLongLong:[v12 address]];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 setObject:v12 forKeyedSubscript:v13];
        }
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v9);
  }

  LOBYTE(v25[0]) = 1;
  id v14 = v7;
  v25[1] = v14;
  id v15 = v23;
  v25[2] = v15;
  id v16 = v6;
  v25[3] = v16;
  __int128 v26 = *(_OWORD *)&self->_firstDominates;
  uint64_t v27 = MEMORY[0x186E33044](v24);
  uint64_t v28 = [v15 methodForSelector:sel_nodeDetails_];
  uint64_t v29 = [v15 methodForSelector:sel_stackIDForNode_];
  id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize >= 1)
  {
    for (uint64_t j = 0LL; nodeNamespaceSize != j; ++j)
    {
      if (self->_dominators[j] == -1 && self->_firstDominates[j] != -1)
      {
        visit((uint64_t)v25, j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          id v21 = 0LL;
          goto LABEL_18;
        }

        [v17 addObject:v20];
      }
    }
  }

  id v21 = v17;
LABEL_18:

  __destructor_8_s8_s16_s24_sb48(v25);
  return v21;
}

- (VMUDominatorGraph)initWithGraph:(id)a3
{
  return -[VMUDominatorGraph initWithGraph:debugTimer:](self, "initWithGraph:debugTimer:", a3, 0LL);
}

- (VMUDominatorGraph)initWithGraph:(id)a3 debugTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VMUDominatorGraph;
  v8 = -[VMUDominatorGraph init](&v18, sel_init);
  if (v8)
  {
    uint64_t v9 = (void *)[v6 copy];

    v8->_uint64_t nodeNamespaceSize = [v9 nodeNamespaceSize];
    uint64_t v10 = -[VMUReverseGraphEnumerator initWithGraph:]( objc_alloc(&OBJC_CLASS___VMUReverseGraphEnumerator),  "initWithGraph:",  v9);
    reverseGraphEnumerator = v8->_reverseGraphEnumerator;
    v8->_reverseGraphEnumerator = &v10->super;

    [v9 removeWeakEdges];
    int v12 = [v9 nodeNamespaceSize];
    v13 = calloc(1uLL, ((v12 + 7) >> 3) + 4);
    _DWORD *v13 = v12;
    [v9 markRootNodes:v13];
    id v14 = -[VMUGraphEnumerator initWithGraph:](objc_alloc(&OBJC_CLASS___VMUGraphEnumerator), "initWithGraph:", v9);
    id v15 = -[VMUGraphEnumerator buildReversePostOrderWithRoots:](v14, "buildReversePostOrderWithRoots:", v13);

    -[VMUDominatorGraph _computeDominators:roots:reversePostOrder:debugTimer:]( v8,  "_computeDominators:roots:reversePostOrder:debugTimer:",  v9,  v13,  v15,  v7);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUDominatorGraph setDominators_data:](v8, "setDominators_data:", v16);

    v8->_dominators = (unsigned int *)-[NSData bytes](v8->_dominators_data, "bytes");
    free(v15);
    free(v13);
    -[VMUDominatorGraph _computeDominees:](v8, "_computeDominees:", v9);
    id v6 = v9;
  }

  return v8;
}

- (id)_computeDominators:(id)a3 roots:(void *)a4 reversePostOrder:(unsigned int *)a5 debugTimer:(id)a6
{
  id v38 = a3;
  id v39 = a6;
  [v38 invertedGraph];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = [v8 nodeNamespaceSize];
  size_t v10 = 4LL * (v9 + 1);
  uint64_t v11 = malloc(v10);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v11, &__pattern4, v10);
  [MEMORY[0x189603F48] dataWithBytesNoCopy:v11 length:v10 freeWhenDone:1];
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  int v12 = malloc(v10);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v12, &__pattern4, v10);
  v13 = malloc(v10);
  LODWORD(__pattern4) = -1;
  v44 = v13;
  memset_pattern4(v13, &__pattern4, v10);
  uint64_t v40 = v8;
  int v14 = [v8 nodeNamespaceSize];
  if (v14 >= 1)
  {
    uint64_t v15 = v14;
    id v16 = a5;
    do
    {
      unsigned int v18 = *v16++;
      uint64_t v17 = v18;
      if (v18 == -1) {
        break;
      }
      *((_DWORD *)v12 + v17) = v15--;
    }

    while (v15);
  }

  v11[v9] = v9;
  uint64_t v41 = 0LL;
  *((_DWORD *)v12 + v9) = [v8 nodeNamespaceSize] + 100;
  do
  {
    while (1)
    {
      int v19 = [v40 nodeNamespaceSize];
      if (v19 >= 1)
      {
        uint64_t v20 = 0LL;
        uint64_t v43 = 0LL;
        uint64_t v21 = -1LL;
        v22 = a5;
        uint64_t v23 = v19;
        while (1)
        {
          unsigned int v25 = *v22++;
          uint64_t v24 = v25;
          if (v25 == -1) {
            goto LABEL_33;
          }
          if (v11[v24] != v9) {
            break;
          }
          ++v20;
LABEL_30:
          if (!--v23) {
            goto LABEL_33;
          }
        }

        p_pattern4 = &__pattern4;
        uint64_t __pattern4 = 0LL;
        __int128 v57 = &__pattern4;
        uint64_t v58 = 0x2020000000LL;
        int v27 = v44[v24];
        int v59 = v27;
        switch(v27)
        {
          case -1:
            int v59 = 0;
            reverseGraphEnumerator = self->_reverseGraphEnumerator;
            v55[0] = MEMORY[0x1895F87A8];
            v55[1] = 3221225472LL;
            v55[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke;
            v55[3] = &unk_189DFFB90;
            v55[4] = &__pattern4;
            -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:]( reverseGraphEnumerator,  "enumerateEdgesOfNode:withBlock:",  v24,  v55);
            p_pattern4 = v57;
            v44[v24] = *((_DWORD *)v57 + 6);
            break;
          case 1:
LABEL_15:
            ++v20;
LABEL_29:
            _Block_object_dispose(&__pattern4, 8);
            goto LABEL_30;
          case 0:
            v11[v24] = v9;
            goto LABEL_15;
        }

        uint64_t v51 = 0LL;
        __int128 v52 = &v51;
        uint64_t v53 = 0x2020000000LL;
        int v54 = -1;
        if (*((_DWORD *)p_pattern4 + 6))
        {
          uint64_t v29 = self->_reverseGraphEnumerator;
          v50[0] = MEMORY[0x1895F87A8];
          v50[1] = 3221225472LL;
          v50[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2;
          v50[3] = &unk_189E00368;
          v50[5] = v12;
          v50[6] = v11;
          v50[4] = &v51;
          -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](v29, "enumerateEdgesOfNode:withBlock:", v24, v50);
          if (*((_DWORD *)v57 + 6) >= 2u)
          {
            v42 = self->_reverseGraphEnumerator;
            v45[0] = MEMORY[0x1895F87A8];
            v45[1] = 3221225472LL;
            v45[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3;
            v45[3] = &unk_189E00390;
            v47 = &v51;
            char v48 = v12;
            v49 = v11;
            id v46 = v38;
            -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](v42, "enumerateEdgesOfNode:withBlock:", v24, v45);
          }
        }

        else
        {
          int v54 = v9;
        }

        int v30 = *((_DWORD *)v52 + 6);
        if (v30 == -1 || ((int v31 = v11[v24], v31 != -1) ? (v32 = v30 == v31) : (v32 = 0), v32))
        {
          uint64_t v24 = v21;
        }

        else
        {
          v11[v24] = v30;
          ++v43;
        }

        _Block_object_dispose(&v51, 8);
        uint64_t v21 = v24;
        goto LABEL_29;
      }

      uint64_t v43 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = -1LL;
LABEL_33:
      if (!v39) {
        break;
      }
      NSLog( @"compute dominators (%lu): changeCount = %lu, skipCount = %lu, lastChangedIndex = %ld",  v41++,  v43,  v20,  v21,  v36);
      if (!v43) {
        goto LABEL_37;
      }
    }
  }

  while (v43);
LABEL_37:
  int v33 = [v40 nodeNamespaceSize];
  if (v33 >= 1)
  {
    uint64_t v34 = v33;
    do
    {
      if (*v11 == v9) {
        _DWORD *v11 = -1;
      }
      ++v11;
      --v34;
    }

    while (v34);
  }

  free(v44);
  free(v12);

  return v36;
}

uint64_t __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke( uint64_t result)
{
  return result;
}

void *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2( void *result,  uint64_t a2,  uint64_t a3,  unsigned int a4,  _BYTE *a5)
{
  if (*(_DWORD *)(result[5] + 4LL * a4) != -1 && *(_DWORD *)(result[6] + 4LL * a4) != -1)
  {
    *(_DWORD *)(*(void *)(result[4] + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a4;
    *a5 = 1;
  }

  return result;
}

void *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3( void *result,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  uint64_t v4 = result[6];
  if (*(_DWORD *)(v4 + 4LL * a4) != -1)
  {
    uint64_t v5 = a4;
    uint64_t v6 = *(void *)(result[5] + 8LL);
    uint64_t v7 = *(unsigned int *)(v6 + 24);
    if (v7 != a4)
    {
      uint64_t v8 = result[7];
      if (*(_DWORD *)(v8 + 4LL * a4) != -1)
      {
        do
        {
          unsigned int v9 = *(_DWORD *)(v4 + 4 * v7);
          while (1)
          {
            unsigned int v10 = *(_DWORD *)(v4 + 4 * v5);
            if (v10 >= v9) {
              break;
            }
            uint64_t v5 = *(unsigned int *)(v8 + 4 * v5);
          }

          while (v9 < v10)
          {
            uint64_t v7 = *(unsigned int *)(v8 + 4 * v7);
            unsigned int v9 = *(_DWORD *)(v4 + 4 * v7);
          }
        }

        while (v5 != v7);
        *(_DWORD *)(v6 + 24) = v5;
      }
    }
  }

  return result;
}

- (void)_computeDominees:(id)a3
{
  id v17 = a3;
  size_t v4 = 4 * [v17 nodeNamespaceSize];
  uint64_t v5 = malloc(v4);
  int __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_firstDominates = (unsigned int *)v5;
  size_t v6 = 4 * [v17 nodeNamespaceSize];
  uint64_t v7 = malloc(v6);
  int v18 = -1;
  memset_pattern4(v7, &v18, v6);
  self->_nextDominates = (unsigned int *)v7;
  [MEMORY[0x189603F48] dataWithBytesNoCopy:self->_firstDominates length:4 * [v17 nodeNamespaceSize] freeWhenDone:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDominatorGraph setFirstDominates_data:](self, "setFirstDominates_data:", v8);

  [MEMORY[0x189603F48] dataWithBytesNoCopy:self->_nextDominates length:4 * [v17 nodeNamespaceSize] freeWhenDone:1];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDominatorGraph setNextDominates_data:](self, "setNextDominates_data:", v9);

  int v10 = [v17 nodeNamespaceSize];
  if (v10 >= 1)
  {
    uint64_t v11 = 0LL;
    dominators = self->_dominators;
    do
    {
      uint64_t v13 = dominators[v11];
      if ((_DWORD)v13 != -1)
      {
        int v14 = &self->_firstDominates[v13];
        uint64_t v15 = *v14;
        if ((_DWORD)v15 != -1)
        {
          nextDominates = self->_nextDominates;
          int v14 = &nextDominates[v15];
          nextDominates[v11] = *v14;
        }

        *int v14 = v11;
      }

      ++v11;
    }

    while (v10 != v11);
  }
}

- (unsigned)dominator:(unsigned int)a3
{
  return self->_dominators[a3];
}

- (void)enumerateDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
  int v12 = (void (**)(id, void))a4;
  size_t v6 = malloc(0x80uLL);
  *size_t v6 = self->_firstDominates[a3];
  uint64_t v7 = 1LL;
  unint64_t v8 = 32LL;
  do
  {
    uint64_t v9 = v7 - 1;
    uint64_t v10 = v6[v7 - 1];
    if ((_DWORD)v10 != -1)
    {
      v12[2](v12, v6[v7 - 1]);
      if (v7 + 1 >= v8)
      {
        size_t v6 = realloc(v6, 8 * v8);
        v8 *= 2LL;
      }

      nextDominates = self->_nextDominates;
      v6[v9] = self->_firstDominates[v10];
      v6[v7] = nextDominates[v10];
      uint64_t v9 = v7 + 1;
    }

    uint64_t v7 = v9;
  }

  while (v9);
  free(v6);
}

- (BOOL)hasAnyDirectDomineesForNodeName:(unsigned int)a3
{
  return self->_firstDominates[a3] != -1;
}

- (void)enumerateDirectDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateDominatorRootsWithBlock:(id)a3
{
  size_t v6 = (void (**)(id, void))a3;
  uint64_t nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize >= 1)
  {
    for (uint64_t i = 0LL; i != nodeNamespaceSize; ++i)
    {
      if (self->_dominators[i] == -1 && self->_firstDominates[i] != -1) {
        v6[2](v6, i);
      }
    }
  }
}

- (id)iterDominatorRoots
{
  return  -[VMUDominatorRoots initWithDominatorGraph:]( objc_alloc(&OBJC_CLASS___VMUDominatorRoots),  "initWithDominatorGraph:",  self);
}

- (id)iterDirectDomineesForNodeName:(unsigned int)a3
{
  return  -[VMUDirectDominees initWithDominatorGraph:rootNode:]( objc_alloc(&OBJC_CLASS___VMUDirectDominees),  "initWithDominatorGraph:rootNode:",  self,  *(void *)&a3);
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredAddress:(id)a6 debugTimer:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  int v14 = objc_alloc_init(&OBJC_CLASS___VMUDominatorCallTreeCreator);
  -[VMUDominatorCallTreeCreator setDesiredAddress:](v14, "setDesiredAddress:", v12);

  -[VMUDominatorCallTreeCreator callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:]( v14,  "callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:",  v13,  v9,  v8,  v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredClassesPattern:(id)a6 debugTimer:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  int v14 = objc_alloc_init(&OBJC_CLASS___VMUDominatorCallTreeCreator);
  -[VMUDominatorCallTreeCreator setDesiredClassesPattern:](v14, "setDesiredClassesPattern:", v12);

  -[VMUDominatorCallTreeCreator callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:]( v14,  "callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:",  v13,  v9,  v8,  v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)dominators_data
{
  return self->_dominators_data;
}

- (void)setDominators_data:(id)a3
{
}

- (NSData)firstDominates_data
{
  return self->_firstDominates_data;
}

- (void)setFirstDominates_data:(id)a3
{
}

- (NSData)nextDominates_data
{
  return self->_nextDominates_data;
}

- (void)setNextDominates_data:(id)a3
{
}

- (unsigned)nodeNamespaceSize
{
  return self->_nodeNamespaceSize;
}

- (void)setNodeNamespaceSize:(unsigned int)a3
{
  self->_uint64_t nodeNamespaceSize = a3;
}

- (unsigned)dominators
{
  return self->_dominators;
}

- (void)setDominators:(unsigned int *)a3
{
  self->_dominators = a3;
}

- (unsigned)firstDominates
{
  return self->_firstDominates;
}

- (void)setFirstDominates:(unsigned int *)a3
{
  self->_firstDominates = a3;
}

- (unsigned)nextDominates
{
  return self->_nextDominates;
}

- (void)setNextDominates:(unsigned int *)a3
{
  self->_nextDominates = a3;
}

- (void).cxx_destruct
{
}

@end