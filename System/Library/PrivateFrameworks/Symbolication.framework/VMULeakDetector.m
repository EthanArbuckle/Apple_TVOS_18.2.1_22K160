@interface VMULeakDetector
+ (id)_consolidatedRootLeakDescriptionsForTree:(id)a3;
+ (id)consolidatedRootLeakDescriptionsForTree:(id)a3;
+ (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5;
- (BOOL)checkAbandoned;
- (BOOL)checkTaskExistence;
- (BOOL)fcloseOutput;
- (BOOL)fullStacks;
- (BOOL)groupByType;
- (BOOL)referenceTreeShowRegionVirtualSize;
- (BOOL)showBinaryContents;
- (BOOL)showContext;
- (BOOL)showLeakedVMregions;
- (BOOL)showListOfLeaks;
- (BOOL)showOnlyVMregions;
- (BOOL)showRawClassNames;
- (BOOL)suppressOutput;
- (NSMutableArray)leakTreeRootsArray;
- (NSMutableString)outputString;
- (VMUDebugTimer)debugTimer;
- (VMULeakDetector)initWithTask:(unsigned int)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6;
- (VMULeakDetector)initWithVMUTask:(id)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6;
- (VMUProcessObjectGraph)graph;
- (VMUProcessObjectGraph)leakedGraph;
- (VMUStackLogReader)stackLogReader;
- (VMUTask)task;
- (VMUTaskMemoryScanner)scanner;
- (__sFILE)outputFile;
- (id)labelForNode:(unsigned int)a3 details:(id)a4 shortLabel:(id)a5;
- (id)nodeDescription:(unsigned int)a3;
- (id)nodeDescription:(unsigned int)a3 usingDetails:(id *)a4;
- (id)nodeTypeDescription:(unsigned int)a3 details:(id *)a4 mallocBySize:(id)a5;
- (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5;
- (id)scannerOrGraph;
- (unint64_t)abandonedSize;
- (unint64_t)allocationsSize;
- (unint64_t)leakedAllocationsSize;
- (unsigned)abandonedCount;
- (unsigned)allocationsCount;
- (unsigned)detectLeaksWithError:(id *)a3;
- (unsigned)doNormalLeakDetectionWithError:(id *)a3;
- (unsigned)leakedAllocationsCount;
- (unsigned)objectContentLevel;
- (void)abandoned;
- (void)buildLeakTree;
- (void)dealloc;
- (void)leakedNodes;
- (void)printContents:(void *)a3 size:(unint64_t)a4;
- (void)printLeak:(const char *)a3 node:(unsigned int)a4 details:(id)a5 region:(id)a6 stop:;
- (void)printLeakTree;
- (void)printout:(const char *)a3;
- (void)setAbandoned:(void *)a3;
- (void)setAbandonedCount:(unsigned int)a3;
- (void)setAbandonedSize:(unint64_t)a3;
- (void)setAllocationsCount:(unsigned int)a3;
- (void)setAllocationsSize:(unint64_t)a3;
- (void)setCheckAbandoned:(BOOL)a3;
- (void)setDebugTimer:(id)a3;
- (void)setFcloseOutput:(BOOL)a3;
- (void)setFullStacks:(BOOL)a3;
- (void)setGroupByType:(BOOL)a3;
- (void)setLeakTreeRootsArray:(id)a3;
- (void)setLeakedAllocationsCount:(unsigned int)a3;
- (void)setLeakedAllocationsSize:(unint64_t)a3;
- (void)setLeakedGraph:(id)a3;
- (void)setLeakedNodes:(void *)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setOutputFile:(__sFILE *)a3;
- (void)setOutputString:(id)a3;
- (void)setReferenceTreeShowRegionVirtualSize:(BOOL)a3;
- (void)setShowBinaryContents:(BOOL)a3;
- (void)setShowContext:(BOOL)a3;
- (void)setShowLeakedVMregions:(BOOL)a3;
- (void)setShowListOfLeaks:(BOOL)a3;
- (void)setShowOnlyVMregions:(BOOL)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setSuppressOutput:(BOOL)a3;
@end

@implementation VMULeakDetector

- (VMULeakDetector)initWithTask:(unsigned int)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", v8);
  v14 = -[VMULeakDetector initWithVMUTask:graph:scanner:stackLogReader:]( self,  "initWithVMUTask:graph:scanner:stackLogReader:",  v13,  v12,  v11,  v10);

  return v14;
}

- (VMULeakDetector)initWithVMUTask:(id)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VMULeakDetector;
  v15 = -[VMULeakDetector init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_scanner, a5);
    objc_storeStrong((id *)&v16->_stackLogReader, a6);
    objc_storeStrong((id *)&v16->_graph, a4);
    objc_storeStrong((id *)&v16->_task, a3);
    v16->_showBinaryContents = 0;
    *(_DWORD *)&v16->_showLeakedVMregions = 0;
    scanner = v16->_scanner;
    if (scanner) {
      int v18 = -[VMUTaskMemoryScanner objectContentLevel](scanner, "objectContentLevel");
    }
    else {
      int v18 = 3;
    }
    v16->_objectContentLevel = v18;
    *(_DWORD *)&v16->_checkAbandoned = 0;
    v16->_referenceTreeShowRegionVirtualSize = 0;
    v16->_max_contents_bytes = 128LL;
    v16->_numExcluded = 0;
    v16->_outputFile = (__sFILE *)*MEMORY[0x1895F89E0];
    outputString = v16->_outputString;
    v16->_outputString = 0LL;
  }

  return v16;
}

- (void)printout:(const char *)a3
{
  if (self->_outputString || self->_outputFile)
  {
    va_list v8 = (va_list)&v9;
    if (self->_outputString)
    {
      outputString = self->_outputString;
      [MEMORY[0x189NSStringTF8String:];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](outputString, "appendString:", v5);

      free(v7);
    }

    else
    {
      outputFile = self->_outputFile;
      if (outputFile) {
        vfprintf(outputFile, a3, v8);
      }
    }
  }

- (BOOL)checkTaskExistence
{
  return 1;
}

- (id)scannerOrGraph
{
  scanner = self->_scanner;
  if (!scanner) {
    scanner = self->_graph;
  }
  return scanner;
}

- (id)labelForNode:(unsigned int)a3 details:(id)a4 shortLabel:(id)a5
{
  int v5 = (int)a5;
  uint64_t v7 = *(void *)&a3;
  if (VMUGraphNodeType_IsVMRegion(*(void *)(a4.var0 + 8) >> 60)
    && (-[VMUTask isCore](self->_task, "isCore")
     || -[VMUTask taskPort](self->_task, "taskPort") && -[VMUTask taskPort](self->_task, "taskPort") != -1))
  {
    uint64_t v9 = *(void *)a4.var0 & ~*MEMORY[0x1895FD560];
    int v18 = 0;
    -[VMUTask memoryCache](self->_task, "memoryCache", 1LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = [v10 machVMPageRangeQueryWithAddress:v9 size:*MEMORY[0x1895FD590] dispositions:&v18 dispositionsCount:&v17];
    int v11 = v18 & 0x11;

    if ((_DWORD)v9 || v11 == 0) {
      return 0LL;
    }
  }

  -[VMULeakDetector scannerOrGraph](self, "scannerOrGraph");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5) {
    [v14 shortLabelForNode:v7];
  }
  else {
    [v14 labelForNode:v7];
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)printContents:(void *)a3 size:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v17 = "< content unavailable >\n";
    goto LABEL_24;
  }

  unint64_t max_contents_bytes = self->_max_contents_bytes;
  if (max_contents_bytes >= a4) {
    unint64_t v6 = a4;
  }
  else {
    unint64_t v6 = self->_max_contents_bytes;
  }
  if (v6 >= 4)
  {
    uint64_t v7 = (unsigned int *)a3;
    unint64_t v18 = a4;
    unint64_t v8 = v6 >> 2;
    do
    {
      -[VMULeakDetector printout:](self, "printout:", "\t");
      if (v8 >= 4) {
        uint64_t v9 = 4LL;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = v9;
      int v11 = v7;
      do
      {
        unsigned int v12 = *v11++;
        -[VMULeakDetector printout:](self, "printout:", "0x%08x ", v12);
        --v10;
      }

      while (v10);
      -[VMULeakDetector printout:](self, "printout:", "\t");
      else {
        uint64_t v13 = (4 * v9);
      }
      id v14 = v7;
      do
      {
        int v16 = *(unsigned __int8 *)v14;
        id v14 = (unsigned int *)((char *)v14 + 1);
        char v15 = v16;
        -[VMULeakDetector printout:](self, "printout:", "%c", v15);
        --v13;
      }

      while (v13);
      -[VMULeakDetector printout:](self, "printout:", "\n");
      v7 += v9;
      v8 -= v9;
    }

    while (v8);
    unint64_t max_contents_bytes = self->_max_contents_bytes;
    a4 = v18;
  }

  if (max_contents_bytes < a4)
  {
    uint64_t v17 = "\t...\n";
LABEL_24:
    -[VMULeakDetector printout:](self, "printout:", v17);
  }

- (void)printLeak:(const char *)a3 node:(unsigned int)a4 details:(id)a5 region:(id)a6 stop:
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v10 = (unsigned int *)a6;
  BOOL IsVMRegion = VMUGraphNodeType_IsVMRegion(*(void *)(a5.var0 + 8) >> 60);
  if ((self->_showLeakedVMregions || !IsVMRegion) && (!self->_showOnlyVMregions || IsVMRegion))
  {
    stackLogReader = self->_stackLogReader;
    if (stackLogReader)
    {
      if (-[VMUStackLogReader usesLiteMode](stackLogReader, "usesLiteMode"))
      {
        -[VMUProcessObjectGraph zoneNameForIndex:](self->_graph, "zoneNameForIndex:", v10[37]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v14 = 0LL;
      }

      id v16 = v14;
      else {
        uint64_t v17 = 0LL;
      }

      uint64_t v18 = 4LL * self->_fullStacks;
      v19 = self->_stackLogReader;
      __int128 v36 = *(_OWORD *)a5.var0;
      uint64_t v37 = *(void *)(a5.var0 + 16);
      -[VMUStackLogReader symbolicatedBacktraceForNode:nodeDetails:isLiteZone:options:]( v19,  "symbolicatedBacktraceForNode:nodeDetails:isLiteZone:options:",  v7,  &v36,  v17,  v18);
      char v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      char v15 = 0LL;
    }

    if (v15 == VMUBacktraceIsExcludedMarker)
    {
      ++self->_numExcluded;
      goto LABEL_38;
    }

    -[VMULeakDetector printout:]( self,  "printout:",  "%s: %#llx  size=%llu  ",  a3,  *(void *)a5.var0,  *(void *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
    if (VMUGraphNodeType_IsVMRegion(*(void *)(a5.var0 + 8) >> 60))
    {
      [v10 type];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 length];

      if (v21)
      {
        v22 = (void *)NSString;
        [v10 descriptionWithOptions:513 maximumLength:0];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 stringWithFormat:@"VM: %@", v23];
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v24 = @"VM: unknown region type";
      }

      v27 = v24;
      -[VMULeakDetector printout:](self, "printout:", "%s", -[__CFString UTF8String](v27, "UTF8String"));
    }

    else
    {
      id v25 = -[VMUProcessObjectGraph zoneNameForIndex:](self->_graph, "zoneNameForIndex:", v10[37]);
      -[VMULeakDetector printout:](self, "printout:", "zone: %s", [v25 UTF8String]);

      v26 = *(void **)(a5.var0 + 16);
      if (!v26)
      {
LABEL_29:
        if ((self->_objectContentLevel & 0xFFFFFFFE) == 2)
        {
          __int128 v36 = *(_OWORD *)a5.var0;
          uint64_t v37 = *(void *)(a5.var0 + 16);
          v32 = -[VMULeakDetector labelForNode:details:shortLabel:](self, "labelForNode:details:shortLabel:", v7, &v36, 0LL);
          v33 = v32;
          if (v32)
          {
            -[VMULeakDetector printout:]( self, "printout:", " %s\n", [v32 UTF8String]);
          }

          else
          {
            BOOL showBinaryContents = self->_showBinaryContents;
            -[VMULeakDetector printout:](self, "printout:", "\n");
            if (showBinaryContents)
            {
              v35 = -[VMULeakDetector scannerOrGraph](self, "scannerOrGraph");
              -[VMULeakDetector printContents:size:]( self,  "printContents:size:",  [v35 contentForNode:v7],  *(void *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
            }
          }

          if (!v15) {
            goto LABEL_38;
          }
        }

        else
        {
          -[VMULeakDetector printout:](self, "printout:", "\n");
          if (!v15) {
            goto LABEL_38;
          }
        }

        -[VMULeakDetector printout:]( self, "printout:", "\tCall stack: %s\n", -[__CFString UTF8String](v15, "UTF8String"));
        -[VMULeakDetector printout:](self, "printout:", "\n");
LABEL_38:

        goto LABEL_39;
      }

      if (self->_showRawClassNames) {
        [v26 className];
      }
      else {
        [v26 displayName];
      }
      v27 = (__CFString *) objc_claimAutoreleasedReturnValue();
      uint64_t v28 = -[__CFString UTF8String](v27, "UTF8String");
      id v29 = [*(id *)(a5.var0 + 16) typeName];
      uint64_t v30 = [v29 UTF8String];
      id v31 = [*(id *)(a5.var0 + 16) binaryName];
      -[VMULeakDetector printout:](self, "printout:", "   %s  %s  %s", v28, v30, [v31 UTF8String]);
    }

    goto LABEL_29;
  }

- (id)nodeTypeDescription:(unsigned int)a3 details:(id *)a4 mallocBySize:(id)a5
{
  if (a4)
  {
    unint64_t v7 = a4[1].var0 >> 60;
    if ((_DWORD)v7 == 1)
    {
      int v8 = (int)a5;
      var0 = (void *)a4[2].var0;
      if (self->_showRawClassNames) {
        [var0 className:a3];
      }
      else {
      uint64_t v10 = [var0 displayName:a3];
      }
      if (v10) {
        int v11 = (__CFString *)v10;
      }
      else {
        int v11 = @"malloc-block";
      }
      if (!v10 && v8)
      {
        [MEMORY[0x1896NSStringrmat:@"malloc<%s>",  VMUMemorySizeString(a4[1].var0 & 0xFFFFFFFFFFFFFFFLL)];
        int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      uint64_t v12 = *(void *)&a3;
      if (VMUGraphNodeType_IsVMRegion(v7))
      {
        -[VMUProcessObjectGraph vmuVMRegionForNode:](self->_graph, "vmuVMRegionForNode:", v12);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v14 = (void *)NSString;
        [v13 type];
        char v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"VM: %@", v15];
        int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        unint64_t v16 = a4[1].var0 >> 60;
        uint64_t v17 = @"thread";
        if ((_DWORD)v16 != 4) {
          uint64_t v17 = 0LL;
        }
        if ((_DWORD)v16 == 3) {
          int v11 = @"kernel";
        }
        else {
          int v11 = (__CFString *)v17;
        }
      }
    }
  }

  else
  {
    int v11 = 0LL;
  }

  return v11;
}

- (id)nodeDescription:(unsigned int)a3 usingDetails:(id *)a4
{
  if (self->_groupByType) {
    -[VMULeakDetector nodeTypeDescription:details:mallocBySize:]( self,  "nodeTypeDescription:details:mallocBySize:",  *(void *)&a3,  a4,  1LL);
  }
  else {
    -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:]( self->_graph,  "nodeDescription:withOffset:showLabel:",  *(void *)&a3,  0LL,  (self->_objectContentLevel & 0xFFFFFFFE) == 2);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  graph = self->_graph;
  if (graph) {
    -[VMUObjectGraph nodeDetails:](graph, "nodeDetails:", *(void *)&a3);
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  -[VMULeakDetector nodeDescription:usingDetails:](self, "nodeDescription:usingDetails:", v3, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  int v8 = (void *)objc_opt_class();
  __int128 v9 = *(_OWORD *)&a3->var1.var1;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v9;
  var2 = a3->var2;
  [v8 referenceDescription:v12 dstDescription:v7 is64bit:v5];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  int v8 = (void *)*((void *)a3->var0 + 2);
  uint64_t v9 = 3LL;
  if (v5) {
    uint64_t v9 = 7LL;
  }
  if ((a3->var1.var0 & v9) != 0 && *((void *)a3->var0 + 1) >> 60 != 3LL)
  {
    [NSString stringWithFormat:@"unaligned +%lld:  --> %@", a3->var1.var0, v7];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }

  else
  {
    [*((id *)a3->var2 + 2) displayName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v10 hasSuffix:@"Storage"]);

    if ((v11 & 1) == 0)
    {
      [v8 fieldAtOrBeforeOffset:LODWORD(a3->var1.var0)];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 ivarName];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t var0 = a3->var1.var0;
        unsigned int v16 = [v13 offset];
        __str[0] = 0;
        if (var0 != v16) {
          snprintf(__str, 0x20uLL, " + %llu", var0 - v16);
        }
        uint64_t v17 = VMUScanTypeKeywordDescription([v13 scanType]);
        if (v17 && *v17)
        {
          [MEMORY[0x189NSStringormat:@"%s " v17];
          uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v18 = &stru_189E010C8;
        }

        uint64_t v21 = [NSString stringWithFormat:@"%@%@%s --> %@", v18, v14, __str, v7];

        id v7 = (id)v21;
      }
    }

    return v7;
  }

- (void)buildLeakTree
{
  uint64_t v164 = *MEMORY[0x1895F89C0];
  v2 = -[VMUDirectedGraph subgraphWithMarkedNodes:](self->_graph, "subgraphWithMarkedNodes:", self->_leakedNodes);
  -[VMULeakDetector setLeakedGraph:](self, "setLeakedGraph:", v2);

  v120 = (id *)calloc(-[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize"), 8uLL);
  v112 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( objc_alloc(&OBJC_CLASS___VMUCallTreeRootWithBacktrace),  "initWithSymbolicator:sampler:options:",  0LL,  0LL,  0LL,  0LL);
  uint64_t v159 = 0LL;
  v160 = &v159;
  uint64_t v161 = 0x2020000000LL;
  int v162 = 0;
  size_t v3 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  LODWORD(__pattern4._pi) = -1;
  v111 = (unsigned int *)malloc(v3);
  memset_pattern4(v111, &__pattern4, v3);
  LODWORD(v3) = -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  v4 = calloc(1uLL, ((v3 + 7) >> 3) + 4);
  _DWORD *v4 = v3;
  v158[0] = MEMORY[0x1895F87A8];
  v158[1] = 3221225472LL;
  v158[2] = __32__VMULeakDetector_buildLeakTree__block_invoke;
  v158[3] = &unk_189DFDA18;
  v158[5] = v111;
  v158[4] = &v159;
  v110 = v4;
  v158[6] = v4;
  BOOL v5 = (void *)MEMORY[0x186E33044](v158);
  unint64_t v6 = self;
  id v7 = (void *)-[VMUProcessObjectGraph copy](self->_leakedGraph, "copy");
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v9 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v9)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v11 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      unint64_t v6 = self;
      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:]( v6->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "identifying strongly-connected-components (cycles) in the graph");
  uint64_t v12 = v6->_debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v14 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "buildLeakTree",  "identifying strongly-connected-components (cycles) in the graph",  (uint8_t *)&__pattern4,  2u);
    }

    unint64_t v6 = self;
  }

  leakedGraph = v6->_leakedGraph;
  v157[0] = MEMORY[0x1895F87A8];
  v157[1] = 3221225472LL;
  v157[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_52;
  v157[3] = &unk_189DFDA40;
  v157[4] = v6;
  -[VMUObjectGraph stronglyConnectedComponentSearch:withRecorder:]( leakedGraph,  "stronglyConnectedComponentSearch:withRecorder:",  0xFFFFFFFFLL,  v157);
  unsigned int v16 = v6->_debugTimer;
  if (v16)
  {
    uint64_t v17 = -[VMUDebugTimer signpostID](v16, "signpostID");
    unsigned int v16 = v6->_debugTimer;
    if (v17)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v19 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      unint64_t v6 = self;
      unsigned int v16 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v16, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:]( v6->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "identifying root leaks and cycles");
  v20 = v6->_debugTimer;
  if (v20)
  {
    -[VMUDebugTimer logHandle](v20, "logHandle");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v22 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v22,  "buildLeakTree",  "identifying root leaks and cycles",  (uint8_t *)&__pattern4,  2u);
    }

    unint64_t v6 = self;
  }

  v113 = v6->_stackLogReader;
  if (v113)
  {
    [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:256];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUStackLogReader inspectingLiveProcess](v113, "inspectingLiveProcess")
      && -[VMUStackLogReader usesLiteMode](v113, "usesLiteMode"))
    {
      for (uint64_t i = 0; i < [v7 zoneCount]; uint64_t i = (i + 1))
      {
        [v7 zoneNameForIndex:i];
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        if ([v25 hasPrefix:@"MallocStackLoggingLiteZone"])
        {
          char v26 = [v25 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

          if ((v26 & 1) == 0)
          {

            goto LABEL_35;
          }
        }

        else
        {
        }
      }
    }
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  LODWORD(i) = -1;
LABEL_35:
  unsigned int v27 = -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  v119 = calloc(1uLL, ((v27 + 7) >> 3) + 4);
  _DWORD *v119 = v27;
  -[VMUDirectedGraph invertedGraph](self->_leakedGraph, "invertedGraph");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = (void *)objc_opt_new();
  v147[0] = MEMORY[0x1895F87A8];
  v147[1] = 3221225472LL;
  v147[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_57;
  v147[3] = &unk_189DFDA90;
  id v30 = v28;
  id v148 = v30;
  v149 = self;
  id v105 = v29;
  id v150 = v105;
  v155 = v119;
  id v109 = v5;
  id v154 = v109;
  v116 = v113;
  v151 = v116;
  id v115 = v7;
  id v152 = v115;
  int v156 = i;
  table = v23;
  v153 = table;
  [v30 enumerateObjectsWithBlock:v147];

  if (v113
    && (!-[VMUStackLogReader usesLiteMode](v116, "usesLiteMode", v105)
     || (-[VMUStackLogReader inspectingLiveProcess](v116, "inspectingLiveProcess") & 1) == 0))
  {
    id v31 = self->_debugTimer;
    if (v31)
    {
      uint64_t v32 = -[VMUDebugTimer signpostID](v31, "signpostID");
      id v31 = self->_debugTimer;
      if (v32)
      {
        -[VMUDebugTimer logHandle](v31, "logHandle");
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v34 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v33,  OS_SIGNPOST_INTERVAL_END,  v34,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
        }

        id v31 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v31, "endEvent:", "buildLeakTree");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "enumerate stack logs to populate rootLeakAddressToStackIDMap");
    v35 = self->_debugTimer;
    if (v35)
    {
      -[VMUDebugTimer logHandle](v35, "logHandle");
      __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v37 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  v37,  "buildLeakTree",  "enumerate stack logs to populate rootLeakAddressToStackIDMap",  (uint8_t *)&__pattern4,  2u);
      }
    }

    v145[0] = MEMORY[0x1895F87A8];
    v145[1] = 3221225472LL;
    v145[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_66;
    v145[3] = &unk_189DFDAB8;
    v146 = table;
    -[VMUStackLogReader enumerateMSLRecordsAndPayloads:](v116, "enumerateMSLRecordsAndPayloads:", v145);
  }

  v38 = (void *)objc_opt_new();
  -[VMULeakDetector setLeakTreeRootsArray:](self, "setLeakTreeRootsArray:", v38);

  if (v113)
  {
    v39 = self;
    v40 = self->_debugTimer;
    if (v40)
    {
      uint64_t v41 = -[VMUDebugTimer signpostID](v40, "signpostID");
      v40 = self->_debugTimer;
      if (v41)
      {
        -[VMUDebugTimer logHandle](v40, "logHandle");
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v43 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v42,  OS_SIGNPOST_INTERVAL_END,  v43,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
        }

        v39 = self;
        v40 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v40, "endEvent:", "buildLeakTree", v105);
    -[VMUDebugTimer startWithCategory:message:]( v39->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map");
    v44 = v39->_debugTimer;
    if (v44)
    {
      -[VMUDebugTimer logHandle](v44, "logHandle");
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v46 = -[VMUDebugTimer signpostID](v39->_debugTimer, "signpostID");
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v45,  OS_SIGNPOST_INTERVAL_BEGIN,  v46,  "buildLeakTree",  "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map",  (uint8_t *)&__pattern4,  2u);
      }
    }

    v118 = (id *)calloc([v115 nodeNamespaceSize], 8uLL);
    [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:0];
    v117 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    NSEnumerateMapTable(&__pattern4, table);
    while (NSNextMapEnumeratorPair(&__pattern4, &key, &value))
    {
      NSMapGet(v117, value);
      v47 = (VMUCallTreeRootWithBacktrace *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v48 = (void *)MEMORY[0x186E32E40]();
        v47 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( objc_alloc(&OBJC_CLASS___VMUCallTreeRootWithBacktrace),  "initWithSymbolicator:sampler:options:",  0LL,  0LL,  0LL,  0LL);
        if (self->_fullStacks) {
          uint64_t v49 = 68LL;
        }
        else {
          uint64_t v49 = 64LL;
        }
        v50 = -[VMUStackLogReader symbolicatedBacktraceForStackID:options:]( v116,  "symbolicatedBacktraceForStackID:options:",  value,  v49);
        -[VMUCallTreeRootWithBacktrace setBacktraceString:](v47, "setBacktraceString:", v50);

        -[NSMutableArray addObject:](self->_leakTreeRootsArray, "addObject:", v47);
        NSMapInsert(v117, value, v47);
        objc_autoreleasePoolPop(v48);
      }
    }

    NSEndMapTableEnumeration(&__pattern4);
  }

  else
  {
    v117 = 0LL;
    v118 = 0LL;
  }

  v51 = self;
  v114 = kVMURootRetainCycle[0];
  uint64_t v108 = -[__CFString length](v114, "length");
  v52 = self->_debugTimer;
  if (v52)
  {
    uint64_t v53 = -[VMUDebugTimer signpostID](v52, "signpostID");
    v52 = self->_debugTimer;
    if (v53)
    {
      -[VMUDebugTimer logHandle](v52, "logHandle");
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v55 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v54,  OS_SIGNPOST_INTERVAL_END,  v55,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      v51 = self;
      v52 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v52, "endEvent:", "buildLeakTree", v105);
  -[VMUDebugTimer startWithCategory:message:]( v51->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "building call tree from references");
  v56 = v51->_debugTimer;
  if (v56)
  {
    -[VMUDebugTimer logHandle](v56, "logHandle");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v58 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v57,  OS_SIGNPOST_INTERVAL_BEGIN,  v58,  "buildLeakTree",  "building call tree from references",  (uint8_t *)&__pattern4,  2u);
    }
  }

  if (*((_DWORD *)v160 + 6))
  {
    int v59 = 0;
    do
    {
      v60 = (void *)MEMORY[0x186E32E40]();
      unint64_t v61 = v111[v59];
      v62 = v112;
      id v63 = v120[v61];
      if (v63)
      {
        v64 = v63;
        if (v113)
        {
          v65 = (VMUCallTreeRootWithBacktrace *)v118[v61];

          v62 = v65;
        }
      }

      else
      {
        v66 = self;
        if (v115) {
          [v115 nodeDetails:v61];
        }
        else {
          memset(&__pattern4, 0, sizeof(__pattern4));
        }
        if (-[VMUDirectedGraph parentGroupForNode:](self->_leakedGraph, "parentGroupForNode:", v61) == -1) {
          v67 = @"ROOT LEAK: ";
        }
        else {
          v67 = v114;
        }
        if (v113)
        {
          v68 = NSMapGet(table, (const void *)__pattern4._pi);
          if (v68)
          {
            uint64_t v69 = NSMapGet(v117, v68);

            v118[v61] = (id)v69;
            v62 = (VMUCallTreeRootWithBacktrace *)v69;
            v66 = self;
          }
        }
        v70 = -[VMULeakDetector nodeDescription:usingDetails:](v66, "nodeDescription:usingDetails:", v61, &__pattern4);
        v71 = -[__CFString stringByAppendingString:](v67, "stringByAppendingString:", v70);
        if (self->_groupByType) {
          -[VMUCallTreeRoot addChildWithName:address:count:numBytes:toNode:]( v62,  "addChildWithName:address:count:numBytes:toNode:",  v71,  0LL,  1LL,  __pattern4._si & 0xFFFFFFFFFFFFFFFLL,  v62);
        }
        else {
          -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:]( v62,  "addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:",  v71,  __pattern4._pi,  1LL,  __pattern4._si & 0xFFFFFFFFFFFFFFFLL,  v62,  0LL);
        }
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v120[v61] = v64;
      }

      if (*v119 > v61
        && ((*((unsigned __int8 *)v119 + (v61 >> 3) + 4) >> (v61 & 7)) & 1) != 0
        && (id v72 = v64) != 0LL)
      {
        v73 = v72;
        v74 = 0LL;
        do
        {
          [v73 parent];
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (v75)
          {
            [v73 parent];
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            [v76 parent];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v78 = v77 == 0LL;

            if (v78)
            {
              uint64_t v79 = [v73 name];

              v74 = (void *)v79;
            }
          }

          uint64_t v80 = [v73 parent];

          v73 = (void *)v80;
        }

        while (v80);
      }

      else
      {
        v74 = 0LL;
      }

      __pattern4._puint64_t i = 0LL;
      __pattern4._suint64_t i = (NSUInteger)&__pattern4;
      __pattern4._bs = (void *)0x2020000000LL;
      char v142 = 0;
      v126[0] = MEMORY[0x1895F87A8];
      v126[1] = 3221225472LL;
      v126[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_73;
      v126[3] = &unk_189DFDAE0;
      v136 = v120;
      id v81 = v74;
      id v127 = v81;
      p_pattern4 = &__pattern4;
      uint64_t v137 = v108;
      id v82 = v115;
      id v128 = v82;
      v83 = v62;
      v129 = v83;
      id v84 = v64;
      id v130 = v84;
      v138 = v110;
      id v134 = v109;
      v131 = self;
      v139 = v119;
      v132 = v114;
      v133 = v116;
      v140 = v118;
      [v82 enumerateReferencesOfNode:v61 withBlock:v126];

      _Block_object_dispose(&__pattern4, 8);
      objc_autoreleasePoolPop(v60);
      ++v59;
    }

    while (v59 != *((_DWORD *)v160 + 6));
  }

  v85 = self->_debugTimer;
  if (v85)
  {
    uint64_t v86 = -[VMUDebugTimer signpostID](v85, "signpostID");
    v85 = self->_debugTimer;
    if (v86)
    {
      -[VMUDebugTimer logHandle](v85, "logHandle");
      v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v88 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v87,  OS_SIGNPOST_INTERVAL_END,  v88,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      v85 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v85, "endEvent:", "buildLeakTree");
  free(v111);
  free(v110);
  free(v119);
  free(v120);
  free(v118);

  v89 = self;
  if (-[VMUCallTreeNode numChildren](v112, "numChildren")) {
    -[NSMutableArray addObject:](self->_leakTreeRootsArray, "addObject:", v112);
  }
  v90 = self->_debugTimer;
  if (v90)
  {
    uint64_t v91 = -[VMUDebugTimer signpostID](v90, "signpostID");
    v90 = self->_debugTimer;
    if (v91)
    {
      -[VMUDebugTimer logHandle](v90, "logHandle");
      v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v93 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v92,  OS_SIGNPOST_INTERVAL_END,  v93,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      v89 = self;
      v90 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v90, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:]( v89->_debugTimer,  "startWithCategory:message:",  "buildLeakTree",  "addChildCountsIntoNode");
  v94 = v89->_debugTimer;
  if (v94)
  {
    -[VMUDebugTimer logHandle](v94, "logHandle");
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v96 = -[VMUDebugTimer signpostID](v89->_debugTimer, "signpostID");
    if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v95,  OS_SIGNPOST_INTERVAL_BEGIN,  v96,  "buildLeakTree",  "addChildCountsIntoNode",  (uint8_t *)&__pattern4,  2u);
    }

    v89 = self;
  }

  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  v97 = v89->_leakTreeRootsArray;
  uint64_t v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v97,  "countByEnumeratingWithState:objects:count:",  &v122,  v163,  16LL);
  if (v98)
  {
    uint64_t v99 = *(void *)v123;
    do
    {
      for (uint64_t j = 0LL; j != v98; ++j)
      {
        if (*(void *)v123 != v99) {
          objc_enumerationMutation(v97);
        }
        [*(id *)(*((void *)&v122 + 1) + 8 * j) addChildCountsIntoNode];
      }

      uint64_t v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v97,  "countByEnumeratingWithState:objects:count:",  &v122,  v163,  16LL);
    }

    while (v98);
  }

  -[NSMutableArray sortUsingSelector:]( self->_leakTreeRootsArray,  "sortUsingSelector:",  sel_comparePuttingRetainCycleNodesAtTop_);
  v101 = self->_debugTimer;
  if (v101)
  {
    uint64_t v102 = -[VMUDebugTimer signpostID](v101, "signpostID");
    v101 = self->_debugTimer;
    if (v102)
    {
      -[VMUDebugTimer logHandle](v101, "logHandle");
      v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v104 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v103,  OS_SIGNPOST_INTERVAL_END,  v104,  "buildLeakTree",  "",  (uint8_t *)&__pattern4,  2u);
      }

      v101 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v101, "endEvent:", "buildLeakTree");

  _Block_object_dispose(&v159, 8);
}

void *__32__VMULeakDetector_buildLeakTree__block_invoke(void *result, unsigned int a2)
{
  uint64_t v2 = result[5];
  uint64_t v3 = *(void *)(result[4] + 8LL);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  BOOL v5 = (unsigned int *)result[6];
  if (*v5 > a2) {
    *((_BYTE *)v5 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t __32__VMULeakDetector_buildLeakTree__block_invoke_52(uint64_t result, uint64_t a2, uint64_t a3)
{
  return result;
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ([*(id *)(a1 + 32) isRootNode:a2])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 128) isGroupNode:v2])
    {
      v40[0] = 0LL;
      v40[1] = v40;
      v40[2] = 0x2020000000LL;
      int v41 = 0;
      uint64_t v36 = 0LL;
      os_signpost_id_t v37 = &v36;
      uint64_t v38 = 0x2020000000LL;
      int v39 = 0;
      v34[0] = 0LL;
      v34[1] = v34;
      v34[2] = 0x2020000000LL;
      int v35 = 0;
      uint64_t v30 = 0LL;
      id v31 = &v30;
      uint64_t v32 = 0x2020000000LL;
      int v33 = -1;
      key = 0LL;
      p_key = &key;
      uint64_t v26 = 0x3032000000LL;
      unsigned int v27 = __Block_byref_object_copy__2;
      uint64_t v28 = __Block_byref_object_dispose__2;
      id v29 = 0LL;
      uint64_t v12 = MEMORY[0x1895F87A8];
      os_signpost_id_t v14 = __32__VMULeakDetector_buildLeakTree__block_invoke_58;
      char v15 = &unk_189DFDA68;
      uint64_t v4 = *(void *)(a1 + 40);
      BOOL v5 = *(void **)(a1 + 48);
      unint64_t v6 = *(void **)(v4 + 128);
      uint64_t v13 = 3221225472LL;
      uint64_t v16 = v4;
      id v17 = v5;
      uint64_t v18 = &key;
      os_signpost_id_t v19 = &v36;
      v20 = &v30;
      uint64_t v7 = *(void *)(a1 + 88);
      os_signpost_id_t v22 = v40;
      uint64_t v23 = v7;
      uint64_t v21 = v34;
      [v6 enumerateMembersOfGroupNode:v2 withBlock:&v12];
      uint64_t v2 = *((unsigned int *)v31 + 6);
      if (*((_DWORD *)v37 + 6) == 6) {
        [*(id *)(a1 + 48) addObject:p_key[5], v12, v13, v14, v15, v16];
      }

      _Block_object_dispose(&key, 8);
      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(v40, 8);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    int v8 = *(void **)(a1 + 56);
    if (v8)
    {
      if (*(void *)(a1 + 64))
      {
        [*(id *)(a1 + 64) nodeDetails:v2];
        int v8 = *(void **)(a1 + 56);
      }

      else
      {
        key = 0LL;
        p_key = 0LL;
        uint64_t v26 = 0LL;
      }

      if (objc_msgSend(v8, "inspectingLiveProcess", v12, v13, v14, v15, v16)
        && [*(id *)(a1 + 56) usesLiteMode])
      {
        uint64_t v9 = [*(id *)(a1 + 64) vmuVMRegionForNode:v2];
        uint64_t v10 = (void *)v9;
        if (v9 && *(_DWORD *)(v9 + 148) == *(_DWORD *)(a1 + 96))
        {
          [*(id *)(a1 + 56) liteMSLPayloadforMallocAddress:key size:(unint64_t)p_key & 0xFFFFFFFFFFFFFFFLL];
          uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
        }

        else
        {
          uint64_t uniquing_table_index = -1LL;
        }
      }

      else
      {
        uint64_t uniquing_table_index = -1LL;
      }

      NSMapInsert(*(NSMapTable **)(a1 + 72), key, (const void *)uniquing_table_index);
    }
  }

void __32__VMULeakDetector_buildLeakTree__block_invoke_58(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 128LL);
  if (v4)
  {
    [v4 nodeDetails:a2];
    unsigned int v5 = 1;
    if (v15 >> 60 == 1)
    {
      unsigned int v6 = [v16 infoType];
      if (v6 > 8 || ((1 << v6) & 0x116) == 0)
      {
        unsigned int v9 = 0;
        unsigned int v5 = 2;
      }

      else
      {
        [v16 className];
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v8 hasPrefix:@"_"])
        {
          unsigned int v9 = 0;
          unsigned int v5 = 3;
        }

        else if ([v8 hasPrefix:@"OS_"])
        {
          unsigned int v9 = 0;
          unsigned int v5 = 4;
        }

        else
        {
          [v16 binaryPath];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          unsigned int v9 = VMUSortIndexForLibraryPath(v10);

          if (v9)
          {
            unsigned int v5 = 5;
          }

          else if ([*(id *)(a1 + 40) containsObject:v8])
          {
            unsigned int v9 = 0;
            unsigned int v5 = 7;
          }

          else
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v8);
            unsigned int v9 = 0;
            unsigned int v5 = 6;
          }
        }
      }
    }

    else
    {
      unsigned int v9 = 0;
    }
  }

  else
  {
    unsigned int v9 = 0;
    unsigned int v5 = 1;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  unsigned int v12 = *(_DWORD *)(v11 + 24);
  if (v12 >= v5)
  {
    if (v5 == 5 && v12 == 5)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
      if (*(_DWORD *)(v13 + 24) > v9)
      {
        *(_DWORD *)(v13 + 24) = v9;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v2;
      }
    }
  }

  else
  {
    *(_DWORD *)(v11 + 24) = v5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v2;
    if (v5 == 5) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v9;
    }
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) != 5) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
  }
  os_signpost_id_t v14 = *(unsigned int **)(a1 + 88);
  if (*v14 > v2) {
    *((_BYTE *)v14 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_66(uint64_t a1, char a2, void *key)
{
  if ((a2 & 0x12) != 0)
  {
    if (!NSMapGet(*(NSMapTable **)(a1 + 32), key)) {
      return;
    }
    uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
    unsigned int v6 = *(NSMapTable **)(a1 + 32);
    uint64_t v7 = key;
    goto LABEL_7;
  }

  if ((a2 & 0x24) != 0 && NSMapGet(*(NSMapTable **)(a1 + 32), key))
  {
    unsigned int v6 = *(NSMapTable **)(a1 + 32);
    uint64_t v7 = key;
    uint64_t uniquing_table_index = -1LL;
LABEL_7:
    NSMapInsert(v6, v7, (const void *)uniquing_table_index);
  }

void __32__VMULeakDetector_buildLeakTree__block_invoke_73( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  __int128 *a5)
{
  int v8 = (void *)MEMORY[0x186E32E40]();
  if (VMUIsOwningReference(*((_DWORD *)a5 + 4)))
  {
    id v9 = *(id *)(*(void *)(a1 + 104) + 8LL * a4);
    uint64_t v10 = v9;
    if (v9
      && (uint64_t v11 = *(void **)(a1 + 32),
          [v9 name],
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v11) = [v11 isEqualToString:v12],
          v12,
          (_DWORD)v11))
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL))
      {
LABEL_25:

        goto LABEL_26;
      }

      [v10 name];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 substringFromIndex:*(void *)(a1 + 112)];
      os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      [@"CYCLE BACK TO " stringByAppendingString:v14];
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [*(id *)(a1 + 40) is64bit];
      __int128 v17 = a5[1];
      __int128 v36 = *a5;
      __int128 v37 = v17;
      uint64_t v38 = *((void *)a5 + 4);
      +[VMULeakDetector referenceDescription:dstDescription:is64bit:]( &OBJC_CLASS___VMULeakDetector,  "referenceDescription:dstDescription:is64bit:",  &v36,  v15,  v16);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      id v19 = (id)[*(id *)(a1 + 48) addChildWithName:v18 address:0 count:0 numBytes:0 toNode:*(void *)(a1 + 56)];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
    }

    else
    {
      v20 = *(_DWORD **)(a1 + 120);
      (*(void (**)(void))(*(void *)(a1 + 88) + 16LL))();
      uint64_t v21 = (void *)*((void *)a5 + 4);
      [*(id *)(a1 + 64) nodeDescription:a4 usingDetails:v21];
      os_signpost_id_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = *(_DWORD **)(a1 + 128);
      if (*v23 > a4 && ((*((unsigned __int8 *)v23 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
      {
        uint64_t v24 = [*(id *)(a1 + 72) stringByAppendingString:v22];

        os_signpost_id_t v22 = (void *)v24;
      }

      uint64_t v25 = a4;
      uint64_t v26 = [*(id *)(a1 + 40) is64bit];
      __int128 v27 = a5[1];
      __int128 v36 = *a5;
      __int128 v37 = v27;
      uint64_t v38 = *((void *)a5 + 4);
      +[VMULeakDetector referenceDescription:dstDescription:is64bit:]( &OBJC_CLASS___VMULeakDetector,  "referenceDescription:dstDescription:is64bit:",  &v36,  v22,  v26);
      os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(_BYTE *)(*(void *)(a1 + 64) + 17LL) && VMUGraphNodeType_IsVMRegion(v21[1] >> 60))
      {
        [*(id *)(a1 + 40) vmuVMRegionForNode:a4];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = v28;
        v21[1] = v21[1] & 0xF000000000000000LL | (v28[22] + v28[23] - v28[24]) & 0xFFFFFFFFFFFFFFFLL;
        if (!*(_BYTE *)(*(void *)(a1 + 64) + 16LL))
        {
          int v35 = (void *)NSString;
          uint64_t v30 = VMUMemorySizeString(v28[23]);
          [v35 stringWithFormat:@"%@  dirty: %s  swapped: %s", v14, v30, VMUMemorySizeString(v29[22])];
          id v31 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v32 = v29[24];
          if (v32)
          {
            [NSString stringWithFormat:@"%@  purgableVolatile: %s", v31, VMUMemorySizeString(v32)];
            os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            os_signpost_id_t v14 = v31;
          }
        }
      }

      id v18 = *(id *)(a1 + 56);
      int v33 = *(void **)(a1 + 48);
      if (*(_BYTE *)(*(void *)(a1 + 64) + 16LL)) {
        [v33 addChildWithName:v14 address:0 count:1 numBytes:v21[1] & 0xFFFFFFFFFFFFFFFLL toNode:v18];
      }
      else {
      uint64_t v34 = [v33 addUniqueChildWithName:v14 address:*v21 count:1 numBytes:v21[1] & 0xFFFFFFFFFFFFFFFLL toNode:v18 isLeafNode:0];
      }

      *(void *)(*(void *)(a1 + 104) + 8 * v25) = v34;
      if (*(void *)(a1 + 80)) {
        *(void *)(*(void *)(a1 + 136) + 8 * v25) = *(void *)(a1 + 48);
      }
      uint64_t v10 = (void *)v34;
    }

    goto LABEL_25;
  }

+ (id)consolidatedRootLeakDescriptionsForTree:(id)a3
{
  return +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:]( &OBJC_CLASS___VMULeakDetector,  "_consolidatedRootLeakDescriptionsForTree:",  a3);
}

+ (id)_consolidatedRootLeakDescriptionsForTree:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (_consolidatedRootLeakDescriptionsForTree__onceToken != -1) {
    dispatch_once(&_consolidatedRootLeakDescriptionsForTree__onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = (void *)objc_opt_new();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v31 = v3;
  [v3 sortedChildren];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v10 name];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 containsString:@": 0x"];

        if (v12)
        {
          uint64_t v13 = _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
          [v10 name];
          os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 name];
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 length];
          __int128 v17 = (void *)v13;
          id v18 = v14;
          id v19 = @"$1: malloc[$2]";
        }

        else
        {
          [v10 name];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v21 = [v20 containsString:@": VM: "];

          if (v21)
          {
            uint64_t v22 = _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
            [v10 name];
            os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 name];
            unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = [v15 length];
            __int128 v17 = (void *)v22;
            id v18 = v14;
            id v19 = @"$1: $2";
          }

          else
          {
            uint64_t v23 = _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
            [v10 name];
            os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 name];
            unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = [v15 length];
            __int128 v17 = (void *)v23;
            id v18 = v14;
            id v19 = @"$1: <$2>";
          }
        }

        [v17 stringByReplacingMatchesInString:v18 options:0 range:0 withTemplate:v16];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

        int v25 = [v10 count];
        uint64_t v26 = v25 - [v10 sumOfChildCounts];
        [v4 objectForKeyedSubscript:v24];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = v27;
        if (v27) {
          uint64_t v26 = [v27 unsignedIntValue] + v26;
        }
        [MEMORY[0x189607968] numberWithUnsignedInt:v26];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v29 forKeyedSubscript:v24];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v7);
  }

  return v4;
}

void __60__VMULeakDetector__consolidatedRootLeakDescriptionsForTree___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): 0x[0-9a-f]+ \\[(.*)\\].*" options:0 error:0];
  v1 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex = v0;

  uint64_t v2 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): (VM: .*)  0x.*" options:0 error:0];
  id v3 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex = v2;

  uint64_t v4 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): <(.*) 0x[0-9a-f]+>* \\[\\d+\\].*" options:0 error:0];
  unsigned int v5 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex = v4;
}

- (void)printLeakTree
{
  uint64_t v2 = self;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v4 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = v2->_debugTimer;
    if (v4)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v5,  OS_SIGNPOST_INTERVAL_END,  v7,  "printLeakTree",  "",  buf,  2u);
        }
      }

      debugTimer = v2->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "printLeakTree");
  -[VMUDebugTimer startWithCategory:message:](v2->_debugTimer, "startWithCategory:message:", "printLeakTree", "");
  uint64_t v8 = v2->_debugTimer;
  if (v8)
  {
    -[VMUDebugTimer logHandle](v8, "logHandle");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "printLeakTree",  "",  buf,  2u);
      }
    }
  }

  if (-[NSMutableArray count](v2->_leakTreeRootsArray, "count") == 1) {
    uint64_t v12 = 74LL;
  }
  else {
    uint64_t v12 = 76LL;
  }
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  obuint64_t j = v2->_leakTreeRootsArray;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    uint64_t v43 = *(void *)v55;
    uint64_t v44 = v12;
    do
    {
      uint64_t v16 = 0LL;
      uint64_t v45 = v14;
      do
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        __int128 v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
        if (v2->_stackLogReader)
        {
          [*(id *)(*((void *)&v54 + 1) + 8 * v16) backtraceString];
          id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v19 = v17;
          v20 = VMUBacktraceIsExcludedMarker;

          if (v18 == v20)
          {
            v2->_numExcluded += [v19 count];
            goto LABEL_41;
          }

          uint64_t v48 = v16;
          [v19 backtraceString];
          int v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [v21 length];

          __int128 v17 = v19;
          if (v22)
          {
            os_signpost_id_t v46 = v19;
            +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:]( &OBJC_CLASS___VMULeakDetector,  "_consolidatedRootLeakDescriptionsForTree:",  v19);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 keysSortedByValueUsingComparator:&__block_literal_global_108];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 lastObject];
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = v2;
            -[VMULeakDetector printout:](v2, "printout:", "STACK OF ");
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            id v49 = v24;
            uint64_t v27 = [v49 countByEnumeratingWithState:&v50 objects:v59 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v51;
              do
              {
                for (uint64_t i = 0LL; i != v28; ++i)
                {
                  if (*(void *)v51 != v29) {
                    objc_enumerationMutation(v49);
                  }
                  id v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  [v23 objectForKeyedSubscript:v31];
                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v33 = [v32 unsignedIntValue];

                  else {
                    __int128 v34 = "INSTANCES";
                  }
                  id v35 = v31;
                  -[VMULeakDetector printout:]( v26,  "printout:",  "%u %s OF '%s'",  v33,  v34,  [v35 UTF8String]);
                  if (v35 == v25) {
                    __int128 v36 = ":";
                  }
                  else {
                    __int128 v36 = ", ";
                  }
                  -[VMULeakDetector printout:](v26, "printout:", v36);
                }

                uint64_t v28 = [v49 countByEnumeratingWithState:&v50 objects:v59 count:16];
              }

              while (v28);
            }

            id v37 = [v46 backtraceString];
            -[VMULeakDetector printout:](v26, "printout:", "%s\n", [v37 UTF8String]);

            __int128 v17 = v46;
            uint64_t v2 = v26;

            uint64_t v12 = v44;
            uint64_t v14 = v45;
            uint64_t v15 = v43;
          }

          else
          {
            -[VMULeakDetector printout:](v2, "printout:", "NO STACK\n");
          }

          -[VMULeakDetector printout:](v2, "printout:", "====\n");
          uint64_t v16 = v48;
        }

        [v17 printCallTreeToFile:v2->_outputFile cumulativeOutput:v2->_outputString options:v12];
        -[VMULeakDetector printout:](v2, "printout:", "\n");
LABEL_41:
        ++v16;
      }

      while (v16 != v14);
      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
    }

    while (v14);
  }

  uint64_t v38 = v2->_debugTimer;
  if (v38)
  {
    uint64_t v39 = -[VMUDebugTimer signpostID](v38, "signpostID");
    uint64_t v38 = v2->_debugTimer;
    if (v39)
    {
      -[VMUDebugTimer logHandle](v38, "logHandle");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
      if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v40,  OS_SIGNPOST_INTERVAL_END,  v42,  "printLeakTree",  "",  buf,  2u);
        }
      }

      uint64_t v38 = v2->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v38, "endEvent:", "printLeakTree");
}

uint64_t __32__VMULeakDetector_printLeakTree__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (unsigned)detectLeaksWithError:(id *)a3
{
  v46[1] = *MEMORY[0x1895F89C0];
  uint64_t v41 = 0LL;
  os_signpost_id_t v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  int v40 = 0;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __40__VMULeakDetector_detectLeaksWithError___block_invoke;
  v36[3] = &unk_189DFDB68;
  v36[4] = self;
  v36[5] = &v41;
  v36[6] = &v37;
  uint64_t v6 = (void *)MEMORY[0x186E33044](v36, a2);
  -[VMUObjectGraph enumerateObjectsWithBlock:](self->_graph, "enumerateObjectsWithBlock:", v6);
  self->_allocationsCount = *((_DWORD *)v38 + 6);
  self->_allocationsSize = v42[3];
  if (!-[VMULeakDetector checkTaskExistence](self, "checkTaskExistence"))
  {
LABEL_25:
    unsigned int v23 = 0;
    goto LABEL_26;
  }

  if (!self->_allocationsCount)
  {
    if (a3)
    {
      uint64_t v24 = (void *)MEMORY[0x189607870];
      uint64_t v45 = @"message";
      v46[0] = @"unable to inspect heap ranges of target process; it may be using a malloc replacement library without the required support";
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 errorWithDomain:@"VMULeakDetectorDomain" code:1 userInfo:v25];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_25;
  }

  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "VMULeakDetector",  "",  buf,  2u);
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMULeakDetector");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMULeakDetector",  "scan for leaks");
  os_signpost_id_t v11 = self->_debugTimer;
  if (v11)
  {
    -[VMUDebugTimer logHandle](v11, "logHandle");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v13 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "VMULeakDetector",  "scan for leaks",  buf,  2u);
    }
  }

  unsigned int v14 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  uint64_t v15 = calloc(1uLL, ((v14 + 7) >> 3) + 4);
  _DWORD *v15 = v14;
  -[VMULeakDetector setLeakedNodes:](self, "setLeakedNodes:", v15);
  if (self->_checkAbandoned) {
    -[VMULeakDetector setAbandoned:]( self,  "setAbandoned:",  -[VMUProcessObjectGraph copyUserMarked](self->_graph, "copyUserMarked"));
  }
  graph = self->_graph;
  uint64_t v27 = v5;
  uint64_t v28 = 3221225472LL;
  uint64_t v29 = __40__VMULeakDetector_detectLeaksWithError___block_invoke_128;
  uint64_t v30 = &unk_189DFDB90;
  id v31 = self;
  uint64_t v33 = &v41;
  __int128 v34 = &v37;
  id v32 = v6;
  VMUWithRootNodeMarkingMap(graph, &v27);
  __int128 v17 = self->_debugTimer;
  if (v17)
  {
    uint64_t v18 = -[VMUDebugTimer signpostID](v17, "signpostID", v27, v28, v29, v30, v31);
    __int128 v17 = self->_debugTimer;
    if (v18)
    {
      -[VMUDebugTimer logHandle](v17, "logHandle");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v20 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v19,  OS_SIGNPOST_INTERVAL_END,  v20,  "VMULeakDetector",  "",  buf,  2u);
      }

      __int128 v17 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v17, "endEvent:", "VMULeakDetector", v27, v28, v29, v30, v31);
  unsigned int leakedAllocationsCount = self->_leakedAllocationsCount;
  unsigned int numExcluded = self->_numExcluded;

  unsigned int v23 = leakedAllocationsCount - numExcluded;
LABEL_26:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  return v23;
}

BOOL __40__VMULeakDetector_detectLeaksWithError___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1[4] + 8LL) || !(BOOL result = VMUGraphNodeType_IsVMRegion(*(void *)(a3 + 8) >> 60)))
  {
    BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
    if (!result)
    {
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) += *(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
    }
  }

  return result;
}

uint64_t __40__VMULeakDetector_detectLeaksWithError___block_invoke_128(void *a1, uint64_t a2)
{
  id v3 = *(_DWORD **)(a1[4] + 112LL);
  int v4 = *v3;
  unint64_t v5 = (*v3 + 7);
  if (v5 >= 8)
  {
    uint64_t v6 = v3 + 1;
    uint64_t v7 = v5 >> 3;
    if (v5 >> 3 <= 1) {
      uint64_t v7 = 1LL;
    }
    do
    {
      *uint64_t v6 = ~*v6;
      ++v6;
      --v7;
    }

    while (v7);
  }

  int v8 = v4 & 7;
  if (v8) {
    *((_BYTE *)v3 + (v5 >> 3) + 3) ^= -1 << v8;
  }
  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 0LL;
  [*(id *)(a1[4] + 48) enumerateMarkedObjects:*(void *)(a1[4] + 112) withBlock:a1[5]];
  *(_DWORD *)(a1[4] + 144LL) = *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL);
  *(void *)(a1[4] + 160LL) = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 0LL;
  uint64_t result = [*(id *)(a1[4] + 48) enumerateMarkedObjects:*(void *)(a1[4] + 104) withBlock:a1[5]];
  *(_DWORD *)(a1[4] + 148LL) = *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL);
  *(void *)(a1[4] + 168LL) = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
  return result;
}

- (unsigned)doNormalLeakDetectionWithError:(id *)a3
{
  if (*a3) {
    return 0;
  }
  unsigned int result = -[VMULeakDetector checkTaskExistence](self, "checkTaskExistence");
  if (result)
  {
    -[VMULeakDetector printout:]( self,  "printout:",  "Process %d: %u nodes malloced for %llu KB\n",  -[VMUProcessObjectGraph pid](self->_graph, "pid"),  self->_allocationsCount,  (self->_allocationsSize + 1023) >> 10);
    uint64_t v6 = -[VMUProcessObjectGraph pid](self->_graph, "pid");
    uint64_t leakedAllocationsCount = self->_leakedAllocationsCount;
    if ((_DWORD)leakedAllocationsCount == 1) {
      int v8 = "";
    }
    else {
      int v8 = "s";
    }
    -[VMULeakDetector printout:]( self,  "printout:",  "Process %d: %u leak%s for %llu total leaked bytes.\n",  v6,  leakedAllocationsCount,  v8,  self->_leakedAllocationsSize);
    if (self->_abandonedSize)
    {
      uint64_t v9 = -[VMUProcessObjectGraph pid](self->_graph, "pid");
      uint64_t abandonedCount = self->_abandonedCount;
      if ((_DWORD)abandonedCount == 1) {
        os_signpost_id_t v11 = "";
      }
      else {
        os_signpost_id_t v11 = "s";
      }
      -[VMULeakDetector printout:]( self,  "printout:",  "Process %d: %u object%s abandoned for %llu total abandoned bytes.\n",  v9,  abandonedCount,  v11,  self->_abandonedSize);
    }

    if (!self->_suppressOutput)
    {
      -[VMULeakDetector printout:](self, "printout:", "\n");
      if (self->_abandoned || self->_showListOfLeaks)
      {
        graph = self->_graph;
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 3221225472LL;
        v16[2] = __50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke;
        v16[3] = &unk_189DFDBB8;
        v16[4] = self;
        VMUEnumerateVMAnnotatedMallocObjectsWithBlock(graph, v16);
      }

      else
      {
        -[VMULeakDetector buildLeakTree](self, "buildLeakTree");
        if (-[VMULeakDetector outputFile](self, "outputFile")
          || (-[VMULeakDetector outputString](self, "outputString"),
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          -[VMULeakDetector printLeakTree](self, "printLeakTree");
        }
      }
    }

    unsigned int numExcluded = self->_numExcluded;
    if (numExcluded)
    {
      if (numExcluded == 1) {
        unsigned int v14 = "";
      }
      else {
        unsigned int v14 = "s";
      }
      -[VMULeakDetector printout:](self, "printout:", "\n%u leak%s excluded (not printed)\n", self->_numExcluded, v14);
    }

    if (-[VMULeakDetector outputFile](self, "outputFile")) {
      fflush(-[VMULeakDetector outputFile](self, "outputFile"));
    }
    return self->_leakedAllocationsCount - self->_numExcluded;
  }

  return result;
}

void *__50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke( uint64_t a1,  uint64_t a2,  __int128 *a3,  uint64_t a4,  uint64_t a5)
{
  unsigned int result = *(void **)(a1 + 32);
  uint64_t v6 = (_DWORD *)result[14];
  if (*v6 > a2 && ((*((unsigned __int8 *)v6 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    __int128 v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    uint64_t v7 = "Leak";
    return (void *)[result printLeak:v7 node:a2 details:&v9 region:a4 stop:a5];
  }

  int v8 = (_DWORD *)result[13];
  if (v8 && *v8 > a2 && ((*((unsigned __int8 *)v8 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    __int128 v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    uint64_t v7 = "Abandoned";
    return (void *)[result printLeak:v7 node:a2 details:&v9 region:a4 stop:a5];
  }

  return result;
}

- (void)dealloc
{
  abandoned = self->_abandoned;
  if (abandoned)
  {
    free(abandoned);
    self->_abandoned = 0LL;
  }

  leakedNodes = self->_leakedNodes;
  if (leakedNodes)
  {
    free(leakedNodes);
    self->_leakedNodes = 0LL;
  }

  if (self->_fcloseOutput)
  {
    outputFile = self->_outputFile;
    if (outputFile)
    {
      fclose(outputFile);
      self->_outputFile = 0LL;
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMULeakDetector;
  -[VMULeakDetector dealloc](&v6, sel_dealloc);
}

- (BOOL)showLeakedVMregions
{
  return self->_showLeakedVMregions;
}

- (void)setShowLeakedVMregions:(BOOL)a3
{
  self->_showLeakedVMregions = a3;
}

- (BOOL)showContext
{
  return self->_showContext;
}

- (void)setShowContext:(BOOL)a3
{
  self->_showContext = a3;
}

- (BOOL)showOnlyVMregions
{
  return self->_showOnlyVMregions;
}

- (void)setShowOnlyVMregions:(BOOL)a3
{
  self->_showOnlyVMregions = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)showBinaryContents
{
  return self->_showBinaryContents;
}

- (void)setShowBinaryContents:(BOOL)a3
{
  self->_BOOL showBinaryContents = a3;
}

- (BOOL)checkAbandoned
{
  return self->_checkAbandoned;
}

- (void)setCheckAbandoned:(BOOL)a3
{
  self->_checkAbandoned = a3;
}

- (BOOL)suppressOutput
{
  return self->_suppressOutput;
}

- (void)setSuppressOutput:(BOOL)a3
{
  self->_suppressOutput = a3;
}

- (BOOL)showListOfLeaks
{
  return self->_showListOfLeaks;
}

- (void)setShowListOfLeaks:(BOOL)a3
{
  self->_showListOfLeaks = a3;
}

- (BOOL)groupByType
{
  return self->_groupByType;
}

- (void)setGroupByType:(BOOL)a3
{
  self->_groupByType = a3;
}

- (BOOL)referenceTreeShowRegionVirtualSize
{
  return self->_referenceTreeShowRegionVirtualSize;
}

- (void)setReferenceTreeShowRegionVirtualSize:(BOOL)a3
{
  self->_referenceTreeShowRegionVirtualSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (__sFILE)outputFile
{
  return self->_outputFile;
}

- (void)setOutputFile:(__sFILE *)a3
{
  self->_outputFile = a3;
}

- (NSMutableString)outputString
{
  return self->_outputString;
}

- (void)setOutputString:(id)a3
{
}

- (BOOL)fcloseOutput
{
  return self->_fcloseOutput;
}

- (void)setFcloseOutput:(BOOL)a3
{
  self->_fcloseOutput = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

- (VMUTask)task
{
  return self->_task;
}

- (VMUProcessObjectGraph)graph
{
  return self->_graph;
}

- (VMUTaskMemoryScanner)scanner
{
  return self->_scanner;
}

- (VMUStackLogReader)stackLogReader
{
  return self->_stackLogReader;
}

- (void)abandoned
{
  return self->_abandoned;
}

- (void)setAbandoned:(void *)a3
{
  self->_abandoned = a3;
}

- (void)leakedNodes
{
  return self->_leakedNodes;
}

- (void)setLeakedNodes:(void *)a3
{
  self->_leakedNodes = a3;
}

- (NSMutableArray)leakTreeRootsArray
{
  return self->_leakTreeRootsArray;
}

- (void)setLeakTreeRootsArray:(id)a3
{
}

- (VMUProcessObjectGraph)leakedGraph
{
  return self->_leakedGraph;
}

- (void)setLeakedGraph:(id)a3
{
}

- (unsigned)allocationsCount
{
  return self->_allocationsCount;
}

- (void)setAllocationsCount:(unsigned int)a3
{
  self->_allocationsCount = a3;
}

- (unint64_t)allocationsSize
{
  return self->_allocationsSize;
}

- (void)setAllocationsSize:(unint64_t)a3
{
  self->_allocationsSize = a3;
}

- (unsigned)leakedAllocationsCount
{
  return self->_leakedAllocationsCount;
}

- (void)setLeakedAllocationsCount:(unsigned int)a3
{
  self->_uint64_t leakedAllocationsCount = a3;
}

- (unint64_t)leakedAllocationsSize
{
  return self->_leakedAllocationsSize;
}

- (void)setLeakedAllocationsSize:(unint64_t)a3
{
  self->_leakedAllocationsSize = a3;
}

- (unsigned)abandonedCount
{
  return self->_abandonedCount;
}

- (void)setAbandonedCount:(unsigned int)a3
{
  self->_uint64_t abandonedCount = a3;
}

- (unint64_t)abandonedSize
{
  return self->_abandonedSize;
}

- (void)setAbandonedSize:(unint64_t)a3
{
  self->_abandonedSize = a3;
}

- (void).cxx_destruct
{
}

- (void)printout:.cold.1()
{
}

@end