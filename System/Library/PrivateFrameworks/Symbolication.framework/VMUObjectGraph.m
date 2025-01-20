@interface VMUObjectGraph
- ($3576753C8488139535C1C7A74D12E914)_rawReferenceInfoWithName:(SEL)a3;
- ($3576753C8488139535C1C7A74D12E914)referenceInfoWithName:(SEL)a3;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUObjectGraph *)self;
- (BOOL)_commonHighAddressBit;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)isGroupNode:(unsigned int)a3;
- (BOOL)isRootNode:(unsigned int)a3;
- (VMUClassInfoMap)indexedClassInfos;
- (VMUObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUObjectGraph)initWithNodeCount:(unsigned int)a3 nodeProvider:(id)a4;
- (VMUObjectGraph)initWithNodesNoCopy:(_VMUBlockNode *)a3 nodeCount:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subgraphWithShortestPathsFromNode:(unsigned int)a3 toNodes:(void *)a4;
- (id)subgraphWithUniquePathsFromNode:(unsigned int)a3 toNodes:(void *)a4;
- (unsigned)addEdgeFromNode:(unsigned int)a3 sourceOffset:(unint64_t)a4 withScanType:(unsigned int)a5 toNode:(unsigned int)a6 destinationOffset:(unint64_t)a7;
- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4;
- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsContainedInCollection:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsOfGroupNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsWithBlock:(id)a3;
- (unsigned)enumerateReferencesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateReferencesWithBlock:(id)a3;
- (unsigned)nodeForAddress:(unint64_t)a3;
- (unsigned)nodeReferencedFromSourceNode:(unsigned int)a3 byIvarWithName:(id)a4;
- (unsigned)scanTypeOfReferenceWithName:(unsigned int)a3;
- (void)_compareWithGraph:(id)a3 andMarkOnMatch:(BOOL)a4;
- (void)_modifyDerivativeGraphCount:(int)a3;
- (void)_refineTypesWithOverlay:(id)a3;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)createMapForIntersectGraph:(id)a3;
- (void)createMapForMinusGraph:(id)a3;
- (void)dealloc;
- (void)internalizeNodes;
- (void)setClassInfoIndex:(unsigned int)a3 forNode:(unsigned int)a4;
- (void)setIndexedClassInfos:(id)a3;
- (void)stronglyConnectedComponentSearch:(unsigned int)a3 withRecorder:(id)a4;
@end

@implementation VMUObjectGraph

- (VMUObjectGraph)initWithNodeCount:(unsigned int)a3 nodeProvider:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  v7 = -[VMUDirectedGraph initWithNodes:](&v14, sel_initWithNodes_, v4);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = MEMORY[0x186E33044](v6);
      id nodeProvider = v8->_nodeProvider;
      v8->_id nodeProvider = (id)v9;

      v8->_referenceGraphNodeNamespaceSize = v4;
      uint64_t v11 = objc_opt_new();
      knownClassInfos = v8->_knownClassInfos;
      v8->_knownClassInfos = (VMUClassInfoMap *)v11;
    }

    else
    {
      knownClassInfos = v7;
      v8 = 0LL;
    }
  }

  return v8;
}

- (VMUObjectGraph)initWithNodesNoCopy:(_VMUBlockNode *)a3 nodeCount:
{
  unsigned int v4 = v3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  id v6 = -[VMUDirectedGraph initWithNodes:](&v11, sel_initWithNodes_);
  v7 = v6;
  if (v6)
  {
    v6->_internalizedNodes = a3;
    v6->_internalizedCount = v4;
    uint64_t v8 = objc_opt_new();
    knownClassInfos = v7->_knownClassInfos;
    v7->_knownClassInfos = (VMUClassInfoMap *)v8;

    v7->_referenceGraphNodeNamespaceSize = 0;
  }

  return v7;
}

- (void)dealloc
{
  referenceGraph = self->_referenceGraph;
  if (referenceGraph)
  {
    -[VMUObjectGraph _modifyDerivativeGraphCount:](referenceGraph, "_modifyDerivativeGraphCount:", 0xFFFFFFFFLL);
    unsigned int v4 = self->_referenceGraph;
    self->_referenceGraph = 0LL;
  }

  referenceTable = self->_referenceTable;
  if (referenceTable)
  {
    free(referenceTable);
    self->_referenceTable = 0LL;
  }

  referenceTableLarge = self->_referenceTableLarge;
  if (referenceTableLarge)
  {
    free(referenceTableLarge);
    self->_referenceTableLarge = 0LL;
  }

  internalizedNodes = self->_internalizedNodes;
  if (internalizedNodes)
  {
    free(internalizedNodes);
    self->_internalizedNodes = 0LL;
  }

  +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:]( &OBJC_CLASS___VMUClassInfoMap,  "_destroyRetainedLinearArray:withCount:",  self->_classInfos,  self->_classInfosCount);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  -[VMUDirectedGraph dealloc](&v8, sel_dealloc);
}

- (VMUObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v137[1] = *MEMORY[0x1895F89C0];
  id v13 = a3;
  v127.receiver = self;
  v127.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  v112 = a7;
  id v113 = a6;
  objc_super v14 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:]( &v127,  sel_initWithArchived_version_options_diskLogs_error_,  v13,  a4,  a5);
  if (!v14) {
    goto LABEL_71;
  }
  [v13 objectForKeyedSubscript:@"objectGraphInfo"];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v14->_unint64_t internalizedCount = -[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize");
  char v15 = -[VMUDirectedGraph graphIs64bit](v14, "graphIs64bit");
  unint64_t internalizedCount = v14->_internalizedCount;
  else {
    char v17 = v15;
  }
  if ((v17 & 1) != 0)
  {
    v14->_internalizedNodes = (_VMUBlockNode *)malloc(16 * internalizedCount);
    unint64_t v126 = 0LL;
    [v114 objectForKeyedSubscript:@"objectDetails"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v18,  &v126,  a5);

    unint64_t v20 = v126;
    [v114 objectForKeyedSubscript:@"commonAddressBits"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v14->_internalizedCount)
    {
      uint64_t v23 = 0LL;
      unint64_t v24 = 0LL;
      unint64_t v25 = 0LL;
      unint64_t var0 = 0LL;
      unsigned int v27 = 0;
      unint64_t v28 = v20 >> 2;
      while (v25 + 1 <= v28)
      {
        unsigned int v29 = v19[v25];
        unint64_t v30 = v25 + 4;
        if ((v29 & 0x80000000) != 0 && v30 > v28) {
          break;
        }
        if ((v29 & 0x80000000) != 0)
        {
          unint64_t v32 = v19[v25 + 1] | ((unint64_t)(v29 & 0x7FFFFFFF) << 32);
          unint64_t v33 = v19[v25 + 3] | ((unint64_t)v19[v25 + 2] << 32);
          v34 = &v14->_internalizedNodes[v23];
          v34->unint64_t var0 = v32;
          *((void *)v34 + 1) = v33;
          unint64_t v25 = v30;
        }

        else
        {
          v31 = &v14->_internalizedNodes[v23];
          v31->unint64_t var0 = var0 + (((v29 >> 4) & 0x3FF) << (v29 & 0xF));
          *((void *)v31 + 1) = (32 * (((v29 >> 14) & 0x1F) << (v29 & 0xF))) | 1 | ((unint64_t)(v29 >> 19) << 41);
          ++v27;
          ++v25;
        }

        v35 = &v14->_internalizedNodes[v23];
        unint64_t var0 = v35->var0;
        unsigned int v36 = *((_DWORD *)v35 + 2) & 7;
        BOOL v37 = v36 > 4;
        int v38 = (1 << v36) & 0x19;
        if (v37 || v38 == 0) {
          v35->unint64_t var0 = var0 | v22;
        }
        ++v24;
        ++v23;
      }

      v40 = (FILE *)*MEMORY[0x1895F89D0];
      v41 = (objc_class *)objc_opt_class();
      id v42 = NSStringFromClass(v41);
      v43 = (const char *)[v42 UTF8String];
      Name = sel_getName(a2);
      fprintf(v40, "-[%s %s] error: malformed serialized data\n", v43, Name);

      if (v19) {
        free(v19);
      }

      goto LABEL_26;
    }

    unsigned int v27 = 0;
    unsigned int v45 = 0;
    if (v19)
    {
LABEL_28:
      free(v19);
      unsigned int v45 = v27;
    }

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n",  v45,  -[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize") - v45,  (double)v45 * 100.0 / (double)-[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize"));
    }
    uint64_t v122 = 0LL;
    v123 = &v122;
    uint64_t v124 = 0x2020000000LL;
    char v125 = 1;
    v121[0] = 0LL;
    v121[1] = v121;
    v121[2] = 0x2020000000LL;
    v121[3] = 0LL;
    v117[0] = MEMORY[0x1895F87A8];
    v117[1] = 3221225472LL;
    v117[2] = __66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
    v117[3] = &unk_189E006B8;
    objc_super v14 = v14;
    v118 = v14;
    v119 = v121;
    v120 = &v122;
    -[VMUDirectedGraph enumerateNodesWithBlock:](v14, "enumerateNodesWithBlock:", v117);
    if (*((_BYTE *)v123 + 24))
    {
      unint64_t v116 = 0LL;
      [v114 objectForKeyedSubscript:@"referenceDetails"];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v14->_referenceTable = (_VMUObjectGraphEdge *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v46,  &v116,  a5);

      unsigned int v47 = -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize");
      v14->_uint64_t referenceTableCapacity = v47;
      if (v116 >= 4 * (unint64_t)v47)
      {
        if (kVMUPrintArchivingTiming) {
          fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Reference Details] Total Compact and Large: %d\n\n",  -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize"));
        }
        unint64_t v115 = 0LL;
        [v114 objectForKeyedSubscript:@"referenceDetailsLarge"];
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v68,  &v115,  a5);

        unint64_t v69 = v115;
        unint64_t v70 = v115 >> 4;
        v14->_referenceTableLargeCapacity = v115 >> 4;
        v14->_referenceTableLargeCount = v70;
        if (v69 >= 16 * (unint64_t)v14->_referenceTableLargeCapacity)
        {
          if (kVMUPrintArchivingTiming) {
            fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n",  -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize") - v14->_referenceTableLargeCount,  v14->_referenceTableLargeCount,  (double)(-[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize") - v14->_referenceTableLargeCount)
          }
            * 100.0
            / (double)-[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize"));
          uint64_t referenceTableCapacity = v14->_referenceTableCapacity;
          if ((_DWORD)referenceTableCapacity)
          {
            referenceTable = v14->_referenceTable;
            while (1)
            {
              $8D6A3E73ED2192107EDB56A8580BF2AB v84 = referenceTable->var0.var0;
              ++referenceTable;
              $8D6A3E73ED2192107EDB56A8580BF2AB v83 = v84;
              if ((*(_DWORD *)&v84 & 0x80000000) != 0
                && (*(unsigned int *)&v83 & 0x7FFFFFFF) >= v14->_referenceTableLargeCount)
              {
                break;
              }

              if (!--referenceTableCapacity) {
                goto LABEL_55;
              }
            }

            if (v112)
            {
              v100 = (void *)MEMORY[0x189607870];
              uint64_t v130 = *MEMORY[0x1896075E0];
              [MEMORY[0x189603F68] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              [v100 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v101];
              id *v112 = (id)objc_claimAutoreleasedReturnValue();
            }

            BOOL v102 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v102) {
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.2( v102,  v103,  v104,  v105,  v106,  v107,  v108,  v109);
            }
          }

          else
          {
LABEL_55:
            [v114 objectForKeyedSubscript:@"archivedClassInfos"];
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v86 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v85,  objc_opt_class(),  a5);
            knownClassInfos = v14->_knownClassInfos;
            v14->_knownClassInfos = (VMUClassInfoMap *)v86;

            v88 = v14->_knownClassInfos;
            if (v88)
            {
              v14->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:]( v88,  "_retainedLinearArrayWithReturnedCount:",  &v14->_classInfosCount);
              if (kVMUPrintArchivingTiming) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Class Layouts] Class info count: %d\n\n",  -[VMUClassInfoMap count](v14->_knownClassInfos, "count"));
              }
              int v89 = 0;
LABEL_69:

              _Block_object_dispose(v121, 8);
              _Block_object_dispose(&v122, 8);

              if (v89) {
                goto LABEL_70;
              }
LABEL_71:
              objc_super v14 = v14;
              v110 = v14;
              goto LABEL_72;
            }

            if (v112)
            {
              v90 = (void *)MEMORY[0x189607870];
              uint64_t v128 = *MEMORY[0x1896075E0];
              [MEMORY[0x189603F68] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              [v90 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v91];
              id *v112 = (id)objc_claimAutoreleasedReturnValue();
            }

            BOOL v92 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v92) {
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.4( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99);
            }

            objc_super v14 = 0LL;
          }
        }

        else
        {
          if (v112)
          {
            v71 = (void *)MEMORY[0x189607870];
            uint64_t v132 = *MEMORY[0x1896075E0];
            [MEMORY[0x189603F68] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            [v71 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v72];
            id *v112 = (id)objc_claimAutoreleasedReturnValue();
          }

          BOOL v73 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v73) {
            -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.3( v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80);
          }
        }
      }

      else
      {
        if (v112)
        {
          v48 = (void *)MEMORY[0x189607870];
          uint64_t v134 = *MEMORY[0x1896075E0];
          [MEMORY[0x189603F68] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v48 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v49];
          id *v112 = (id)objc_claimAutoreleasedReturnValue();
        }

        BOOL v50 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v50) {
          -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.2( v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57);
        }
      }
    }

    else
    {
      if (v112)
      {
        v58 = (void *)MEMORY[0x189607870];
        uint64_t v136 = *MEMORY[0x1896075E0];
        v137[0] = @"Memgraph is corrupt due to malloc zone enumeration failure. The malloc heap of the target process was in an inconsistent state such as when being modified.";
        [MEMORY[0x189603F68] dictionaryWithObjects:v137 forKeys:&v136 count:1];
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        [v58 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v59];
        id *v112 = (id)objc_claimAutoreleasedReturnValue();
      }

      BOOL v60 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v60) {
        -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.1( v60,  v61,  v62,  v63,  v64,  v65,  v66,  v67);
      }
    }

    int v89 = 1;
    goto LABEL_69;
  }

  NSLog(@"Memory graph has bizarrely high %s count %zu\n", "internalized node", internalizedCount);

LABEL_26:
  objc_super v14 = 0LL;
LABEL_70:
  v110 = 0LL;
LABEL_72:

  return v110;
}

void *__66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke( void *result,  unsigned int a2,  _BYTE *a3)
{
  unint64_t v3 = *(void *)(*(void *)(result[4] + 128LL) + 16LL * a2);
  uint64_t v4 = *(void *)(result[5] + 8LL);
  if (*(void *)(v4 + 24) > v3)
  {
    *(_BYTE *)(*(void *)(result[6] + 8LL) + 24LL) = 0;
    *a3 = 1;
    uint64_t v4 = *(void *)(result[5] + 8LL);
  }

  *(void *)(v4 + 24) = v3;
  return result;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  -[VMUDirectedGraph archiveDictionaryRepresentation:options:]( &v40,  sel_archiveDictionaryRepresentation_options_,  v6,  a4);
  [MEMORY[0x189603FC8] dictionary];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  BOOL v8 = -[VMUObjectGraph _commonHighAddressBit](self, "_commonHighAddressBit");
  unsigned int v9 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  unsigned int v10 = v9;
  if (v9)
  {
    objc_super v11 = malloc(16LL * v9);
    unsigned int v12 = 0;
    uint64_t v13 = 0LL;
    unsigned int v14 = 0;
    int v15 = 0;
    internalizedNodes = self->_internalizedNodes;
    BOOL v17 = 0;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v8) {
      uint64_t v18 = -1LL;
    }
    do
    {
      unint64_t var0 = internalizedNodes[v15].var0;
      if (((var0 & v18 & 0x8000000000000000LL) != 0LL) != v17) {
        -[VMUObjectGraph archiveDictionaryRepresentation:options:].cold.1();
      }
      unint64_t v20 = *((void *)&internalizedNodes[v15] + 1);
      unint64_t v21 = (v20 >> 5) & 0xFFFFFFFFFLL;
      if (v21) {
        BOOL v22 = (*((void *)&internalizedNodes[v15] + 1) & 0x20LL) == 0;
      }
      else {
        BOOL v22 = 0;
      }
      if (v22)
      {
        unsigned int v23 = 0;
        unint64_t v24 = (v20 >> 5) & 0xFFFFFFFFFLL;
        do
        {
          ++v23;
          if (v24 < 2) {
            break;
          }
          char v25 = v24;
          v24 >>= 1;
        }

        while ((v25 & 2) == 0);
      }

      else
      {
        unsigned int v23 = 0;
      }

      unsigned int v26 = 0;
      unint64_t v27 = (var0 & v18) - v13;
      if (v27 && (v27 & 1) == 0)
      {
        unsigned int v26 = 0;
        unint64_t v28 = v27;
        do
        {
          ++v26;
          if (v28 < 2) {
            break;
          }
          char v29 = v28;
          v28 >>= 1;
        }

        while ((v29 & 2) == 0);
      }

      if (v23 >= v26) {
        unsigned int v23 = v26;
      }
      if (v23 >= 0xF) {
        unsigned int v23 = 15;
      }
      if ((*((void *)&internalizedNodes[v15] + 1) & 7LL) == 1
        && (v20 >> 41) <= 0xFFF
        && (unint64_t v30 = v27 >> v23, v30 <= 0x3FF)
        && (unint64_t v31 = v21 >> v23, v31 <= 0x1F))
      {
        v11[v12++] = ((v31 & 0x1F) << 14) | (16 * (v30 & 0x3FF)) | (v20 >> 41 << 19) | v23;
        ++v14;
      }

      else
      {
        v11[v12] = HIDWORD(var0) | 0x80000000;
        v11[v12 + 1] = var0;
        unsigned int v32 = v12 + 3;
        v11[v12 + 2] = HIDWORD(v20);
        v12 += 4;
        v11[v32] = v20 & 0xFFFFFFE7;
      }

      ++v15;
      uint64_t v13 = var0 & v18;
      BOOL v17 = __OFSUB__(v15, v10);
    }

    while (v15 != v10);
  }

  else
  {
    objc_super v11 = 0LL;
    unsigned int v14 = 0;
    unsigned int v12 = 0;
  }

  +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  v11,  4LL * v12,  a4);
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v33 forKeyedSubscript:@"objectDetails"];

  if (v11) {
    free(v11);
  }
  v34 = (FILE **)MEMORY[0x1895F89D0];
  if (kVMUPrintArchivingTiming) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n",  v14,  v10 - v14,  (double)v14 * 100.0 / (double)v10);
  }
  if (-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"))
  {
    v35 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_referenceTable,  4LL * -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"),  a4);
    [v7 setObject:v35 forKeyedSubscript:@"referenceDetails"];
  }

  if (kVMUPrintArchivingTiming) {
    fprintf( *v34,  "[Reference Details] Total Compact and Large: %d\n\n",  -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"));
  }
  uint64_t referenceTableLargeCount = self->_referenceTableLargeCount;
  if ((_DWORD)referenceTableLargeCount)
  {
    +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_referenceTableLarge,  16 * referenceTableLargeCount,  a4);
    BOOL v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v37 forKeyedSubscript:@"referenceDetailsLarge"];
  }

  if (kVMUPrintArchivingTiming) {
    fprintf( *v34,  "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n",  -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize") - self->_referenceTableLargeCount,  self->_referenceTableLargeCount,  (double)(-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize") - self->_referenceTableLargeCount)
  }
    * 100.0
    / (double)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"));
  +[VMUDirectedGraph _archivedObject:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedObject:options:",  self->_knownClassInfos,  a4);
  int v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v38 forKeyedSubscript:@"archivedClassInfos"];

  if (v8)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0x8000000000000000];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v39 forKeyedSubscript:@"commonAddressBits"];
  }

  [v6 setObject:v7 forKeyedSubscript:@"objectGraphInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  id v4 = -[VMUDirectedGraph copyWithZone:](&v9, sel_copyWithZone_, a3);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __31__VMUObjectGraph_copyWithZone___block_invoke;
  v8[3] = &unk_189E006E0;
  v8[4] = self;
  uint64_t v5 = MEMORY[0x186E33044](v8);
  id v6 = (void *)*((void *)v4 + 21);
  *((void *)v4 + 21) = v5;

  objc_storeStrong((id *)v4 + 22, self);
  *((_DWORD *)v4 + 47) = -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  *((_DWORD *)v4 + 46) = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  -[VMUObjectGraph _modifyDerivativeGraphCount:](self, "_modifyDerivativeGraphCount:", 1LL);
  return v4;
}

void *__31__VMUObjectGraph_copyWithZone___block_invoke@<X0>( uint64_t a1@<X0>,  uint64_t a2@<X1>,  void *a3@<X8>)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result nodeDetails:a2];
  }
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  return result;
}

- (void)setIndexedClassInfos:(id)a3
{
  p_knownClassInfos = &self->_knownClassInfos;
  objc_storeStrong((id *)&self->_knownClassInfos, a3);
  id v6 = a3;
  +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:]( &OBJC_CLASS___VMUClassInfoMap,  "_destroyRetainedLinearArray:withCount:",  self->_classInfos,  self->_classInfosCount);
  v7 = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:]( *p_knownClassInfos,  "_retainedLinearArrayWithReturnedCount:",  &self->_classInfosCount);

  self->_classInfos = v7;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return -[VMUClassInfoMap hasClassInfosDerivedFromStackBacktraces]( self->_knownClassInfos,  "hasClassInfosDerivedFromStackBacktraces");
}

- (void)internalizeNodes
{
  if (self->_referenceGraphNodeNamespaceSize && (self->_nodeProvider || self->_referenceGraph))
  {
    if (!self->_knownClassInfos)
    {
      unint64_t v3 = (VMUClassInfoMap *)objc_opt_new();
      knownClassInfos = self->_knownClassInfos;
      self->_knownClassInfos = v3;
    }

    uint64_t v5 = (_VMUBlockNode *)calloc(-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize"), 0x10uLL);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke;
    v28[3] = &unk_189DFFBB8;
    v28[4] = self;
    v28[5] = v5;
    -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v28);
    +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:]( &OBJC_CLASS___VMUClassInfoMap,  "_destroyRetainedLinearArray:withCount:",  self->_classInfos,  self->_classInfosCount);
    self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:]( self->_knownClassInfos,  "_retainedLinearArrayWithReturnedCount:",  &self->_classInfosCount);
    internalizedNodes = self->_internalizedNodes;
    self->_internalizedNodes = v5;
    self->_unint64_t internalizedCount = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    if (self->_referenceGraphEdgeNamespaceSize)
    {
      BOOL v8 = (_VMUObjectGraphEdge *)calloc(-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"), 4uLL);
      uint64_t v24 = 0LL;
      char v25 = &v24;
      uint64_t v26 = 0x2020000000LL;
      uint64_t v27 = 0LL;
      uint64_t v20 = 0LL;
      unint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000LL;
      int v23 = 0;
      uint64_t v16 = 0LL;
      BOOL v17 = &v16;
      uint64_t v18 = 0x2020000000LL;
      int v19 = 0;
      v14[0] = v6;
      v14[1] = 3221225472LL;
      v14[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke_2;
      v14[3] = &unk_189E00708;
      v14[4] = &v24;
      v14[5] = &v20;
      v14[6] = &v16;
      v14[7] = v8;
      BOOL v15 = -[VMUDirectedGraph inverted](self, "inverted");
      -[VMUObjectGraph enumerateReferencesWithBlock:](self, "enumerateReferencesWithBlock:", v14);
      referenceTable = self->_referenceTable;
      if (referenceTable) {
        free(referenceTable);
      }
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLarge) {
        free(referenceTableLarge);
      }
      self->_referenceTable = v8;
      self->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)v25[3];
      self->_uint64_t referenceTableLargeCount = *((_DWORD *)v21 + 6);
      self->_referenceTableLargeCapacity = *((_DWORD *)v17 + 6);
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
    }

    referenceGraph = self->_referenceGraph;
    if (referenceGraph)
    {
      -[VMUObjectGraph _modifyDerivativeGraphCount:](referenceGraph, "_modifyDerivativeGraphCount:", 0xFFFFFFFFLL);
      unsigned int v12 = self->_referenceGraph;
      self->_referenceGraph = 0LL;
    }

    id nodeProvider = self->_nodeProvider;
    self->_id nodeProvider = 0LL;

    self->_referenceGraphEdgeNamespaceSize = 0;
    self->_referenceGraphNodeNamespaceSize = 0;
  }

uint64_t __34__VMUObjectGraph_internalizeNodes__block_invoke(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  unint64_t v3 = (void *)(*(void *)(a1 + 40) + 16LL * a2);
  uint64_t v5 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v6 = (v4 >> 60) & 7;
  unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFFLL;
  if (v7 >= 0xFFFFFFFFFLL) {
    unint64_t v7 = 0xFFFFFFFFFLL;
  }
  uint64_t v8 = v6 | (32 * v7);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) indexForClassInfo:a3[2]];
  *unint64_t v3 = v5;
  v3[1] = v8 | (result << 41);
  return result;
}

void *__34__VMUObjectGraph_internalizeNodes__block_invoke_2( void *result,  unsigned int a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(result[4] + 8LL);
  uint64_t v7 = *(void *)(result[5] + 8LL);
  uint64_t v8 = result[7];
  uint64_t v9 = *(void *)(result[6] + 8LL);
  int v10 = *(_DWORD *)(a5 + 16);
  if (*((_BYTE *)result + 64)) {
    unint64_t v11 = *(void *)(a5 + 8);
  }
  else {
    unint64_t v11 = *(void *)(a5 + 24);
  }
  if (*((_BYTE *)result + 64)) {
    unint64_t v12 = *(void *)(a5 + 24);
  }
  else {
    unint64_t v12 = *(void *)(a5 + 8);
  }
  if ((v12 & 3) != 0)
  {
LABEL_12:
    unsigned int v16 = *(_DWORD *)(v7 + 24);
    unsigned int v17 = *(_DWORD *)(v9 + 24);
    uint64_t result = *(void **)(v6 + 24);
    if (v16 >= v17)
    {
      unsigned int v18 = 2 * v17;
      if (2 * v17 <= 0x100) {
        unsigned int v18 = 256;
      }
      *(_DWORD *)(v9 + 24) = v18;
      uint64_t result = realloc(result, 16LL * v18);
      *(void *)(v6 + 24) = result;
      unsigned int v16 = *(_DWORD *)(v7 + 24);
    }

    int v19 = &result[2 * v16];
    unint64_t *v19 = v12 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v10 << 56);
    v19[1] = v11 & 0xFFFFFFFFFFFFFFLL;
    *(_DWORD *)(v8 + 4LL * a2) = (*(_DWORD *)(v7 + 24))++ | 0x80000000;
  }

  else
  {
    uint64_t v13 = 0LL;
    int v14 = -67108864 * (*(_DWORD *)(a5 + 16) & 0x1F);
    while (1)
    {
      int v15 = offset_settings[v13];
      if (v12 < 1 << (26 - v15) && v11 < 1 << v15) {
        break;
      }
      ++v13;
      v14 -= 0x1000000;
      if (v13 == 4) {
        goto LABEL_12;
      }
    }

    *(_DWORD *)(v8 + 4LL * a2) = ((((_DWORD)v12 << (v15 - 2)) | v11) & 0xFFFFFF) - v14;
  }

  return result;
}

- (BOOL)_commonHighAddressBit
{
  v2 = self;
  uint64_t internalizedCount = self->_internalizedCount;
  LOBYTE(self) = 1;
  if ((_DWORD)internalizedCount)
  {
    unint64_t v4 = (_DWORD *)v2->_internalizedNodes + 2;
    unint64_t v5 = -1LL;
    uint64_t v6 = internalizedCount;
    do
    {
      unsigned int v7 = *v4 & 7;
      BOOL v8 = v7 > 4;
      int v9 = (1 << v7) & 0x19;
      BOOL v10 = v8 || v9 == 0;
      if (v10 && v5 >= *((void *)v4 - 1)) {
        unint64_t v5 = *((void *)v4 - 1);
      }
      v4 += 4;
      --v6;
    }

    while (v6);
    if ((v5 & 0x8000000000000000LL) != 0)
    {
      internalizedNodes = v2->_internalizedNodes;
      do
      {
        internalizedNodes->var0 &= ~0x8000000000000000LL;
        ++internalizedNodes;
        --internalizedCount;
      }

      while (internalizedCount);
      LOBYTE(self) = 1;
    }

    else
    {
      return v5 >> 63;
    }
  }

  return (char)self;
}

- (void)setClassInfoIndex:(unsigned int)a3 forNode:(unsigned int)a4
{
  unint64_t v4 = &self->_internalizedNodes[a4];
  *((void *)v4 + 1) = *((void *)v4 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 sourceOffset:(unint64_t)a4 withScanType:(unsigned int)a5 toNode:(unsigned int)a6 destinationOffset:(unint64_t)a7
{
  unsigned __int8 v8 = a5;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  unsigned int v11 = -[VMUDirectedGraph addEdgeFromNode:toNode:](&v32, sel_addEdgeFromNode_toNode_, *(void *)&a3, *(void *)&a6);
  unsigned int v12 = v11;
  if (v11 != -1)
  {
    unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    uint64_t referenceTableCapacity = self->_referenceTableCapacity;
    unsigned __int8 v31 = v8;
    if (v11 >= referenceTableCapacity)
    {
      LODWORD(v16) = 2 * referenceTableCapacity;
      else {
        unint64_t v16 = v16;
      }
      unint64_t v17 = referenceTableCapacity + 0x80000;
      if (v17 >= v16) {
        unint64_t v18 = v16;
      }
      else {
        unint64_t v18 = v17;
      }
      referenceTable = (_VMUObjectGraphEdge *)realloc(self->_referenceTable, 4 * v18);
      self->_referenceTable = referenceTable;
      bzero(&referenceTable[self->_referenceTableCapacity], 4LL * (v18 - self->_referenceTableCapacity));
      self->_uint64_t referenceTableCapacity = v18;
    }

    else
    {
      referenceTable = self->_referenceTable;
    }

    unsigned int v19 = v12 - referenceGraphEdgeNamespaceSize;
    BOOL v20 = -[VMUDirectedGraph inverted](self, "inverted");
    if (v20) {
      unint64_t v21 = a4;
    }
    else {
      unint64_t v21 = a7;
    }
    if (!v20) {
      a7 = a4;
    }
    if ((a7 & 3) != 0)
    {
LABEL_21:
      unsigned int referenceTableLargeCount = self->_referenceTableLargeCount;
      unsigned int referenceTableLargeCapacity = self->_referenceTableLargeCapacity;
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLargeCount >= referenceTableLargeCapacity)
      {
        unsigned int v28 = 2 * referenceTableLargeCapacity;
        if (2 * referenceTableLargeCapacity <= 0x100) {
          unsigned int v28 = 256;
        }
        self->_unsigned int referenceTableLargeCapacity = v28;
        referenceTableLarge = (_VMUObjectGraphEdgeLarge *)realloc(referenceTableLarge, 16LL * v28);
        self->_referenceTableLarge = referenceTableLarge;
        unsigned int referenceTableLargeCount = self->_referenceTableLargeCount;
      }

      char v29 = (unint64_t *)((char *)referenceTableLarge + 16 * referenceTableLargeCount);
      *char v29 = a7 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v31 << 56);
      v29[1] = v21 & 0xFFFFFFFFFFFFFFLL;
      referenceTable[v19].var0.unint64_t var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)(self->_referenceTableLargeCount++ | 0x80000000);
    }

    else
    {
      uint64_t v22 = 0LL;
      int v23 = -67108864 * (v31 & 0x1F);
      while (1)
      {
        int v24 = offset_settings[v22];
        if (a7 < 1 << (26 - v24) && v21 < 1 << v24) {
          break;
        }
        ++v22;
        v23 -= 0x1000000;
        if (v22 == 4) {
          goto LABEL_21;
        }
      }

      referenceTable[v19].var0.unint64_t var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)(((((_DWORD)a7 << (v24 - 2)) | v21) & 0xFFFFFF)
                                                                        - v23);
    }
  }

  return v12;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  return -[VMUObjectGraph addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:]( self,  "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:",  *(void *)&a3,  0LL,  0LL,  *(void *)&a4,  0LL);
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  if (a3)
  {
    unsigned int v11 = (_VMUBlockNode *)malloc(16LL * v8);
    unsigned int v12 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    if (v12)
    {
      uint64_t v13 = 0LL;
      int v14 = a3;
      do
      {
        unsigned int v16 = *v14++;
        uint64_t v15 = v16;
        if (v16 != -1) {
          v11[v15] = self->_internalizedNodes[v13];
        }
        ++v13;
      }

      while (v12 != v13);
    }

    internalizedNodes = self->_internalizedNodes;
    self->_internalizedNodes = v11;
  }

  if (a5)
  {
    self->_uint64_t referenceTableCapacity = v6;
    unint64_t v18 = (_VMUObjectGraphEdge *)malloc(4LL * v6);
    unsigned int v19 = -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
    if (v19)
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        uint64_t v21 = a5[i];
        if ((_DWORD)v21 != -1) {
          v18[v21] = self->_referenceTable[i];
        }
      }
    }

    referenceTable = self->_referenceTable;
    if (referenceTable) {
      free(referenceTable);
    }
    self->_referenceTable = v18;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  -[VMUDirectedGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:]( &v23,  sel__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace_,  a3,  v8,  a5,  v6);
}

- (unsigned)scanTypeOfReferenceWithName:(unsigned int)a3
{
  $8D6A3E73ED2192107EDB56A8580BF2AB var0 = self->_referenceTable[a3].var0.var0;
  if ((*(_DWORD *)&var0 & 0x80000000) != 0) {
    return *((unsigned __int8 *)self->_referenceTableLarge + 16 * (*(unsigned int *)&var0 & 0x7FFFFFFF) + 7);
  }
  else {
    return *(unsigned int *)&var0 >> 26;
  }
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  unsigned int v5 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") + 1;
  do
  {
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v5 - 2);
    --v5;
  }

  while (!v10);
  if (!v5) {
    return -1;
  }
  unsigned int v6 = 0;
  while (1)
  {
    unsigned int v7 = v6 + (v5 >> 1);
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
    if (v9 == a3) {
      break;
    }
    if (v9 <= a3) {
      v5 += ~(v5 >> 1);
    }
    else {
      v5 >>= 1;
    }
    if (v9 <= a3) {
      unsigned int v6 = v7 + 1;
    }
    if (!v5) {
      return -1;
    }
  }

  return v7;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke;
    v9[3] = &unk_189E00730;
    v9[4] = self;
    id v10 = v4;
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
    unsigned int v6 = -[VMUDirectedGraph enumerateNodesWithBlock:](&v8, sel_enumerateNodesWithBlock_, v9);
  }

  else
  {
    unsigned int v6 = -[VMUDirectedGraph nodeCount](self, "nodeCount");
  }

  return v6;
}

uint64_t __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned int v7 = *(_DWORD *)(v5 + 184);
  uint64_t v8 = *(void *)(v5 + 128);
  unsigned int v9 = *(_DWORD *)(v5 + 136);
  uint64_t v10 = *(void *)(v5 + 144);
  id v11 = *(id *)(v5 + 168);
  unsigned int v12 = v11;
  unsigned int v13 = a2 - v7;
  if (a2 >= v7 || v11 == 0LL)
  {
    if (v13 >= v9)
    {
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
    }

    else
    {
      uint64_t v15 = (uint64_t *)(v8 + 16LL * v13);
      uint64_t v17 = *v15;
      unint64_t v16 = v15[1];
      uint64_t v20 = v17;
      uint64_t v21 = ((v16 >> 5) | (v16 << 60)) & 0x7000000FFFFFFFFFLL;
      if ((v16 & 7) == 1) {
        uint64_t v18 = *(void *)(v10 + ((v16 >> 38) & 0x3FFFFF8));
      }
      else {
        uint64_t v18 = 0LL;
      }
      uint64_t v22 = v18;
    }
  }

  else
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v11 + 2))(&v20, v11, a2);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t))(v6 + 16))(v6, a2, &v20, a3);
}

- (unsigned)enumerateObjectsOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke;
    v15[3] = &unk_189E00730;
    unsigned int v9 = v15;
    id v4 = &v16;
    id v10 = v7;
    v15[4] = self;
    id v16 = v10;
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  id v11 = (void *)MEMORY[0x186E33044](v9);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
  unsigned int v12 = -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]( &v14,  sel_enumerateMembersOfGroupNode_withBlock_,  v5,  v11);

  if (v8) {
  return v12;
  }
}

uint64_t __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v7 = a1 + 32;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v7 + 8);
  if (v5) {
    [v5 nodeDetails:a2];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t))(v6 + 16))(v6, a2, v9, a3);
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    unsigned int v7 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    unsigned __int8 v32 = 0;
    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
    uint64_t v8 = -[VMUDirectedGraph deadNodeMap](&v31, sel_deadNodeMap);
    if (v7)
    {
      uint64_t v9 = 0LL;
      unsigned int v10 = 0;
      uint64_t v27 = v8;
      while (1)
      {
        if (*(_DWORD *)a3 <= v9
          || (uint64_t v11 = (v9 >> 3) + 4LL,
              int v12 = 1 << (v9 & 7),
              (v12 & *((_BYTE *)a3 + v11)) == 0)
          || v8 && *v8 > v9 && (v12 & *((_BYTE *)v8 + v11)) != 0
          || (++v10, !v6))
        {
          int v24 = 0;
          goto LABEL_19;
        }

        id v13 = v6;
        unsigned int referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
        internalizedNodes = self->_internalizedNodes;
        unsigned int internalizedCount = self->_internalizedCount;
        classInfos = self->_classInfos;
        id v17 = self->_nodeProvider;
        uint64_t v18 = v17;
        unsigned int v19 = v9 - referenceGraphNodeNamespaceSize;
        if (v9 >= referenceGraphNodeNamespaceSize || v17 == 0LL)
        {
          if (v19 < internalizedCount)
          {
            uint64_t v21 = &internalizedNodes[v19];
            unint64_t var0 = v21->var0;
            unint64_t v22 = *((void *)v21 + 1);
            uint64_t v29 = ((v22 >> 5) | (v22 << 60)) & 0x7000000FFFFFFFFFLL;
            id v6 = v13;
            if ((v22 & 7) == 1) {
              uint64_t v23 = *(uint64_t *)((char *)classInfos + ((v22 >> 38) & 0x3FFFFF8));
            }
            else {
              uint64_t v23 = 0LL;
            }
            uint64_t v30 = v23;
            goto LABEL_26;
          }

          unint64_t var0 = 0LL;
          uint64_t v29 = 0LL;
          uint64_t v30 = 0LL;
        }

        else
        {
          (*((void (**)(unint64_t *__return_ptr, id, uint64_t))v17 + 2))(&var0, v17, v9);
        }

        id v6 = v13;
LABEL_26:

        (*((void (**)(id, uint64_t, unint64_t *, unsigned __int8 *))v6 + 2))(v6, v9, &var0, &v32);
        int v24 = v32;
        uint64_t v8 = v27;
LABEL_19:
        uint64_t v9 = (v9 + 1);
      }
    }
  }

  unsigned int v10 = 0;
LABEL_28:

  return v10;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = -[VMUDirectedGraph inverted](self, "inverted");
    unsigned int v6 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    unsigned int v7 = malloc(24LL * v6);
    uint64_t v8 = calloc(1uLL, ((v6 + 7) >> 3) + 4);
    _DWORD *v8 = v6;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke;
    v12[3] = &unk_189E00758;
    objc_super v14 = v7;
    uint64_t v15 = v8;
    v12[4] = self;
    id v13 = v4;
    BOOL v16 = v5;
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
    unsigned int v9 = -[VMUDirectedGraph enumerateEdgesWithBlock:](&v11, sel_enumerateEdgesWithBlock_, v12);
    free(v7);
    free(v8);
  }

  else
  {
    unsigned int v9 = -[VMUDirectedGraph edgeCount](self, "edgeCount");
  }

  return v9;
}

uint64_t __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 48);
  unsigned int v9 = *(unsigned int **)(a1 + 56);
  uint64_t v11 = v10 + 24LL * a3;
  if (!v9)
  {
    uint64_t v17 = v10 + 24LL * a4;
    goto LABEL_37;
  }

  int v12 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
  id v13 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
  objc_super v14 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
  uint64_t v15 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
  BOOL v16 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
  if (*v9 > a3 && ((*((unsigned __int8 *)v9 + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0)
  {
    uint64_t v17 = v10 + 24LL * a4;
  }

  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    unsigned int v19 = *(_DWORD *)(v18 + 184);
    uint64_t v20 = *(void *)(v18 + 128);
    unsigned int v21 = *(_DWORD *)(v18 + 136);
    uint64_t v22 = *(void *)(v18 + 144);
    id v23 = *(id *)(v18 + 168);
    int v24 = v23;
    unsigned int v25 = a3 - v19;
    if (a3 >= v19 || v23 == 0LL)
    {
      if (v25 >= v21)
      {
        __int128 v70 = 0uLL;
        *(void *)&__int128 v71 = 0LL;
      }

      else
      {
        uint64_t v27 = (void *)(v20 + 16LL * v25);
        *(void *)&__int128 v70 = *v27;
        unint64_t v28 = v27[1];
        *((void *)&v70 + 1) = ((v28 >> 5) | (v28 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v28 & 7) == 1) {
          uint64_t v29 = *(void *)(v22 + ((v28 >> 38) & 0x3FFFFF8));
        }
        else {
          uint64_t v29 = 0LL;
        }
        *(void *)&__int128 v71 = v29;
      }
    }

    else
    {
      (*((void (**)(__int128 *__return_ptr, id, uint64_t))v23 + 2))(&v70, v23, a3);
    }

    __int128 v30 = v70;
    *(void *)(v11 + 16) = v71;
    *(_OWORD *)uint64_t v11 = v30;
    unsigned int v9 = *(unsigned int **)(a1 + 56);
    unsigned int v31 = *v9;
    if (*v9 <= a3)
    {
      uint64_t v17 = *(void *)(a1 + 48) + 24LL * a4;
      BOOL v16 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
      uint64_t v15 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
      objc_super v14 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
      id v13 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
      int v12 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
      goto LABEL_21;
    }

    *((_BYTE *)v9 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
    unsigned int v9 = *(unsigned int **)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 48) + 24LL * a4;
    BOOL v16 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
    uint64_t v15 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
    objc_super v14 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
    id v13 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
    int v12 = &OBJC_IVAR___VMUProcessDescription__memoryCache;
    if (!v9) {
      goto LABEL_37;
    }
  }

  unsigned int v31 = *v9;
LABEL_21:
  uint64_t v68 = v11;
  uint64_t v32 = a2;
  uint64_t v33 = *(void *)(a1 + 32);
  unsigned int v34 = *(_DWORD *)(v33 + v12[518]);
  uint64_t v35 = *(void *)(v33 + v14[520]);
  unsigned int v36 = *(_DWORD *)(v33 + v15[521]);
  uint64_t v37 = *(void *)(v33 + v16[525]);
  id v38 = *(id *)(v33 + v13[517]);
  v39 = v38;
  unsigned int v40 = a4 - v34;
  if (a4 < v34 && v38 != 0LL)
  {
    (*((void (**)(__int128 *__return_ptr, id, uint64_t))v38 + 2))(&v70, v38, a4);
LABEL_32:
    a2 = v32;
    uint64_t v11 = v68;
    goto LABEL_35;
  }

  if (v40 >= v36)
  {
    __int128 v70 = 0uLL;
    *(void *)&__int128 v71 = 0LL;
    goto LABEL_32;
  }

  uint64_t v42 = v37;
  v43 = (void *)(v35 + 16LL * v40);
  *(void *)&__int128 v70 = *v43;
  unint64_t v44 = v43[1];
  *((void *)&v70 + 1) = ((v44 >> 5) | (v44 << 60)) & 0x7000000FFFFFFFFFLL;
  a2 = v32;
  uint64_t v11 = v68;
  if ((v44 & 7) == 1) {
    uint64_t v45 = *(void *)(v42 + ((v44 >> 38) & 0x3FFFFF8));
  }
  else {
    uint64_t v45 = 0LL;
  }
  *(void *)&__int128 v71 = v45;
LABEL_35:

  __int128 v46 = v70;
  *(void *)(v17 + 16) = v71;
  *(_OWORD *)uint64_t v17 = v46;
  unsigned int v47 = *(_DWORD **)(a1 + 56);
LABEL_37:
  *(void *)&__int128 v73 = v11;
  uint64_t v48 = *(void *)(a1 + 32);
  uint64_t v49 = *(void *)(a1 + 40);
  unsigned int v50 = *(_DWORD *)(v48 + 188);
  uint64_t v51 = *(void *)(v48 + 96);
  uint64_t v52 = *(void *)(v48 + 112);
  int v53 = *(unsigned __int8 *)(a1 + 64);
  id v54 = *(id *)(v48 + 176);
  uint64_t v55 = v54;
  if (a2 >= v50)
  {
    unint64_t v56 = *(unsigned int *)(v51 + 4LL * (a2 - v50));
    if ((v56 & 0x80000000) != 0)
    {
      uint64_t v64 = (unint64_t *)(v52 + 16 * (v56 & 0x7FFFFFFF));
      unint64_t v62 = *v64;
      unint64_t v63 = v64[1];
      if (v53) {
        unint64_t v65 = v63;
      }
      else {
        unint64_t v65 = v62;
      }
      if (v53) {
        unint64_t v63 = v62;
      }
      *((void *)&v73 + 1) = v65 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v74) = HIBYTE(v62);
      uint64_t v61 = v63 & 0xFFFFFFFFFFFFFFLL;
    }

    else
    {
      char v57 = offset_settings[(v56 >> 24) & 3];
      unsigned int v58 = 4 * ((v56 & 0xFFFFFF) >> v57);
      unsigned int v59 = v56 & 0xFFFFFF & ~(-1 << v57);
      if (v53) {
        uint64_t v60 = v59;
      }
      else {
        uint64_t v60 = v58;
      }
      *((void *)&v73 + 1) = v60;
      LODWORD(v74) = v56 >> 26;
      if (v53) {
        uint64_t v61 = v58;
      }
      else {
        uint64_t v61 = v59;
      }
    }

    *((void *)&v74 + 1) = v61;
  }

  else if (v54)
  {
    [v54 referenceInfoWithName:a2];
  }

  else
  {
    *((void *)&v73 + 1) = 0LL;
    __int128 v74 = 0uLL;
  }

  uint64_t v75 = v17;
  uint64_t v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(v49 + 16);
  __int128 v70 = v73;
  __int128 v71 = v74;
  uint64_t v72 = v17;
  return v66(v49, a2, a3, a4, &v70, a5);
}

- (unsigned)enumerateReferencesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6 && -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") > v4)
  {
    BOOL v7 = -[VMUDirectedGraph inverted](self, "inverted");
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke;
    v11[3] = &unk_189E00780;
    v11[4] = self;
    id v12 = v6;
    BOOL v13 = v7;
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
    unsigned int v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:]( &v10,  sel__internalEnumerateEdgesOfNode_withBlock_,  v4,  v11);
  }

  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

uint64_t __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke( uint64_t a1,  unsigned int a2,  uint64_t a3,  unsigned int a4,  unsigned int a5,  unsigned int a6,  uint64_t a7)
{
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(v9 + 184);
  uint64_t v11 = *(void *)(v9 + 128);
  unsigned int v12 = *(_DWORD *)(v9 + 136);
  uint64_t v13 = *(void *)(v9 + 144);
  id v14 = *(id *)(v9 + 168);
  uint64_t v15 = v14;
  unsigned int v16 = a3 - v10;
  if (a3 < v10 && v14 != 0LL)
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v14 + 2))(&v67, v14, a3);
LABEL_10:
    uint64_t v20 = a2;
    goto LABEL_13;
  }

  if (v16 >= v12)
  {
    uint64_t v67 = 0LL;
    uint64_t v68 = 0LL;
    uint64_t v69 = 0LL;
    goto LABEL_10;
  }

  uint64_t v18 = (uint64_t *)(v11 + 16LL * v16);
  uint64_t v67 = *v18;
  unint64_t v19 = v18[1];
  uint64_t v68 = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
  uint64_t v20 = a2;
  if ((v19 & 7) == 1) {
    uint64_t v21 = *(void *)(v13 + ((v19 >> 38) & 0x3FFFFF8));
  }
  else {
    uint64_t v21 = 0LL;
  }
  uint64_t v69 = v21;
LABEL_13:

  uint64_t v22 = *(void *)(a1 + 32);
  unsigned int v23 = *(_DWORD *)(v22 + 184);
  uint64_t v24 = *(void *)(v22 + 128);
  unsigned int v25 = *(_DWORD *)(v22 + 136);
  uint64_t v26 = *(void *)(v22 + 144);
  id v27 = *(id *)(v22 + 168);
  unint64_t v28 = v27;
  unsigned int v29 = a4 - v23;
  if (a4 >= v23 || v27 == 0LL)
  {
    if (v29 >= v25)
    {
      uint64_t v64 = 0LL;
      uint64_t v65 = 0LL;
      uint64_t v66 = 0LL;
    }

    else
    {
      unsigned int v31 = (uint64_t *)(v24 + 16LL * v29);
      uint64_t v64 = *v31;
      unint64_t v32 = v31[1];
      uint64_t v65 = ((v32 >> 5) | (v32 << 60)) & 0x7000000FFFFFFFFFLL;
      if ((v32 & 7) == 1) {
        uint64_t v33 = *(void *)(v26 + ((v32 >> 38) & 0x3FFFFF8));
      }
      else {
        uint64_t v33 = 0LL;
      }
      uint64_t v66 = v33;
    }
  }

  else
  {
    (*((void (**)(uint64_t *__return_ptr, id))v27 + 2))(&v64, v27);
  }

  *(void *)&__int128 v61 = &v67;
  uint64_t v34 = *(void *)(a1 + 32);
  uint64_t v35 = *(void *)(a1 + 40);
  unsigned int v36 = *(_DWORD *)(v34 + 188);
  uint64_t v37 = *(void *)(v34 + 96);
  uint64_t v38 = *(void *)(v34 + 112);
  int v39 = *(unsigned __int8 *)(a1 + 48);
  id v40 = *(id *)(v34 + 176);
  v41 = v40;
  if (v20 >= v36)
  {
    unint64_t v42 = *(unsigned int *)(v37 + 4LL * (v20 - v36));
    if ((v42 & 0x80000000) != 0)
    {
      unsigned int v50 = (unint64_t *)(v38 + 16 * (v42 & 0x7FFFFFFF));
      unint64_t v48 = *v50;
      unint64_t v49 = v50[1];
      if (v39) {
        unint64_t v51 = v49;
      }
      else {
        unint64_t v51 = v48;
      }
      if (v39) {
        unint64_t v49 = v48;
      }
      *((void *)&v61 + 1) = v51 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v62) = HIBYTE(v48);
      uint64_t v47 = v49 & 0xFFFFFFFFFFFFFFLL;
    }

    else
    {
      char v43 = offset_settings[(v42 >> 24) & 3];
      unsigned int v44 = 4 * ((v42 & 0xFFFFFF) >> v43);
      unsigned int v45 = v42 & 0xFFFFFF & ~(-1 << v43);
      if (v39) {
        uint64_t v46 = v45;
      }
      else {
        uint64_t v46 = v44;
      }
      *((void *)&v61 + 1) = v46;
      LODWORD(v62) = v42 >> 26;
      if (v39) {
        uint64_t v47 = v44;
      }
      else {
        uint64_t v47 = v45;
      }
    }

    *((void *)&v62 + 1) = v47;
  }

  else if (v40)
  {
    [v40 referenceInfoWithName:v20];
  }

  else
  {
    *((void *)&v61 + 1) = 0LL;
    __int128 v62 = 0uLL;
  }

  unint64_t v63 = &v64;
  uint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, void, void, _OWORD *, uint64_t))(v35 + 16);
  v59[0] = v61;
  v59[1] = v62;
  uint64_t v60 = &v64;
  return v52(v35, v20, a5, a6, v59, a7);
}

- (unsigned)nodeReferencedFromSourceNode:(unsigned int)a3 byIvarWithName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -1;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v4);
  [v13 firstFieldWithName:v6];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke;
  v10[3] = &unk_189E007A8;
  id v8 = v7;
  id v11 = v8;
  unsigned int v12 = &v14;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v4, v10);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

uint64_t __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  int a4,  uint64_t a5,  _BYTE *a6)
{
  uint64_t v10 = *(void *)(a5 + 8);
  uint64_t result = [*(id *)(a1 + 32) offset];
  if (v10 == result && !*(void *)(a5 + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a4;
    *a6 = 1;
  }

  return result;
}

- (unsigned)enumerateObjectsContainedInCollection:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  int v26 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  int v22 = -1;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke;
  v15[3] = &unk_189E007D0;
  int v17 = &v19;
  id v8 = v6;
  id v16 = v8;
  uint64_t v18 = &v23;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v4, v15);
  uint64_t v9 = *((unsigned int *)v20 + 6);
  if ((_DWORD)v9 != -1)
  {
    v12[0] = v7;
    v12[1] = 3221225472LL;
    v12[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2;
    v12[3] = &unk_189E007F8;
    id v13 = v8;
    uint64_t v14 = &v23;
    -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v9, v12);
  }

  unsigned int v10 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (*(void *)(a5 + 24)
    || ([*(id *)(*(void *)(a5 + 32) + 16) className],
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 hasSuffix:@"Storage"]),
        v10,
        !v11))
  {
    uint64_t v12 = a1[4];
    id v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v12 + 16);
    __int128 v14 = *(_OWORD *)(a5 + 16);
    v15[0] = *(_OWORD *)a5;
    v15[1] = v14;
    uint64_t v16 = *(void *)(a5 + 32);
    v13(v12, a2, a3, a4, v15);
    ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
  }

  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = a4;
  }

uint64_t __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v6 + 16);
  __int128 v8 = *(_OWORD *)(a5 + 16);
  v10[0] = *(_OWORD *)a5;
  v10[1] = v8;
  uint64_t v11 = *(void *)(a5 + 32);
  uint64_t result = v7(v6, a2, a3, a4, v10);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUObjectGraph *)self
{
  uint64_t v3 = v1;
  BOOL v5 = v2;
  unsigned int referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
  v7.unint64_t var0 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  if (LODWORD(v7.var0) < v3
    || ((unsigned int v8 = v3 - referenceGraphNodeNamespaceSize,
         unsigned int v9 = self->_referenceGraphNodeNamespaceSize,
         unsigned int internalizedCount = self->_internalizedCount,
         v3 >= v9)
      ? (BOOL v11 = v8 >= internalizedCount)
      : (BOOL v11 = 0),
        v11))
  {
    *BOOL v5 = 0LL;
    v5[1] = 0LL;
    v5[2] = 0LL;
  }

  else
  {
    id nodeProvider = self->_nodeProvider;
    internalizedNodes = self->_internalizedNodes;
    classInfos = self->_classInfos;
    uint64_t v15 = (void (**)(id, void))nodeProvider;
    unsigned int v16 = v3 - v9;
    if (v3 >= v9 || v15 == 0LL)
    {
      if (v16 >= internalizedCount)
      {
        *BOOL v5 = 0LL;
        v5[1] = 0LL;
        v5[2] = 0LL;
      }

      else
      {
        uint64_t v18 = &internalizedNodes[v16];
        unint64_t var0 = v18->var0;
        unint64_t v19 = *((void *)v18 + 1);
        *BOOL v5 = var0;
        v5[1] = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v19 & 7) == 1) {
          unint64_t v21 = *(unint64_t *)((char *)classInfos + ((v19 >> 38) & 0x3FFFFF8));
        }
        else {
          unint64_t v21 = 0LL;
        }
        v5[2] = v21;
      }
    }

    else
    {
      int v22 = v15;
      v15[2](v15, v3);
      uint64_t v15 = v22;
    }
  }

  return v7;
}

- ($3576753C8488139535C1C7A74D12E914)referenceInfoWithName:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  uint64_t result = ($3576753C8488139535C1C7A74D12E914 *)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  if (result < v4)
  {
    retstr->unint64_t var0 = 0LL;
    *(void *)&retstr->var1 = 0LL;
    retstr->var2 = 0LL;
    return result;
  }

  unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
  referenceGraph = self->_referenceGraph;
  referenceTable = self->_referenceTable;
  referenceTableLarge = self->_referenceTableLarge;
  BOOL v12 = -[VMUDirectedGraph inverted](self, "inverted");
  id v13 = referenceGraph;
  if (v4 >= referenceGraphEdgeNamespaceSize)
  {
    unint64_t var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
    if ((var0 & 0x80000000) != 0)
    {
      uint64_t v20 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
      unint64_t v22 = *v20;
      unint64_t v21 = v20[1];
      if (v12) {
        unint64_t v23 = v21;
      }
      else {
        unint64_t v23 = v22;
      }
      if (v12) {
        unint64_t v21 = v22;
      }
      retstr->unint64_t var0 = v23 & 0xFFFFFFFFFFFFFFLL;
      retstr->var1 = HIBYTE(v22);
      unint64_t v19 = v21 & 0xFFFFFFFFFFFFFFLL;
    }

    else
    {
      char v15 = offset_settings[(var0 >> 24) & 3];
      unsigned int v16 = 4 * ((var0 & 0xFFFFFF) >> v15);
      unsigned int v17 = var0 & 0xFFFFFF & ~(-1 << v15);
      if (v12) {
        unint64_t v18 = v17;
      }
      else {
        unint64_t v18 = v16;
      }
      retstr->unint64_t var0 = v18;
      retstr->var1 = var0 >> 26;
      if (v12) {
        unint64_t v19 = v16;
      }
      else {
        unint64_t v19 = v17;
      }
    }

    retstr->var2 = v19;
  }

  else
  {
    if (v13)
    {
      uint64_t v24 = v13;
      -[VMUObjectGraph referenceInfoWithName:](v13, "referenceInfoWithName:", v4);

      return result;
    }

    retstr->unint64_t var0 = 0LL;
    *(void *)&retstr->var1 = 0LL;
    retstr->var2 = 0LL;
  }

  return result;
}

- ($3576753C8488139535C1C7A74D12E914)_rawReferenceInfoWithName:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  uint64_t result = ($3576753C8488139535C1C7A74D12E914 *)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  if (result >= v4)
  {
    unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    referenceGraph = self->_referenceGraph;
    referenceTable = self->_referenceTable;
    referenceTableLarge = self->_referenceTableLarge;
    BOOL v12 = referenceGraph;
    if (v4 >= referenceGraphEdgeNamespaceSize)
    {
      unint64_t var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
      if ((var0 & 0x80000000) != 0)
      {
        unsigned int v17 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
        unint64_t v15 = *v17;
        unint64_t v16 = v17[1];
        retstr->unint64_t var0 = *v17 & 0xFFFFFFFFFFFFFFLL;
        retstr->var1 = HIBYTE(v15);
        retstr->var2 = v16 & 0xFFFFFFFFFFFFFFLL;
      }

      else
      {
        char v14 = offset_settings[(var0 >> 24) & 3];
        retstr->unint64_t var0 = 4 * ((var0 & 0xFFFFFF) >> v14);
        retstr->var1 = var0 >> 26;
        retstr->var2 = var0 & 0xFFFFFF & ~(-1 << v14);
      }
    }

    else if (v12)
    {
      unint64_t v18 = v12;
      -[VMUObjectGraph referenceInfoWithName:](v12, "referenceInfoWithName:", v4);
      BOOL v12 = v18;
    }

    else
    {
      retstr->unint64_t var0 = 0LL;
      *(void *)&retstr->var1 = 0LL;
      retstr->var2 = 0LL;
    }
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    *(void *)&retstr->var1 = 0LL;
    retstr->var2 = 0LL;
  }

  return result;
}

- (void)_modifyDerivativeGraphCount:(int)a3
{
  p_referencingCount = &self->_referencingCount;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_referencingCount);
  while (__stlxr(v4 + a3, (unsigned int *)p_referencingCount));
}

- (void)_refineTypesWithOverlay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
    -[VMUClassInfoMap _applyTypeOverlay:](self->_knownClassInfos, "_applyTypeOverlay:", v4);
    p_uint64_t classInfosCount = &self->_classInfosCount;
    +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:]( &OBJC_CLASS___VMUClassInfoMap,  "_destroyRetainedLinearArray:withCount:",  self->_classInfos,  self->_classInfosCount);
    self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:]( self->_knownClassInfos,  "_retainedLinearArrayWithReturnedCount:",  &self->_classInfosCount);
    uint64_t classInfosCount = self->_classInfosCount;
    if ((_DWORD)classInfosCount)
    {
      id v18 = v4;
      $61A80719B04F7407D3E47539F1B23CAA v7 = (char *)malloc(24 * classInfosCount);
      unint64_t v8 = 0LL;
      unsigned int v9 = v7 + 8;
      uint64_t v10 = MEMORY[0x1895F87A8];
      do
      {
        uint64_t v11 = [self->_classInfos[v8] instanceSize];
        int v12 = [self->_classInfos[v8] defaultScanType];
        if ((_DWORD)v11) {
          id v13 = calloc(v11, 1uLL);
        }
        else {
          id v13 = 0LL;
        }
        *((_DWORD *)v9 - 2) = v11;
        *((_DWORD *)v9 - 1) = v12;
        *unsigned int v9 = v13;
        v9[1] = 0LL;
        v9 += 3;
        id v14 = self->_classInfos[v8];
        v23[0] = v10;
        v23[1] = 3221225472LL;
        v23[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke;
        v23[3] = &unk_189E00820;
        int v24 = v8;
        int v25 = v11;
        v23[4] = self;
        v23[5] = v7;
        [v14 enumerateScanningLocationsForSize:v11 withBlock:v23];
        ++v8;
      }

      while (v8 < *p_classInfosCount);
      v22[0] = v10;
      v22[1] = 3221225472LL;
      v22[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2;
      v22[3] = &unk_189E00848;
      v22[4] = self;
      v22[5] = v7;
      v21.receiver = self;
      v21.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
      -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](&v21, sel__internalAccessRawEdgesWithBlock_, v22);
      v20[1] = 3221225472LL;
      v20[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3;
      v20[3] = &unk_189E00848;
      v20[4] = self;
      v20[5] = v7;
      v19.receiver = self;
      v19.super_class = (Class)&OBJC_CLASS___VMUObjectGraph;
      v20[0] = v10;
      -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](&v19, sel__internalAccessRawEdgesWithBlock_, v20);
      if (*p_classInfosCount)
      {
        unint64_t v15 = 0LL;
        unint64_t v16 = (void **)(v7 + 16);
        do
        {
          unsigned int v17 = *(v16 - 1);
          if (v17) {
            free(v17);
          }
          if (*v16) {
            free(*v16);
          }
          ++v15;
          v16 += 3;
        }

        while (v15 < *p_classInfosCount);
      }

      free(v7);
      id v4 = v18;
    }
  }
}

void __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke( uint64_t a1,  void *a2,  unsigned int a3,  char a4)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 24LL * *(unsigned int *)(a1 + 48) + 8) + a3) = a4;
  [a2 destinationLayout];
  $61A80719B04F7407D3E47539F1B23CAA v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v8 = a3;
    if (!*(void *)(*(void *)(a1 + 40) + 24LL * *(unsigned int *)(a1 + 48) + 16)) {
      *(void *)(*(void *)(a1 + 40) + 24LL * *(unsigned int *)(a1 + 48) + 16) = calloc( *(unsigned int *)(a1 + 52),  4uLL);
    }
    unsigned int v9 = *(void **)(*(void *)(a1 + 32) + 152LL);
    [a2 destinationLayout];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16) + 4 * v8) = [v9 indexForClassInfo:v10];
  }

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2( uint64_t result,  uint64_t a2,  unsigned int a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    id v4 = (unsigned int *)(a2 + 8);
    do
    {
      uint64_t v5 = *(v4 - 2);
      if (v5 <= 0xFFFFFFFA)
      {
        uint64_t v6 = *(void **)(result + 32);
        uint64_t v7 = v6[16];
        uint64_t v8 = *(void *)(v7 + 16LL * *(v4 - 1) + 8) >> 41;
        if ((*(void *)(v7 + 16LL * *(v4 - 1) + 8) & 7LL) == 1 && v8 != 0)
        {
          uint64_t v10 = *(void *)(result + 40);
          uint64_t v11 = *(void *)(v10 + 24LL * v8 + 16);
          if (v11)
          {
            unint64_t v12 = *(unsigned int *)(v6[12] + 4 * v5);
            if ((v12 & 0x80000000) != 0) {
              unint64_t v13 = *(void *)(v6[14] + 16 * (v12 & 0x7FFFFFFF)) & 0xFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v13 = 4 * ((v12 & 0xFFFFFF) >> offset_settings[(v12 >> 24) & 3]);
            }
            if (v13 < *(unsigned int *)(v10 + 24LL * v8))
            {
              uint64_t v14 = *(unsigned int *)(v11 + 4 * v13);
              if ((_DWORD)v14)
              {
                uint64_t v15 = v7 + 16LL * *v4;
                uint64_t v18 = *(void *)(v15 + 8);
                unint64_t v16 = (uint64_t *)(v15 + 8);
                uint64_t v17 = v18;
                if ((v18 & 0xFFFFFE0000000007LL) == 1) {
                  *unint64_t v16 = v17 | (v14 << 41);
                }
              }
            }
          }
        }
      }

      v4 += 3;
      --v3;
    }

    while (v3);
  }

  return result;
}

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3( uint64_t result,  uint64_t a2,  unsigned int a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    id v4 = (unsigned int *)(a2 + 4);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *(void **)(result + 32);
      uint64_t v7 = *(void *)(v6[16] + 16LL * *v4 + 8) >> 41;
      if ((*(void *)(v6[16] + 16LL * *v4 + 8) & 7LL) != 1 || v7 == 0) {
        goto LABEL_9;
      }
      uint64_t v9 = v6[12];
      uint64_t v10 = v6[14];
      unint64_t v11 = *(unsigned int *)(v9 + 4 * v5);
      if ((v11 & 0x80000000) != 0)
      {
        unint64_t v14 = *(void *)(v10 + 16 * (v11 & 0x7FFFFFFF));
        unint64_t v12 = v14 & 0xFFFFFFFFFFFFFFLL;
        unint64_t v13 = HIBYTE(v14);
      }

      else
      {
        unint64_t v12 = 4 * ((v11 & 0xFFFFFF) >> offset_settings[(v11 >> 24) & 3]);
        LODWORD(v13) = v11 >> 26;
      }

      if ((_DWORD)v13 != 1) {
        goto LABEL_9;
      }
      uint64_t v15 = *(void *)(result + 40);
      unint64_t v16 = (unsigned int *)(v15 + 24LL * v7);
      if (v12 >= *v16)
      {
        char v17 = *((_BYTE *)v16 + 4);
        if ((v11 & 0x80000000) == 0)
        {
LABEL_19:
          *(_DWORD *)(v9 + 4 * v5) = v11 & 0x83FFFFFF | ((v17 & 0x1F) << 26);
          goto LABEL_9;
        }
      }

      else
      {
        char v17 = *(_BYTE *)(*(void *)(v15 + 24LL * v7 + 8) + v12);
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_19;
        }
      }

      *(_BYTE *)(v10 + 16 * (v11 & 0x7FFFFFFF) + 7) = v17;
LABEL_9:
      v4 += 3;
      --v3;
    }

    while (v3);
  }

  return result;
}

- (void)_compareWithGraph:(id)a3 andMarkOnMatch:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  [v6 internalizeNodes];
  size_t v7 = 4LL * -[VMUDirectedGraph nodeCount](self, "nodeCount");
  uint64_t v8 = (unsigned int *)malloc(v7);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v8, &__pattern4, v7);
  size_t v9 = 4 * [v6 nodeCount];
  uint64_t v10 = (unsigned int *)malloc(v9);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v10, &__pattern4, v9);
  uint64_t __pattern4 = 0LL;
  p_pattern4 = &__pattern4;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 0;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke;
  v39[3] = &unk_189E00870;
  v39[4] = self;
  v39[5] = &__pattern4;
  v39[6] = v8;
  -[VMUDirectedGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v39);
  *((_DWORD *)p_pattern4 + 6) = 0;
  v35[0] = v11;
  v35[1] = 3221225472LL;
  v35[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2;
  v35[3] = &unk_189E00870;
  uint64_t v37 = &__pattern4;
  unint64_t v12 = (unint64_t **)v6;
  unsigned int v36 = v12;
  uint64_t v38 = v10;
  [v12 enumerateNodesWithBlock:v35];
  sortNodesInMap(&self->_internalizedNodes->var0, v8, -[VMUDirectedGraph nodeCount](self, "nodeCount"));
  sortNodesInMap(v12[16], v10, [v12 nodeCount]);
  unsigned int v13 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  unint64_t v14 = calloc(1uLL, ((v13 + 7) >> 3) + 4);
  unsigned int v15 = 0;
  uint64_t v16 = 0LL;
  *unint64_t v14 = v13;
LABEL_2:
  uint64_t v17 = v15;
  while (v16 < -[VMUDirectedGraph nodeCount](self, "nodeCount"))
  {
    internalizedNodes = self->_internalizedNodes;
    uint64_t v19 = v8[v16];
    unint64_t var0 = internalizedNodes[v19].var0;
    unint64_t v21 = v12[16][2 * v10[v17]];
    if (var0 <= v21)
    {
      if (var0 >= v21)
      {
        if (v19 >= self->_internalizedCount)
        {
          int v24 = 0LL;
          unint64_t v23 = 0LL;
          unint64_t var0 = 0LL;
        }

        else
        {
          unint64_t v22 = *((void *)&internalizedNodes[v19] + 1);
          unint64_t v23 = ((v22 >> 5) | (v22 << 60)) & 0x7000000FFFFFFFFFLL;
          if ((v22 & 7) == 1) {
            int v24 = *(id *)((char *)self->_classInfos + ((v22 >> 38) & 0x3FFFFF8));
          }
          else {
            int v24 = 0LL;
          }
        }

        uint64_t v26 = v10[v17];
        if (v26 >= *((_DWORD *)v12 + 34))
        {
          uint64_t v31 = 0LL;
          unint64_t v30 = 0LL;
          unint64_t v28 = 0LL;
          if (v24) {
            goto LABEL_24;
          }
        }

        else
        {
          id v27 = &v12[16][2 * v26];
          unint64_t v28 = *v27;
          unint64_t v29 = v27[1];
          unint64_t v30 = ((v29 >> 5) | (v29 << 60)) & 0x7000000FFFFFFFFFLL;
          if ((v29 & 7) == 1)
          {
            uint64_t v31 = *(unint64_t *)((char *)v12[18] + ((v29 >> 38) & 0x3FFFFF8));
            if (!v24) {
              goto LABEL_28;
            }
LABEL_24:
            int v32 = [v24 isEqual:v31];
LABEL_25:
            if (v32 != v4) {
              goto LABEL_33;
            }
LABEL_31:
            unint64_t v33 = v8[v16];
            goto LABEL_33;
          }

          uint64_t v31 = 0LL;
          if (v24) {
            goto LABEL_24;
          }
        }

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke(uint64_t a1, int a2)
{
  unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t result = [*(id *)(a1 + 32) nodeCount];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2(uint64_t a1, int a2)
{
  unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t result = [*(id *)(a1 + 32) nodeCount];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

- (void)createMapForMinusGraph:(id)a3
{
  return -[VMUObjectGraph _compareWithGraph:andMarkOnMatch:](self, "_compareWithGraph:andMarkOnMatch:", a3, 0LL);
}

- (void)createMapForIntersectGraph:(id)a3
{
  return -[VMUObjectGraph _compareWithGraph:andMarkOnMatch:](self, "_compareWithGraph:andMarkOnMatch:", a3, 1LL);
}

- (VMUClassInfoMap)indexedClassInfos
{
  return self->_knownClassInfos;
}

- (void).cxx_destruct
{
}

- (void)stronglyConnectedComponentSearch:(unsigned int)a3 withRecorder:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (v7)
  {
    size_t v8 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    size_t v9 = malloc(v8);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v9, __pattern4, v8);
    size_t v10 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    uint64_t v11 = malloc(v10);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v11, __pattern4, v10);
    size_t v12 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    unsigned int v13 = malloc(v12);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v13, __pattern4, v12);
    size_t v14 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    unsigned int v15 = malloc(v14);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v15, __pattern4, v14);
    __pattern4[0] = 0LL;
    __pattern4[1] = __pattern4;
    __pattern4[2] = 0x2020000000LL;
    int v32 = 0;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x2020000000LL;
    int v30 = 0;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke;
    v21[3] = &unk_189E00898;
    BOOL v25 = v13;
    uint64_t v26 = v9;
    id v27 = v11;
    unint64_t v23 = __pattern4;
    int v24 = v29;
    id v22 = v7;
    unint64_t v28 = v15;
    v20[0] = v16;
    v20[1] = 3221225472LL;
    v20[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2;
    v20[3] = &unk_189E008C0;
    v20[4] = self;
    v20[5] = v15;
    void v20[6] = v11;
    -[VMUDirectedGraph depthFirstSearch:nodeVisitBlock:edgeVisitBlock:]( self,  "depthFirstSearch:nodeVisitBlock:edgeVisitBlock:",  v4,  v21,  v20);
    free(v9);
    free(v11);
    free(v13);
    free(v15);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(__pattern4, 8);
  }

  else
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(@"-[%@ %s]: %s", v18, Name, "^block parameter must be non-nil.");
  }
}

uint64_t __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke( void *a1,  unsigned int a2,  int a3)
{
  char v3 = a3;
  uint64_t v5 = a2;
  if (a3)
  {
    uint64_t v6 = a1[9];
    if (*(_DWORD *)(v6 + 4LL * a2) == *(_DWORD *)(a1[8] + 4LL * a2))
    {
      uint64_t v7 = a1[7];
      unsigned int v8 = *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) - 1;
      for (uint64_t i = *(unsigned int *)(v7 + 4LL * v8); i != a2; uint64_t i = *(unsigned int *)(v7 + 4LL * v8))
      {
        *(_DWORD *)(v6 + 4 * i) = -1;
        --v8;
      }

      *(_DWORD *)(v6 + 4LL * a2) = -1;
      if (a3 == 4) {
        (*(void (**)(void))(a1[4] + 16LL))();
      }
      *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = v8;
    }

    uint64_t v10 = *(unsigned int *)(a1[10] + 4 * v5);
    if ((_DWORD)v10 != -1)
    {
      uint64_t v11 = a1[9];
      unsigned int v12 = *(_DWORD *)(v11 + 4 * v10);
      if (v12 >= *(_DWORD *)(v11 + 4 * v5)) {
        unsigned int v12 = *(_DWORD *)(v11 + 4 * v5);
      }
      *(_DWORD *)(v11 + 4 * v10) = v12;
    }
  }

  else
  {
    uint64_t v13 = *(void *)(a1[5] + 8LL);
    uint64_t v14 = *(unsigned int *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14 + 1;
    uint64_t v15 = a1[8];
    *(_DWORD *)(a1[7] + 4 * v14) = a2;
    uint64_t v16 = *(void *)(a1[6] + 8LL);
    LODWORD(v14) = *(_DWORD *)(v16 + 24);
    *(_DWORD *)(v16 + 24) = v14 + 1;
    *(_DWORD *)(a1[9] + 4LL * a2) = v14;
    *(_DWORD *)(v15 + 4LL * a2) = v14;
  }

  if (((v3 + 1) & 0xFE) != 0) {
    return 2LL;
  }
  else {
    return (v3 + 1);
  }
}

BOOL __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2( void *a1,  uint64_t a2,  unsigned int a3,  unsigned int a4,  _BYTE *a5)
{
  size_t v9 = (void *)a1[4];
  if (v9)
  {
    [v9 referenceInfoWithName:a2];
    LOBYTE(v9) = v13;
  }

  BOOL result = VMUIsOwningReference((char)v9);
  if (result)
  {
    if (*a5)
    {
      BOOL result = 0LL;
      *a5 = 4;
      uint64_t v11 = a1[6];
      unsigned int v12 = *(_DWORD *)(v11 + 4LL * a3);
      if (v12 >= *(_DWORD *)(v11 + 4LL * a4)) {
        unsigned int v12 = *(_DWORD *)(v11 + 4LL * a4);
      }
      *(_DWORD *)(v11 + 4LL * a3) = v12;
    }

    else
    {
      *(_DWORD *)(a1[5] + 4LL * a4) = a3;
      return 1LL;
    }
  }

  return result;
}

- (id)subgraphWithShortestPathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 0);
}

- (id)subgraphWithUniquePathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 1);
}

- (BOOL)isGroupNode:(unsigned int)a3
{
  return -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]( self,  "enumerateMembersOfGroupNode:withBlock:",  *(void *)&a3,  &__block_literal_global_20) != 0;
}

void __48__VMUObjectGraph_UsefulAlgorithms__isGroupNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 1;
}

- (BOOL)isRootNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!-[VMUDirectedGraph inverted](self, "inverted")) {
    -[VMUObjectGraph(UsefulAlgorithms) isRootNode:].cold.1();
  }
  uint64_t v8 = 0LL;
  size_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 1;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke;
  v7[3] = &unk_189E00928;
  v7[4] = self;
  v7[5] = &v8;
  -[VMUDirectedGraph enumerateEdgesOfNode:withBlock:](self, "enumerateEdgesOfNode:withBlock:", v3, v7);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke( uint64_t a1,  uint64_t a2,  int a3,  int a4,  _BYTE *a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = [(id)result referenceInfoWithName:a2];
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  if (a3 != a4)
  {
    uint64_t result = VMUIsOwningReference(v11);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *a5 = 1;
    }
  }

  return result;
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)archiveDictionaryRepresentation:options:.cold.1()
{
  __assert_rtn( "-[VMUObjectGraph archiveDictionaryRepresentation:options:]",  "VMUObjectGraph.m",  313,  "(address & (1ull << 63)) == 0");
}

@end