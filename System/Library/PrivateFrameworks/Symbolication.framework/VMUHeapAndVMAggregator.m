@interface VMUHeapAndVMAggregator
- (NSArray)heapZoneAggregates;
- (VMUHeapAndVMAggregator)initWithGraph:(id)a3 options:(id)a4;
- (VMUMallocZoneAggregate)allZonesAggregate;
- (id)_classDisplayName:(id)a3;
- (void)_countAllocation:(id)a3 inRegion:(id)a4;
- (void)analyzeMemgraph;
- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUHeapAndVMAggregator

- (VMUHeapAndVMAggregator)initWithGraph:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VMUHeapAndVMAggregator;
  v9 = -[VMUHeapAndVMAggregator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_graph, a3);
    uint64_t v11 = -[VMUHeapAndVMAggregatorOptions classFilterPatternMatcher](v10->_heapAndVMOptions, "classFilterPatternMatcher");
    classFilterPatternMatcher = v10->_classFilterPatternMatcher;
    v10->_classFilterPatternMatcher = (VMUClassPatternMatcher *)v11;

    uint64_t v13 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"non-object",  &stru_189E010C8,  0LL);
    nonObjectInfo = v10->_nonObjectInfo;
    v10->_nonObjectInfo = (VMUClassInfo *)v13;
  }

  return v10;
}

- (NSArray)heapZoneAggregates
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_heapZoneAggregates, "copy");
}

- (id)_classDisplayName:(id)a3
{
  heapAndVMOptions = self->_heapAndVMOptions;
  id v4 = a3;
  if (-[VMUHeapAndVMAggregatorOptions showRawClassNames](heapAndVMOptions, "showRawClassNames")) {
    [v4 className];
  }
  else {
    [v4 displayName];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_countAllocation:(id)a3 inRegion:(id)a4
{
  v10 = (unsigned int *)a4;
  [*(id *)(a3.var0 + 16) genericInfo];
  v6 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  nonObjectInfo = v6;
  if (!v6) {
    nonObjectInfo = self->_nonObjectInfo;
  }
  id v8 = nonObjectInfo;

  -[VMUMallocZoneAggregate incrementAllocationCountForClassInfo:size:]( self->_allZonesAggregate,  "incrementAllocationCountForClassInfo:size:",  v8,  *(void *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
  if (-[VMUHeapAndVMAggregatorOptions separateByZone](self->_heapAndVMOptions, "separateByZone"))
  {
    v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_heapZoneAggregates, "objectAtIndexedSubscript:", v10[37]);
    [v9 incrementAllocationCountForClassInfo:v8 size:*(void *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL];
  }
}

- (void)analyzeMemgraph
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  v2 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  if (v2)
  {
    v3 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    uint64_t v4 = [v3 signpostID];

    if (v4)
    {
      v5 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      [v5 logHandle];
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v8 = [v7 signpostID];

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v6,  OS_SIGNPOST_INTERVAL_END,  v8,  "VMUHeapAndVMAggregator",  "",  buf,  2u);
      }
    }
  }
  v9 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  [v9 endEvent:"VMUHeapAndVMAggregator"];
  v10 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  [v10 startWithCategory:"VMUHeapAndVMAggregator" message:"counting allocations"];

  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    [v12 logHandle];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v14 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    os_signpost_id_t v15 = [v14 signpostID];

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "VMUHeapAndVMAggregator",  "counting allocations",  buf,  2u);
    }
  }

  objc_super v16 = -[VMUMallocZoneAggregate initWithZoneName:options:]( objc_alloc(&OBJC_CLASS___VMUMallocZoneAggregate),  "initWithZoneName:options:",  0LL,  self->_heapAndVMOptions);
  allZonesAggregate = self->_allZonesAggregate;
  self->_allZonesAggregate = v16;

  if (-[VMUHeapAndVMAggregatorOptions separateByZone](self->_heapAndVMOptions, "separateByZone"))
  {
    [MEMORY[0x189603FA8] array];
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    heapZoneAggregates = self->_heapZoneAggregates;
    self->_heapZoneAggregates = v18;

    if (-[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount"))
    {
      unsigned int v20 = 0;
      do
      {
        v21 = self->_heapZoneAggregates;
        v22 = -[VMUMallocZoneAggregate initWithZoneName:options:]( objc_alloc(&OBJC_CLASS___VMUMallocZoneAggregate),  "initWithZoneName:options:",  0LL,  self->_heapAndVMOptions);
        -[NSMutableArray addObject:](v21, "addObject:", v22);

        ++v20;
      }

      while (v20 < -[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount"));
    }
  }

  v86[0] = 0LL;
  v86[1] = v86;
  v86[2] = 0x2020000000LL;
  int v87 = 0;
  v23 = self;
  unsigned int v70 = -[VMUCommonGraphInterface nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  int v69 = -[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount");
  v68 = (void *)objc_opt_new();
  if (-[VMUHeapAndVMAggregatorOptions guessNonObjects](self->_heapAndVMOptions, "guessNonObjects"))
  {
    v24 = malloc(4LL * v70);
    *(_DWORD *)buf = -1;
    v71 = v24;
    memset_pattern4(v24, buf, 4LL * v70);
  }

  else
  {
    v71 = 0LL;
  }

  if ((-[VMUHeapAndVMAggregatorOptions scope](self->_heapAndVMOptions, "scope") == 2
     || -[VMUHeapAndVMAggregatorOptions scope](self->_heapAndVMOptions, "scope") == 1)
    && -[VMUCommonGraphInterface isMemberOfClass:](self->_graph, "isMemberOfClass:", objc_opt_class()))
  {
    v25 = -[VMUVMRegionIdentifier initWithGraph:options:]( objc_alloc(&OBJC_CLASS___VMUVMRegionIdentifier),  "initWithGraph:options:",  self->_graph,  0LL);
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    v26 = -[VMUVMRegionIdentifier zoneNames](v25, "zoneNames");
    uint64_t v27 = [v26 countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v83;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v83 != v28) {
            objc_enumerationMutation(v26);
          }
          if (v25)
          {
            uint64_t v30 = *(void *)(*((void *)&v82 + 1) + 8 * i);
            -[VMUVMRegionIdentifier computedStatisticsForZoneWithName:](v25, "computedStatisticsForZoneWithName:", v30);
            if (v81)
            {
              [NSString stringWithFormat:@"VM: %@ fragmentation", v30];
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v31,  &stru_189E010C8,  0LL);
              -[VMUMallocZoneAggregate modifySize:count:forClassInfo:]( self->_allZonesAggregate,  "modifySize:count:forClassInfo:",  v81,  1LL,  v32);
            }
          }
        }

        uint64_t v27 = [v26 countByEnumeratingWithState:&v82 objects:v88 count:16];
      }

      while (v27);
    }

    v23 = self;
  }

  graph = v23->_graph;
  uint64_t v34 = MEMORY[0x1895F87A8];
  v74[0] = MEMORY[0x1895F87A8];
  v74[1] = 3221225472LL;
  v74[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke;
  v74[3] = &unk_189E00B40;
  unsigned int v78 = v70;
  v76 = v86;
  v74[4] = v23;
  v77 = v71;
  id v35 = v68;
  id v75 = v35;
  int v79 = v69;
  -[VMUCommonGraphInterface enumerateRegionsWithBlock:](graph, "enumerateRegionsWithBlock:", v74);
  v36 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  if (v36)
  {
    v37 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    BOOL v38 = [v37 signpostID] == 0;

    if (!v38)
    {
      v39 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      [v39 logHandle];
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v41 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      os_signpost_id_t v42 = [v41 signpostID];

      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v40,  OS_SIGNPOST_INTERVAL_END,  v42,  "VMUHeapAndVMAggregator",  "",  buf,  2u);
      }
    }
  }
  v43 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  [v43 endEvent:"VMUHeapAndVMAggregator"];

  if (-[VMUHeapAndVMAggregatorOptions guessNonObjects](self->_heapAndVMOptions, "guessNonObjects"))
  {
    v44 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    if (v44)
    {
      v45 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      BOOL v46 = [v45 signpostID] == 0;

      if (!v46)
      {
        v47 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        [v47 logHandle];
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v49 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        os_signpost_id_t v50 = [v49 signpostID];

        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v48,  OS_SIGNPOST_INTERVAL_END,  v50,  "VMUHeapAndVMAggregator",  "",  buf,  2u);
        }
      }
    }
    v51 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    [v51 endEvent:"VMUHeapAndVMAggregator"];
    v52 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    [v52 startWithCategory:"VMUHeapAndVMAggregator" message:"enumerating references for guessNonObjects"];
    v53 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    if (v53)
    {
      v54 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      [v54 logHandle];
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v56 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      os_signpost_id_t v57 = [v56 signpostID];

      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  v57,  "VMUHeapAndVMAggregator",  "enumerating references for guessNonObjects",  buf,  2u);
      }
    }

    v58 = (void *)MEMORY[0x186E32E40]();
    v59 = self->_graph;
    v73[0] = v34;
    v73[1] = 3221225472LL;
    v73[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_19;
    v73[3] = &unk_189E00B68;
    v73[4] = self;
    v73[5] = v71;
    -[VMUCommonGraphInterface enumerateReferencesWithBlock:](v59, "enumerateReferencesWithBlock:", v73);
    objc_autoreleasePoolPop(v58);
    v60 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    if (v60)
    {
      v61 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      BOOL v62 = [v61 signpostID] == 0;

      if (!v62)
      {
        v63 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        [v63 logHandle];
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v65 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        os_signpost_id_t v66 = [v65 signpostID];

        if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v64,  OS_SIGNPOST_INTERVAL_END,  v66,  "VMUHeapAndVMAggregator",  "",  buf,  2u);
        }
      }
    }
    v67 = -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    [v67 endEvent:"VMUHeapAndVMAggregator"];

    free(v71);
  }

  _Block_object_dispose(v86, 8);
}

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) < *(_DWORD *)(a1 + 64))
  {
    unint64_t v4 = 0x189DFB000uLL;
    do
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      if (v6)
      {
        [v6 nodeDetails:];
        uint64_t v5 = *(void *)(a1 + 32);
      }

      else
      {
        __int128 v20 = 0uLL;
        uint64_t v21 = 0LL;
      }

      int v7 = [*(id *)(v5 + 8) scope];
      if (v7 == 2)
      {
        unint64_t v8 = *((void *)&v20 + 1);
        if (*((void *)&v20 + 1) >> 60 != 5LL) {
          goto LABEL_30;
        }
      }

      else if (v7 == 1)
      {
        unint64_t v8 = *((void *)&v20 + 1);
        if (*((void *)&v20 + 1) >> 60 != 1)
        {
          if (!VMUGraphNodeType_IsVMRegion(*((void *)&v20 + 1) >> 60)) {
            goto LABEL_30;
          }
          unint64_t v8 = *((void *)&v20 + 1);
        }
      }

      else
      {
        if (v7) {
          abort();
        }
        unint64_t v8 = *((void *)&v20 + 1);
        if (*((void *)&v20 + 1) >> 60 != 1LL) {
          goto LABEL_30;
        }
      }

      if ((v8 & 0xFFFFFFFFFFFFFFFLL) != 0)
      {
        v9 = *(void **)(*(void *)(a1 + 32) + 48LL);
        if (!v9) {
          goto LABEL_21;
        }
        __int128 v18 = v20;
        uint64_t v19 = v21;
        if ([v9 matchesNodeDetails:&v18 orNodeDescription:0])
        {
          unint64_t v8 = *((void *)&v20 + 1);
LABEL_21:
          if (v8 >> 60 == 1)
          {
            v10 = *(void **)(a1 + 32);
            __int128 v18 = v20;
            uint64_t v19 = v21;
            [v10 _countAllocation:&v18 inRegion:v3];
          }

          else if (VMUGraphNodeType_IsVMRegion(v8 >> 60) && ([v3 isMallocHeapRelated] & 1) == 0)
          {
            uint64_t v11 = v3[22] + v3[23];
            uint64_t v12 = v3[24];
            uint64_t v13 = v11 - v12;
            if (v11 != v12)
            {
              unint64_t v14 = v4;
              [*(id *)(a1 + 40) objectForKeyedSubscript:v3[4]];
              os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
              {
                [NSString stringWithFormat:@"VM: %@", v3[4]];
                objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
                [*(id *)(v14 + 3776) classInfoWithClassName:v16 binaryPath:&stru_189E010C8 type:0];
                os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v3[4]];
              }

              [*(id *)(*(void *)(a1 + 32) + 24) modifySize:v13 count:1 forClassInfo:v15];

              unint64_t v4 = v14;
            }
          }
        }
      }

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_19( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (!*(void *)(a5 + 24))
  {
    unsigned int v5 = a4;
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = *(_DWORD *)(v7 + 4LL * a4);
    if (v8)
    {
      if (*(_DWORD *)(v7 + 4LL * a3) == v8)
      {
        v10 = *(void **)(*(void *)(a1 + 32) + 16LL);
        if (v10)
        {
          [v10 nodeDetails:a4];
          uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 16LL);
          if (v12)
          {
            [v12 nodeDetails:a3];
            id v13 = v30;
            unint64_t v14 = v13;
            if (v13)
            {
              if (!v33)
              {
                [v13 className];
                os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                char v16 = [v15 hasSuffix:@"Storage"]);

                if ((v16 & 1) == 0)
                {
                  uint64_t v17 = *(void *)(a1 + 32);
                  __int128 v18 = *(void **)(v17 + 48);
                  if (!v18)
                  {
LABEL_13:
                    uint64_t v19 = v5;
                    id v20 = *(id *)(v17 + 24);
                    if ([*(id *)(*(void *)(a1 + 32) + 8) separateByZone])
                    {
                      uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndexedSubscript:(*(_DWORD *)(*(void *)(a1 + 40) + 4 * v19) - 1)];

                      id v20 = (id)v21;
                    }

                    [v20 modifySize:-(v32 & 0xFFFFFFFFFFFFFFFLL) count:-1 forClassInfo:*(void *)(*(void *)(a1 + 32) + 40)];
                    if ([*(id *)(*(void *)(a1 + 32) + 8) sumObjectFields])
                    {
                      [v20 modifySize:v32 & 0xFFFFFFFFFFFFFFFLL count:0 forClassInfo:v14];
                    }

                    else
                    {
                      v22 = (void *)MEMORY[0x186E32E40]();
                      [*(id *)(a1 + 32) _classDisplayName:v14];
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      [v23 stringByAppendingFormat:@"[%llu]"];
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      [v14 binaryPath];
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v24,  v25,  [v14 infoType]);
                      [v20 modifySize:v32 & 0xFFFFFFFFFFFFFFFLL count:1 forClassInfo:v26];
                      objc_autoreleasePoolPop(v22);
                    }

                    *(_DWORD *)(*(void *)(a1 + 40) + 4 * v19) = 0;

                    goto LABEL_19;
                  }

                  __int128 v27 = v29;
                  id v28 = v30;
                  if ([v18 matchesNodeDetails:&v27 orNodeDescription:0])
                  {
                    uint64_t v17 = *(void *)(a1 + 32);
                    goto LABEL_13;
                  }
                }
              }
            }

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
}

- (VMUMallocZoneAggregate)allZonesAggregate
{
  return self->_allZonesAggregate;
}

- (void).cxx_destruct
{
}

@end