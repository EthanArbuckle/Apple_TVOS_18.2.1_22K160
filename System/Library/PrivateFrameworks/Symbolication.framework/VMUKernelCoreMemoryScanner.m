@interface VMUKernelCoreMemoryScanner
+ (void)initialize;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUKernelCoreMemoryScanner *)self;
- (BOOL)abandonedMarkingEnabled;
- (BOOL)addAllNodesFromTaskWithError:(id *)a3;
- (BOOL)addMallocNodesFromTaskWithError:(id *)a3;
- (BOOL)addRootNodesFromTaskWithError:(id *)a3;
- (BOOL)addressIsInDataSegment:(unint64_t)a3;
- (BOOL)exactScanningEnabled;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)recordRuntimeMetadataChunkInfo;
- (BOOL)showRawClassNames;
- (NSDictionary)ledger;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUKernelCoreMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (VMUObjectIdentifier)objectIdentifier;
- (VMUScanOverlay)scanOverlay;
- (VMUTaskMemoryCache)memoryCache;
- (_VMUBlockNode)blocks;
- (_VMURegionNode)regions;
- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4;
- (id)_readonlyRegionRanges;
- (id)_typeNameForZoneName:(id)a3;
- (id)classInfoForObjectAtAddress:(unint64_t)a3;
- (id)labelForNode:(unsigned int)a3;
- (id)processSnapshotGraph;
- (id)processSnapshotGraphWithOptions:(unint64_t)a3;
- (id)shortLabelForNode:(unsigned int)a3;
- (id)vmuTask;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (id)vmuVMRegionForNode:(unsigned int)a3;
- (id)zoneNameForIndex:(unsigned int)a3;
- (id)zoneNameForNode:(unsigned int)a3;
- (int)pid;
- (unint64_t)_lengthOfMappedFileOfRegion:(id)a3;
- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (unint64_t)maxInteriorOffset;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unint64_t)suspendTimeContinuous;
- (unsigned)_indexForClassInfo:(id)a3;
- (unsigned)_nodeForAddress:(unint64_t)a3 checkMaxInteriorOffset:(BOOL)a4;
- (unsigned)_removeFalsePositiveLeakedVMregionsFromNodes:(unsigned int *)a3 nodeCount:(unsigned int)a4 recorder:(id)a5;
- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsWithBlock:(id)a3;
- (unsigned)enumerateReferencesWithBlock:(id)a3;
- (unsigned)enumerateRegionsWithBlock:(id)a3;
- (unsigned)idleExitStatus;
- (unsigned)kernelPageSize;
- (unsigned)mallocNodeCount;
- (unsigned)nodeCount;
- (unsigned)nodeForAddress:(unint64_t)a3;
- (unsigned)nodeNamespaceSize;
- (unsigned)objectContentLevel;
- (unsigned)regionCount;
- (unsigned)scanningMask;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_addThreadNodesFromTask;
- (void)_buildRegionFirstBlockIndexOnPageArrays;
- (void)_callRemoteMallocEnumerators:(unsigned int)a3 block:(id)a4;
- (void)_destroyLinearClassInfos;
- (void)_enumerateZallocZones:(BOOL)a3 blocks:(BOOL)a4;
- (void)_findMarkedAbandonedBlocks;
- (void)_fixupBlockIsas;
- (void)_identifyNonObjectsPointedToByTypedIvars:(unsigned int)a3;
- (void)_identifyNonObjectsUsingStackBacktrace;
- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5;
- (void)_shortenScannableRangeOfMappedFile:(unsigned int)a3;
- (void)_sortAndClassifyBlocks;
- (void)_sortBlocks;
- (void)_updateLinearClassInfos;
- (void)_withMemoryReaderBlock:(id)a3;
- (void)_withOrderedNodeMapper:(id)a3;
- (void)addMallocNodes:(id)a3;
- (void)addMallocNodesFromTask;
- (void)addRootNodesFromTask;
- (void)applyTypeOverlayToMutableInfo:(id)a3;
- (void)contentForNode:(unsigned int)a3;
- (void)copyUserMarked;
- (void)dealloc;
- (void)printRuntimeMetadataInfo;
- (void)refineTypesWithOverlay:(id)a3;
- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:;
- (void)scanNodesWithReferenceRecorder:(id)a3;
- (void)setAbandonedMarkingEnabled:(BOOL)a3;
- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4;
- (void)setDebugTimer:(id)a3;
- (void)setExactScanningEnabled:(BOOL)a3;
- (void)setMaxInteriorOffset:(unint64_t)a3;
- (void)setNodeScanningLogger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3;
- (void)setReferenceScanningLogger:(id)a3;
- (void)setScanningMask:(unsigned int)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)unmapAllRegions;
@end

@implementation VMUKernelCoreMemoryScanner

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = getenv("VMUEnumeratorValidation");
    BOOL v6 = 0;
    if (v2)
    {
      int v3 = *v2;
      BOOL v4 = (v3 - 48) > 0x3E || ((1LL << (v3 - 48)) & 0x4000000040000001LL) == 0;
      if (v4 && v3 != 0) {
        BOOL v6 = 1;
      }
    }

    s_enumeratorDebugging_0 = v6;
  }

- (id)vmuTask
{
  return self->_task;
}

- (void)unmapAllRegions
{
  if (self->_regionsCount)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      regions = self->_regions;
      v7 = self->_memoryCache;
      v8 = v7;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v11[0] = v5;
          v11[1] = 3221225472LL;
          v11[2] = ___unmapRegion_block_invoke_0;
          v11[3] = &unk_189DFD7B8;
          v12 = v7;
          v13 = &regions[v3];
          v14 = regions;
          v10 = (void (**)(void))MEMORY[0x186E33044](v11);
          v10[2]();
        }

        else
        {
          v9 = &regions[v3];
          v9->var6 = 0LL;
          v9->var7 = 0LL;
          v9->var8 = 0LL;
        }
      }

      ++v4;
      ++v3;
    }

    while (v4 < self->_regionsCount);
  }

  -[VMUTaskMemoryCache flushMemoryCache](self->_memoryCache, "flushMemoryCache");
  -[VMUObjectIdentifier flushRemoteMirrorMemoryCache](self->_objectIdentifier, "flushRemoteMirrorMemoryCache");
}

- (VMUKernelCoreMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  uint64_t v142 = *MEMORY[0x1895F89C0];
  id v122 = a3;
  v139.receiver = self;
  v139.super_class = (Class)&OBJC_CLASS___VMUKernelCoreMemoryScanner;
  v7 = -[VMUKernelCoreMemoryScanner init](&v139, sel_init);

  if (!v7)
  {
    v12 = 0LL;
LABEL_126:
    v118 = v122;
    v12 = v12;
    v117 = v12;
    goto LABEL_127;
  }
  v124 = +[VMUDebugTimer sharedTimerIfCreated](&OBJC_CLASS___VMUDebugTimer, "sharedTimerIfCreated");
  p_task = (id *)&v7->_task;
  objc_storeStrong((id *)&v7->_task, a3);
  v7->_pid = -1;
  if (v124)
  {
    if ([v124 signpostID])
    {
      [v124 logHandle];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v9 = [v124 signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "initMemoryScanner",  "",  buf,  2u);
      }
    }

    [v124 endEvent:"initMemoryScanner"];
    [v124 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
    [v124 logHandle];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = [v124 signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "initMemoryScanner",  "building VMUProcessDescription",  buf,  2u);
    }
  }

  else
  {
    [0 endEvent:"initMemoryScanner"];
    [0 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
  }

  [*p_task processDescription];
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    uint64_t v13 = [v123 description];
    processDescriptionString = v7->_processDescriptionString;
    v7->_processDescriptionString = (NSString *)v13;

    uint64_t v15 = [v123 date];
    suspendDate = v7->_suspendDate;
    v7->_suspendDate = (NSDate *)v15;

    uint64_t v17 = [v123 processName];
    processName = v7->_processName;
    v7->_processName = (NSString *)v17;

    if ((a4 & 0x8000) != 0)
    {
      uint64_t v19 = [v123 binaryImagesDescription];
      binaryImagesDescription = v7->_binaryImagesDescription;
      v7->_binaryImagesDescription = (NSString *)v19;
    }

    uint64_t v21 = [v123 executablePath];
    executablePath = v7->_executablePath;
    v7->_executablePath = (NSString *)v21;

    v7->_physicalFootprint = [v123 physicalFootprint];
    v7->_physicalFootprintPeak = [v123 physicalFootprintPeak];
    v7->_idleExitStatus = [v123 idleExitStatus];
  }

  uint64_t v23 = +[VMUProcessLedger ledgerForVMUTask:](&OBJC_CLASS___VMUProcessLedger, "ledgerForVMUTask:", v7->_task);
  ledger = v7->_ledger;
  v7->_ledger = (NSDictionary *)v23;

  if (v124 && [v124 signpostID])
  {
    [v124 logHandle];
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v26 = [v124 signpostID];
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v25,  OS_SIGNPOST_INTERVAL_END,  v26,  "initMemoryScanner",  "",  buf,  2u);
    }
  }

  [v124 endEvent:"initMemoryScanner"];
  mach_get_times();
  v7->_maxInteriorOffset = *MEMORY[0x1895FD590];
  v7->_scanningMask = VMUScanningMaskForOwningReferences();
  v7->_exactScanningEnabled = 1;
  v7->_abandonedMarkingEnabled = 1;
  uint64_t v27 = objc_opt_new();
  mappedFileNameToLengthDict = v7->_mappedFileNameToLengthDict;
  v7->_mappedFileNameToLengthDict = (NSMutableDictionary *)v27;

  unint64_t v120 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
  v29 = -[VMUVMRegionIdentifier initWithVMUTask:options:]( objc_alloc(&OBJC_CLASS___VMUVMRegionIdentifier),  "initWithVMUTask:options:",  v7->_task);
  regionIdentifier = v7->_regionIdentifier;
  v7->_regionIdentifier = v29;
  v125 = -[VMUVMRegionIdentifier regions](v7->_regionIdentifier, "regions");
  unsigned int v31 = [v125 count];
  v7->_unint64_t regionsCount = v31;
  if (!v31) {
    goto LABEL_116;
  }
  regions = (_VMURegionNode *)calloc(v31, 0x40uLL);
  v7->_regions = regions;
  if (v7->_regionsCount)
  {
    uint64_t v33 = 0LL;
    unint64_t v34 = 0LL;
    do
    {
      id v35 = (id)[v125 objectAtIndexedSubscript:v34];
      regions = v7->_regions;
      regions[v33].var0 = v35;
      ++v34;
      unint64_t regionsCount = v7->_regionsCount;
      ++v33;
    }

    while (v34 < regionsCount);
  }

  else
  {
    LODWORD(regionsCount) = 0;
  }

  v37 = (_VMURegionMap *)calloc(1uLL, 0x200040uLL);
  v37->unint64_t var6 = -1LL;
  v38 = calloc(1uLL, 0x800004uLL);
  _DWORD *v38 = 0x4000000;
  v37->var3 = v38;
  v37->var4 = regions;
  v37->var5 = regionsCount;
  if ((_DWORD)regionsCount)
  {
    uint64_t v39 = 0LL;
    v40 = (_DWORD *)MEMORY[0x1895FD580];
    do
    {
      p_var0 = &regions[v39].var0;
      if (([*p_var0 isSpecialPhysFootprintRegion] & 1) == 0)
      {
        unint64_t v42 = *((void *)*p_var0 + 1);
        unint64_t v43 = *((void *)*p_var0 + 2) + v42;
        unint64_t var6 = v37->var6;
        unint64_t var7 = v37->var7;
        if (var6 >= v42) {
          unint64_t var6 = *((void *)*p_var0 + 1);
        }
        if (var7 <= v43) {
          unint64_t var7 = *((void *)*p_var0 + 2) + *((void *)*p_var0 + 1);
        }
        v37->unint64_t var6 = var6;
        v37->unint64_t var7 = var7;
        unint64_t v46 = v42 >> *v40;
        if (v46)
        {
          unint64_t v47 = (~*MEMORY[0x1895FD578] & (*MEMORY[0x1895FD578] + v43)) >> *v40;
          do
          {
            if (v46 + 1 > v47) {
              unint64_t v48 = v46 + 1;
            }
            else {
              unint64_t v48 = v47;
            }
            var3 = (unsigned int *)v37->var3;
            unsigned int v50 = v46 & 0x3FFFFFF;
            unsigned int v51 = *var3;
            if (*var3 > (v46 & 0x3FFFFFF))
            {
              unsigned int v52 = ((v48 - v46) & 0x3FFFFFF) + v50;
              if (v51 < v52) {
                unsigned int v52 = *var3;
              }
              unsigned int v53 = (v50 + 7) & 0x7FFFFF8;
              if (v53 >= v52) {
                unsigned int v53 = v52;
              }
              if (v50 < v53)
              {
                do
                {
                  if (v51 > v50) {
                    *((_BYTE *)var3 + (v50 >> 3) + 4) |= 1 << (v50 & 7);
                  }
                  ++v50;
                }

                while (v53 != v50);
                unsigned int v50 = v53;
              }

              unsigned int v54 = v52 & 0x7FFFFF8;
              if ((v52 & 0x7FFFFF8) <= v50) {
                unsigned int v54 = v50;
              }
              if (v52 > v54)
              {
                unsigned int v55 = v52 - 1;
                do
                {
                  if (v51 > v55) {
                    *((_BYTE *)var3 + (v55 >> 3) + 4) |= 1 << (v55 & 7);
                  }
                  unsigned int v56 = v55 - 1;
                }

                while (v55-- > v54);
                unsigned int v52 = v56 + 1;
              }

              memset((char *)var3 + (v50 >> 3) + 4, 255, (v52 - v50) >> 3);
            }

            v46 >>= 26;
            unint64_t v47 = v48 >> 26;
          }

          while (v46);
        }
      }

      ++v39;
    }

    while (v39 != regionsCount);
  }

  v7->_regionMap = v37;
  uint64_t v58 = -[VMUTask memoryCache](v7->_task, "memoryCache");
  memoryCache = v7->_memoryCache;
  v7->_memoryCache = (VMUTaskMemoryCache *)v58;

  if (!v7->_memoryCache)
  {
LABEL_116:

    v12 = 0LL;
    int v110 = 1;
    goto LABEL_124;
  }

  v7->_coreSymbolicator._opaque_1 = -[VMUTask createSymbolicatorWithFlags:andNotification:]( v7->_task,  "createSymbolicatorWithFlags:andNotification:",  CSSymbolicatorGetFlagsForNListOnlyData(),  0LL);
  v7->_coreSymbolicator._opaque_2 = v60;
  regionMap = v7->_regionMap;
  *(void *)buf = 0LL;
  v134 = buf;
  uint64_t v135 = 0x3032000000LL;
  v136 = __Block_byref_object_copy__0;
  v137 = __Block_byref_object_dispose__0;
  id v138 = 0LL;
  uint64_t v62 = MEMORY[0x1895F87A8];
  v132[0] = MEMORY[0x1895F87A8];
  v132[1] = 3221225472LL;
  v132[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke;
  v132[3] = &unk_189DFCDB0;
  v132[4] = buf;
  v132[5] = regionMap;
  uint64_t v63 = MEMORY[0x186E33044](v132);
  id regionInfoBlock = v7->_regionInfoBlock;
  v7->_id regionInfoBlock = (id)v63;

  -[VMUTaskMemoryCache setRegionInfoBlock:](v7->_memoryCache, "setRegionInfoBlock:", v7->_regionInfoBlock);
  v65 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
  dataSegmentsRangeArrayOutsideSharedCache = v7->_dataSegmentsRangeArrayOutsideSharedCache;
  v7->_dataSegmentsRangeArrayOutsideSharedCache = v65;

  uint64_t v67 = -[VMUVMRegionIdentifier taskThreadStates](v7->_regionIdentifier, "taskThreadStates");
  threadStates = v7->_threadStates;
  v7->_threadStates = (VMUTaskThreadStates *)v67;

  v69 = v124;
  v7->_threadsCount = -[VMUTaskThreadStates threadCount](v7->_threadStates, "threadCount");
  if (v124 && [v124 signpostID])
  {
    [v124 logHandle];
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v71 = [v124 signpostID];
    if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v70,  OS_SIGNPOST_INTERVAL_END,  v71,  "initMemoryScanner",  "",  v140,  2u);
    }

    v69 = v124;
  }

  [v69 endEvent:"initMemoryScanner"];
  [v69 startWithCategory:"initMemoryScanner" message:"get malloc zones array"];
  if (v69)
  {
    [v69 logHandle];
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v73 = [v69 signpostID];
    if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v72,  OS_SIGNPOST_INTERVAL_BEGIN,  v73,  "initMemoryScanner",  "get malloc zones array",  v140,  2u);
    }
  }

  uint64_t v74 = objc_opt_new();
  zoneNames = v7->_zoneNames;
  v7->_zoneNames = (NSMutableArray *)v74;

  uint64_t v76 = objc_opt_new();
  nonScannableZoneNames = v7->_nonScannableZoneNames;
  v7->_nonScannableZoneNames = (NSMutableSet *)v76;

  -[VMUKernelCoreMemoryScanner _enumerateZallocZones:blocks:](v7, "_enumerateZallocZones:blocks:", 1LL, 0LL);
  v78 = v124;
  if (v124 && [v124 signpostID])
  {
    [v124 logHandle];
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v80 = [v124 signpostID];
    if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v79,  OS_SIGNPOST_INTERVAL_END,  v80,  "initMemoryScanner",  "",  v140,  2u);
    }

    v78 = v124;
  }

  [v78 endEvent:"initMemoryScanner"];
  size_t zonesCount = v7->_zonesCount;
  if ((_DWORD)zonesCount && v7->_regions)
  {
    zones = v7->_zones;
    __compar[0] = v62;
    __compar[1] = 3221225472LL;
    __compar[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2;
    __compar[3] = &unk_189DFCE40;
    v131 = (VMUKernelCoreMemoryScanner *)&__block_literal_global_0;
    mergesort_b(zones, zonesCount, 0x18uLL, __compar);
    -[NSMutableArray sortUsingComparator:](v7->_zoneNames, "sortUsingComparator:", &__block_literal_global_0);
    v83 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]( objc_alloc(&OBJC_CLASS___VMUObjectIdentifier),  "initWithVMUTask:symbolicator:scanner:",  v7->_task,  0LL,  0LL,  v7);
    objectIdentifier = v7->_objectIdentifier;
    v7->_objectIdentifier = v83;

    v85 = v7->_objectIdentifier;
    if (v85)
    {
      uint64_t v86 = -[VMUObjectIdentifier realizedClasses](v85, "realizedClasses");
      classInfoIndexer = v7->_classInfoIndexer;
      v7->_classInfoIndexer = (VMUClassInfoMap *)v86;

      v88 = v124;
      if (v124 && [v124 signpostID])
      {
        [v124 logHandle];
        v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v90 = [v124 signpostID];
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v89,  OS_SIGNPOST_INTERVAL_END,  v90,  "initMemoryScanner",  "",  v140,  2u);
        }

        v88 = v124;
      }

      [v88 endEvent:"initMemoryScanner"];
      [v88 startWithCategory:"initMemoryScanner" message:"setting up VMUScanOverlay"];
      if (v88)
      {
        [v88 logHandle];
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v92 = [v88 signpostID];
        if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v91,  OS_SIGNPOST_INTERVAL_BEGIN,  v92,  "initMemoryScanner",  "setting up VMUScanOverlay",  v140,  2u);
        }
      }

      v93 = -[VMUScanOverlay initWithScanner:](objc_alloc(&OBJC_CLASS___VMUScanOverlay), "initWithScanner:", v7);
      scanOverlay = v7->_scanOverlay;
      v7->_scanOverlay = v93;

      -[VMUKernelCoreMemoryScanner refineTypesWithOverlay:](v7, "refineTypesWithOverlay:", v7->_scanOverlay);
      v95 = v124;
      if (v124 && [v124 signpostID])
      {
        [v124 logHandle];
        v96 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v97 = [v124 signpostID];
        if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v96,  OS_SIGNPOST_INTERVAL_END,  v97,  "initMemoryScanner",  "",  v140,  2u);
        }

        v95 = v124;
      }

      [v95 endEvent:"initMemoryScanner"];
      uint64_t v98 = objc_opt_new();
      nonscannableGlobalSymbolsArray = v7->_nonscannableGlobalSymbolsArray;
      v7->_nonscannableGlobalSymbolsArray = (VMUNonOverlappingRangeArray *)v98;

      CSSymbolicatorGetAOutSymbolOwner();
      __int128 v128 = 0u;
      __int128 v129 = 0u;
      __int128 v126 = 0u;
      __int128 v127 = 0u;
      uint64_t v100 = [&unk_189E1D018 countByEnumeratingWithState:&v126 objects:v141 count:16];
      if (v100)
      {
        uint64_t v101 = *(void *)v127;
        do
        {
          for (uint64_t i = 0LL; i != v100; ++i)
          {
            if (*(void *)v127 != v101) {
              objc_enumerationMutation(&unk_189E1D018);
            }
            [*(id *)(*((void *)&v126 + 1) + 8 * i) UTF8String];
            CSSymbolOwnerGetSymbolWithMangledName();
            uint64_t Range = CSSymbolGetRange();
            if (v104) {
              -[VMURangeArray addRange:](v7->_nonscannableGlobalSymbolsArray, "addRange:", Range, v104);
            }
          }

          uint64_t v100 = [&unk_189E1D018 countByEnumeratingWithState:&v126 objects:v141 count:16];
        }

        while (v100);
      }

      v7->_regionDescriptionOptions = v120;
      uint64_t v105 = *MEMORY[0x1895FD590];
      v106 = -[VMUTask memoryCache](v7->_task, "memoryCache");
      LOBYTE(v105) = v105 == [v106 pageSize];

      if ((v105 & 1) != 0)
      {
        MEMORY[0x186E31ED4]();
        int v107 = CSArchitectureIs64Bit();
        CSSymbolicatorGetArchitecture();
        int v108 = CSArchitectureIs64Bit();
        v109 = (FILE *)*MEMORY[0x1895F89D0];
        if (v107 == v108)
        {
          fwrite("warning: kernel core support is highly experimental\n", 0x34uLL, 1uLL, v109);
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v140 = 0;
            _os_log_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "warning: kernel core support is highly experimental",  v140,  2u);
          }

          int v110 = 0;
          goto LABEL_122;
        }

        int v110 = 1;
        fwrite("error: core's pointer size doesn't match the host system, cannot continue\n", 0x4AuLL, 1uLL, v109);
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
LABEL_122:
          v12 = v7;
          v7 = v131;
          goto LABEL_123;
        }

        -[VMUKernelCoreMemoryScanner initWithVMUTask:options:].cold.1();
      }

      else
      {
        v111 = (FILE *)*MEMORY[0x1895F89D0];
        [*p_task memoryCache];
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v113 = [v112 pageSize];
        fprintf( v111,  "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue\n",  v113 >> 10,  *MEMORY[0x1895FD590] >> 10);

        v114 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v115 = MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          [*p_task memoryCache];
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUKernelCoreMemoryScanner initWithVMUTask:options:]([v116 pageSize], v140, v116);
        }
      }
    }

    else
    {

      v7 = 0LL;
    }

    int v110 = 1;
    goto LABEL_122;
  }

  v12 = 0LL;
  int v110 = 1;
LABEL_123:

  _Block_object_dispose(buf, 8);
LABEL_124:

  if (!v110) {
    goto LABEL_126;
  }
  v117 = 0LL;
  v118 = v122;
LABEL_127:

  return v117;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke( uint64_t a1,  unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v4 + 4 * ((a2 >> *MEMORY[0x1895FD580]) & 0x7FFFF);
  int v8 = *(_DWORD *)(v5 + 64);
  v7 = (_DWORD *)(v5 + 64);
  int v6 = v8;
  uint64_t v9 = *(void *)(v4 + 32);
  if (v8)
  {
    v10 = *(void **)(v9 + ((unint64_t)(v6 - 1) << 6));
    if (a2 - v10[1] < v10[2]) {
      goto LABEL_25;
    }
  }

  unint64_t v11 = *(unsigned int *)(v4 + 40);
  if (!(_DWORD)v11)
  {
LABEL_9:
    v14 = 0LL;
    goto LABEL_12;
  }

  v12 = *(id **)(v4 + 32);
  while (1)
  {
    unint64_t v13 = v11 >> 1;
    v14 = &v12[8 * (v11 >> 1)];
    if (*((void *)*v14 + 1) <= a2) {
      break;
    }
LABEL_8:
    BOOL v15 = v11 > 1;
    unint64_t v11 = v13;
    if (!v15) {
      goto LABEL_9;
    }
  }

  if (*((void *)*v14 + 2) + *((void *)*v14 + 1) <= a2)
  {
    v12 = v14 + 8;
    unint64_t v13 = --v11 >> 1;
    goto LABEL_8;
  }

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_23( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 rangeOfString:@"zalloc (no zone)"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"zalloc (no zone)"] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = [v4 compare:v5];
    }
    else {
      uint64_t v6 = 1LL;
    }
  }

  else
  {
    uint64_t v6 = -1LL;
  }

  return v6;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)dealloc
{
  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0LL;
  }

  CSRelease();
  -[VMUTaskMemoryCache setRegionInfoBlock:](self->_memoryCache, "setRegionInfoBlock:", 0LL);
  if (self->_regionsCount)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    uint64_t v6 = MEMORY[0x1895F87A8];
    do
    {
      regions = self->_regions;
      int v8 = self->_memoryCache;
      uint64_t v9 = v8;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v20[0] = v6;
          v20[1] = 3221225472LL;
          v20[2] = ___unmapRegion_block_invoke_0;
          v20[3] = &unk_189DFD7B8;
          uint64_t v21 = v8;
          v22 = &regions[v4];
          uint64_t v23 = regions;
          unint64_t v11 = (void (**)(void))MEMORY[0x186E33044](v20);
          v11[2]();
        }

        else
        {
          v10 = &regions[v4];
          v10->unint64_t var6 = 0LL;
          v10->unint64_t var7 = 0LL;
          v10->var8 = 0LL;
        }
      }

      var1 = self->_regions[v4].var1;
      if (var1)
      {
        free(var1);
        self->_regions[v4].var1 = 0LL;
      }

      ++v5;
      ++v4;
    }

    while (v5 < self->_regionsCount);
  }

  unint64_t v13 = self->_regions;
  if (v13)
  {
    free(v13);
    self->_regions = 0LL;
  }

  zones = self->_zones;
  if (zones)
  {
    free(zones);
    self->_zones = 0LL;
  }

  instanceValues = self->_instanceValues;
  if (instanceValues) {
    free(instanceValues);
  }
  self->_instanceValues = 0LL;
  regionMap = self->_regionMap;
  if (regionMap)
  {
    var3 = regionMap->var3;
    if (var3) {
      free(var3);
    }
    free(regionMap);
  }

  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0LL;
  }

  -[VMUKernelCoreMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VMUKernelCoreMemoryScanner;
  -[VMUKernelCoreMemoryScanner dealloc](&v19, sel_dealloc);
}

- (void)_withMemoryReaderBlock:(id)a3
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_189DFCED0;
  v5[4] = self;
  id v6 = 0LL;
  uint64_t v3 = (void (**)(id, void *))a3;
  uint64_t v4 = (void *)MEMORY[0x186E33044](v5);
  v3[2](v3, v4);
}

uint64_t __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke( uint64_t a1,  unint64_t a2,  uint64_t a3)
{
  uint64_t result = 0LL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 128LL);
  unint64_t v7 = *(void *)(v5 + 48);
  unint64_t v6 = *(void *)(v5 + 56);
  unint64_t v8 = v6 - v7;
  BOOL v9 = v6 < v7;
  if (a2 - v7 >= v8 || v9) {
    return result;
  }
  v12 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v13 = a2 >> *MEMORY[0x1895FD580];
  if (v13)
  {
    v14 = *(unsigned int **)(v5 + 24);
    unint64_t v15 = a2 >> *MEMORY[0x1895FD580];
    do
    {
      if (*v14 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v14 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0LL;
      }

      v15 >>= 26;
    }

    while (v15);
  }

  uint64_t v16 = v5 + 4 * (v13 & 0x7FFFF);
  int v19 = *(_DWORD *)(v16 + 64);
  unint64_t v18 = (_DWORD *)(v16 + 64);
  int v17 = v19;
  uint64_t v20 = *(void *)(v5 + 32);
  if (v19)
  {
    unint64_t v21 = v20 + ((unint64_t)(v17 - 1) << 6);
    if (a2 - *(void *)(*(void *)v21 + 8LL) < *(void *)(*(void *)v21 + 16LL)) {
      goto LABEL_10;
    }
  }

  unint64_t v48 = *(unsigned int *)(v5 + 40);
  if (!(_DWORD)v48) {
    return 0LL;
  }
  unint64_t v49 = *(void *)(v5 + 32);
  while (1)
  {
    unint64_t v50 = v48 >> 1;
    unint64_t v21 = v49 + (v48 >> 1 << 6);
    if (*(void *)(*(void *)v21 + 8LL) <= a2) {
      break;
    }
LABEL_30:
    BOOL v51 = v48 >= 2;
    unint64_t v48 = v50;
    if (!v51) {
      return 0LL;
    }
  }

  if (*(void *)(*(void *)v21 + 16LL) + *(void *)(*(void *)v21 + 8LL) <= a2)
  {
    unint64_t v49 = v21 + 64;
    unint64_t v50 = --v48 >> 1;
    goto LABEL_30;
  }

  int v52 = [*(id *)v21 isSpecialPhysFootprintRegion];
  uint64_t result = 0LL;
  if (v52) {
    unint64_t v53 = 0LL;
  }
  else {
    unint64_t v53 = v21;
  }
  if ((v52 & 1) == 0)
  {
    if ((*(_BYTE *)(*(void *)v53 + 132LL) & 1) == 0) {
      goto LABEL_80;
    }
    unsigned int v54 = (id *)(v53 + 64);
    unint64_t v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(void *)(v5 + 32)) >> 6);
    if (!v55) {
      goto LABEL_77;
    }
    while (1)
    {
      unint64_t v56 = v55 >> 1;
      v57 = &v54[8 * (v55 >> 1)];
      if (*((void *)*v57 + 1) <= a2)
      {
        if (*((void *)*v57 + 2) + *((void *)*v57 + 1) > a2)
        {
          else {
            unint64_t v55 = (unint64_t)v57;
          }
LABEL_77:
          if (v55) {
            unint64_t v53 = v55;
          }
          unint64_t v21 = v53;
LABEL_80:
          *unint64_t v18 = ((v53 - v20) >> 6) + 1;
LABEL_10:
          unint64_t v22 = a3 + a2;
          if (*(void *)(*(void *)v21 + 16LL) + *(void *)(*(void *)v21 + 8LL) < a3 + a2
            && *(void *)(v21 + 40) + *(void *)(*(void *)v21 + 8LL) < v22)
          {
            LODWORD(v23) = 1;
            do
            {
              v24 = (void *)(*(void *)(v21 + ((unint64_t)v23 << 6)) + 8LL);
              uint64_t v23 = (v23 + 1);
            }

            while (v24[1] + *v24 < v22);
            uint64_t v25 = *(void *)(a1 + 32);
            os_signpost_id_t v26 = *(void **)(a1 + 40);
            uint64_t v27 = *(void **)(v25 + 72);
            id v28 = *(id *)(v25 + 8);
            id v82 = v27;
            v83 = v26;
            uint64_t v29 = 0LL;
            if ((_DWORD)v23)
            {
              uint64_t v30 = v23;
              unsigned int v31 = (uint64_t *)v21;
              do
              {
                uint64_t v32 = *v31;
                v31 += 8;
                v29 += *(void *)(v32 + 16);
                --v30;
              }

              while (v30);
            }

            v90[0] = 0LL;
            uint64_t v85 = 0LL;
            uint64_t v33 = (void *)[v82 findMappedAddress:*(void *)(*(void *)v21 + 8) size:v29];
            if (v33)
            {
              uint64_t v34 = v33[1];
              uint64_t v35 = *(void *)(*(void *)v21 + 8LL) - *v33;
              v90[0] = v33[2] + v35;
              uint64_t v85 = v34 - v35;
              goto LABEL_19;
            }

            v81 = v28;
            if ((_DWORD)v23)
            {
              uint64_t v74 = 0LL;
              do
              {
                id v75 = v82;
                uint64_t v76 = v83;
                if (*(void *)(v21 + v74 + 48))
                {
                  if (v21 + v74 == *(void *)(v21 + v74 + 56))
                  {
                    v86[0] = MEMORY[0x1895F87A8];
                    v86[1] = 3221225472LL;
                    v86[2] = ___unmapRegion_block_invoke_0;
                    v86[3] = &unk_189DFD7B8;
                    id v87 = v75;
                    uint64_t v88 = v21 + v74;
                    unint64_t v89 = v21;
                    v78 = (void (**)(void))MEMORY[0x186E33044](v86);
                    v79 = v78;
                    if (v83) {
                      dispatch_async(v76, v78);
                    }
                    else {
                      v78[2](v78);
                    }
                  }

                  else
                  {
                    v77 = (void *)(v21 + v74);
                    v77[5] = 0LL;
                    v77[6] = 0LL;
                    v77[7] = 0LL;
                  }
                }

                v74 += 64LL;
              }

              while ((unint64_t)v23 << 6 != v74);
            }

            int v80 = [v82 mapAddress:*(void *)(*(void *)v21 + 8) size:v29 returnedAddress:v90 returnedSize:&v85];
            v12 = (_DWORD *)MEMORY[0x1895FD580];
            id v28 = v81;
            if (v80)
            {
              if (task_exists(v81)) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *(void *)(*(void *)v21 + 8LL),  *(void *)(*(void *)v21 + 8LL) + v29);
              }
            }

            else
            {
LABEL_19:
              if ((_DWORD)v23)
              {
                uint64_t v36 = 0LL;
                uint64_t v37 = v85;
                do
                {
                  v38 = (void *)(v21 + v36);
                  v38[7] = v21;
                  v38[5] = v37;
                  uint64_t v39 = v90[0];
                  v38[6] = v90[0];
                  uint64_t v40 = *(void *)(v21 + v36) + 8LL;
                  v90[0] = *(void *)(*(void *)(v21 + v36) + 16LL) + v39;
                  uint64_t v37 = v85 - *(void *)(v40 + 8);
                  uint64_t v85 = v37;
                  v36 += 64LL;
                }

                while ((unint64_t)v23 << 6 != v36);
              }
            }
          }

          uint64_t v41 = *(void *)(a1 + 32);
          unint64_t v42 = *(void **)(v41 + 72);
          uint64_t v43 = *(void *)(v41 + 112);
          int v44 = *(_DWORD *)(v41 + 120);
          id v45 = *(id *)(v41 + 8);
          id v46 = v42;
          unint64_t v47 = v46;
          if (*(void *)(v21 + 48))
          {
LABEL_24:

            return *(void *)(v21 + 48) + a2 - *(void *)(*(void *)v21 + 8LL);
          }

          v59 = *(void **)v21;
          if ((*(_BYTE *)(*(void *)v21 + 132LL) & 2) == 0)
          {
            [v46 taskIsTranslated];
            v59 = *(void **)v21;
          }

          int v60 = [v47 mapAddress:v59[1] size:v59[2] returnedAddress:v86 returnedSize:v90];
          if (!v60)
          {
            uint64_t v73 = v86[0];
            *(void *)(v21 + 40) = v90[0];
            *(void *)(v21 + 48) = v73;
            *(void *)(v21 + 56) = v21;
            goto LABEL_24;
          }

          if ((*(_DWORD *)(*(void *)v21 + 52LL) & 3u) - 1 >= 2)
          {
            int v61 = v60;
            BOOL v62 = task_exists(v45);
            if (v21 != v43 + ((unint64_t)(v44 - 1) << 6) && v62)
            {
              v84 = (FILE *)*MEMORY[0x1895F89D0];
              uint64_t v64 = [*(id *)v21 address];
              uint64_t v65 = *(unsigned int *)(*(void *)v21 + 24LL);
              v66 = vm_prot_strings_0[v65];
              uint64_t v67 = *(void *)(*(void *)v21 + 16LL) + *(void *)(*(void *)v21 + 8LL);
              id v68 = VMURegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*(void *)v21 + 104LL),  *(unsigned __int8 *)(*(void *)v21 + 50LL),  v65,  *(unsigned __int8 *)(*(void *)v21 + 49LL));
              v69 = (const char *)[v68 UTF8String];
              uint64_t v70 = *(void *)(*(void *)v21 + 16LL) >> *v12;
              os_signpost_id_t v71 = "pages";
              if (v70 == 1) {
                os_signpost_id_t v71 = "page";
              }
              if (*(void *)(v21 + 24) == *(void *)(v21 + 32)) {
                v72 = "";
              }
              else {
                v72 = " [root]";
              }
              fprintf( v84,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v64,  v67,  v66,  v69,  v70,  v71,  v72,  v61);
            }
          }

          return 0LL;
        }

        unsigned int v54 = v57 + 8;
        unint64_t v56 = --v55 >> 1;
      }

      BOOL v58 = v55 > 1;
      unint64_t v55 = v56;
      if (!v58)
      {
        unint64_t v55 = 0LL;
        goto LABEL_77;
      }
    }
  }

  return result;
}

- (void)_callRemoteMallocEnumerators:(unsigned int)a3 block:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke;
  v8[3] = &unk_189DFD658;
  v8[4] = self;
  id v9 = v6;
  unsigned int v10 = a3;
  id v7 = v6;
  -[VMUKernelCoreMemoryScanner _withMemoryReaderBlock:](self, "_withMemoryReaderBlock:", v8);
}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke( uint64_t a1,  void *a2)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2;
  v5[3] = &unk_189DFD630;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  int v7 = *(_DWORD *)(a1 + 48);
  _withPeekTransformerFunctionForMemoryReader(a2, v5);
}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 232))
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      if (*(void *)(*(void *)(v2 + 224) + v5 + 16))
      {
        get_local_zone_count();
        v8[0] = MEMORY[0x1895F87A8];
        v8[1] = 3221225472LL;
        v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3;
        v8[3] = &unk_189DFCF00;
        id v9 = *(id *)(a1 + 40);
        int v10 = v6;
        int v7 = (void *)MEMORY[0x186E33044](v8);
        (**(void (***)(uint64_t, void *, void, void, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(void *)(*(void *)(a1 + 32) + 224) + v5 + 16))( [*(id *)(*(void *)(a1 + 32) + 8) taskPort],  v7,  *(unsigned int *)(a1 + 48),  *(void *)(*(void *)(*(void *)(a1 + 32) + 224) + v5),  a2,  _pointerRecorderBlockContextAdapter_0);
        unregister_new_local_zones();

        uint64_t v2 = *(void *)(a1 + 32);
      }

      ++v6;
      v5 += 24LL;
    }

    while (v6 < *(unsigned int *)(v2 + 232));
  }

uint64_t __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40),  a2,  a3,  a4);
}

- (void)_destroyLinearClassInfos
{
  scanCaches = self->_scanCaches;
  if (scanCaches)
  {
    unint64_t classInfosCount = self->_classInfosCount;
    if ((_DWORD)classInfosCount)
    {
      for (unint64_t i = 0LL; i < classInfosCount; ++i)
      {
        unint64_t v6 = self->_scanCaches[i];
        if (v6)
        {
          free(v6);
          unint64_t classInfosCount = self->_classInfosCount;
        }
      }

      scanCaches = self->_scanCaches;
    }

    free(scanCaches);
    self->_scanCaches = 0LL;
  }

  applySwiftMaskingToIsa = self->_applySwiftMaskingToIsa;
  if (applySwiftMaskingToIsa)
  {
    free(applySwiftMaskingToIsa);
    self->_applySwiftMaskingToIsa = 0LL;
  }

- (unsigned)_indexForClassInfo:(id)a3
{
  return -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", a3);
}

- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4
{
  uint64_t v6 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", a3);
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5
{
  classInfoIndexer = self->_classInfoIndexer;
  id v9 = a3;
  uint64_t v10 = -[VMUClassInfoMap indexForClassInfo:](classInfoIndexer, "indexForClassInfo:", a4);
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  [MEMORY[0x189607968] numberWithUnsignedInt:v10];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v12);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    unint64_t v13 = self->_variantCachesByIsaIndex;
    [MEMORY[0x189607968] numberWithUnsignedInt:v10];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a5];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setObject:v9 forKeyedSubscript:v15];
}

- (void)_updateLinearClassInfos
{
  self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:]( self->_classInfoIndexer,  "_retainedLinearArrayWithReturnedCount:",  &self->_classInfosCount);
  self->_scanCaches = (_VMUScanLocationCache **)calloc(self->_classInfosCount, 8uLL);
  unsigned int classInfosCount = self->_classInfosCount;
  uint64_t v4 = calloc(1uLL, ((classInfosCount + 7) >> 3) + 4);
  *uint64_t v4 = classInfosCount;
  self->_applySwiftMaskingToIsa = v4;
}

- (void)_addThreadNodesFromTask
{
  if (self->_threadsCount)
  {
    unint64_t v3 = 0LL;
    unsigned int blocksCount = self->_blocksCount;
    do
    {
      uint64_t blocksSize = self->_blocksSize;
      if (blocksSize <= blocksCount)
      {
        else {
          int v7 = 2 * blocksSize;
        }
        do
        {
          unsigned int v8 = v7;
          v7 *= 2;
        }

        while (v8 < blocksCount);
        self->_uint64_t blocksSize = v8;
        blocks = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v8);
        self->_blocks = blocks;
        if (!blocks)
        {
          NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  blocksSize,  self->_blocksSize);
          abort();
        }

        unsigned int blocksCount = self->_blocksCount;
      }

      else
      {
        blocks = self->_blocks;
      }

      id v9 = &blocks[blocksCount];
      v9->var0 = v3;
      *((void *)v9 + 1) = (v3 << 41) | 4;
      unsigned int blocksCount = self->_blocksCount + 1;
      self->_unsigned int blocksCount = blocksCount;
      ++v3;
    }

    while (v3 < self->_threadsCount);
  }

- (unint64_t)_lengthOfMappedFileOfRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a3;
  if (!v4[49]) {
    goto LABEL_11;
  }
  if (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", *((void *)v4 + 1), *((void *)v4 + 2)))
  {
    off_t st_size = *((void *)v4 + 2) + *((void *)v4 + 15);
    goto LABEL_16;
  }

  [v4 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_11:
    off_t st_size = 0LL;
    goto LABEL_16;
  }

  int v7 = v6;
  if (([v6 containsString:@"*"] & 1) != 0
    || ([v7 hasPrefix:@"/"] & 1) == 0)
  {
    -[VMUTask memoryCache](self->_task, "memoryCache");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 procRegionFileNameForAddress:*((void *)v4 + 1) buffer:v16 bufferSize:1024];

    if (v9 >= 1)
    {
      *((_BYTE *)&v16[0].st_dev + v9) = 0;
      uint64_t v10 = [NSString stringWithUTF8String:v16];

      int v7 = (void *)v10;
    }
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mappedFileNameToLengthDict, "objectForKeyedSubscript:", v7);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    off_t st_size = [v11 unsignedLongLongValue];
  }

  else
  {
    id v13 = v7;
    if (stat((const char *)[v13 UTF8String], v16))
    {
      off_t st_size = *((void *)v4 + 2) + *((void *)v4 + 15);
    }

    else
    {
      off_t st_size = v16[0].st_size;
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v16[0].st_size];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mappedFileNameToLengthDict,  "setObject:forKeyedSubscript:",  v14,  v13);
    }
  }

LABEL_16:
  return st_size;
}

- (void)_shortenScannableRangeOfMappedFile:(unsigned int)a3
{
  regions = self->_regions;
  uint64_t v5 = a3;
  int v9 = regions[(unint64_t)a3].var0;
  unint64_t v6 = -[VMUKernelCoreMemoryScanner _lengthOfMappedFileOfRegion:](self, "_lengthOfMappedFileOfRegion:", v9);
  unint64_t v7 = v9[15];
  if (v6 < v7)
  {
    unint64_t var4 = regions[v5].var4;
LABEL_5:
    regions[v5].var5 = var4;
    goto LABEL_6;
  }

  if (v6 < v9[2] + v7)
  {
    unint64_t var4 = v6 - v7 + regions[v5].var4;
    goto LABEL_5;
  }

- (BOOL)addRootNodesFromTaskWithError:(id *)a3
{
  unsigned int v4 = self->_regionsCount - 1;
  do
  {
    unsigned int v5 = v4;
    if (!v4) {
      break;
    }
    int v6 = *((unsigned __int8 *)self->_regions[(unint64_t)v4--].var0 + 50);
  }

  while (v6 == 5);
  unsigned int v7 = 0;
  do
  {
    uint64_t v8 = v7;
    int v9 = self->_regions[(unint64_t)v7].var0;
    uint64_t v10 = v9;
    if (v9[50] != 3 && ([v9 isSubmap] & 1) == 0)
    {
      unint64_t v11 = *((void *)v10 + 1);
      uint64_t v12 = *((void *)v10 + 2);
      BOOL v13 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v11, v12);
      unsigned int v14 = *((_DWORD *)v10 + 26);
      BOOL v15 = v14 > 0x3D || ((1LL << v14) & 0x3000000080103FDELL) == 0;
      if (v15 && v14 != 99)
      {
        BOOL v16 = v13;
        if ((~[v10 protection] & 3) != 0)
        {
          int v18 = *((_DWORD *)v10 + 6);
          char v19 = (~v18 & 5) != 0 || v16;
          if ((v19 & 1) == 0 || (v18 != 1 ? (char v20 = 1) : (char v20 = v16), (v20 & 1) == 0))
          {
            if ((v10[132] & 2) == 0)
            {
              unint64_t v21 = &self->_regions[v8];
              v21->unint64_t var4 = *((void *)v10 + 1);
              v21->unint64_t var5 = v12 + v11;
            }
          }
        }

        else if ((v10[132] & 4) == 0 || self->_targetProcessHasObjCPatches && [v10 dirtyLength])
        {
          uint64_t v17 = &self->_regions[v8];
          v17->unint64_t var4 = v11;
          v17->unint64_t var5 = v12 + v11;
        }

        else
        {
          unint64_t v22 = &self->_regions[v8];
          v22->unint64_t var4 = 0LL;
          v22->unint64_t var5 = 0LL;
        }

        if (*((_DWORD *)v10 + 26) == 78) {
          self->_regions[v8].unint64_t var5 = self->_regions[v8].var4 + 4096;
        }
        if ((v10[132] & 2) != 0
          && (v10[132] & 4) == 0
          && ([v10 protection] & 1) != 0
          && ([v10 protection] & 4) == 0)
        {
          [v10 type];
          uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
          char v102 = [v104 isEqualToString:@"__LINKEDIT"];

          if ((v102 & 1) == 0)
          {
            uint64_t v23 = 23LL;
            if (v16) {
              uint64_t v23 = 21LL;
            }
            v24 = &(&self->super.isa)[v23];
            unint64_t v25 = (unint64_t)*v24;
            if (!*v24)
            {
              Class *v24 = (Class)v11;
              unint64_t v25 = v11;
            }

            v24[1] = (Class)(v12 + v11 - v25);
            if (!v16) {
              -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v11, v12);
            }
          }
        }

        if (self->_regions[v8].var5 && v10[49]) {
          -[VMUKernelCoreMemoryScanner _shortenScannableRangeOfMappedFile:]( self,  "_shortenScannableRangeOfMappedFile:",  v8);
        }
      }
    }

    unsigned int v7 = v8 + 1;
  }

  while ((int)v8 + 1 <= v5);
  v106[0] = MEMORY[0x1895F87A8];
  v106[1] = 3221225472LL;
  v106[2] = __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v106[3] = &unk_189DFD080;
  v106[4] = self;
  -[VMUKernelCoreMemoryScanner _callRemoteMallocEnumerators:block:]( self,  "_callRemoteMallocEnumerators:block:",  6LL,  v106);
  if (!self->_stackRanges)
  {
    os_signpost_id_t v26 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v26;
  }

  unsigned int regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    regions = self->_regions;
    uint64_t v30 = &regions[(unint64_t)(regionsCount - 1)];
  }

  else
  {
    regions = 0LL;
    uint64_t v30 = 0LL;
  }

  if (self->_threadsCount)
  {
    uint64_t v31 = 0LL;
    do
    {
      unint64_t v32 = -[VMUTaskThreadStates stackPointerForThreadNum:](self->_threadStates, "stackPointerForThreadNum:", v31);
      if (v32)
      {
        unint64_t v33 = v32;
        regionMap = self->_regionMap;
        unint64_t var6 = regionMap->var6;
        unint64_t var7 = regionMap->var7;
        unint64_t v37 = var7 - var6;
        BOOL v38 = var7 < var6;
        if (v32 - var6 < v37 && !v38)
        {
          unint64_t v39 = v32 >> *MEMORY[0x1895FD580];
          if (v39)
          {
            var3 = (unsigned int *)regionMap->var3;
            unint64_t v41 = v32 >> *MEMORY[0x1895FD580];
            do
            {
              if (*var3 <= (v41 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)var3 + ((v41 & 0x3FFFFFF) >> 3) + 4) >> (v41 & 7)) & 1) == 0)
              {
                goto LABEL_87;
              }

              v41 >>= 26;
            }

            while (v41);
          }

          unint64_t v42 = (char *)regionMap + 4 * (v39 & 0x7FFFF);
          int v45 = *((_DWORD *)v42 + 16);
          int v44 = v42 + 64;
          int v43 = v45;
          unint64_t var4 = regionMap->var4;
          if (v45)
          {
            unint64_t v47 = &var4[(unint64_t)(v43 - 1)];
            if (v32 - *((void *)v47->var0 + 1) < *((void *)v47->var0 + 2)) {
              goto LABEL_63;
            }
          }

          unint64_t var5 = regionMap->var5;
          if ((_DWORD)var5)
          {
            v57 = regionMap->var4;
            do
            {
              unint64_t v58 = var5 >> 1;
              unint64_t v47 = &v57[var5 >> 1];
              if (*((void *)v47->var0 + 1) <= v32)
              {
                if (*((void *)v47->var0 + 2) + *((void *)v47->var0 + 1) > v32)
                {
                  int v62 = [v47->var0 isSpecialPhysFootprintRegion];
                  if (v62) {
                    unint64_t v63 = 0LL;
                  }
                  else {
                    unint64_t v63 = (unint64_t)v47;
                  }
                  if ((v62 & 1) != 0) {
                    break;
                  }
                  if ((*(_BYTE *)(*(void *)v63 + 132LL) & 1) == 0) {
                    goto LABEL_102;
                  }
                  uint64_t v64 = (id *)(v63 + 64);
                  unint64_t v65 = regionMap->var5 - ((uint64_t)(v63 + 64 - (unint64_t)regionMap->var4) >> 6);
                  if (!v65) {
                    goto LABEL_99;
                  }
                  while (1)
                  {
                    unint64_t v66 = v65 >> 1;
                    uint64_t v67 = &v64[8 * (v65 >> 1)];
                    if (*((void *)*v67 + 1) <= v33)
                    {
                      if (*((void *)*v67 + 2) + *((void *)*v67 + 1) > v33)
                      {
                        unint64_t v69 = v63;
                        int v70 = [*v67 isSpecialPhysFootprintRegion];
                        unint64_t v63 = v69;
                        if (v70) {
                          unint64_t v65 = 0LL;
                        }
                        else {
                          unint64_t v65 = (unint64_t)v67;
                        }
LABEL_99:
                        if (v65) {
                          unint64_t v63 = v65;
                        }
                        unint64_t v47 = (_VMURegionNode *)v63;
LABEL_102:
                        *int v44 = ((v63 - (unint64_t)var4) >> 6) + 1;
LABEL_63:
                        v47->unint64_t var4 = v33;
                        unint64_t v48 = (uint64_t *)((char *)v47->var0 + 8);
                        uint64_t v49 = *v48;
                        unint64_t v50 = *((void *)v47->var0 + 2) + *v48;
                        v47->unint64_t var5 = v50;
                        for (unint64_t i = v47 - 1; i >= regions; v49 = v55)
                        {
                          var0 = i->var0;
                          unsigned int v54 = (uint64_t *)((char *)i->var0 + 8);
                          uint64_t v55 = *v54;
                          if (*((void *)i->var0 + 2) + *v54 != v49) {
                            break;
                          }
                          if (var0[26] != 30) {
                            break;
                          }
                          if (!var0[6]) {
                            break;
                          }
                          i->unint64_t var4 = 0LL;
                          i->unint64_t var5 = 0LL;
                          --i;
                        }

                        for (j = v47 + 1; j <= v30; ++j)
                        {
                          int v60 = j->var0;
                          int v61 = (char *)j->var0 + 8;
                          if (v50 != *v61) {
                            break;
                          }
                          if (v60[26] != 30) {
                            break;
                          }
                          if (!v60[6]) {
                            break;
                          }
                          j->unint64_t var4 = v50;
                          unint64_t v50 = v61[1] + *v61;
                          j->unint64_t var5 = v50;
                        }

                        -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v33, v50 - v33);
                        goto LABEL_87;
                      }

                      uint64_t v64 = v67 + 8;
                      unint64_t v66 = --v65 >> 1;
                    }

                    BOOL v68 = v65 > 1;
                    unint64_t v65 = v66;
                    if (!v68)
                    {
                      unint64_t v65 = 0LL;
                      goto LABEL_99;
                    }
                  }
                }

                v57 = v47 + 1;
                unint64_t v58 = --var5 >> 1;
              }

              BOOL v59 = var5 >= 2;
              unint64_t var5 = v58;
            }

            while (v59);
          }
        }
      }

void __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke( uint64_t a1,  unsigned int a2,  uint64_t a3,  uint64_t a4,  unsigned int a5)
{
  if (a5)
  {
    uint64_t v6 = a1;
    uint64_t v7 = 0LL;
    unsigned int v82 = a2;
    uint64_t v8 = a5;
    int v9 = (_DWORD *)MEMORY[0x1895FD580];
    uint64_t v10 = &unk_18C68A000;
    unsigned int v84 = a2;
    unsigned int v85 = a3;
    do
    {
      unint64_t v11 = (unint64_t *)(a4 + 16 * v7);
      uint64_t v12 = v11 + 1;
      if (v11[1])
      {
        uint64_t v13 = *(void *)(*(void *)(v6 + 32) + 128LL);
        unint64_t v14 = *(void *)(v13 + 48);
        unint64_t v15 = *(void *)(v13 + 56);
        BOOL v16 = v15 >= v14;
        unint64_t v17 = v15 - v14;
        if (v16)
        {
          unint64_t v18 = *v11;
          if (*v11 - v14 < v17)
          {
            unint64_t v19 = v18 >> *v9;
            if (v19)
            {
              char v20 = *(unsigned int **)(v13 + 24);
              unint64_t v21 = v18 >> *v9;
              do
              {
                if (*v20 <= (v21 & 0x3FFFFFF)
                  || ((*((unsigned __int8 *)v20 + ((v21 & 0x3FFFFFF) >> 3) + 4) >> (v21 & 7)) & 1) == 0)
                {
                  goto LABEL_70;
                }

                v21 >>= 26;
              }

              while (v21);
            }

            uint64_t v22 = v13 + 4 * (v19 & 0x7FFFF);
            int v25 = *(_DWORD *)(v22 + 64);
            v24 = (_DWORD *)(v22 + 64);
            int v23 = v25;
            uint64_t v26 = *(void *)(v13 + 32);
            if (v25)
            {
              unint64_t v27 = v26 + ((unint64_t)(v23 - 1) << 6);
              if (v18 - *(void *)(*(void *)v27 + 8LL) < *(void *)(*(void *)v27 + 16LL)) {
                goto LABEL_14;
              }
            }

            unint64_t v63 = *(unsigned int *)(v13 + 40);
            if ((_DWORD)v63)
            {
              unint64_t v64 = *(void *)(v13 + 32);
              do
              {
                unint64_t v65 = v63 >> 1;
                unint64_t v27 = v64 + (v63 >> 1 << 6);
                if (*(void *)(*(void *)v27 + 8LL) <= v18)
                {
                  if (*(void *)(*(void *)v27 + 16LL) + *(void *)(*(void *)v27 + 8LL) > v18)
                  {
                    int v66 = [*(id *)v27 isSpecialPhysFootprintRegion:a3 zone_index:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                    uint64_t v10 = (_BYTE *)&unk_18C68A000;
                    int v9 = (_DWORD *)MEMORY[0x1895FD580];
                    uint64_t v6 = a1;
                    a2 = v84;
                    a3 = v85;
                    if (v66) {
                      unint64_t v67 = 0LL;
                    }
                    else {
                      unint64_t v67 = v27;
                    }
                    if ((v66 & 1) == 0)
                    {
                      if ((*(_BYTE *)(*(void *)v67 + 132LL) & 1) == 0) {
                        goto LABEL_85;
                      }
                      BOOL v68 = (id *)(v67 + 64);
                      unint64_t v69 = *(unsigned int *)(v13 + 40) - ((uint64_t)(v67 + 64 - *(void *)(v13 + 32)) >> 6);
                      if (!v69) {
                        goto LABEL_82;
                      }
                      while (1)
                      {
                        unint64_t v70 = v69 >> 1;
                        unint64_t v71 = &v68[8 * (v69 >> 1)];
                        if (*((void *)*v71 + 1) <= v18)
                        {
                          if (*((void *)*v71 + 2) + *((void *)*v71 + 1) > v18)
                          {
                            unint64_t v72 = v67;
                            int v73 = [*v71 isSpecialPhysFootprintRegion:v85 zone_index:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                            unint64_t v67 = v72;
                            uint64_t v10 = (_BYTE *)&unk_18C68A000;
                            int v9 = (_DWORD *)MEMORY[0x1895FD580];
                            uint64_t v6 = a1;
                            a2 = v84;
                            a3 = v85;
                            if (v73) {
                              unint64_t v69 = 0LL;
                            }
                            else {
                              unint64_t v69 = (unint64_t)v71;
                            }
LABEL_82:
                            if (v69) {
                              unint64_t v27 = v69;
                            }
                            else {
                              unint64_t v27 = v67;
                            }
LABEL_85:
                            _DWORD *v24 = ((v27 - v26) >> 6) + 1;
LABEL_14:
                            unint64_t v28 = *v12 + *v11;
LABEL_15:
                            while (2)
                            {
                              uint64_t v29 = *(char **)v27;
                              if (v28 <= *(void *)(*(void *)v27 + 8LL)) {
                                goto LABEL_70;
                              }
                              *((_DWORD *)v29 + 37) = a2;
                              *((_DWORD *)v29 + 36) |= a3;
                              *(void *)(v27 + 24) = 0LL;
                              *(void *)(v27 + 32) = 0LL;
                              if (v10[2320])
                              {
                                v57 = (FILE **)MEMORY[0x1895F89D0];
                                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "zone %s ",  (const char *)objc_msgSend( objc_retainAutorelease(*(id *)(*(void *)(*(void *)(v6 + 32) + 224)
                                                                               + 24LL * v82
                                                                               + 8)),
                                                  "UTF8String"));
                                v81 = *v57;
                                uint64_t v79 = [*(id *)v27 address];
                                uint64_t v58 = *(unsigned int *)(*(void *)v27 + 24LL);
                                uint64_t v78 = *(void *)(*(void *)v27 + 16LL) + *(void *)(*(void *)v27 + 8LL);
                                unsigned int v77 = vm_prot_strings_0[v58];
                                id v76 = VMURegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*(void *)v27 + 104LL),  *(unsigned __int8 *)(*(void *)v27 + 50LL),  v58,  *(unsigned __int8 *)(*(void *)v27 + 49LL));
                                id v75 = (const char *)[v76 UTF8String];
                                uint64_t v59 = *(void *)(*(void *)v27 + 16LL) >> *MEMORY[0x1895FD580];
                                int v60 = "pages";
                                if (v59 == 1) {
                                  int v60 = "page";
                                }
                                uint64_t v74 = v60;
                                if (*(void *)(v27 + 24) == *(void *)(v27 + 32)) {
                                  int v61 = "";
                                }
                                else {
                                  int v61 = " [root]";
                                }
                                int v62 = VMUMallocRangeTypeString(v85);
                                fprintf( v81,  "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n",  v79,  v78,  v77,  v75,  v59,  v74,  v61,  v62,  *v11,  *v12 + *v11);

                                uint64_t v10 = (_BYTE *)&unk_18C68A000;
                                int v9 = (_DWORD *)MEMORY[0x1895FD580];
                                uint64_t v6 = a1;
                                a2 = v84;
                                a3 = v85;
                                uint64_t v29 = *(char **)v27;
                              }

                              uint64_t v30 = (uint64_t *)(v29 + 8);
                              uint64_t v32 = *v30;
                              uint64_t v31 = v30[1];
                              if (v28 <= v31 + v32) {
                                goto LABEL_70;
                              }
                              uint64_t v33 = *(void *)(*(void *)(v6 + 32) + 128LL);
                              unint64_t v34 = *(void *)(v33 + 48);
                              unint64_t v35 = *(void *)(v33 + 56);
                              BOOL v16 = v35 >= v34;
                              unint64_t v36 = v35 - v34;
                              if (!v16) {
                                goto LABEL_70;
                              }
                              v18 += v31;
                              if (v18 - v34 >= v36) {
                                goto LABEL_70;
                              }
                              unint64_t v37 = v18 >> *v9;
                              if (v37)
                              {
                                BOOL v38 = *(unsigned int **)(v33 + 24);
                                unint64_t v39 = v18 >> *v9;
                                while (*v38 > (v39 & 0x3FFFFFF)
                                     && ((*((unsigned __int8 *)v38 + ((v39 & 0x3FFFFFF) >> 3) + 4) >> (v39 & 7)) & 1) != 0)
                                {
                                  v39 >>= 26;
                                  if (!v39) {
                                    goto LABEL_26;
                                  }
                                }

                                goto LABEL_70;
                              }

- (void)addRootNodesFromTask
{
}

- (id)_readonlyRegionRanges
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___VMUNonOverlappingRangeArray);
  if (self->_regionsCount)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = self->_regions[v4].var0;
      if (([v6 protection] & 1) != 0
        && ([v6 isSubmap] & 1) == 0
        && ([v6 protection] & 2) == 0
        && (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v6[1], v6[2])
         || (*((_BYTE *)v6 + 132) & 2) != 0))
      {
        -[VMUNonOverlappingRangeArray addOrExtendRange:](v3, "addOrExtendRange:", v6[1], v6[2]);
      }

      ++v5;
      ++v4;
    }

    while (v5 < self->_regionsCount);
  }

  return v3;
}

- (unsigned)objectContentLevel
{
  return -[VMUObjectIdentifier objectContentLevel](self->_objectIdentifier, "objectContentLevel");
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  if (a3 == 2 && self->_regionsCount)
  {
    if (self->_objectIdentifier)
    {
      -[VMUKernelCoreMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v5);
    }
  }

- (void)_sortBlocks
{
}

uint64_t __41__VMUKernelCoreMemoryScanner__sortBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (void)_enumerateZallocZones:(BOOL)a3 blocks:(BOOL)a4
{
  BOOL v77 = a4;
  BOOL v4 = a3;
  uint64_t v88 = *MEMORY[0x1895F89C0];
  unsigned int v85 = 0LL;
  uint64_t v86 = 0LL;
  uint64_t v84 = 0LL;
  CSSymbolicatorGetAOutSymbolOwner();
  CSSymbolOwnerGetSymbolWithName();
  uint64_t Range = CSSymbolGetRange();
  unint64_t v8 = v7;
  uint64_t v73 = Range;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
  int v9 = v86;
  CSSymbolOwnerGetSymbolWithName();
  uint64_t v10 = CSSymbolGetRange();
  unint64_t v12 = v11;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:]( self->_memoryCache,  "peekAtAddress:size:returnsBuf:",  v10,  v11,  &v85);
  CSSymbolOwnerGetSymbolWithName();
  uint64_t v13 = CSSymbolGetRange();
  unint64_t v15 = v14;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:]( self->_memoryCache,  "peekAtAddress:size:returnsBuf:",  v13,  v14,  &v84);
  BOOL v16 = v86;
  if (!v86 || !v85 || !v84 || v8 >> 9 < 0x159 || v12 < 0x70 || v15 < 0xAC8) {
    return;
  }
  if (v4)
  {
    -[NSMutableArray addObject:](self->_zoneNames, "addObject:", @"zalloc (no zone)");
    uint64_t zonesSize = self->_zonesSize;
    if (zonesSize >= 2)
    {
      zones = self->_zones;
    }

    else
    {
      self->_uint64_t zonesSize = 8;
      unint64_t v18 = (_VMUZoneNode *)realloc(self->_zones, 0xC0uLL);
      self->_zones = v18;
      if (!v18)
      {
        NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_zones",  zonesSize,  self->_zonesSize);
        goto LABEL_91;
      }

      zones = v18;
      bzero(&v18[zonesSize], 24LL * (self->_zonesSize - zonesSize));
    }

    char v20 = &zones[self->_zonesCount];
    v20->var0 = v73;
    v20->var1 = @"zalloc (no zone)";
    v20->var2 = 0LL;
    ++self->_zonesCount;
    BOOL v16 = v86;
  }

  unint64_t v21 = (unint64_t)v9 + v8;
  uint64_t v22 = 0LL;
  int v23 = (void *)MEMORY[0x1895FD590];
  v24 = v16;
  unint64_t v64 = v21;
  while (!*v16)
  {
LABEL_34:
    ++v22;
    v24 = v86;
    BOOL v16 = &v86[32 * v22];
  }

  uint64_t v25 = v84 + 4 * v22;
  uint64_t v66 = v22;
  uint64_t v26 = -[VMUTaskMemoryCache peekStringAtAddress:](self->_memoryCache, "peekStringAtAddress:", v24[32 * v22 + 2]);
  v87[0] = xmmword_189DFD6D8;
  v87[1] = *(_OWORD *)off_189DFD6E8;
  if (v26) {
    [NSString stringWithFormat:@"%@%s", *((void *)v87 + (*(_BYTE *)(v25 + 1) & 3)), v26];
  }
  else {
    [NSString stringWithFormat:@"UnknownZone (%#llx)", (char *)v16 + v73 - (char *)v86, v63];
  }
  unint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 24LL; i != -8; i -= 8LL)

  if (v4)
  {
    unint64_t v28 = (char *)v86;
    unsigned int zonesCount = self->_zonesCount;
    uint64_t blocksSize = self->_zonesSize;
    if (blocksSize > zonesCount)
    {
LABEL_29:
      -[NSMutableArray addObject:](self->_zoneNames, "addObject:", v72);
      unint64_t v34 = &self->_zones[self->_zonesCount];
      v34->var0 = (char *)v16 + v73 - v28;
      v34->var1 = v72;
      v34->var2 = 0LL;
      if ((*(_WORD *)v25 & 0x4000) != 0 || (*(_WORD *)v25 & 0x300) == 0x200) {
        -[NSMutableSet addObject:](self->_nonScannableZoneNames, "addObject:", v72);
      }
      ++self->_zonesCount;
LABEL_33:
      unint64_t v21 = v64;

      uint64_t v22 = v66;
      goto LABEL_34;
    }

    else {
      int v31 = 2 * blocksSize;
    }
    do
    {
      unsigned int v32 = v31;
      v31 *= 2;
    }

    while (v32 < zonesCount);
    self->_uint64_t zonesSize = v32;
    uint64_t v33 = (_VMUZoneNode *)realloc(self->_zones, 24LL * v32);
    self->_zones = v33;
    if (v33)
    {
      bzero(&v33[blocksSize], 24LL * (self->_zonesSize - blocksSize));
      goto LABEL_29;
    }

    uint64_t v61 = self->_zonesSize;
    int v62 = "_zones";
LABEL_90:
    NSLog(@"Out of memory: failed to expand %s from %u to %u entries", v62, blocksSize, v61);
LABEL_91:
    abort();
  }

  uint64_t v35 = -[NSMutableArray indexOfObject:](self->_zoneNames, "indexOfObject:", v72);
  uint64_t v36 = 0LL;
  unint64_t v37 = (unsigned __int16 *)&v24[32 * v66];
  *(void *)&v87[0] = v37 + 78;
  *((void *)&v87[0] + 1) = v37 + 80;
  unint64_t v69 = v37 + 26;
  BOOL v68 = v37 + 29;
  unint64_t v71 = v37 + 27;
  v81 = v37 + 30;
  unint64_t v67 = v37 + 28;
  uint64_t v70 = v35 << 41;
  char v38 = 1;
  while (2)
  {
    char v65 = v38;
    int v39 = **((_DWORD **)v87 + v36);
    if (!v39) {
      goto LABEL_85;
    }
LABEL_38:
    unint64_t v40 = (((*(void *)&v39 | 0xFFFFFFFF00000000LL) << *MEMORY[0x1895FD580]) - *v85) >> *MEMORY[0x1895FD580];
    uint64_t v41 = v85[4];
    unint64_t v83 = 0LL;
    uint64_t v74 = v41 + 16 * v40;
    -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
    unint64_t v42 = v83;
    if (v83)
    {
      int v43 = *(_DWORD *)v81;
      if ((*(_DWORD *)v81 & 0x100) != 0)
      {
        uint64_t v79 = (unsigned __int16)v83[2];
        unsigned int v44 = 1;
        if ((v43 & 0x40) == 0) {
          goto LABEL_43;
        }
LABEL_41:
        unsigned int v45 = *v67;
      }

      else
      {
        uint64_t v79 = *v69;
        unsigned int v44 = *v68;
        if ((v43 & 0x40) != 0) {
          goto LABEL_41;
        }
LABEL_43:
        unsigned int v45 = 1;
      }

      unsigned int v78 = v45;
      if (!v44) {
        goto LABEL_84;
      }
      unint64_t v46 = 0LL;
      unint64_t v80 = *v85 + *v23 * v40;
      unint64_t v75 = v80 + *v71;
      if (v45 <= 1) {
        uint64_t v47 = 1LL;
      }
      else {
        uint64_t v47 = v45;
      }
      uint64_t v48 = v44;
      char v49 = !v77;
      if (!v45) {
        char v49 = 1;
      }
      char v76 = v49;
LABEL_51:
      if ((*((_BYTE *)v81 + 1) & 1) != 0)
      {
        if ((v76 & 1) == 0) {
          goto LABEL_72;
        }
      }

      else
      {
        if (v80 >= v85[10])
        {
          unint64_t v50 = v83;
          if (v80 > v85[11]) {
            goto LABEL_57;
          }
          BOOL v51 = (*v83 & 0xF000) == 40960;
        }

        else
        {
          unint64_t v50 = v83;
LABEL_57:
          if ((*v50 & 0x800) != 0)
          {
            unint64_t v82 = 0LL;
            -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:]( self->_memoryCache,  "peekAtAddress:size:returnsBuf:",  v74 + ((v46 >> 1) & 0x3FFFFFF0),  16LL,  &v82);
            if (!v82) {
              break;
            }
            BOOL v51 = ((*(_DWORD *)(v82 + 4) >> v46) & 1) == 0;
          }

          else
          {
            -[VMUTaskMemoryCache readPointerAt:value:]( self->_memoryCache,  "readPointerAt:value:",  v85[6] + ((v46 >> 3) & 0xFFFFFF8) + 8LL * (*((_DWORD *)v50 + 1) & 0xFFFFFFF),  &v82);
            BOOL v51 = ((v82 >> v46) & 1) == 0;
          }
        }

        if (v51 && v77 && v78 != 0)
        {
LABEL_72:
          uint64_t v55 = 0LL;
          unsigned int blocksCount = self->_blocksCount;
          do
          {
            uint64_t blocksSize = self->_blocksSize;
            if (blocksSize <= blocksCount)
            {
              else {
                int v58 = 2 * blocksSize;
              }
              do
              {
                unsigned int v59 = v58;
                v58 *= 2;
              }

              while (v59 < blocksCount);
              self->_uint64_t blocksSize = v59;
              blocks = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v59);
              self->_blocks = blocks;
              if (!blocks)
              {
                uint64_t v61 = self->_blocksSize;
                int v62 = "_blocks";
                goto LABEL_90;
              }

              unsigned int blocksCount = self->_blocksCount;
            }

            else
            {
              blocks = self->_blocks;
            }

            int v60 = &blocks[blocksCount];
            v60->var0 = v75 + v46 * v79 + *v23 * v55;
            *((void *)v60 + 1) = v70 | (32 * v79) | 9;
            unsigned int blocksCount = self->_blocksCount + 1;
            self->_unsigned int blocksCount = blocksCount;
            ++v55;
          }

          while (v55 != v47);
        }
      }

      if (++v46 == v48)
      {
        unint64_t v42 = v83;
        BOOL v4 = 0;
LABEL_84:
        int v39 = *((_DWORD *)v42 + 2);
        if (!v39)
        {
LABEL_85:
          char v38 = 0;
          uint64_t v36 = 1LL;
          if ((v65 & 1) == 0) {
            goto LABEL_33;
          }
          continue;
        }

        goto LABEL_38;
      }

      goto LABEL_51;
    }

    break;
  }
}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  return 1;
}

- (void)addMallocNodesFromTask
{
}

- (void)addMallocNodes:(id)a3
{
  unint64_t v18 = a3;
  if ([v18 count])
  {
    uint64_t blocksSize = self->_blocksSize;
    id v5 = v18;
    int v6 = v18[2];
    unsigned int v7 = self->_blocksCount - 1;
    if (blocksSize <= v7 + v6)
    {
      else {
        unsigned int v8 = 2 * blocksSize;
      }
      do
      {
        unsigned int v9 = v8;
        self->_uint64_t blocksSize = v8;
        v8 *= 2;
      }

      while (v9 < v7 + v18[2]);
      uint64_t v10 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v9);
      self->_blocks = v10;
      if (!v10)
      {
        NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  blocksSize,  self->_blocksSize);
        abort();
      }

      id v5 = v18;
      int v6 = v18[2];
    }

    if (v6)
    {
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      unsigned int blocksCount = self->_blocksCount;
      do
      {
        unint64_t v14 = (unint64_t *)(*((void *)v5 + 2) + v11);
        unint64_t v16 = *v14;
        unint64_t v15 = v14[1];
        unint64_t v17 = &self->_blocks[blocksCount];
        if (v15 >= 0xFFFFFFFFFLL) {
          unint64_t v15 = 0xFFFFFFFFFLL;
        }
        v17->var0 = v16;
        *((void *)v17 + 1) = (32 * v15) | 1;
        unsigned int blocksCount = self->_blocksCount + 1;
        self->_unsigned int blocksCount = blocksCount;
        ++v12;
        v11 += 16LL;
      }

      while (v12 < v5[2]);
    }

    -[VMUKernelCoreMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  }
}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  BOOL v5 = -[VMUKernelCoreMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5) {
    LOBYTE(v5) = -[VMUKernelCoreMemoryScanner addMallocNodesFromTaskWithError:]( self,  "addMallocNodesFromTaskWithError:",  a3);
  }
  return v5;
}

- (void)_sortAndClassifyBlocks
{
}

- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4
{
  classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  if (!classStructureAddressToDestinationMapTable)
  {
    [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:1282];
    unsigned int v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    unsigned int v9 = self->_classStructureAddressToDestinationMapTable;
    self->_classStructureAddressToDestinationMapTable = v8;

    classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  }

  NSMapInsert(classStructureAddressToDestinationMapTable, a3, a4);
}

- (void)printRuntimeMetadataInfo
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v28[3] = &unk_189DFD700;
  v28[4] = self;
  unint64_t v3 = (void (**)(void, void, void, void))MEMORY[0x186E33044](v28, a2);
  -[NSMutableDictionary allKeys](self->_addressToRuntimeMetadataChunkInfoDict, "allKeys");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 sortedArrayUsingSelector:sel_compare_];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0LL;
    unint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v25;
    uint64_t v22 = v3;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:]( self->_addressToRuntimeMetadataChunkInfoDict,  "objectForKeyedSubscript:",  v13);
        unint64_t v14 = (id *)objc_claimAutoreleasedReturnValue();
        unint64_t v15 = [v13 unsignedLongLongValue];
        unint64_t v16 = &self->_blocks[v10];
        if (v15 >= ((*((void *)v16 + 1) >> 5) & 0xFFFFFFFFFLL) + v16->var0)
        {
          uint64_t v10 = -[VMUKernelCoreMemoryScanner nodeForAddress:](self, "nodeForAddress:", v15);
          char v20 = v14;

          unsigned int v8 = v20;
          unint64_t v9 = v15;
        }

        else
        {
          if (v9)
          {
            uint64_t v17 = v11;
            else {
              unint64_t v18 = "Metadata";
            }
            putchar(10);
            unint64_t v19 = &self->_blocks[v10];
            unint64_t v21 = v18;
            uint64_t v11 = v17;
            unint64_t v3 = v22;
            printf( "%s %#llx-%#llx[%llu]\n",  v21,  v19->var0,  ((*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL) + v19->var0,  (*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL);
            ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v9, v8);

            unsigned int v8 = 0LL;
          }

          ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v15, v14);
          unint64_t v9 = 0LL;
        }
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v7);
  }

  else
  {
    unsigned int v8 = 0LL;
  }
}

void __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke( uint64_t a1,  unsigned int a2,  uint64_t a3,  unsigned int *a4)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unsigned int v8 = (char *)&VMUObjCClassStructureTypeInfoArray + 24 * a4[3];
  int v9 = *((_DWORD *)v8 + 4);
  strchr(*((const char **)v8 + 1), 40);
  uint64_t v10 = a4;
  __strcpy_chk();
  *strchr(__s, 41) = 0;
  uint64_t v11 = a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * a2);
  if (*((_BYTE *)v10 + 8)) {
    unint64_t v12 = "metaclass";
  }
  else {
    unint64_t v12 = "class";
  }
  uint64_t v13 = (void *)*((void *)v10 + 2);

  id v14 = [v13 className];
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)[v14 UTF8String]);
}

- (void)_fixupBlockIsas
{
  unint64_t blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    unint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    LODWORD(v7) = -1;
    unsigned int v8 = &unk_18C68A000;
    int v9 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      blocks = self->_blocks;
      unint64_t v11 = *((void *)&blocks[v4] + 1);
      if ((v11 & 7) == 1)
      {
        unint64_t var0 = blocks[v4].var0;
        if (var0 >= v6)
        {
          uint64_t v13 = ((uint64_t)(int)v7 << 6) + 64;
          uint64_t v14 = (int)v7 + 1LL;
          do
          {
            if (v14 >= (int)self->_regionsCount)
            {
              unint64_t v5 = -1LL;
              unint64_t v6 = -1LL;
            }

            else
            {
              unint64_t v15 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v13) + 8);
              unint64_t v5 = *v15;
              unint64_t v6 = (*(void **)((char *)&self->_regions->var0 + v13))[2] + *v15;
            }

            LODWORD(v7) = v7 + 1;
            v13 += 64LL;
            ++v14;
          }

          while (var0 >= v6);
        }

        unint64_t v16 = var0 + ((v11 >> 5) & 0xFFFFFFFFFLL);
        if (v16 > v5)
        {
          uint64_t v17 = (uint64_t)(int)v7 << 6;
          uint64_t v7 = (int)v7;
          regions = self->_regions;
          do
          {
            unint64_t v19 = self->_blocks;
            char v20 = &v19[v4];
            unint64_t v21 = *((void *)v20 + 1);
            if ((v21 & 0x18) == 8)
            {
              if (v8[2320])
              {
                int v23 = (*(_DWORD **)((char *)&regions->var0 + v17))[37];
                unint64_t v24 = v21 >> 41;
                if (v23 != -1 && v23 != (_DWORD)v24)
                {
                  fprintf( *v9, "warning: zone fixup failed - block %#llx from zone %s discovered in region [%#llx-%#llx] already claimed by %s\n", v20->var0, (const char *)[self->_zones[v24].var1 UTF8String], v5, v6, (const char *)objc_msgSend( self->_zones[(*(unsigned int **)((char *)&self->_regions->var0 + v17))[37]].var1, "UTF8String"));
                  int v9 = (FILE **)MEMORY[0x1895F89D0];
                  unsigned int v8 = (_BYTE *)&unk_18C68A000;
                  unint64_t v19 = self->_blocks;
                  unint64_t v21 = *((void *)&v19[v4] + 1);
                  regions = self->_regions;
                }
              }

              (*(_DWORD **)((char *)&regions->var0 + v17))[37] = v21 >> 41;
              *((void *)&v19[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((void *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7LL;
              regions = self->_regions;
            }

            uint64_t v22 = *(uint64_t *)((char *)&regions->var0 + v17);
            *(_DWORD *)(v22 + 144) |= 1u;
            ++*(void *)(v22 + 136);
            if (v16 <= v6) {
              break;
            }
            if (++v7 >= (int)self->_regionsCount)
            {
              unint64_t v6 = -1LL;
              unint64_t v5 = -1LL;
              break;
            }

            unint64_t v5 = (*(void **)((char *)&regions[1].var0 + v17))[1];
            unint64_t v6 = (*(void **)((char *)&regions[1].var0 + v17))[2] + v5;
            v17 += 64LL;
          }

          while (v16 > v5);
          unint64_t blocksCount = self->_blocksCount;
        }
      }

      ++v4;
    }

    while (v4 < blocksCount);
  }

  self->_initializedRegionMallocBlockCounts = 1;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier swiftRuntimeInfoStableABI](self->_objectIdentifier, "swiftRuntimeInfoStableABI");
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }

  else
  {
    -[VMUObjectIdentifier swiftRuntimeInfoPreABI](self->_objectIdentifier, "swiftRuntimeInfoPreABI");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v30 = v29;

  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3221225472LL;
  v33[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke;
  v33[3] = &unk_189DFD198;
  id v34 = v30;
  id v35 = v26;
  v33[4] = self;
  id v31 = v30;
  id v32 = v26;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v33);
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUKernelCoreMemoryScanner _identifyNonObjectsPointedToByTypedIvars:]( self,  "_identifyNonObjectsPointedToByTypedIvars:",  -[VMUClassInfoMap count](self->_classInfoIndexer, "count"));
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUKernelCoreMemoryScanner _identifyNonObjectsUsingStackBacktrace](self, "_identifyNonObjectsUsingStackBacktrace");
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_98);
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 8LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      if ((*(void *)(*(void *)(v2 + 96) + v6) & 0xFFFFFE0000000007LL) == 1)
      {
        v8[0] = v7;
        v8[1] = 3221225472LL;
        v8[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2;
        v8[3] = &unk_189DFD170;
        void v8[4] = v2;
        int v11 = v5;
        id v10 = *(id *)(a1 + 48);
        id v9 = *(id *)(a1 + 40);
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1LL, v8);

        uint64_t v2 = *(void *)(a1 + 32);
      }

      ++v5;
      v6 += 16LL;
    }

    while (v5 < *(unsigned int *)(v2 + 104));
  }

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x186E32E40]();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 96);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(void *)(v6 + 16 * v7))) {
    BOOL v8 = (*(void *)(v6 + 16 * v7) & 7LL) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8
    && (objc_msgSend( *(id *)(v5 + 80),  "classInfoForMemory:length:remoteAddress:",  a2,  (*(void *)(v6 + 16 * v7 + 8) >> 5) & 0xFFFFFFFFFLL),  (id v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    if ([v9 hasSpecificLayout])
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v10];
      unint64_t v12 = *(void **)(*(void *)(a1 + 32) + 512LL);
      [MEMORY[0x189607968] numberWithUnsignedInt:v11];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectForKeyedSubscript:v13];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        uint64_t v14 = (void *)objc_opt_new();
        unint64_t v15 = *(void **)(*(void *)(a1 + 32) + 512LL);
        [MEMORY[0x189607968] numberWithUnsignedInt:v11];
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setObject:v14 forKeyedSubscript:v16];
      }

      uint64_t v17 = (void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 56));
      uint64_t v18 = [v10 instanceSpecificInfoForObject:*v17 ofSize:v17[1] >> 5 withScanner:v17[1] >> 5 memoryReader:v17[1] >> 5];

      id v10 = (void *)v18;
    }

    unint64_t v19 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v31[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3;
    v31[3] = &unk_189DFD120;
    uint64_t v21 = MEMORY[0x1895F87A8];
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    uint64_t v36 = a2;
    id v32 = v10;
    id v22 = v19;
    uint64_t v23 = *(void *)(a1 + 32);
    id v33 = v22;
    uint64_t v34 = v23;
    id v35 = *(id *)(a1 + 48);
    id v24 = v10;
    [v24 enumerateSublayoutsForSize:v20 withBlock:v31];
    unsigned int v25 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v24];
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 56);
    *(void *)(v26 + 8) = *(void *)(v26 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v25 << 41);
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(*(void *)(v27 + 96) + 16LL * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v30[0] = v21;
    v30[1] = 3221225472LL;
    v30[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4;
    v30[3] = &unk_189DFD148;
    v30[4] = v27;
    [v24 enumerateExternalValuesFromObject:a2 withSize:v28 block:v30];
  }

  else
  {
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 56);
    *(void *)(v29 + 8) &= 0x1FFFFFFFFFFuLL;
  }

  objc_autoreleasePoolPop(v4);
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3( uint64_t a1,  void *a2,  unsigned int a3,  int a4)
{
  unint64_t v6 = *(void *)(*(void *)(a1 + 64) + a3);
  if (a4 == 3)
  {
    v6 &= ~1uLL;
  }

  else if (a4 == 5)
  {
    BOOL v8 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    id v10 = v8;
    if (v10)
    {
      if ([v9 usesSwiftRefcounting] && objc_msgSend(v9, "pointerSize") == a3)
      {
        id v11 = v10;
        uint64_t v12 = [v11 refcountIsSideTableMarkerMask] & v6;
        if (v12 == [v11 refcountIsSideTableMarkerValue])
        {
          unint64_t v13 = [v11 sideTablePointerMask] & v6;
          unint64_t v14 = v13 >> [v11 sideTablePointerRightShift];
          unint64_t v6 = v14 << [v11 sideTablePointerLeftShift];
        }

        else
        {
          unint64_t v6 = 0LL;
        }
      }

      else
      {
        v6 &= [v10 nativeWeakReferencePointerMask];
      }
    }
  }

  if (HIDWORD(v6)) {
    BOOL v15 = (v6 & 7) == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15) {
    return;
  }
  unint64_t v16 = *(uint64_t **)(*(void *)(a1 + 48) + 128LL);
  unint64_t v18 = v16[6];
  unint64_t v17 = v16[7];
  unint64_t v19 = v17 - v18;
  BOOL v20 = v17 < v18;
  if (v6 - v18 >= v19 || v20) {
    return;
  }
  uint64_t v21 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v22 = v6 >> *MEMORY[0x1895FD580];
  if (v22)
  {
    uint64_t v23 = (unsigned int *)v16[3];
    unint64_t v24 = v6 >> *MEMORY[0x1895FD580];
    do
    {
      if (*v23 <= (v24 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
      {
        return;
      }

      v24 >>= 26;
    }

    while (v24);
  }

  uint64_t v25 = (uint64_t)v16 + 4 * (v22 & 0x7FFFF);
  int v28 = *(_DWORD *)(v25 + 64);
  uint64_t v27 = (_DWORD *)(v25 + 64);
  int v26 = v28;
  uint64_t v29 = v16[4];
  if (v28)
  {
    unint64_t v30 = v29 + ((unint64_t)(v26 - 1) << 6);
    if (v6 - *(void *)(*(void *)v30 + 8LL) < *(void *)(*(void *)v30 + 16LL)) {
      goto LABEL_27;
    }
  }

  unint64_t v47 = *((unsigned int *)v16 + 10);
  if (!(_DWORD)v47) {
    return;
  }
  unint64_t v48 = v16[4];
  while (1)
  {
    unint64_t v49 = v47 >> 1;
    unint64_t v30 = v48 + (v47 >> 1 << 6);
    if (*(void *)(*(void *)v30 + 8LL) <= v6) {
      break;
    }
LABEL_50:
    BOOL v45 = v47 >= 2;
    unint64_t v47 = v49;
    if (!v45) {
      return;
    }
  }

  if (*(void *)(*(void *)v30 + 16LL) + *(void *)(*(void *)v30 + 8LL) <= v6)
  {
    unint64_t v48 = v30 + 64;
    unint64_t v49 = --v47 >> 1;
    goto LABEL_50;
  }

  int v50 = [*(id *)v30 isSpecialPhysFootprintRegion];
  if (v50) {
    unint64_t v51 = 0LL;
  }
  else {
    unint64_t v51 = v30;
  }
  if ((v50 & 1) != 0) {
    return;
  }
  if ((*(_BYTE *)(*(void *)v51 + 132LL) & 1) == 0) {
    goto LABEL_83;
  }
  unint64_t v52 = (id *)(v51 + 64);
  unint64_t v53 = *((unsigned int *)v16 + 10) - ((uint64_t)(v51 + 64 - v16[4]) >> 6);
  if (!v53) {
    goto LABEL_80;
  }
  while (2)
  {
    unint64_t v54 = v53 >> 1;
    uint64_t v55 = &v52[8 * (v53 >> 1)];
    if (*((void *)*v55 + 1) > v6)
    {
LABEL_61:
      BOOL v56 = v53 > 1;
      unint64_t v53 = v54;
      if (!v56)
      {
        unint64_t v53 = 0LL;
        goto LABEL_80;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v55 + 2) + *((void *)*v55 + 1) <= v6)
  {
    unint64_t v52 = v55 + 8;
    unint64_t v54 = --v53 >> 1;
    goto LABEL_61;
  }

  else {
    unint64_t v53 = (unint64_t)v55;
  }
LABEL_80:
  if (v53) {
    unint64_t v51 = v53;
  }
  unint64_t v30 = v51;
LABEL_83:
  *uint64_t v27 = ((v51 - v29) >> 6) + 1;
LABEL_27:
  unsigned int v31 = *(_DWORD *)(v30 + 20);
  if (v31)
  {
    uint64_t v32 = *(void *)(v30 + 8);
    uint64_t v33 = *v16;
    uint64_t v34 = *(unsigned int *)(v30 + 16);
    id v35 = (unint64_t *)(*v16 + 16 * v34);
    if (v32)
    {
      if (*v35 > v6) {
        return;
      }
      uint64_t v36 = (void *)(v33 + 16LL * (v31 + v34 - 1));
      if (((v36[1] >> 5) & 0xFFFFFFFFFuLL) + *v36 <= v6) {
        return;
      }
      unint64_t v37 = (unsigned int *)(v32 + 4 * ((v6 - (*v35 & -*MEMORY[0x1895FD590])) >> *v21));
      uint64_t v38 = *v37;
      int v39 = (unint64_t *)(v33 + 16 * v38);
      if (*v39 > v6) {
        return;
      }
      uint64_t v40 = v37[1];
      if (v40 < *((_DWORD *)v16 + 2)
        && (v41 = (unint64_t *)(v33 + 16 * v40), unint64_t v42 = *v41, *v41 <= v6))
      {
LABEL_63:
        unint64_t v57 = v41[1];
        if ((v57 & 7) - 2 < 3) {
          return;
        }
        unint64_t v58 = (unint64_t)v41 - v33;
        unint64_t v59 = v58 >> 4;
        unint64_t v60 = v6 - v42;
        unint64_t v61 = v16[2];
        if (v60 >= v61)
        {
          if (((v57 >> 5) & 0xFFFFFFFFFLL) - v60 > v61 || (_DWORD)v59 == -1) {
            return;
          }
        }

        else if ((_DWORD)v59 == -1)
        {
          return;
        }

        uint64_t v63 = *(void *)(*(void *)(a1 + 48) + 96LL);
        if (v63)
        {
          uint64_t v64 = (v58 >> 4);
          if (*(void *)(v63 + 16 * v64) == v6)
          {
            uint64_t v65 = v63 + 16 * v64;
            uint64_t v67 = *(void *)(v65 + 8);
            uint64_t v66 = (unint64_t *)(v65 + 8);
            if ((v67 & 7) == 1)
            {
              BOOL v68 = (void *)MEMORY[0x186E32E40]();
              [a2 instanceSpecificInfoForObject:v6 ofSize:*v66 >> 5 withScanner:*(void *)(a1 + 48) memoryReader:*(void *)(a1 + 56)];
              unint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69) {
                unint64_t *v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)[*(id *)(*(void *)(a1 + 48) + 288) indexForClassInfo:v69] << 41);
              }

              objc_autoreleasePoolPop(v68);
            }
          }
        }
      }

      else
      {
        unsigned int v43 = v40 - v38;
        if (v43)
        {
          do
          {
            uint64_t v44 = v43 >> 1;
            uint64_t v41 = &v39[2 * v44];
            unint64_t v42 = *v41;
            if (*v41 <= v6)
            {
              if (((v39[2 * v44 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
                goto LABEL_63;
              }
              int v39 = v41 + 2;
              LODWORD(v44) = --v43 >> 1;
            }

            BOOL v45 = v43 >= 2;
            unsigned int v43 = v44;
          }

          while (v45);
        }
      }
    }

    else
    {
      do
      {
        uint64_t v46 = v31 >> 1;
        uint64_t v41 = &v35[2 * v46];
        unint64_t v42 = *v41;
        if (*v41 <= v6)
        {
          if (((v35[2 * v46 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
            goto LABEL_63;
          }
          id v35 = v41 + 2;
          LODWORD(v46) = --v31 >> 1;
        }

        BOOL v45 = v31 >= 2;
        unsigned int v31 = v46;
      }

      while (v45);
    }
  }

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4( uint64_t a1,  unint64_t a2,  void *a3)
{
  id v5 = a3;
  unint64_t v6 = *(uint64_t **)(*(void *)(a1 + 32) + 128LL);
  unint64_t v8 = v6[6];
  unint64_t v7 = v6[7];
  unint64_t v9 = v7 - v8;
  BOOL v10 = v7 < v8;
  if (a2 - v8 >= v9 || v10) {
    goto LABEL_73;
  }
  id v11 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v12 = a2 >> *MEMORY[0x1895FD580];
  if (v12)
  {
    unint64_t v13 = (unsigned int *)v6[3];
    unint64_t v14 = a2 >> *MEMORY[0x1895FD580];
    do
    {
      if (*v13 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v13 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_73;
      }

      v14 >>= 26;
    }

    while (v14);
  }

  uint64_t v15 = (uint64_t)v6 + 4 * (v12 & 0x7FFFF);
  int v18 = *(_DWORD *)(v15 + 64);
  unint64_t v17 = (_DWORD *)(v15 + 64);
  int v16 = v18;
  uint64_t v19 = v6[4];
  if (v18)
  {
    unint64_t v20 = v19 + ((unint64_t)(v16 - 1) << 6);
    if (a2 - *(void *)(*(void *)v20 + 8LL) < *(void *)(*(void *)v20 + 16LL)) {
      goto LABEL_10;
    }
  }

  unint64_t v37 = *((unsigned int *)v6 + 10);
  if (!(_DWORD)v37) {
    goto LABEL_73;
  }
  unint64_t v38 = v6[4];
  while (1)
  {
    unint64_t v39 = v37 >> 1;
    unint64_t v20 = v38 + (v37 >> 1 << 6);
    if (*(void *)(*(void *)v20 + 8LL) <= a2) {
      break;
    }
LABEL_33:
    BOOL v35 = v37 >= 2;
    unint64_t v37 = v39;
    if (!v35) {
      goto LABEL_73;
    }
  }

  if (*(void *)(*(void *)v20 + 16LL) + *(void *)(*(void *)v20 + 8LL) <= a2)
  {
    unint64_t v38 = v20 + 64;
    unint64_t v39 = --v37 >> 1;
    goto LABEL_33;
  }

  id v66 = v5;
  int v40 = [*(id *)v20 isSpecialPhysFootprintRegion];
  id v5 = v66;
  if (v40) {
    unint64_t v41 = 0LL;
  }
  else {
    unint64_t v41 = v20;
  }
  if ((v40 & 1) != 0) {
    goto LABEL_73;
  }
  if ((*(_BYTE *)(*(void *)v41 + 132LL) & 1) == 0) {
    goto LABEL_64;
  }
  unint64_t v42 = (id *)(v41 + 64);
  unint64_t v43 = *((unsigned int *)v6 + 10) - ((uint64_t)(v41 + 64 - v6[4]) >> 6);
  if (!v43) {
    goto LABEL_61;
  }
  while (2)
  {
    unint64_t v44 = v43 >> 1;
    BOOL v45 = &v42[8 * (v43 >> 1)];
    if (*((void *)*v45 + 1) > a2)
    {
LABEL_44:
      BOOL v46 = v43 > 1;
      unint64_t v43 = v44;
      if (!v46)
      {
        unint64_t v43 = 0LL;
        goto LABEL_61;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v45 + 2) + *((void *)*v45 + 1) <= a2)
  {
    unint64_t v42 = v45 + 8;
    unint64_t v44 = --v43 >> 1;
    goto LABEL_44;
  }

  int v59 = [*v45 isSpecialPhysFootprintRegion];
  id v5 = v66;
  if (v59) {
    unint64_t v43 = 0LL;
  }
  else {
    unint64_t v43 = (unint64_t)v45;
  }
LABEL_61:
  if (v43) {
    unint64_t v41 = v43;
  }
  unint64_t v20 = v41;
LABEL_64:
  *unint64_t v17 = ((v41 - v19) >> 6) + 1;
LABEL_10:
  unsigned int v21 = *(_DWORD *)(v20 + 20);
  if (v21)
  {
    uint64_t v22 = *(void *)(v20 + 8);
    uint64_t v23 = *v6;
    uint64_t v24 = *(unsigned int *)(v20 + 16);
    uint64_t v25 = (unint64_t *)(*v6 + 16 * v24);
    if (v22)
    {
      if (*v25 > a2) {
        goto LABEL_73;
      }
      int v26 = (void *)(v23 + 16LL * (v21 + v24 - 1));
      if (((v26[1] >> 5) & 0xFFFFFFFFFuLL) + *v26 <= a2) {
        goto LABEL_73;
      }
      uint64_t v27 = (unsigned int *)(v22 + 4 * ((a2 - (*v25 & -*MEMORY[0x1895FD590])) >> *v11));
      uint64_t v28 = *v27;
      uint64_t v29 = (unint64_t *)(v23 + 16 * v28);
      if (*v29 > a2) {
        goto LABEL_73;
      }
      uint64_t v30 = v27[1];
      if (v30 < *((_DWORD *)v6 + 2)
        && (unsigned int v31 = (unint64_t *)(v23 + 16 * v30), v32 = *v31, *v31 <= a2))
      {
LABEL_46:
        unint64_t v47 = v31[1];
        if ((v47 & 7) - 2 < 3) {
          goto LABEL_73;
        }
        unint64_t v48 = (unint64_t)v31 - v23;
        unint64_t v49 = ((unint64_t)v31 - v23) >> 4;
        unint64_t v50 = a2 - v32;
        unint64_t v51 = v6[2];
        if (v50 >= v51)
        {
          if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || (_DWORD)v49 == -1) {
            goto LABEL_73;
          }
        }

        else if ((_DWORD)v49 == -1)
        {
          goto LABEL_73;
        }

        uint64_t v53 = *(void *)(a1 + 32);
        uint64_t v54 = *(void *)(v53 + 96);
        if (v54)
        {
          uint64_t v55 = (v48 >> 4);
          if ((*(void *)(v54 + 16 * v55 + 8) & 7LL) == 1)
          {
            uint64_t v56 = *(unsigned int *)(v53 + 268);
            unsigned int v57 = *(_DWORD *)(v53 + 264);
            if (v56 <= v57)
            {
              int v60 = 2 * v56;
              *(_DWORD *)(v53 + 268) = v60;
              uint64_t v61 = *(void *)(a1 + 32);
              unsigned int v62 = *(_DWORD *)(v61 + 268);
              id v67 = v5;
              if (v62 < *(_DWORD *)(v61 + 264))
              {
                uint64_t v63 = (_DWORD *)(v61 + 268);
                do
                {
                  *uint64_t v63 = 2 * v62;
                  uint64_t v61 = *(void *)(a1 + 32);
                  uint64_t v63 = (_DWORD *)(v61 + 268);
                  unsigned int v62 = *(_DWORD *)(v61 + 268);
                }

                while (v62 < *(_DWORD *)(v61 + 264));
              }

              *(void *)(*(void *)(a1 + 32) + 256LL) = realloc(*(void **)(v61 + 256), 16LL * v62);
              uint64_t v64 = *(void *)(a1 + 32);
              uint64_t v58 = *(void *)(v64 + 256);
              if (!v58)
              {
                NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_instanceValues",  v56,  *(unsigned int *)(v64 + 268));
                abort();
              }

              unsigned int v57 = *(_DWORD *)(v64 + 264);
              id v5 = v67;
            }

            else
            {
              uint64_t v58 = *(void *)(v53 + 256);
            }

            uint64_t v65 = (void *)(v58 + 16LL * v57);
            void *v65 = v55;
            v65[1] = 0LL;
            ++*(_DWORD *)(*(void *)(a1 + 32) + 264LL);
          }
        }
      }

      else
      {
        unsigned int v33 = v30 - v28;
        if (v33)
        {
          do
          {
            uint64_t v34 = v33 >> 1;
            unsigned int v31 = &v29[2 * v34];
            unint64_t v32 = *v31;
            if (*v31 <= a2)
            {
              if (((v29[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2) {
                goto LABEL_46;
              }
              uint64_t v29 = v31 + 2;
              LODWORD(v34) = --v33 >> 1;
            }

            BOOL v35 = v33 >= 2;
            unsigned int v33 = v34;
          }

          while (v35);
        }
      }
    }

    else
    {
      do
      {
        uint64_t v36 = v21 >> 1;
        unsigned int v31 = &v25[2 * v36];
        unint64_t v32 = *v31;
        if (*v31 <= a2)
        {
          if (((v25[2 * v36 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2) {
            goto LABEL_46;
          }
          uint64_t v25 = v31 + 2;
          LODWORD(v36) = --v21 >> 1;
        }

        BOOL v35 = v21 >= 2;
        unsigned int v21 = v36;
      }

      while (v35);
    }
  }

uint64_t __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (void)_identifyNonObjectsPointedToByTypedIvars:(unsigned int)a3
{
  unsigned int v5 = a3 + 1;
  unint64_t v6 = calloc(1uLL, ((a3 + 8) >> 3) + 4);
  *unint64_t v6 = v5;
  uint64_t v7 = MEMORY[0x1895F87A8];
  classInfoIndexer = self->_classInfoIndexer;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke;
  v14[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  v14[4] = v6;
  -[VMUClassInfoMap enumerateInfosWithBlock:](classInfoIndexer, "enumerateInfosWithBlock:", v14);
  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:1282];
  v10[0] = v7;
  v10[1] = 3221225472LL;
  v10[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2;
  v10[3] = &unk_189DFD250;
  unsigned int v13 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = v6;
  v10[4] = self;
  id v9 = v11;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  free(v6);
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  unsigned int a4)
{
  id v9 = a3;
  if ([v9 infoType] != 1 && objc_msgSend(v9, "infoType") != 128
    || ([v9 className],
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"__NSMallocBlock__"],
        v6,
        v7))
  {
    unint64_t v8 = *(unsigned int **)(a1 + 32);
    if (*v8 > a4) {
      *((_BYTE *)v8 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
    }
  }
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 8LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      unint64_t v8 = *(void *)(*(void *)(v2 + 96) + v6);
      if ((v8 & 7) == 1)
      {
        unint64_t v9 = v8 >> 41;
        if (*(_DWORD *)(a1 + 56) >= v8 >> 41)
        {
          BOOL v10 = *(_DWORD **)(a1 + 48);
          if (*v10 <= v9
            || ((*((unsigned __int8 *)v10 + (v9 >> 3) + 4) >> (v9 & 7)) & 1) == 0)
          {
            id v11 = *(id *)(*(void *)(v2 + 272) + 8 * v9);
            unint64_t v12 = v11;
            if (v11)
            {
              v18[0] = v7;
              v18[1] = 3221225472LL;
              v18[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3;
              v18[3] = &unk_189DFD748;
              id v13 = v11;
              uint64_t v14 = *(void *)(a1 + 32);
              uint64_t v15 = *(void **)(a1 + 40);
              id v19 = v13;
              uint64_t v20 = v14;
              id v16 = v15;
              uint64_t v17 = *(void *)(a1 + 48);
              id v21 = v16;
              uint64_t v22 = v17;
              int v23 = v9;
              (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1LL, v18);
            }

            uint64_t v2 = *(void *)(a1 + 32);
          }
        }
      }

      ++v5;
      v6 += 16LL;
    }

    while (v5 < *(unsigned int *)(v2 + 104));
  }

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x186E32E40]();
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4;
  v8[3] = &unk_189DFD200;
  id v11 = &v13;
  uint64_t v12 = a2;
  unint64_t v5 = *(void **)(a1 + 32);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v5, (uint64_t)v8);
  if (!*((_BYTE *)v14 + 24))
  {
    uint64_t v6 = *(_DWORD **)(a1 + 56);
    unint64_t v7 = *(unsigned int *)(a1 + 64);
  }

  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v4);
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4( uint64_t a1,  void *a2,  void *a3,  uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 64);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  unint64_t v9 = *(void *)(v8 + [a2 offset] + a4);
  if (HIDWORD(v9)) {
    BOOL v10 = (v9 & 7) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    return;
  }
  id v11 = *(uint64_t **)(*(void *)(a1 + 32) + 128LL);
  unint64_t v13 = v11[6];
  unint64_t v12 = v11[7];
  unint64_t v14 = v12 - v13;
  BOOL v15 = v12 < v13;
  if (v9 - v13 >= v14 || v15) {
    return;
  }
  char v16 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v17 = v9 >> *MEMORY[0x1895FD580];
  if (v17)
  {
    int v18 = (unsigned int *)v11[3];
    unint64_t v19 = v9 >> *MEMORY[0x1895FD580];
    do
    {
      if (*v18 <= (v19 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v18 + ((v19 & 0x3FFFFFF) >> 3) + 4) >> (v19 & 7)) & 1) == 0)
      {
        return;
      }

      v19 >>= 26;
    }

    while (v19);
  }

  uint64_t v20 = (uint64_t)v11 + 4 * (v17 & 0x7FFFF);
  int v23 = *(_DWORD *)(v20 + 64);
  uint64_t v22 = (_DWORD *)(v20 + 64);
  int v21 = v23;
  uint64_t v24 = v11[4];
  if (v23)
  {
    unint64_t v25 = v24 + ((unint64_t)(v21 - 1) << 6);
    if (v9 - *(void *)(*(void *)v25 + 8LL) < *(void *)(*(void *)v25 + 16LL)) {
      goto LABEL_15;
    }
  }

  unint64_t v42 = *((unsigned int *)v11 + 10);
  if (!(_DWORD)v42) {
    return;
  }
  unint64_t v43 = v11[4];
  while (1)
  {
    unint64_t v44 = v42 >> 1;
    unint64_t v25 = v43 + (v42 >> 1 << 6);
    if (*(void *)(*(void *)v25 + 8LL) <= v9) {
      break;
    }
LABEL_38:
    BOOL v40 = v42 >= 2;
    unint64_t v42 = v44;
    if (!v40) {
      return;
    }
  }

  if (*(void *)(*(void *)v25 + 16LL) + *(void *)(*(void *)v25 + 8LL) <= v9)
  {
    unint64_t v43 = v25 + 64;
    unint64_t v44 = --v42 >> 1;
    goto LABEL_38;
  }

  int v45 = [*(id *)v25 isSpecialPhysFootprintRegion];
  char v16 = (_DWORD *)MEMORY[0x1895FD580];
  if (v45) {
    unint64_t v46 = 0LL;
  }
  else {
    unint64_t v46 = v25;
  }
  if ((v45 & 1) != 0) {
    return;
  }
  if ((*(_BYTE *)(*(void *)v46 + 132LL) & 1) == 0) {
    goto LABEL_71;
  }
  unint64_t v47 = (id *)(v46 + 64);
  unint64_t v48 = *((unsigned int *)v11 + 10) - ((uint64_t)(v46 + 64 - v11[4]) >> 6);
  if (!v48) {
    goto LABEL_68;
  }
  while (2)
  {
    unint64_t v49 = v48 >> 1;
    unint64_t v50 = &v47[8 * (v48 >> 1)];
    if (*((void *)*v50 + 1) > v9)
    {
LABEL_49:
      BOOL v51 = v48 > 1;
      unint64_t v48 = v49;
      if (!v51)
      {
        unint64_t v48 = 0LL;
        goto LABEL_68;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v50 + 2) + *((void *)*v50 + 1) <= v9)
  {
    unint64_t v47 = v50 + 8;
    unint64_t v49 = --v48 >> 1;
    goto LABEL_49;
  }

  unint64_t v64 = v46;
  int v65 = [*v50 isSpecialPhysFootprintRegion];
  unint64_t v46 = v64;
  char v16 = (_DWORD *)MEMORY[0x1895FD580];
  if (v65) {
    unint64_t v48 = 0LL;
  }
  else {
    unint64_t v48 = (unint64_t)v50;
  }
LABEL_68:
  if (v48) {
    unint64_t v46 = v48;
  }
  unint64_t v25 = v46;
LABEL_71:
  _DWORD *v22 = ((v46 - v24) >> 6) + 1;
LABEL_15:
  unsigned int v26 = *(_DWORD *)(v25 + 20);
  if (v26)
  {
    uint64_t v27 = *(void *)(v25 + 8);
    uint64_t v28 = *v11;
    uint64_t v29 = *(unsigned int *)(v25 + 16);
    uint64_t v30 = (unint64_t *)(*v11 + 16 * v29);
    if (v27)
    {
      if (*v30 > v9) {
        return;
      }
      unsigned int v31 = (void *)(v28 + 16LL * (v26 + v29 - 1));
      if (((v31[1] >> 5) & 0xFFFFFFFFFuLL) + *v31 <= v9) {
        return;
      }
      unint64_t v32 = (unsigned int *)(v27 + 4 * ((v9 - (*v30 & -*MEMORY[0x1895FD590])) >> *v16));
      uint64_t v33 = *v32;
      uint64_t v34 = (unint64_t *)(v28 + 16 * v33);
      if (*v34 > v9) {
        return;
      }
      uint64_t v35 = v32[1];
      if (v35 < *((_DWORD *)v11 + 2)
        && (uint64_t v36 = (unint64_t *)(v28 + 16 * v35), v37 = *v36, *v36 <= v9))
      {
LABEL_51:
        unint64_t v52 = v36[1];
        if ((v52 & 7) - 2 < 3) {
          return;
        }
        unint64_t v53 = (unint64_t)v36 - v28;
        unint64_t v54 = v53 >> 4;
        unint64_t v55 = v9 - v37;
        unint64_t v56 = v11[2];
        if (v55 >= v56)
        {
          if (((v52 >> 5) & 0xFFFFFFFFFLL) - v55 > v56 || (_DWORD)v54 == -1) {
            return;
          }
        }

        else if ((_DWORD)v54 == -1)
        {
          return;
        }

        uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 96LL);
        if (v58)
        {
          uint64_t v59 = (v53 >> 4);
          if (*(void *)(v58 + 16 * v59) == v9)
          {
            uint64_t v60 = v58 + 16 * v59;
            uint64_t v62 = *(void *)(v60 + 8);
            uint64_t v61 = (unint64_t *)(v60 + 8);
            if ((v62 & 0xFFFFFE0000000007LL) == 1)
            {
              uint64_t v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a2);
              if (!v63)
              {
                else {
                  [a2 ivarName];
                }
                id v79 = (id)objc_claimAutoreleasedReturnValue();
                [a3 typeName];
                id v66 = (void *)objc_claimAutoreleasedReturnValue();
                if ([v66 length])
                {
                  [a3 typeName];
                  id v67 = (void *)objc_claimAutoreleasedReturnValue();
                  int v68 = [v67 characterAtIndex:0];

                  if (v68 == 35)
                  {

                    return;
                  }
                }

                else
                {
                }

                unsigned int v80 = 0;
                id v69 = [a3 typeName];
                descriptionForTypeOfReferencedAllocation((const char *)[v69 UTF8String], &v80);
                uint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

                unint64_t v71 = (void *)NSString;
                uint64_t v72 = [*(id *)(a1 + 48) displayName];
                uint64_t v73 = (void *)v72;
                uint64_t v74 = @"malloc";
                if (v70) {
                  uint64_t v74 = v70;
                }
                [v71 stringWithFormat:@"%@.%@ (%@)", v72, v79, v74];
                unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();

                [*(id *)(a1 + 48) binaryPath];
                char v76 = (void *)objc_claimAutoreleasedReturnValue();
                +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v75,  v76,  v80);
                BOOL v77 = (void *)objc_claimAutoreleasedReturnValue();

                unint64_t v78 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v77];
                NSMapInsert(*(NSMapTable **)(a1 + 40), a3, (const void *)v78);

                LODWORD(v63) = v78;
              }

              *uint64_t v61 = *v61 & 0x1FFFFFFFFFFLL | ((unint64_t)v63 << 41);
            }
          }
        }
      }

      else
      {
        unsigned int v38 = v35 - v33;
        if (v38)
        {
          do
          {
            uint64_t v39 = v38 >> 1;
            uint64_t v36 = &v34[2 * v39];
            unint64_t v37 = *v36;
            if (*v36 <= v9)
            {
              if (((v34[2 * v39 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9) {
                goto LABEL_51;
              }
              uint64_t v34 = v36 + 2;
              LODWORD(v39) = --v38 >> 1;
            }

            BOOL v40 = v38 >= 2;
            unsigned int v38 = v39;
          }

          while (v40);
        }
      }
    }

    else
    {
      do
      {
        uint64_t v41 = v26 >> 1;
        uint64_t v36 = &v30[2 * v41];
        unint64_t v37 = *v36;
        if (*v36 <= v9)
        {
          if (((v30[2 * v41 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9) {
            goto LABEL_51;
          }
          uint64_t v30 = v36 + 2;
          LODWORD(v41) = --v26 >> 1;
        }

        BOOL v40 = v26 >= 2;
        unsigned int v26 = v41;
      }

      while (v40);
    }
  }

- (id)_typeNameForZoneName:(id)a3
{
  return (id)[@"non-object in zone " stringByAppendingString:a3];
}

- (void)_identifyNonObjectsUsingStackBacktrace
{
  unint64_t v3 = (void *)objc_opt_new();
  unint64_t blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 8LL;
    while (1)
    {
      blocks = self->_blocks;
LABEL_12:
      ++v5;
      v6 += 16LL;
      if (v5 >= blocksCount) {
        goto LABEL_13;
      }
    }

    -[VMUKernelCoreMemoryScanner nodeDetails:](self, "nodeDetails:", v5);
    if (v17)
    {
      [v17 displayName];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 hasPrefix:@"non-object"])
      {
      }

      else
      {
        int v9 = [v17 isDerivedFromStackBacktrace];

        if (!v9)
        {
LABEL_11:
          unint64_t blocksCount = self->_blocksCount;
          goto LABEL_12;
        }
      }
    }

    -[VMUKernelCoreMemoryScanner zoneNameForNode:](self, "zoneNameForNode:", v5);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = [v11 unsignedIntValue];
    if (!(_DWORD)v12)
    {
      -[VMUKernelCoreMemoryScanner _typeNameForZoneName:](self, "_typeNameForZoneName:", v10);
      char v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v16,  @"<unknown>",  0LL);
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setIsDerivedFromStackBacktrace:1];
      uint64_t v12 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v13);
      [MEMORY[0x189607968] numberWithUnsignedInt:v12];
      unint64_t v14 = v3;
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v15 forKeyedSubscript:v10];

      unint64_t v3 = v14;
    }

    *(unint64_t *)((char *)&blocks->var0 + v6) = *(unint64_t *)((_BYTE *)&blocks->var0 + v6) & 0x1FFFFFFFFFFLL | ((unint64_t)v12 << 41);

    goto LABEL_11;
  }

- (void)_findMarkedAbandonedBlocks
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0LL;
  }

  if (!self->_abandonedMarkingEnabled) {
    return;
  }
  LODWORD(regionsCount) = self->_regionsCount;
  if (!(_DWORD)regionsCount) {
    return;
  }
  unint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  unsigned int v7 = 0;
  uint64_t v8 = 0LL;
  do
  {
    regions = self->_regions;
    p_unint64_t var0 = &regions[v5].var0;
    if (*((_DWORD *)*p_var0 + 26) != 10) {
      goto LABEL_51;
    }
    memoryCache = self->_memoryCache;
    uint64_t v12 = self->_task;
    unint64_t v13 = memoryCache;
    if (p_var0[6]) {
      goto LABEL_8;
    }
    uint64_t v36 = *p_var0;
    unint64_t v64 = v13;
    if ((*((_BYTE *)*p_var0 + 132) & 2) == 0)
    {
      -[VMUTaskMemoryCache taskIsTranslated](v13, "taskIsTranslated");
      unint64_t v13 = v64;
      uint64_t v36 = *p_var0;
    }

    int v37 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v13,  "mapAddress:size:returnedAddress:returnedSize:",  v36[1],  v36[2],  v65,  &v69);
    if (!v37)
    {
      unint64_t v13 = v64;
      unint64_t v48 = v69;
      p_var0[6] = (id)v65[0];
      unint64_t v49 = &regions[v5];
      v49->unint64_t var6 = v48;
      v49->var8 = (_VMURegionNode *)p_var0;
LABEL_8:

      unint64_t v14 = self->_regions;
      unint64_t var7 = (unint64_t)v14[v5].var7;
      if (var7)
      {
        char v16 = (unint64_t *)MEMORY[0x1895FD590];
        unint64_t v17 = *MEMORY[0x1895FD590];
        uint64_t v18 = v8;
        do
        {
          unint64_t v19 = v17 + var7;
          if (*(void *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            unsigned int v20 = *(_DWORD *)(var7 + 20);
            unsigned int v21 = v7 + v20 - 1;
            if (v18 <= v21)
            {
              uint64_t v22 = v17 >> 3;
              else {
                uint64_t v22 = v22;
              }
              do
              {
                uint64_t v8 = v22;
                uint64_t v22 = (2 * v22);
              }

              while (v8 < v21);
              int v23 = realloc(v6, 8LL * v8);
              if (!v23)
              {
                NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "allMarkedAddresses",  v18,  v8);
                abort();
              }

              uint64_t v6 = v23;
              unsigned int v20 = *(_DWORD *)(var7 + 20);
            }

            else
            {
              uint64_t v8 = v18;
            }

            unint64_t v24 = *(unsigned int *)(var7 + 12) + var7;
            uint64_t v25 = v20;
            if (v20)
            {
              unsigned int v26 = (uint64_t *)(*(unsigned int *)(var7 + 12) + var7);
              uint64_t v27 = v25;
              do
              {
                uint64_t v29 = *v26++;
                uint64_t v28 = v29;
                if (v29) {
                  *((void *)v6 + v7++) = v28;
                }
                --v27;
              }

              while (v27);
            }

            unint64_t v30 = v24 + 8 * v25;
            unint64_t v17 = *v16;
            unint64_t v19 = (v30 + *v16 - 1) & -(uint64_t)*v16;
            unint64_t v14 = self->_regions;
          }

          else
          {
            uint64_t v8 = v18;
          }

          BOOL v31 = (void *)v19 >= (char *)v14[v5].var7 + v14[v5].var6 || v19 == 0;
          uint64_t v18 = v8;
          unint64_t var7 = v19;
        }

        while (!v31);
      }

      unint64_t v32 = self->_memoryCache;
      uint64_t v33 = v32;
      uint64_t v34 = &v14[v5];
      if (v34->var7)
      {
        if (v34->var8 == v34)
        {
          v65[0] = MEMORY[0x1895F87A8];
          v65[1] = 3221225472LL;
          v65[2] = ___unmapRegion_block_invoke_0;
          v65[3] = &unk_189DFD7B8;
          id v66 = v32;
          id v67 = &v14[v5];
          int v68 = v14;
          unint64_t v47 = (void (**)(void))MEMORY[0x186E33044](v65);
          v47[2]();
        }

        else
        {
          uint64_t v35 = &v14[v5];
          v35->unint64_t var6 = 0LL;
          v35->unint64_t var7 = 0LL;
          v35->var8 = 0LL;
        }
      }

      goto LABEL_51;
    }

    int v63 = v37;
    unsigned int v38 = v12;
    if ((*((_DWORD *)*p_var0 + 13) & 3u) - 1 >= 2)
    {
      BOOL v39 = task_exists(v12);
      if (v5 != (_DWORD)regionsCount - 1 && v39)
      {
        uint64_t v62 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v61 = [*p_var0 address];
        uint64_t v40 = *((unsigned int *)*p_var0 + 6);
        uint64_t v60 = *((void *)*p_var0 + 2) + *((void *)*p_var0 + 1);
        uint64_t v41 = vm_prot_strings_0[v40];
        id v42 = VMURegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)*p_var0 + 104),  *((unsigned __int8 *)*p_var0 + 50),  v40,  *((unsigned __int8 *)*p_var0 + 49));
        unint64_t v43 = (const char *)[v42 UTF8String];
        uint64_t v44 = *((void *)*p_var0 + 2) >> *MEMORY[0x1895FD580];
        int v45 = "pages";
        if (v44 == 1) {
          int v45 = "page";
        }
        unint64_t v46 = " [root]";
        if (regions[v5].var4 == regions[v5].var5) {
          unint64_t v46 = "";
        }
        uint64_t v59 = v41;
        unsigned int v38 = v12;
        fprintf( v62,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v61,  v60,  v59,  v43,  v44,  v45,  v46,  v63);
      }
    }

LABEL_51:
    ++v5;
    unint64_t regionsCount = self->_regionsCount;
  }

  while (v5 < regionsCount);
  if (v6)
  {
    unsigned int blocksCount = self->_blocksCount;
    BOOL v51 = calloc(1uLL, ((blocksCount + 7) >> 3) + 4);
    *BOOL v51 = blocksCount;
    self->_userMarkedAbandoned = v51;
    mergesort_b(v6, v7, 8uLL, &__block_literal_global_116);
    if (v7)
    {
      uint64_t v52 = 0LL;
      unint64_t v53 = 0LL;
      do
      {
        unint64_t v54 = self->_blocksCount;
        if (v53 >= v54) {
          break;
        }
        blocks = self->_blocks;
        unint64_t v56 = (void *)&blocks[v53] + 1;
        while (1)
        {
          if ((*v56 & 7LL) == 1)
          {
            unint64_t v57 = *((void *)v6 + v52);
            if (*(v56 - 1) >= v57) {
              break;
            }
          }

          ++v53;
          v56 += 2;
          if (v54 == v53) {
            goto LABEL_67;
          }
        }

        unint64_t v54 = v53;
        if (blocks[v53].var0 != v57)
        {
LABEL_67:
          unint64_t v53 = v54;
          goto LABEL_68;
        }

        uint64_t v58 = self->_userMarkedAbandoned;
        unint64_t v53 = v53;
LABEL_68:
        ++v52;
      }

      while (v52 != v7);
    }

    free(v6);
  }

uint64_t __56__VMUKernelCoreMemoryScanner__findMarkedAbandonedBlocks__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (void)refineTypesWithOverlay:(id)a3
{
}

- (void)applyTypeOverlayToMutableInfo:(id)a3
{
  classInfoIndexer = self->_classInfoIndexer;
  scanOverlay = self->_scanOverlay;
  id v5 = a3;
  -[VMUScanOverlay refinementRules](scanOverlay, "refinementRules");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)classInfoIndexer, v6, v5);
}

- (void)_buildRegionFirstBlockIndexOnPageArrays
{
}

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  if (a1)
  {
    LODWORD(v11) = a6;
    [*(id *)(a1 + 80) swiftRuntimeInfoStableABI];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }

    else
    {
      [*(id *)(a1 + 80) swiftRuntimeInfoPreABI];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    v228 = v17;

    uint64_t v18 = [*(id *)(a1 + 80) hasSwiftContent];
    if ((_DWORD)v11 && *(_BYTE *)(a1 + 364))
    {
      unint64_t v19 = a5 - 8;
      if (a5 < 8) {
        goto LABEL_186;
      }
      uint64_t v20 = v11;
      id v21 = *(id *)(*(void *)(a1 + 272) + 8LL * v11);
      uint64_t v22 = v21;
      uint64_t v23 = v11 >> 3;
      unsigned int v231 = v11;
      if (!*(void *)(*(void *)(a1 + 296) + 8LL * v11))
      {
        uint64_t v24 = [v21 instanceSize];
        v240[0] = 0LL;
        v240[1] = v240;
        v240[2] = 0x2020000000LL;
        unsigned int v241 = (v24 >> 3) + 2;
        *(void *)(*(void *)(a1 + 296) + 8LL * v11) = malloc(4 * v241);
        uint64_t v25 = *(_DWORD **)(a1 + 304);
        uint64_t v236 = 0LL;
        v237 = &v236;
        uint64_t v238 = 0x2020000000LL;
        int v239 = 0;
        v234[0] = MEMORY[0x1895F87A8];
        v234[1] = 3221225472LL;
        v234[2] = __97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke;
        v234[3] = &unk_189DFD370;
        v234[5] = &v236;
        v234[6] = v240;
        v234[4] = a1;
        int v235 = v11;
        [v22 enumerateScanningLocationsForSize:v24 withBlock:v234];
        uint64_t v26 = *(void *)(*(void *)(a1 + 296) + 8LL * v11);
        uint64_t v11 = *((unsigned int *)v237 + 6);
        *((_DWORD *)v237 + 6) = v11 + 1;
        *(_DWORD *)(v26 + 4 * v11) = (v24 + 7) & 0xFFFFF8 | ([v22 defaultScanType] << 24);
        uint64_t v27 = *(void *)(*(void *)(a1 + 296) + 8 * v20);
        uint64_t v28 = *((unsigned int *)v237 + 6);
        *((_DWORD *)v237 + 6) = v28 + 1;
        *(_DWORD *)(v27 + 4 * v28) = ([v22 defaultScanType] << 24) | 0xFFFFFF;
        _Block_object_dispose(&v236, 8);
        _Block_object_dispose(v240, 8);
        LOBYTE(v11) = v231;
      }

      v214 = v22;
      unsigned int v29 = 0;
      unint64_t v30 = 0LL;
      uint64_t v229 = a2 + a3;
      uint64_t v221 = v23 + 4;
      int v218 = 1 << (v11 & 7);
      while (1)
      {
        unsigned int v31 = *(_DWORD *)(*(void *)(*(void *)(a1 + 296) + 8 * v20) + 4LL * v29);
        uint64_t v32 = HIBYTE(v31);
        int v33 = v31 & 0xFFFFFF;
        unint64_t v34 = v30 + 8;
        if (HIBYTE(v31) == 1) {
          unint64_t v34 = v30 + 1;
        }
        if (v33 == 0xFFFFFF) {
          unint64_t v30 = v34;
        }
        else {
          unint64_t v30 = *(void *)&v31 & 0xFFFFFFLL;
        }
        if (v33 != 0xFFFFFF) {
          ++v29;
        }
        if (((*(_DWORD *)(a1 + 376) >> SHIBYTE(v31)) & 1) == 0 || v30 > v19) {
          goto LABEL_91;
        }
        unsigned int v35 = HIBYTE(v31);
        uint64_t v36 = *(void *)(v229 + v30);
        if (v35 == 3) {
          break;
        }
        if (v35 != 5) {
          goto LABEL_32;
        }
        id v37 = v214;
        id v38 = v228;
        if (v228)
        {
          if ([v37 usesSwiftRefcounting]
            && v30 == [v37 pointerSize])
          {
            id v39 = v38;
            uint64_t v40 = [v39 refcountIsSideTableMarkerMask] & v36;
            if (v40 == [v39 refcountIsSideTableMarkerValue])
            {
              unint64_t v41 = [v39 sideTablePointerMask] & v36;
              unint64_t v42 = v41 >> [v39 sideTablePointerRightShift];
              uint64_t v36 = v42 << [v39 sideTablePointerLeftShift];
            }

            else
            {
              uint64_t v36 = 0LL;
            }
          }

          else
          {
            v36 &= [v38 nativeWeakReferencePointerMask];
          }
        }

        uint64_t v32 = 5LL;
        unsigned int v43 = v231;
LABEL_37:
        uint64_t v44 = *(unsigned int **)(a1 + 304);
        if (!v36) {
          goto LABEL_91;
        }
        uint64_t v225 = *(void *)(*(void *)(a1 + 96) + 16LL * a4);
        int v45 = *(uint64_t **)(a1 + 128);
        unint64_t v46 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v36);
        unint64_t v47 = v45[6];
        unint64_t v48 = v45[7];
        BOOL v49 = v48 >= v47;
        unint64_t v50 = v48 - v47;
        if (!v49) {
          goto LABEL_91;
        }
        unint64_t v51 = v46;
        if (v46 - v47 >= v50) {
          goto LABEL_91;
        }
        unint64_t v52 = v46 >> *MEMORY[0x1895FD580];
        if (v52)
        {
          unint64_t v53 = (unsigned int *)v45[3];
          unint64_t v54 = v46 >> *MEMORY[0x1895FD580];
          do
          {
            if (*v53 <= (v54 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v53 + ((v54 & 0x3FFFFFF) >> 3) + 4) >> (v54 & 7)) & 1) == 0)
            {
              goto LABEL_91;
            }

            v54 >>= 26;
          }

          while (v54);
        }

        uint64_t v55 = (uint64_t)v45 + 4 * (v52 & 0x7FFFF);
        int v58 = *(_DWORD *)(v55 + 64);
        unint64_t v57 = (_DWORD *)(v55 + 64);
        int v56 = v58;
        if (v58)
        {
          unint64_t v59 = v45[4] + ((unint64_t)(v56 - 1) << 6);
          if (v46 - *(void *)(*(void *)v59 + 8LL) < *(void *)(*(void *)v59 + 16LL)) {
            goto LABEL_51;
          }
        }

        unint64_t v75 = *((unsigned int *)v45 + 10);
        if (!(_DWORD)v75) {
          goto LABEL_91;
        }
        unint64_t v76 = v45[4];
        while (1)
        {
          unint64_t v77 = v75 >> 1;
          unint64_t v59 = v76 + (v75 >> 1 << 6);
          if (*(void *)(*(void *)v59 + 8LL) <= v46) {
            break;
          }
LABEL_74:
          BOOL v49 = v75 >= 2;
          unint64_t v75 = v77;
          if (!v49) {
            goto LABEL_91;
          }
        }

        if (*(void *)(*(void *)v59 + 16LL) + *(void *)(*(void *)v59 + 8LL) <= v46)
        {
          unint64_t v76 = v59 + 64;
          unint64_t v77 = --v75 >> 1;
          goto LABEL_74;
        }

        uint64_t v213 = v45[4];
        int v78 = [*(id *)v59 isSpecialPhysFootprintRegion];
        uint64_t v79 = v213;
        if (v78) {
          unint64_t v80 = 0LL;
        }
        else {
          unint64_t v80 = v59;
        }
        if ((v78 & 1) != 0) {
          goto LABEL_91;
        }
        if ((*(_BYTE *)(*(void *)v80 + 132LL) & 1) == 0) {
          goto LABEL_105;
        }
        v81 = (id *)(v80 + 64);
        unint64_t v82 = *((unsigned int *)v45 + 10) - ((uint64_t)(v80 + 64 - v45[4]) >> 6);
        if (!v82) {
          goto LABEL_102;
        }
        while (2)
        {
          unint64_t v83 = v82 >> 1;
          uint64_t v84 = &v81[8 * (v82 >> 1)];
          if (*((void *)*v84 + 1) > v51)
          {
LABEL_85:
            BOOL v85 = v82 > 1;
            unint64_t v82 = v83;
            if (!v85)
            {
              unint64_t v82 = 0LL;
              goto LABEL_102;
            }

            continue;
          }

          break;
        }

        if (*((void *)*v84 + 2) + *((void *)*v84 + 1) <= v51)
        {
          v81 = v84 + 8;
          unint64_t v83 = --v82 >> 1;
          goto LABEL_85;
        }

        unint64_t v212 = v80;
        int v90 = [*v84 isSpecialPhysFootprintRegion];
        unint64_t v80 = v212;
        uint64_t v79 = v213;
        if (v90) {
          unint64_t v82 = 0LL;
        }
        else {
          unint64_t v82 = (unint64_t)v84;
        }
LABEL_102:
        if (v82) {
          unint64_t v80 = v82;
        }
        unint64_t v59 = v80;
LABEL_105:
        _DWORD *v57 = ((v80 - v79) >> 6) + 1;
LABEL_51:
        unsigned int v60 = *(_DWORD *)(v59 + 20);
        if (v60)
        {
          uint64_t v61 = *(void *)(v59 + 8);
          uint64_t v62 = *v45;
          uint64_t v63 = *(unsigned int *)(v59 + 16);
          unint64_t v64 = (unint64_t *)(*v45 + 16 * v63);
          if (v61)
          {
            if (*v64 > v51) {
              goto LABEL_91;
            }
            int v65 = (void *)(v62 + 16LL * (v60 + v63 - 1));
            if (((v65[1] >> 5) & 0xFFFFFFFFFuLL) + *v65 <= v51) {
              goto LABEL_91;
            }
            id v66 = (unsigned int *)(v61 + 4 * ((v51 - (*v64 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
            uint64_t v67 = *v66;
            int v68 = (unint64_t *)(v62 + 16 * v67);
            if (*v68 > v51) {
              goto LABEL_91;
            }
            uint64_t v69 = v66[1];
            if (v69 < *((_DWORD *)v45 + 2))
            {
              uint64_t v70 = (unint64_t *)(v62 + 16 * v69);
              unint64_t v71 = *v70;
              if (*v70 <= v51)
              {
LABEL_87:
                unint64_t v86 = v70[1];
                if ((v86 & 7) - 2 < 3) {
                  goto LABEL_91;
                }
                unint64_t v87 = ((unint64_t)v70 - v62) >> 4;
                unint64_t v88 = v45[2];
                if (v51 - v71 >= v88)
                {
                  if (((v86 >> 5) & 0xFFFFFFFFFLL) - (v51 - v71) > v88 || (_DWORD)v87 == -1) {
                    goto LABEL_91;
                  }
                }

                else if ((_DWORD)v87 == -1)
                {
                  goto LABEL_91;
                }

                (*(void (**)(uint64_t, void, unint64_t, uint64_t))(a9 + 16))( a9,  a4,  v30 + a3 + v225,  v32);
                goto LABEL_91;
              }
            }

            unsigned int v72 = v69 - v67;
            if (v72)
            {
              do
              {
                uint64_t v73 = v72 >> 1;
                uint64_t v70 = &v68[2 * v73];
                unint64_t v71 = *v70;
                if (*v70 <= v51)
                {
                  if (((v68[2 * v73 + 1] >> 5) & 0xFFFFFFFFFLL) + v71 > v51) {
                    goto LABEL_87;
                  }
                  int v68 = v70 + 2;
                  LODWORD(v73) = --v72 >> 1;
                }

                BOOL v49 = v72 >= 2;
                unsigned int v72 = v73;
              }

              while (v49);
            }
          }

          else
          {
            do
            {
              uint64_t v74 = v60 >> 1;
              uint64_t v70 = &v64[2 * v74];
              unint64_t v71 = *v70;
              if (*v70 <= v51)
              {
                if (((v64[2 * v74 + 1] >> 5) & 0xFFFFFFFFFLL) + v71 > v51) {
                  goto LABEL_87;
                }
                unint64_t v64 = v70 + 2;
                LODWORD(v74) = --v60 >> 1;
              }

              BOOL v49 = v60 >= 2;
              unsigned int v60 = v74;
            }

            while (v49);
          }
        }

void *__97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke( void *result,  uint64_t a2,  int a3,  unsigned __int8 a4)
{
  id v6 = result;
  uint64_t v7 = *(void *)(result[5] + 8LL);
  unsigned int v8 = *(_DWORD *)(v7 + 24);
  uint64_t v9 = *(void *)(result[6] + 8LL);
  unsigned int v10 = *(_DWORD *)(v9 + 24);
  if (v8 + 2 >= v10)
  {
    *(_DWORD *)(v9 + 24) = 2 * v10;
    uint64_t result = realloc( *(void **)(*(void *)(result[4] + 296LL) + 8LL * *((unsigned int *)result + 14)),  4LL * *(unsigned int *)(*(void *)(result[6] + 8LL) + 24LL));
    uint64_t v11 = *((unsigned int *)v6 + 14);
    *(void *)(*(void *)(v6[4] + 296LL) + 8 * v11) = result;
    uint64_t v7 = *(void *)(v6[5] + 8LL);
    unsigned int v8 = *(_DWORD *)(v7 + 24);
  }

  else
  {
    uint64_t v11 = *((unsigned int *)result + 14);
  }

  uint64_t v12 = *(void *)(*(void *)(v6[4] + 296LL) + 8 * v11);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  *(_DWORD *)(v12 + 4LL * v8) = a3 & 0xFFFFFF | (a4 << 24);
  return result;
}

- (void)_withOrderedNodeMapper:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    int v17 = -1;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x2020000000LL;
    int v15 = 0;
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x2020000000LL;
    v13[3] = 0LL;
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2020000000LL;
    v12[3] = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke;
    v6[3] = &unk_189DFD398;
    unsigned int v8 = v16;
    uint64_t v9 = v12;
    unsigned int v10 = v14;
    uint64_t v11 = v13;
    v6[4] = self;
    id v7 = 0LL;
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke( void *a1,  unsigned int a2,  int a3,  uint64_t a4)
{
  if (!a4) {
    return;
  }
  uint64_t v6 = a1[4];
  if (*(_DWORD *)(v6 + 104) <= a2) {
    return;
  }
  id v7 = (unint64_t *)(*(void *)(v6 + 96) + 16LL * a2);
  unint64_t v8 = v7[1];
  uint64_t v9 = (v8 >> 5) & 0xFFFFFFFFFLL;
  if (!v9) {
    return;
  }
  unint64_t v12 = *v7;
  int v13 = v8 & 7;
  if (!a3)
  {
    uint64_t v52 = *(unsigned int *)(*(void *)(a1[6] + 8LL) + 24LL);
    if ((_DWORD)v52 != -1 && *(void *)(*(void *)(a1[7] + 8LL) + 24LL) <= v12)
    {
      unint64_t v53 = *(uint64_t **)(v6 + 112);
      id v54 = *(id *)(v6 + 72);
      uint64_t v55 = &v53[8 * v52];
      if (v55[6])
      {
        if ((uint64_t *)v55[7] == v55)
        {
          uint64_t v134 = MEMORY[0x1895F87A8];
          uint64_t v135 = 3221225472LL;
          v136 = ___unmapRegion_block_invoke_0;
          unint64_t v137 = &unk_189DFD7B8;
          id v103 = v54;
          id v138 = v54;
          unint64_t v139 = v55;
          v140 = v53;
          unint64_t v104 = (void (**)(void))MEMORY[0x186E33044](&v134);
          v104[2]();

          id v54 = v103;
        }

        else
        {
          int v56 = &v53[8 * v52];
          v56[5] = 0LL;
          v56[6] = 0LL;
          v56[7] = 0LL;
        }
      }

      *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = -1;
    }
  }

  if (v13 != 1)
  {
    if (!VMUGraphNodeType_IsVMRegion(v13))
    {
      if (v13 == 4)
      {
        uint64_t v57 = [*(id *)(a1[4] + 240) threadStateForThreadNum:*(void *)(*(void *)(a1[4] + 96) + 16 * a2 + 8) >> 41];
        if (v57) {
          (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v57);
        }
        *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = -1;
      }

      return;
    }

    *(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL) = *(void *)(*(void *)(a1[4] + 96LL) + 16LL * a2 + 8) >> 41;
    uint64_t v32 = (id *)objc_retain(objc_retain(*(id *)(*(void *)(a1[4] + 112LL)
                                              + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8LL) + 24LL) << 6))));
    if (_shouldScanVMregion_onceToken != -1) {
      dispatch_once(&_shouldScanVMregion_onceToken, &__block_literal_global_538);
    }
    if (!_shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar
      && *((_BYTE *)v32 + 49)
      && ([v32 path],
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(),
          char v80 = [v79 hasPrefix:kVMUUnknownMappedFileNamePrefix[0]],
          v79,
          (v80 & 1) != 0)
      || (*((_DWORD *)v32 + 13) & 3) == 2)
    {
    }

    else
    {
      if ([v32 protection] != 1
        || *((_DWORD *)v32 + 26) == 1
        || [v32[4] isEqualToString:@"MALLOC metadata"])
      {

LABEL_23:
        *(void *)(*(void *)(a1[9] + 8) + 24) = [v32 address];
        uint64_t v33 = *(void *)(*(void *)(a1[9] + 8LL) + 24LL);
        *(void *)(*(void *)(a1[7] + 8) + 24) = [v32 length] + v33;
        uint64_t v34 = a1[4];
        uint64_t v35 = *(void *)(v34 + 112);
        uint64_t v36 = *(unsigned int *)(*(void *)(a1[8] + 8LL) + 24LL);
        id v37 = (uint64_t *)(v35 + (v36 << 6));
        id v38 = *(void **)(v34 + 72);
        int v129 = *(_DWORD *)(v34 + 120);
        id v39 = *(id *)(v34 + 8);
        id v40 = v38;
        if (!v37[6])
        {
          uint64_t v123 = v36;
          uint64_t v125 = v35;
          uint64_t v41 = *v37;
          id v42 = v40;
          if ((*(_BYTE *)(*v37 + 132) & 2) == 0)
          {
            [v40 taskIsTranslated];
            id v40 = v42;
            uint64_t v41 = *v37;
          }

          int v43 = [v40 mapAddress:*(void *)(v41 + 8) size:*(void *)(v41 + 16) returnedAddress:&v134 returnedSize:v141];
          if (v43)
          {
            if ((*(_DWORD *)(*v37 + 52) & 3u) - 1 >= 2)
            {
              int v44 = v43;
              BOOL v45 = task_exists(v39);
              if ((_DWORD)v123 != v129 - 1 && v45)
              {
                int v130 = (FILE *)*MEMORY[0x1895F89D0];
                uint64_t v119 = [(id)*v37 address];
                uint64_t v46 = *(unsigned int *)(*v37 + 24);
                v117 = vm_prot_strings_0[v46];
                uint64_t v115 = *(void *)(*v37 + 16) + *(void *)(*v37 + 8);
                id v47 = VMURegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*v37 + 104),  *(unsigned __int8 *)(*v37 + 50),  v46,  *(unsigned __int8 *)(*v37 + 49));
                unint64_t v48 = (const char *)[v47 UTF8String];
                uint64_t v49 = *(void *)(*v37 + 16) >> *MEMORY[0x1895FD580];
                if (v49 == 1) {
                  unint64_t v50 = "page";
                }
                else {
                  unint64_t v50 = "pages";
                }
                if (*(void *)(v125 + (v123 << 6) + 24) == *(void *)(v125 + (v123 << 6) + 32)) {
                  unint64_t v51 = "";
                }
                else {
                  unint64_t v51 = " [root]";
                }
                fprintf( v130,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v119,  v115,  v117,  v48,  v49,  v50,  v51,  v44);
              }
            }
          }

          else
          {
            uint64_t v109 = v141[0];
            v37[6] = v134;
            uint64_t v110 = v125 + (v36 << 6);
            *(void *)(v110 + 40) = v109;
            *(void *)(v110 + 56) = v37;
          }

          id v40 = v42;
        }

        uint64_t v111 = *(void *)(*(void *)(a1[4] + 112LL)
        if (v111)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))( a4,  v111 + v12 - *(void *)(*(void *)(a1[9] + 8LL) + 24LL));
          if (!a3) {
            *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = *(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL);
          }
        }

        goto LABEL_102;
      }

      int v112 = *((_DWORD *)v32 + 26);

      if (v112 == 78) {
        goto LABEL_23;
      }
    }

- (void)scanNodesWithReferenceRecorder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x186E33044]();
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (self->_referenceLogger
    || (unint64_t maxInteriorOffset = self->_maxInteriorOffset, maxInteriorOffset != -1LL)
    && (!maxInteriorOffset || (maxInteriorOffset & ~(-1 << *MEMORY[0x1895FD580])) != 0))
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v13[3] = &unk_189DFD3C0;
    void v13[4] = self;
    id v14 = v4;
    uint64_t v7 = MEMORY[0x186E33044](v13);

    id v5 = (void *)v7;
  }

  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v10[3] = &unk_189DFD4D0;
  int v12 = 0;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  -[VMUKernelCoreMemoryScanner unmapAllRegions](self, "unmapAllRegions");
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  unsigned int a5,  uint64_t a6)
{
  uint64_t v6 = *(void **)(result + 32);
  if ((unint64_t)(a6 - *(void *)(v6[12] + 16LL * a5)) <= v6[46])
  {
    uint64_t v7 = result;
    if (v6[59])
    {
      id v8 = (void *)MEMORY[0x186E32E40]();
      (*(void (**)(void))(*(void *)(*(void *)(v7 + 32) + 472LL) + 16LL))();
      objc_autoreleasePoolPop(v8);
    }

    return (*(uint64_t (**)(void))(*(void *)(v7 + 40) + 16LL))();
  }

  return result;
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v7 = &unk_189DFD430;
    do
    {
      int v8 = *(_DWORD *)(*(void *)(v2 + 96) + 16 * v5 + 8);
      if (*(void *)(v2 + 480))
      {
        uint64_t v9 = (void *)MEMORY[0x186E32E40]();
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 480LL) + 16LL))();
        objc_autoreleasePoolPop(v9);
      }

      int v10 = v8 & 7;
      if (v10 == 1)
      {
        uint64_t v11 = *(unsigned int *)(a1 + 48);
        v119[0] = v6;
        v119[1] = 3221225472LL;
        v119[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
        v119[3] = v7;
        int v12 = *(void **)(a1 + 40);
        v119[4] = *(void *)(a1 + 32);
        int v121 = v5;
        id v120 = v12;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v11, v119);
        int v13 = v120;
      }

      else
      {
        if (VMUGraphNodeType_IsVMRegion(v8 & 7))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = (mach_vm_address_t *)(*(void *)(v14 + 96) + 16 * v5);
          mach_vm_address_t v16 = *v15;
          mach_vm_address_t v19 = v15[1];
          int v17 = v15 + 1;
          mach_vm_address_t v18 = v19;
          kcd_addr_begin[0] = 0LL;
          kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
          kcd_addr_begin[2] = 0x2020000000LL;
          kcd_addr_begin[3] = v16;
          kcd_size[0] = 0LL;
          kcd_size[1] = (mach_vm_size_t)kcd_size;
          kcd_size[2] = 0x2020000000LL;
          if ((*v17 >> 5) & 0xFFFFFFFFFLL)
          {
            mach_vm_address_t v20 = ((v18 >> 5) & 0xFFFFFFFFFLL) + v16;
            id v21 = *(id *)(*(void *)(v14 + 112) + ((*v17 >> 35) & 0x1FFFFFC0LL));
            unsigned int v22 = (void *)MEMORY[0x186E33044](*(void *)(a1 + 40));
            uint64_t v23 = *(unsigned int *)(a1 + 48);
            v108[0] = v6;
            v108[1] = 3221225472LL;
            v108[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
            v108[3] = &unk_189DFD480;
            mach_vm_address_t v113 = v16;
            mach_vm_address_t v114 = v20;
            v108[4] = *(void *)(a1 + 32);
            uint64_t v111 = kcd_size;
            int v112 = kcd_addr_begin;
            int v115 = v5;
            id v24 = v22;
            id v110 = v24;
            id v25 = v21;
            id v109 = v25;
            (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v23, v108);
          }

          _Block_object_dispose(kcd_size, 8);
          _Block_object_dispose(kcd_addr_begin, 8);
          goto LABEL_15;
        }

        if (v10 == 3)
        {
          uint64_t v28 = *(void *)(a1 + 32);
          unsigned int v29 = *(void **)(a1 + 40);
          uint64_t v30 = *(void *)(*(void *)(v28 + 96) + 16 * v5);
          v101[0] = v6;
          v101[1] = 3221225472LL;
          v101[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
          v101[3] = &unk_189DFD4A8;
          v101[4] = v28;
          id v31 = v29;
          int v104 = v5;
          id v102 = v31;
          uint64_t v103 = v30;
          uint64_t v32 = (void (**)(void, void, void))MEMORY[0x186E33044](v101);
          if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
          {
            kcd_addr_begin[0] = 0LL;
            [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            int v34 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v33, 0LL, kcd_addr_begin);

            if (!v34 && kcd_addr_begin[0])
            {
              if (kcd_addr_begin[0] >> 61)
              {
                NSLog(@"Failed to get udata pointers for core file.");
              }

              else
              {
                uint64_t v93 = malloc(8 * kcd_addr_begin[0]);
                if (v93)
                {
                  uint64_t v94 = v93;
                  uint64_t v95 = v7;
                  [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
                  uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
                  int v97 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]( (uint64_t)v96,  (uint64_t)v94,  kcd_addr_begin);

                  if (!v97) {
                    ((void (**)(void, void *, mach_vm_address_t))v32)[2](v32, v94, kcd_addr_begin[0]);
                  }
                  free(v94);
                  uint64_t v7 = v95;
                }
              }
            }

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  unint64_t v6 = *(void *)(*(void *)(v4 + 96) + 16 * v5 + 8);
  unint64_t v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(a2 + 2048) == -1583242847
     && !strncmp((const char *)(a2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    char v19 = *(_BYTE *)(v4 + 364);
    *(_DWORD *)(v4 + 316) = 1;
    *(_BYTE *)(*(void *)(a1 + 32) + 364LL) = 0;
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = (uint64_t *)(*(void *)(v20 + 96) + 16LL * *(unsigned int *)(a1 + 48));
    uint64_t v22 = *v21;
    unint64_t v23 = ((unint64_t)v21[1] >> 5) & 0xFFFFFFFFFLL;
    unint64_t v24 = *(void *)(a2 + *(unsigned int *)[*(id *)(v20 + 80) autoreleasePoolPageLayout]) - v22;
    if (v23 < v24) {
      unint64_t v24 = v23;
    }
    if (v24 >= 0x4000) {
      unint64_t v25 = 0x4000LL;
    }
    else {
      unint64_t v25 = v24;
    }
    -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( *(void *)(a1 + 32),  a2,  0LL,  *(_DWORD *)(a1 + 48),  v25,  *(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 48) + 8) >> 41,  0LL,  8u,  *(void *)(a1 + 40));
    *(_BYTE *)(*(void *)(a1 + 32) + 364LL) = v19;
    *(_DWORD *)(*(void *)(a1 + 32) + 316LL) = 0;
  }

  else
  {
    [(id)v4 zoneNameForNode:v5];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "containsObject:") & 1) == 0) {
      -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( *(void *)(a1 + 32),  a2,  0LL,  *(_DWORD *)(a1 + 48),  (v6 >> 5) & 0xFFFFFFFFFLL,  *(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * *(unsigned int *)(a1 + 48) + 8) >> 41,  0LL,  1u,  *(void *)(a1 + 40));
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(const void **)(v8 + 256);
    size_t v10 = *(unsigned int *)(v8 + 264);
    uint64_t v11 = MEMORY[0x1895F87A8];
    __compar[0] = MEMORY[0x1895F87A8];
    __compar[1] = 3221225472LL;
    __compar[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    int v32 = *(_DWORD *)(a1 + 48);
    int v12 = bsearch_b(0LL, v9, v10, 0x10uLL, __compar);
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(unsigned int *)(a1 + 48);
      mach_vm_address_t v16 = *(void **)(*(void *)(v13 + 272) + ((*(void *)(*(void *)(v13 + 96) + 16 * v15 + 8) >> 38) & 0x3FFFFF8LL));
      uint64_t v17 = v12[1];
      v27[0] = v11;
      v27[1] = 3221225472LL;
      v27[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v27[3] = &unk_189DFD408;
      v27[4] = v13;
      uint64_t v29 = a2;
      int v30 = v15;
      id v28 = v14;
      id v18 = v16;
      [v18 enumerateStoredEntriesForObject:a2 ofSize:v6 >> 5 externalValues:v17 block:v27];
    }
  }

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4( uint64_t a1,  uint64_t a2,  unint64_t *a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 32);
  BOOL v4 = *a3 > v3;
  BOOL v5 = *a3 != v3;
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5( uint64_t a1,  void *a2,  unsigned int a3,  unsigned int a4)
{
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6( uint64_t a1,  uint64_t a2)
{
  if (*MEMORY[0x1895FD568] >= *MEMORY[0x1895FD590]) {
    unint64_t v4 = *MEMORY[0x1895FD590];
  }
  else {
    unint64_t v4 = *MEMORY[0x1895FD568];
  }
  if (*MEMORY[0x1895FD560] >= *MEMORY[0x1895FD578]) {
    uint64_t v5 = *MEMORY[0x1895FD578];
  }
  else {
    uint64_t v5 = *MEMORY[0x1895FD560];
  }
  uint64_t v6 = *(void *)(a1 + 72) & ~v5;
  unint64_t v7 = ((*(void *)(a1 + 80) + v5) & ~v5) - v6;
  unint64_t v30 = v7 / v4;
  uint64_t v8 = malloc(4 * (v7 / v4) + 4);
  v8[v7 / v4] = 0;
  [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = [v9 machVMPageRangeQueryWithAddress:v6 size:v7 dispositions:v8 dispositionsCount:&v30];

  if ((_DWORD)v6)
  {
    free(v8);
  }

  else
  {
    uint64_t v29 = a2;
    uint64_t v10 = *(void *)(a1 + 56);
    unint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24LL);
    if (v11)
    {
      uint64_t v12 = ~v5;
      unint64_t v13 = *(void *)(a1 + 72) & ~v5;
      unint64_t v14 = -1LL;
      uint64_t v15 = (char *)v8;
      do
      {
        char v16 = *v15;
        v15 += 4;
        BOOL v17 = (v16 & 0x11) == 0 || v13 >= *(void *)(a1 + 80);
        int v18 = !v17;
        if (v17)
        {
          uint64_t v19 = *(void *)(a1 + 64);
          if (v14 == -1LL)
          {
            unint64_t v20 = *(void *)(*(void *)(v19 + 8) + 24LL);
            if (v13 > v20)
            {
              if (v11 >= v13 - v20) {
                unint64_t v21 = v13 - v20;
              }
              else {
                unint64_t v21 = v11;
              }
              -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( *(void *)(a1 + 32),  v29,  v20 - *(void *)(a1 + 72),  *(_DWORD *)(a1 + 88),  v21,  0,  0LL,  8u,  *(void *)(a1 + 48));
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) += v21;
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) -= v21;
              uint64_t v19 = *(void *)(a1 + 64);
            }
          }

          uint64_t v22 = *(void *)(v19 + 8);
          uint64_t v23 = *(void *)(v22 + 24);
          *(void *)(v22 + 24) = (v23 & v12) + v4;
          unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) - v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8LL);
          unint64_t v26 = *(void *)(v25 + 24);
          BOOL v17 = v26 >= v24;
          unint64_t v27 = v26 - v24;
          if (!v17) {
            unint64_t v27 = 0LL;
          }
          *(void *)(v25 + 24) = v27;
          uint64_t v10 = *(void *)(a1 + 56);
        }

        if (v14 >= v13) {
          unint64_t v28 = v13;
        }
        else {
          unint64_t v28 = v14;
        }
        if (v18) {
          unint64_t v14 = -1LL;
        }
        else {
          unint64_t v14 = v28;
        }
        v13 += v4;
        unint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24LL);
      }

      while (v11);
    }

    free(v8);
    if (*(_BYTE *)(*(void *)(a1 + 40) + 49LL)) {
      [*(id *)(a1 + 32) clearCrashReporterInfoForMappedFileRegion];
    }
  }

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7( uint64_t a1,  uint64_t a2)
{
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  if (!a3) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = 0LL;
  unint64_t v7 = (_DWORD *)MEMORY[0x1895FD580];
  uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
  do
  {
    uint64_t v9 = *(uint64_t **)(*(void *)(v5 + 32) + 128LL);
    unint64_t v10 = v9[6];
    unint64_t v11 = v9[7];
    BOOL v12 = v11 >= v10;
    unint64_t v13 = v11 - v10;
    if (!v12) {
      goto LABEL_53;
    }
    unint64_t v14 = *(void *)(a2 + 8 * v6);
    if (v14 - v10 >= v13) {
      goto LABEL_53;
    }
    unint64_t v15 = v14 >> *v7;
    if (v15)
    {
      char v16 = (unsigned int *)v9[3];
      unint64_t v17 = v14 >> *v7;
      do
      {
        if (*v16 <= (v17 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
        {
          goto LABEL_53;
        }

        v17 >>= 26;
      }

      while (v17);
    }

    uint64_t v18 = (uint64_t)v9 + 4 * (v15 & 0x7FFFF);
    int v21 = *(_DWORD *)(v18 + 64);
    unint64_t v20 = (_DWORD *)(v18 + 64);
    int v19 = v21;
    uint64_t v22 = v9[4];
    if (v21)
    {
      unint64_t v23 = v22 + ((unint64_t)(v19 - 1) << 6);
      if (v14 - *(void *)(*(void *)v23 + *v8) < *(void *)(*(void *)v23 + *v8 + 8LL)) {
        goto LABEL_13;
      }
    }

    unint64_t v39 = *((unsigned int *)v9 + 10);
    if (!(_DWORD)v39) {
      goto LABEL_53;
    }
    unint64_t v40 = v9[4];
    while (1)
    {
      unint64_t v41 = v39 >> 1;
      unint64_t v23 = v40 + (v39 >> 1 << 6);
      uint64_t result = *(void *)v23;
      unint64_t v42 = (unint64_t *)(*(void *)v23 + *v8);
      if (*v42 <= v14) {
        break;
      }
LABEL_36:
      BOOL v12 = v39 >= 2;
      unint64_t v39 = v41;
      if (!v12) {
        goto LABEL_53;
      }
    }

    if (v42[1] + *v42 <= v14)
    {
      unint64_t v40 = v23 + 64;
      unint64_t v41 = --v39 >> 1;
      goto LABEL_36;
    }

    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
    uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
    unint64_t v7 = (_DWORD *)MEMORY[0x1895FD580];
    if ((_DWORD)result) {
      unint64_t v43 = 0LL;
    }
    else {
      unint64_t v43 = v23;
    }
    if ((result & 1) != 0) {
      goto LABEL_53;
    }
    if ((*(_BYTE *)(*(void *)v43 + 132LL) & 1) == 0) {
      goto LABEL_67;
    }
    BOOL v44 = (uint64_t *)(v43 + 64);
    unint64_t v45 = *((unsigned int *)v9 + 10) - ((uint64_t)(v43 + 64 - v9[4]) >> 6);
    if (!v45) {
      goto LABEL_64;
    }
    while (2)
    {
      unint64_t v46 = v45 >> 1;
      unint64_t v47 = &v44[8 * (v45 >> 1)];
      uint64_t result = *v47;
      if (*(void *)(*v47 + 8) > v14)
      {
LABEL_47:
        BOOL v48 = v45 > 1;
        unint64_t v45 = v46;
        if (!v48)
        {
          unint64_t v45 = 0LL;
          goto LABEL_64;
        }

        continue;
      }

      break;
    }

    if (*(void *)(*v47 + 16) + *(void *)(*v47 + 8) <= v14)
    {
      BOOL v44 = v47 + 8;
      unint64_t v46 = --v45 >> 1;
      goto LABEL_47;
    }

    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
    uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
    unint64_t v7 = (_DWORD *)MEMORY[0x1895FD580];
    if ((_DWORD)result) {
      unint64_t v45 = 0LL;
    }
    else {
      unint64_t v45 = (unint64_t)v47;
    }
LABEL_64:
    if (v45) {
      unint64_t v43 = v45;
    }
    unint64_t v23 = v43;
LABEL_67:
    *unint64_t v20 = ((v43 - v22) >> 6) + 1;
LABEL_13:
    unsigned int v24 = *(_DWORD *)(v23 + 20);
    if (v24)
    {
      uint64_t v25 = *(void *)(v23 + 8);
      uint64_t v26 = *v9;
      uint64_t v27 = *(unsigned int *)(v23 + 16);
      unint64_t v28 = (unint64_t *)(*v9 + 16 * v27);
      if (v25)
      {
        if (*v28 > v14) {
          goto LABEL_53;
        }
        uint64_t v29 = (void *)(v26 + 16LL * (v24 + v27 - 1));
        if (((v29[1] >> 5) & 0xFFFFFFFFFuLL) + *v29 <= v14) {
          goto LABEL_53;
        }
        unint64_t v30 = (unsigned int *)(v25 + 4 * ((v14 - (*v28 & -*MEMORY[0x1895FD590])) >> *v7));
        uint64_t v31 = *v30;
        int v32 = (unint64_t *)(v26 + 16 * v31);
        if (*v32 > v14) {
          goto LABEL_53;
        }
        uint64_t v33 = v30[1];
        if (v33 < *((_DWORD *)v9 + 2))
        {
          int v34 = (unint64_t *)(v26 + 16 * v33);
          unint64_t v35 = *v34;
          if (*v34 <= v14)
          {
LABEL_49:
            unint64_t v49 = v34[1];
            if ((v49 & 7) - 2 < 3) {
              goto LABEL_53;
            }
            unint64_t v50 = ((unint64_t)v34 - v26) >> 4;
            unint64_t v51 = v9[2];
            if (v14 - v35 >= v51)
            {
              if (((v49 >> 5) & 0xFFFFFFFFFLL) - (v14 - v35) > v51 || (_DWORD)v50 == -1) {
                goto LABEL_53;
              }
            }

            else if ((_DWORD)v50 == -1)
            {
              goto LABEL_53;
            }

            uint64_t v52 = v7;
            int v53 = v8;
            uint64_t result = (*(uint64_t (**)(void))(*(void *)(v5 + 40) + 16LL))();
            uint64_t v8 = v53;
            unint64_t v7 = v52;
            goto LABEL_53;
          }
        }

        unsigned int v36 = v33 - v31;
        if (v36)
        {
          do
          {
            uint64_t v37 = v36 >> 1;
            int v34 = &v32[2 * v37];
            unint64_t v35 = *v34;
            if (*v34 <= v14)
            {
              if (((v32[2 * v37 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14) {
                goto LABEL_49;
              }
              int v32 = v34 + 2;
              LODWORD(v37) = --v36 >> 1;
            }

            BOOL v12 = v36 >= 2;
            unsigned int v36 = v37;
          }

          while (v12);
        }
      }

      else
      {
        do
        {
          uint64_t v38 = v24 >> 1;
          int v34 = &v28[2 * v38];
          unint64_t v35 = *v34;
          if (*v34 <= v14)
          {
            if (((v28[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14) {
              goto LABEL_49;
            }
            unint64_t v28 = v34 + 2;
            LODWORD(v38) = --v24 >> 1;
          }

          BOOL v12 = v24 >= 2;
          unsigned int v24 = v38;
        }

        while (v12);
      }
    }

- (unsigned)_removeFalsePositiveLeakedVMregionsFromNodes:(unsigned int *)a3 nodeCount:(unsigned int)a4 recorder:(id)a5
{
  uint64_t v8 = (void (**)(void))a5;
  if (!a4)
  {
    unsigned int v35 = 0;
    goto LABEL_5;
  }

  uint64_t v9 = getenv("DT_REPORT_IOKIT_REGION_LEAKS");
  if (v9) {
    BOOL v10 = ((*v9 - 89) & 0xDF) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = (uint64_t *)self->_blocks + 1;
    do
    {
      uint64_t v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3) {
        break;
      }
      ++v13;
    }

    while (blocksCount != v13);
  }

  uint64_t v16 = 0LL;
  char v36 = 0;
  unsigned int v35 = 0;
  if (a4 <= 1) {
    uint64_t v17 = 1LL;
  }
  else {
    uint64_t v17 = a4;
  }
  uint64_t v18 = 0xFFFFFFFFLL;
  int v34 = v8;
  unsigned int v31 = -1;
  BOOL v33 = v10;
  do
  {
    uint64_t v19 = a3[v16];
    if (!(_DWORD)v19 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v19] + 2) & 7)) {
      goto LABEL_48;
    }
    unint64_t v20 = (unsigned __int8 *)objc_retain(*(id *)((char *)&self->_regions->var0
                                               + ((*((void *)&self->_blocks[v19] + 1) >> 35) & 0x1FFFFFC0LL)));
    int v21 = v20;
    int v22 = *((_DWORD *)v20 + 26);
    if (v22 > 87)
    {
      if (v22 == 88 || v22 == 100)
      {
LABEL_23:
        if (v10)
        {
          if ((v36 & 1) != 0)
          {
            char v36 = 1;
          }

          else
          {
            char v36 = 1;
            fwrite( "The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n",  0x97uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
          }
        }

        else
        {
          v8[2](v8);
        }

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  unint64_t v4 = objc_alloc(&OBJC_CLASS___VMUProcessObjectGraph);
  uint64_t pid = self->_pid;
  uint64_t blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  blocks = self->_blocks;
  -[VMUVMRegionIdentifier regions](self->_regionIdentifier, "regions");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = -[VMUProcessObjectGraph initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:]( v4,  "initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:",  pid,  blocks,  blocksCount,  zoneNames,  classInfoIndexer,  v10,  0LL,  self->_userMarkedAbandoned,  -[VMUObjectIdentifier autoreleasePoolPageLayout](self->_objectIdentifier, "autoreleasePoolPageLayout"));
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v11;

  -[VMUProcessObjectGraph setSnapshotMachTime:](self->_processObjectGraph, "setSnapshotMachTime:", self->_suspendTime);
  -[VMUProcessObjectGraph setSnapshotDate:](self->_processObjectGraph, "setSnapshotDate:", self->_suspendDate);
  -[VMUProcessObjectGraph setScanner:](self->_processObjectGraph, "setScanner:", self);
  -[VMUProcessObjectGraph setDebugTimer:](self->_processObjectGraph, "setDebugTimer:", self->_debugTimer);
  -[VMUProcessObjectGraph setShowRawClassNames:]( self->_processObjectGraph,  "setShowRawClassNames:",  self->_showRawClassNames);
  -[VMUProcessObjectGraph setProcessDescriptionString:]( self->_processObjectGraph,  "setProcessDescriptionString:",  self->_processDescriptionString);
  -[VMUProcessObjectGraph setIsTranslatedByRosetta:]( self->_processObjectGraph,  "setIsTranslatedByRosetta:",  -[VMUKernelCoreMemoryScanner isTranslatedByRosetta](self, "isTranslatedByRosetta"));
  -[VMUProcessObjectGraph setProcessName:](self->_processObjectGraph, "setProcessName:", self->_processName);
  -[VMUProcessObjectGraph setBinaryImagesDescription:]( self->_processObjectGraph,  "setBinaryImagesDescription:",  self->_binaryImagesDescription);
  -[VMUProcessObjectGraph setPhysicalFootprint:]( self->_processObjectGraph,  "setPhysicalFootprint:",  self->_physicalFootprint);
  -[VMUProcessObjectGraph setLedger:](self->_processObjectGraph, "setLedger:", self->_ledger);
  -[VMUProcessObjectGraph setPhysicalFootprintPeak:]( self->_processObjectGraph,  "setPhysicalFootprintPeak:",  self->_physicalFootprintPeak);
  uint64_t v13 = -[VMUTask taskDyldSharedCacheRange](self->_task, "taskDyldSharedCacheRange");
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  -[VMUProcessObjectGraph setObjectContentLevel:]( self->_processObjectGraph,  "setObjectContentLevel:",  -[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setObjectContentLevelForNodeLabels:]( self->_processObjectGraph,  "setObjectContentLevelForNodeLabels:",  -[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setSrcAddressToExtraAutoreleaseCountDict:]( self->_processObjectGraph,  "setSrcAddressToExtraAutoreleaseCountDict:",  self->_srcAddressToExtraAutoreleaseCountDict);
  if ((self->_regionDescriptionOptions & 0x10000) != 0) {
    -[VMUProcessObjectGraph setShowsPhysFootprint:](self->_processObjectGraph, "setShowsPhysFootprint:", 1LL);
  }
  uint64_t v15 = -[VMUTask createSymbolicatorWithFlags:andNotification:]( self->_task,  "createSymbolicatorWithFlags:andNotification:",  0LL,  0LL);
  uint64_t v17 = v16;
  if (self->_targetProcessHasObjCPatches)
  {
    uint64_t v82 = CSSymbolicatorCreateForTaskSharedCache();
    uint64_t v83 = v18;
  }

  else
  {
    uint64_t v82 = 0LL;
    uint64_t v83 = 0LL;
  }

  v124[0] = 0LL;
  v124[1] = v124;
  v124[2] = 0x3010000000LL;
  v124[5] = 0LL;
  v124[3] = &unk_1861837AD;
  v124[4] = 0LL;
  v123[0] = 0LL;
  v123[1] = v123;
  v123[2] = 0x3010000000LL;
  v123[5] = 0LL;
  v123[3] = &unk_1861837AD;
  v123[4] = 0LL;
  v121[0] = 0LL;
  v121[1] = v121;
  v121[2] = 0x2020000000LL;
  char v122 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v20 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v20)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v22 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v21,  OS_SIGNPOST_INTERVAL_END,  v22,  "processSnapshotGraph",  "",  buf,  2u);
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "processSnapshotGraph");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "sampling all threads");
  uint64_t v23 = self->_debugTimer;
  if (v23)
  {
    -[VMUDebugTimer logHandle](v23, "logHandle");
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v25 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "processSnapshotGraph",  "sampling all threads",  buf,  2u);
    }
  }

  if (-[VMUTask isCore](self->_task, "isCore"))
  {
    int v26 = 0LL;
    unint64_t v81 = 0LL;
  }

  else
  {
    int v27 = -[VMUSampler initWithTask:options:]( objc_alloc(&OBJC_CLASS___VMUSampler),  "initWithTask:options:",  -[VMUTask taskPort](self->_task, "taskPort"),  257LL);
    -[VMUSampler sampleAllThreadsOnceWithFramePointers:](v27, "sampleAllThreadsOnceWithFramePointers:", 1LL);
    int v26 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v81 = v27;
  }

  BOOL v28 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v28
    && ([NSString stringWithUTF8String:v28],
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(),
        [v29 uppercaseString],
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 isEqualToString:@"NO"],
        v30,
        v29,
        (v31 & 1) != 0))
  {
    int v32 = 0LL;
  }

  else
  {
    -[VMUProcessObjectGraph setBacktraces:](self->_processObjectGraph, "setBacktraces:", v26);
    int v32 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]( objc_alloc(&OBJC_CLASS___VMUSymbolStore),  "initWithSymbolicator:debugTimer:",  v15,  v17,  self->_debugTimer);
    -[VMUProcessObjectGraph setSymbolStore:](self->_processObjectGraph, "setSymbolStore:", v32);
    BOOL v33 = self->_processObjectGraph;
    -[VMUProcessObjectGraph symbolStore](v33, "symbolStore");
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 setGraph:v33];
  }

  if (v26)
  {
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    id v35 = v26;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v117 objects:v125 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v118;
      do
      {
        for (uint64_t i = 0LL; i != v36; ++i)
        {
          if (*(void *)v118 != v37) {
            objc_enumerationMutation(v35);
          }
          -[VMUSymbolStore addBacktrace:origin:]( v32,  "addBacktrace:origin:",  *(void *)(*((void *)&v117 + 1) + 8 * i),  0LL);
        }

        uint64_t v36 = [v35 countByEnumeratingWithState:&v117 objects:v125 count:16];
      }

      while (v36);
    }
  }

  *(void *)buf = 0LL;
  int v112 = buf;
  uint64_t v113 = 0x3010000000LL;
  uint64_t v116 = 0LL;
  mach_vm_address_t v114 = &unk_1861837AD;
  uint64_t v115 = 0LL;
  v110[0] = 0LL;
  v110[1] = v110;
  v110[2] = 0x3010000000LL;
  v110[4] = 0LL;
  v110[5] = 0LL;
  v110[3] = &unk_1861837AD;
  v108[0] = 0LL;
  v108[1] = v108;
  v108[2] = 0x3032000000LL;
  v108[3] = __Block_byref_object_copy__0;
  v108[4] = __Block_byref_object_dispose__0;
  id v109 = 0LL;
  v106[0] = 0LL;
  v106[1] = v106;
  v106[2] = 0x2020000000LL;
  int v107 = 0;
  if ((a3 & 2) != 0 && (-[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel") & 0xFFFFFFFE) == 2)
  {
    unint64_t v39 = self->_debugTimer;
    if (v39)
    {
      uint64_t v40 = -[VMUDebugTimer signpostID](v39, "signpostID");
      unint64_t v39 = self->_debugTimer;
      if (v40)
      {
        -[VMUDebugTimer logHandle](v39, "logHandle");
        unint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v42 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)uint64_t v105 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v41,  OS_SIGNPOST_INTERVAL_END,  v42,  "processSnapshotGraph",  "",  v105,  2u);
        }

        unint64_t v39 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v39, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "getting node labels");
    unint64_t v43 = self->_debugTimer;
    if (v43)
    {
      -[VMUDebugTimer logHandle](v43, "logHandle");
      BOOL v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v45 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)uint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  v45,  "processSnapshotGraph",  "getting node labels",  v105,  2u);
      }
    }

    v104[0] = MEMORY[0x1895F87A8];
    v104[1] = 3221225472LL;
    v104[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v104[3] = &unk_189DFD4F8;
    v104[4] = self;
    -[VMUKernelCoreMemoryScanner enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v104);
  }

  size_t regionsCount = self->_regionsCount;
  if ((_DWORD)regionsCount)
  {
    unint64_t v47 = self->_debugTimer;
    if (v47)
    {
      uint64_t v48 = -[VMUDebugTimer signpostID](v47, "signpostID");
      unint64_t v47 = self->_debugTimer;
      if (v48)
      {
        -[VMUDebugTimer logHandle](v47, "logHandle");
        unint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v50 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)uint64_t v105 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v49,  OS_SIGNPOST_INTERVAL_END,  v50,  "processSnapshotGraph",  "",  v105,  2u);
        }

        unint64_t v47 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v47, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "scan nodes into the graph, while recording symbols of __DATA regions and stacks");
    unint64_t v51 = self->_debugTimer;
    if (v51)
    {
      -[VMUDebugTimer logHandle](v51, "logHandle");
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v53 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)uint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v52,  OS_SIGNPOST_INTERVAL_BEGIN,  v53,  "processSnapshotGraph",  "scan nodes into the graph, while recording symbols of __DATA regions and stacks",  v105,  2u);
      }
    }

    uint64_t v54 = (char *)calloc(regionsCount, 4uLL);
    uint64_t v55 = MEMORY[0x1895F87A8];
    v87[0] = MEMORY[0x1895F87A8];
    v87[1] = 3221225472LL;
    _OWORD v87[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_141;
    v87[3] = &unk_189DFD790;
    unint64_t v98 = v54;
    unint64_t v99 = a3;
    uint64_t v100 = v82;
    uint64_t v101 = v83;
    uint64_t v102 = v15;
    uint64_t v103 = v17;
    v87[4] = self;
    mach_vm_address_t v91 = v124;
    int v92 = v121;
    uint64_t v93 = v123;
    mach_vm_size_t v88 = v32;
    uint64_t v94 = buf;
    uint64_t v95 = v110;
    uint64_t v96 = v108;
    int v97 = v106;
    id v89 = v26;
    mach_vm_address_t v90 = v81;
    -[VMUKernelCoreMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v87);
    unsigned int v56 = self->_debugTimer;
    if (v56)
    {
      uint64_t v57 = -[VMUDebugTimer signpostID](v56, "signpostID");
      unsigned int v56 = self->_debugTimer;
      if (v57)
      {
        -[VMUDebugTimer logHandle](v56, "logHandle");
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v59 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_WORD *)uint64_t v105 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v58,  OS_SIGNPOST_INTERVAL_END,  v59,  "processSnapshotGraph",  "",  v105,  2u);
        }

        unsigned int v56 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v56, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "find unreferenced VM regions");
    id v60 = self->_debugTimer;
    if (v60)
    {
      -[VMUDebugTimer logHandle](v60, "logHandle");
      id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v62 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)uint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v61,  OS_SIGNPOST_INTERVAL_BEGIN,  v62,  "processSnapshotGraph",  "find unreferenced VM regions",  v105,  2u);
      }
    }

    uint64_t v63 = malloc(4 * regionsCount);
    uint64_t v64 = v63;
    uint64_t v65 = self->_blocksCount;
    if ((_DWORD)v65)
    {
      uint64_t v66 = 0LL;
      uint64_t v67 = 0LL;
      unsigned int v68 = (unint64_t *)self->_blocks + 1;
      do
      {
        unint64_t v70 = *v68;
        v68 += 2;
        unint64_t v69 = v70;
        if ((v70 & 7) == 5 && !*(_DWORD *)&v54[(v69 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v63 + v67) = v66;
          uint64_t v67 = (v67 + 1);
        }

        ++v66;
      }

      while (v65 != v66);
      if ((_DWORD)v67)
      {
        v86[0] = v55;
        v86[1] = 3221225472LL;
        v86[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_155;
        v86[3] = &unk_189DFD598;
        void v86[4] = self;
        -[VMUKernelCoreMemoryScanner _removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:]( self,  "_removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:",  v63,  v67,  v86);
      }
    }

    free(v64);
    free(v54);
  }

  CSRelease();
  -[VMUKernelCoreMemoryScanner unmapAllRegions](self, "unmapAllRegions");
  unint64_t v71 = self->_debugTimer;
  if (v71)
  {
    uint64_t v72 = -[VMUDebugTimer signpostID](v71, "signpostID");
    unint64_t v71 = self->_debugTimer;
    if (v72)
    {
      -[VMUDebugTimer logHandle](v71, "logHandle");
      unint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v74 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)uint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v73,  OS_SIGNPOST_INTERVAL_END,  v74,  "processSnapshotGraph",  "",  v105,  2u);
      }

      unint64_t v71 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v71, "endEvent:", "processSnapshotGraph");
  if ((a3 & 1) != 0)
  {
    unint64_t v75 = objc_alloc(&OBJC_CLASS___VMUGraphStackLogReader);
    LODWORD(v80) = self->_zonesCount;
    uint64_t v76 = -[VMUGraphStackLogReader initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:]( v75,  "initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:",  self->_memoryCache,  v15,  v17,  self->_processObjectGraph,  self->_debugTimer,  self->_zones,  v80);
    if (v76)
    {
      -[VMUProcessObjectGraph setStackLogReader:](self->_processObjectGraph, "setStackLogReader:", v76);
      unint64_t v77 = self->_classInfoIndexer;
      v85[0] = MEMORY[0x1895F87A8];
      v85[1] = 3221225472LL;
      v85[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_157;
      v85[3] = &unk_189DFD328;
      v85[4] = self;
      -[VMUStackLogReaderBase identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:]( v76,  "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:",  self,  v77,  v85);
      -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
    }
  }

  -[VMUProcessObjectGraph setIdleExitStatus:](self->_processObjectGraph, "setIdleExitStatus:", self->_idleExitStatus);
  CSRelease();
  unint64_t v78 = self->_processObjectGraph;
  _Block_object_dispose(v106, 8);
  _Block_object_dispose(v108, 8);

  _Block_object_dispose(v110, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v123, 8);
  _Block_object_dispose(v124, 8);
  return v78;
}

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (*(void *)(a3 + 8) >> 60 == 1LL)
  {
    uint64_t v5 = (void *)MEMORY[0x186E32E40]();
    [*(id *)(a1 + 32) labelForNode:a2];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      [*(id *)(*(void *)(a1 + 32) + 496) setLabel:v6 forNode:a2];
    }

    objc_autoreleasePoolPop(v5);
  }

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_141( uint64_t a1,  uint64_t a2,  unint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  unsigned int v8 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5)] != -1)
  {
    if (v8 != (_DWORD)a5
      && (*(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * a5 + 8) & 7LL) == 5)
    {
      unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * a5 + 8);
      ++*(_DWORD *)(*(void *)(a1 + 120) + ((v10 >> 39) & 0x1FFFFFC));
    }

    if ((*(_BYTE *)(a1 + 128) & 4) != 0)
    {
      uint64_t v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16LL * v8 + 8) & 7))
      {
        BOOL v12 = (void *)MEMORY[0x186E32E40]();
        id v13 = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32) + 112LL)
                                + ((*(void *)(*(void *)(*(void *)(a1 + 32) + 96LL) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0LL)));
        uint64_t v14 = v13;
        if ((*((_BYTE *)v13 + 132) & 2) != 0)
        {
          if ((*((_BYTE *)v13 + 132) & 4) == 0) {
            goto LABEL_17;
          }
        }

        else if ((*((_BYTE *)v13 + 132) & 4) == 0)
        {
          if (*((_DWORD *)v13 + 26) != 30
            || a3 - *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 32LL) < *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL)
                                                                                            + 40LL))
          {
            goto LABEL_32;
          }

          if (a3 - *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 32LL) >= *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL)
                                                                                             + 40LL))
          {
            uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 152) indexForLocation:a3];
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v16 = *(void *)(*(void *)(a1 + 96) + 8LL);
              *(void *)(v16 + 32) = 0LL;
              *(void *)(v16 + 40) = 0LL;
              uint64_t v17 = *(void *)(*(void *)(a1 + 104) + 8LL);
              uint64_t v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = 0LL;

              *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 0;
            }

            else
            {
              uint64_t v33 = v15;
              uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 152) rangeAtIndex:v15];
              uint64_t v35 = *(void *)(*(void *)(a1 + 96) + 8LL);
              *(void *)(v35 + 32) = v34;
              *(void *)(v35 + 40) = v36;
              if ([*(id *)(a1 + 48) count])
              {
                uint64_t v37 = 0LL;
                unsigned int v38 = 0;
                while (1)
                {
                  [*(id *)(a1 + 48) objectAtIndexedSubscript:v37];
                  unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if ([v39 backtraceLength])
                  {
                    if ([v39 backtraceLength])
                    {
                      uint64_t v40 = 0LL;
                      while (!*(void *)([v39 stackFramePointers] + 8 * v40))
                      {
                      }

                      uint64_t v41 = *(void *)([v39 stackFramePointers] + 8 * v40);
                    }

                    else
                    {
LABEL_40:
                      uint64_t v41 = 0LL;
                    }
                  }

                  uint64_t v37 = ++v38;
                }

                uint64_t v42 = *(void *)(*(void *)(a1 + 104) + 8LL);
                unint64_t v43 = *(void **)(v42 + 40);
                *(void *)(v42 + 40) = v39;
              }

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_155( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5)];
}

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_157( uint64_t result,  unsigned int a2,  unsigned int a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 96LL) + 16LL * a2;
  *(void *)(v3 + 8) = *(void *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (id)processSnapshotGraph
{
  return -[VMUKernelCoreMemoryScanner processSnapshotGraphWithOptions:](self, "processSnapshotGraphWithOptions:", 5LL);
}

- (VMUClassInfoMap)realizedClasses
{
  return -[VMUObjectIdentifier realizedClasses](self->_objectIdentifier, "realizedClasses");
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 hasClassInfosDerivedFromStackBacktraces];

  return v3;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUKernelCoreMemoryScanner *)self
{
  if (self->_blocksCount <= v1)
  {
    unint64_t *v2 = 0LL;
    v2[1] = 0LL;
    v2[2] = 0LL;
  }

  else
  {
    char v3 = &self->_blocks[v1];
    unint64_t var0 = v3->var0;
    unint64_t v4 = *((void *)v3 + 1);
    unint64_t *v2 = var0;
    v2[1] = ((v4 >> 5) | (v4 << 60)) & 0x7000000FFFFFFFFFLL;
    if ((v4 & 7) == 1) {
      unint64_t v6 = *(unint64_t *)((char *)self->_classInfos + ((v4 >> 38) & 0x3FFFFF8));
    }
    else {
      unint64_t v6 = 0LL;
    }
    v2[2] = v6;
  }

  return ($61A80719B04F7407D3E47539F1B23CAA)self;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  id v4 = 0LL;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v8 = var7 - var6;
  BOOL v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9) {
    return v4;
  }
  unint64_t v11 = a3 >> *MEMORY[0x1895FD580];
  if (v11)
  {
    var3 = regionMap->var3;
    unint64_t v13 = a3 >> *MEMORY[0x1895FD580];
    while (*var3 > (v13 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v13 & 0x3FFFFFF) >> 3) + 4) >> (v13 & 7)) & 1) != 0)
    {
      v13 >>= 26;
      if (!v13) {
        goto LABEL_8;
      }
    }

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[VMUKernelCoreMemoryScanner nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    -[VMUKernelCoreMemoryScanner nodeDetails:](self, "nodeDetails:", v3);
    -[VMUKernelCoreMemoryScanner vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)zoneNameForNode:(unsigned int)a3
{
  if (self->_blocksCount <= a3) {
    goto LABEL_43;
  }
  uint64_t v4 = a3;
  if (VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[a3] + 2) & 7))
  {
    uint64_t v5 = &self->_regions[*((void *)&self->_blocks[v4] + 1) >> 41];
    if (!v5) {
      goto LABEL_43;
    }
    goto LABEL_4;
  }

  blocks = self->_blocks;
  if ((*((void *)&blocks[v4] + 1) & 7LL) != 1) {
    goto LABEL_43;
  }
  unint64_t v8 = 0LL;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v13 = var7 >= var6;
  unint64_t v14 = var7 - var6;
  if (!v13) {
    return v8;
  }
  unint64_t var0 = blocks[v4].var0;
  if (var0 - var6 >= v14) {
    return v8;
  }
  unint64_t v16 = var0 >> *MEMORY[0x1895FD580];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v18 = var0 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        goto LABEL_43;
      }

      v18 >>= 26;
    }

    while (v18);
  }

  uint64_t v19 = (char *)regionMap + 4 * (v16 & 0x7FFFF);
  int v22 = *((_DWORD *)v19 + 16);
  int v21 = v19 + 64;
  int v20 = v22;
  unint64_t var4 = regionMap->var4;
  if (v22)
  {
    id v6 = var4[(unint64_t)(v20 - 1)].var0;
    if (var0 - *((void *)v6 + 1) < *((void *)v6 + 2)) {
      goto LABEL_5;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_43;
  }
  int v25 = regionMap->var4;
  while (1)
  {
    unint64_t v26 = var5 >> 1;
    uint64_t v5 = &v25[var5 >> 1];
    if (*((void *)v5->var0 + 1) <= var0) {
      break;
    }
LABEL_23:
    unint64_t v8 = 0LL;
    BOOL v13 = var5 >= 2;
    unint64_t var5 = v26;
    if (!v13) {
      return v8;
    }
  }

  if (*((void *)v5->var0 + 2) + *((void *)v5->var0 + 1) <= var0)
  {
    int v25 = v5 + 1;
    unint64_t v26 = --var5 >> 1;
    goto LABEL_23;
  }

  int v27 = [v5->var0 isSpecialPhysFootprintRegion];
  unint64_t v8 = 0LL;
  if (v27) {
    unint64_t v28 = 0LL;
  }
  else {
    unint64_t v28 = v5;
  }
  if ((v27 & 1) != 0) {
    return v8;
  }
  if ((*((_BYTE *)v28->var0 + 132) & 1) == 0) {
    goto LABEL_42;
  }
  p_unint64_t var0 = &v28[1].var0;
  unint64_t v30 = regionMap->var5 - (&v28[1] - regionMap->var4);
  if (!v30) {
    goto LABEL_39;
  }
  while (2)
  {
    unint64_t v31 = v30 >> 1;
    uint64_t v32 = &p_var0[8 * (v30 >> 1)];
    if (*((void *)*v32 + 1) > var0)
    {
LABEL_34:
      BOOL v33 = v30 > 1;
      unint64_t v30 = v31;
      if (!v33)
      {
        unint64_t v30 = 0LL;
        goto LABEL_39;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v32 + 2) + *((void *)*v32 + 1) <= var0)
  {
    p_unint64_t var0 = v32 + 8;
    unint64_t v31 = --v30 >> 1;
    goto LABEL_34;
  }

  else {
    unint64_t v30 = (unint64_t)v32;
  }
LABEL_39:
  if (v30) {
    uint64_t v5 = (_VMURegionNode *)v30;
  }
  else {
    uint64_t v5 = v28;
  }
LABEL_42:
  *int v21 = ((unint64_t)((char *)v5 - (char *)var4) >> 6) + 1;
  if (!v5)
  {
LABEL_43:
    unint64_t v8 = 0LL;
    return v8;
  }

- (id)zoneNameForIndex:(unsigned int)a3
{
  if (self->_zonesCount <= a3) {
    return 0LL;
  }
  else {
    return self->_zones[a3].var1;
  }
}

- (BOOL)hasLabelsForNodes
{
  return 1;
}

- (id)labelForNode:(unsigned int)a3
{
  if (self->_blocksCount > a3 && (uint64_t v3 = *(void *)&a3, v5 = &self->_blocks[a3], (*((void *)v5 + 1) & 7LL) == 1))
  {
    uint64_t v6 = *((void *)v5 + 1) >> 41;
    else {
      id v7 = 0LL;
    }
    -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:]( self->_objectIdentifier,  "labelForMemory:length:remoteAddress:classInfo:",  -[VMUKernelCoreMemoryScanner contentForNode:](self, "contentForNode:", v3),  (*((void *)v5 + 1) >> 5) & 0xFFFFFFFFFLL,  v5->var0,  v7);
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = v3;
    shortenString(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)contentForNode:(unsigned int)a3
{
  if (self->_blocksCount <= a3) {
    return 0LL;
  }
  uint64_t result = 0LL;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v8 = var7 >= var6;
  unint64_t v9 = var7 - var6;
  if (!v8) {
    return result;
  }
  unint64_t var0 = self->_blocks[a3].var0;
  if (var0 - var6 >= v9) {
    return result;
  }
  BOOL v12 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v13 = var0 >> *MEMORY[0x1895FD580];
  if (v13)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v15 = var0 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0LL;
      }

      v15 >>= 26;
    }

    while (v15);
  }

  unint64_t v16 = (char *)regionMap + 4 * (v13 & 0x7FFFF);
  int v19 = *((_DWORD *)v16 + 16);
  unint64_t v18 = v16 + 64;
  int v17 = v19;
  unint64_t var4 = regionMap->var4;
  if (v19)
  {
    int v21 = &var4[(unint64_t)(v17 - 1)];
    if (var0 - *((void *)v21->var0 + 1) < *((void *)v21->var0 + 2)) {
      goto LABEL_12;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    return 0LL;
  }
  BOOL v44 = regionMap->var4;
  while (1)
  {
    unint64_t v45 = var5 >> 1;
    int v21 = &v44[var5 >> 1];
    if (*((void *)v21->var0 + 1) <= var0) {
      break;
    }
LABEL_29:
    BOOL v8 = var5 >= 2;
    unint64_t var5 = v45;
    if (!v8) {
      return 0LL;
    }
  }

  if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) <= var0)
  {
    BOOL v44 = v21 + 1;
    unint64_t v45 = --var5 >> 1;
    goto LABEL_29;
  }

  int v51 = [v21->var0 isSpecialPhysFootprintRegion];
  uint64_t result = 0LL;
  if (v51) {
    unint64_t v52 = 0LL;
  }
  else {
    unint64_t v52 = (unint64_t)v21;
  }
  if ((v51 & 1) == 0)
  {
    if ((*(_BYTE *)(*(void *)v52 + 132LL) & 1) == 0) {
      goto LABEL_76;
    }
    uint64_t v53 = (id *)(v52 + 64);
    unint64_t v54 = regionMap->var5 - ((uint64_t)(v52 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v54) {
      goto LABEL_73;
    }
    while (1)
    {
      unint64_t v55 = v54 >> 1;
      unsigned int v56 = &v53[8 * (v54 >> 1)];
      if (*((void *)*v56 + 1) <= var0)
      {
        if (*((void *)*v56 + 2) + *((void *)*v56 + 1) > var0)
        {
          else {
            unint64_t v54 = (unint64_t)v56;
          }
LABEL_73:
          if (v54) {
            unint64_t v52 = v54;
          }
          int v21 = (_VMURegionNode *)v52;
LABEL_76:
          *unint64_t v18 = ((v52 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          uint64_t v22 = a3;
          BOOL v23 = &self->_blocks[a3];
          unint64_t v24 = ((*((void *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            unsigned int regionsCount = self->_regionsCount;
            uint64_t v42 = self->_task;
            unsigned int v49 = memoryCache;
            unint64_t v29 = v49;
            if (!v21->var7)
            {
              uint64_t v63 = v21->var0;
              if ((*((_BYTE *)v21->var0 + 132) & 2) == 0)
              {
                -[VMUTaskMemoryCache taskIsTranslated](v49, "taskIsTranslated");
                uint64_t v63 = v21->var0;
              }

              int v64 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v29,  "mapAddress:size:returnedAddress:returnedSize:",  v63[1],  v63[2],  v83,  v87);
              if (v64)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  int v65 = v64;
                  BOOL v66 = task_exists(v42);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v66)
                  {
                    unint64_t v81 = (FILE *)*MEMORY[0x1895F89D0];
                    uint64_t v79 = [v21->var0 address];
                    uint64_t v67 = *((unsigned int *)v21->var0 + 6);
                    unint64_t v78 = vm_prot_strings_0[v67];
                    uint64_t v68 = v22;
                    uint64_t v69 = *((void *)v21->var0 + 2) + *((void *)v21->var0 + 1);
                    VMURegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)v21->var0 + 104),  *((unsigned __int8 *)v21->var0 + 50),  v67,  *((unsigned __int8 *)v21->var0 + 49));
                    id v71 = v70 = v42;
                    uint64_t v72 = (const char *)[v71 UTF8String];
                    uint64_t v73 = *((void *)v21->var0 + 2) >> *v12;
                    os_signpost_id_t v74 = "pages";
                    if (v73 == 1) {
                      os_signpost_id_t v74 = "page";
                    }
                    if (v21->var4 == v21->var5) {
                      unint64_t v75 = "";
                    }
                    else {
                      unint64_t v75 = " [root]";
                    }
                    uint64_t v77 = v69;
                    uint64_t v22 = v68;
                    fprintf( v81,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v79,  v77,  v78,  v72,  v73,  v74,  v75,  v65);

                    uint64_t v42 = v70;
                  }
                }
              }

              else
              {
                uint64_t v76 = (void *)v83[0];
                v21->unint64_t var6 = v87[0];
                v21->unint64_t var7 = v76;
                v21->var8 = v21;
              }
            }
          }

          else
          {
            LODWORD(v25) = 1;
            do
            {
              unint64_t v26 = (char *)v21[(unint64_t)v25].var0 + 8;
              uint64_t v25 = (v25 + 1);
            }

            while (v26[1] + *v26 < v24);
            int v27 = self->_memoryCache;
            uint64_t v80 = self->_task;
            unint64_t v28 = v27;
            unint64_t v29 = v28;
            uint64_t v30 = 0LL;
            if ((_DWORD)v25)
            {
              uint64_t v31 = v25;
              uint64_t v32 = v21;
              do
              {
                BOOL v33 = v32->var0;
                ++v32;
                v30 += v33[2];
                --v31;
              }

              while (v31);
            }

            v87[0] = 0LL;
            unint64_t v82 = 0LL;
            uint64_t v34 = -[VMUTaskMemoryCache findMappedAddress:size:]( v28,  "findMappedAddress:size:",  *((void *)v21->var0 + 1),  v30);
            if (v34)
            {
              unint64_t var1 = v34->var1;
              unint64_t v36 = *((void *)v21->var0 + 1) - v34->var0;
              v87[0] = v34->var2 + v36;
              unint64_t v82 = var1 - v36;
              goto LABEL_20;
            }

            if ((_DWORD)v25)
            {
              unint64_t v58 = 0LL;
              do
              {
                os_signpost_id_t v59 = v29;
                id v60 = v59;
                if (v21[v58 / 0x40].var7)
                {
                  if (&v21[v58 / 0x40] == v21[v58 / 0x40].var8)
                  {
                    v83[0] = MEMORY[0x1895F87A8];
                    v83[1] = 3221225472LL;
                    v83[2] = ___unmapRegion_block_invoke_0;
                    v83[3] = &unk_189DFD7B8;
                    uint64_t v84 = v59;
                    int v85 = &v21[v58 / 0x40];
                    unsigned int v86 = v21;
                    os_signpost_id_t v62 = (void (**)(void))MEMORY[0x186E33044](v83);
                    v62[2]();
                  }

                  else
                  {
                    id v61 = &v21[v58 / 0x40];
                    v61->unint64_t var6 = 0LL;
                    v61->unint64_t var7 = 0LL;
                    v61->var8 = 0LL;
                  }
                }

                v58 += 64LL;
              }

              while ((unint64_t)v25 << 6 != v58);
            }

            if (-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v29,  "mapAddress:size:returnedAddress:returnedSize:",  *((void *)v21->var0 + 1),  v30,  v87,  &v82))
            {
              if (task_exists(v80)) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *((void *)v21->var0 + 1),  *((void *)v21->var0 + 1) + v30);
              }
            }

            else
            {
LABEL_20:
              if ((_DWORD)v25)
              {
                unint64_t v37 = 0LL;
                unint64_t v38 = v82;
                do
                {
                  unint64_t v39 = &v21[v37 / 0x40];
                  v39->var8 = v21;
                  v39->unint64_t var6 = v38;
                  uint64_t v40 = v87[0];
                  v39->unint64_t var7 = (void *)v87[0];
                  uint64_t v41 = (uint64_t)v21[v37 / 0x40].var0 + 8;
                  v87[0] = *((void *)v21[v37 / 0x40].var0 + 2) + v40;
                  unint64_t v38 = v82 - *(void *)(v41 + 8);
                  unint64_t v82 = v38;
                  v37 += 64LL;
                }

                while ((unint64_t)v25 << 6 != v37);
              }
            }

            uint64_t v42 = v80;
          }

          unint64_t v50 = (char *)v21->var7;
          if (v50) {
            return &v50[self->_blocks[v22].var0 - *((void *)v21->var0 + 1)];
          }
          return 0LL;
        }

        uint64_t v53 = v56 + 8;
        unint64_t v55 = --v54 >> 1;
      }

      BOOL v57 = v54 > 1;
      unint64_t v54 = v55;
      if (!v57)
      {
        unint64_t v54 = 0LL;
        goto LABEL_73;
      }
    }
  }

  return result;
}

- (unsigned)mallocNodeCount
{
  uint64_t blocksCount = self->_blocksCount;
  if (!(_DWORD)blocksCount) {
    return 0;
  }
  unsigned int result = 0;
  uint64_t v5 = (uint64_t *)self->_blocks + 1;
  do
  {
    uint64_t v6 = *v5;
    v5 += 2;
    if ((v6 & 7) == 1) {
      ++result;
    }
    --blocksCount;
  }

  while (blocksCount);
  return result;
}

- (id)classInfoForObjectAtAddress:(unint64_t)a3
{
  id v4 = 0LL;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v8 = var7 - var6;
  BOOL v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9) {
    return v4;
  }
  unint64_t v11 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v12 = a3 >> *MEMORY[0x1895FD580];
  if (v12)
  {
    var3 = regionMap->var3;
    unint64_t v14 = a3 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_34;
      }

      v14 >>= 26;
    }

    while (v14);
  }

  unint64_t v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  int v18 = *((_DWORD *)v15 + 16);
  int v17 = v15 + 64;
  int v16 = v18;
  unint64_t var4 = regionMap->var4;
  if (v18)
  {
    int v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((void *)v20->var0 + 1) < *((void *)v20->var0 + 2)) {
      goto LABEL_10;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_34;
  }
  unint64_t v38 = regionMap->var4;
  while (1)
  {
    unint64_t v39 = var5 >> 1;
    int v20 = &v38[var5 >> 1];
    if (*((void *)v20->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v35 = var5 >= 2;
    unint64_t var5 = v39;
    if (!v35) {
      goto LABEL_34;
    }
  }

  if (*((void *)v20->var0 + 2) + *((void *)v20->var0 + 1) <= a3)
  {
    unint64_t v38 = v20 + 1;
    unint64_t v39 = --var5 >> 1;
    goto LABEL_33;
  }

  int v41 = [v20->var0 isSpecialPhysFootprintRegion];
  id v4 = 0LL;
  if (v41) {
    unint64_t v42 = 0LL;
  }
  else {
    unint64_t v42 = (unint64_t)v20;
  }
  if ((v41 & 1) != 0) {
    return v4;
  }
  if ((*(_BYTE *)(*(void *)v42 + 132LL) & 1) == 0) {
    goto LABEL_61;
  }
  unint64_t v43 = (id *)(v42 + 64);
  unint64_t v44 = regionMap->var5 - ((uint64_t)(v42 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v44) {
    goto LABEL_58;
  }
  while (2)
  {
    unint64_t v45 = v44 >> 1;
    unint64_t v46 = &v43[8 * (v44 >> 1)];
    if (*((void *)*v46 + 1) > a3)
    {
LABEL_45:
      BOOL v47 = v44 > 1;
      unint64_t v44 = v45;
      if (!v47)
      {
        unint64_t v44 = 0LL;
        goto LABEL_58;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v46 + 2) + *((void *)*v46 + 1) <= a3)
  {
    unint64_t v43 = v46 + 8;
    unint64_t v45 = --v44 >> 1;
    goto LABEL_45;
  }

  else {
    unint64_t v44 = (unint64_t)v46;
  }
LABEL_58:
  if (v44) {
    unint64_t v42 = v44;
  }
  int v20 = (_VMURegionNode *)v42;
LABEL_61:
  *int v17 = ((v42 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v21 = v20->var3;
  if (!v21) {
    goto LABEL_34;
  }
  unint64_t var1 = v20->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v20->var2;
  uint64_t v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      unint64_t v26 = &var0[v21 - 1 + var2];
      if (((*((void *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        id v4 = 0LL;
        int v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1895FD590])) >> *v11];
        uint64_t v28 = *v27;
        p_unint64_t var0 = &var0[v28].var0;
        if (*p_var0 > a3) {
          return v4;
        }
        uint64_t v30 = v27[1];
        if (v30 < regionMap->var1 && (uint64_t v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
        {
LABEL_47:
          unint64_t v48 = v31[1];
          if ((v48 & 7) - 2 >= 3)
          {
            unint64_t v49 = a3 - v32;
            unint64_t v50 = regionMap->var2;
            if (v49 < v50 || ((v48 >> 5) & 0xFFFFFFFFFLL) - v49 <= v50)
            {
              unint64_t v51 = (char *)v31 - (char *)var0;
              if (self->_blocksCount > (v51 >> 4))
              {
                blocks = self->_blocks;
                unint64_t v53 = *((void *)&blocks[(v51 >> 4)] + 1);
                if ((v53 & 7) == 1)
                {
                  unint64_t v54 = v53 >> 41;
                  if (v53 >> 41 && self->_classInfosCount > v54)
                  {
                    id v4 = self->_classInfos[v54];
                  }

                  else
                  {
                    -[VMUObjectIdentifier classInfoForObjectWithRange:]( self->_objectIdentifier,  "classInfoForObjectWithRange:",  blocks[(v51 >> 4)].var0,  (v53 >> 5) & 0xFFFFFFFFFLL);
                    id v4 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  return v4;
                }
              }
            }
          }
        }

        else
        {
          unsigned int v33 = v30 - v28;
          if (v33)
          {
            do
            {
              uint64_t v34 = v33 >> 1;
              uint64_t v31 = &p_var0[2 * v34];
              unint64_t v32 = *v31;
              if (*v31 <= a3)
              {
                if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
                  goto LABEL_47;
                }
                p_unint64_t var0 = v31 + 2;
                LODWORD(v34) = --v33 >> 1;
              }

              id v4 = 0LL;
              BOOL v35 = v33 >= 2;
              unsigned int v33 = v34;
            }

            while (v35);
            return v4;
          }
        }
      }
    }

- (BOOL)addressIsInDataSegment:(unint64_t)a3
{
  return a3 - self->_dataSegmentsRangeInSharedCache.location < self->_dataSegmentsRangeInSharedCache.length
      || a3 - self->_dataSegmentsRangeOutsideSharedCache.location < self->_dataSegmentsRangeOutsideSharedCache.length
      && -[VMURangeArray indexForLocation:](self->_dataSegmentsRangeArrayOutsideSharedCache, "indexForLocation:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v14 = 0;
    if (self->_blocksCount)
    {
      uint64_t v5 = 0LL;
      unint64_t v6 = 0LL;
      do
      {
        id v7 = &self->_blocks[v5];
        unint64_t v8 = *((void *)v7 + 1);
        if ((v8 & 7) == 1) {
          uint64_t v9 = *(uint64_t *)((char *)self->_classInfos + ((v8 >> 38) & 0x3FFFFF8));
        }
        else {
          uint64_t v9 = 0LL;
        }
        unint64_t v10 = (void (*)(void *, unint64_t, void *, char *))v4[2];
        v13[0] = v7->var0;
        v13[1] = ((v8 & 7) << 60) | (v8 >> 5) & 0xFFFFFFFFFLL;
        v13[2] = v9;
        v10(v4, v6++, v13, &v14);
        ++v5;
      }

      while (v6 < self->_blocksCount && v14 == 0);
    }

    else
    {
      LODWORD(v6) = 0;
    }
  }

  else
  {
    LODWORD(v6) = self->_blocksCount;
  }

  return v6;
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  unint64_t v6 = a4;
  if (a3)
  {
    unsigned __int8 v20 = 0;
    unint64_t blocksCount = self->_blocksCount;
    if ((_DWORD)blocksCount)
    {
      uint64_t v8 = 0LL;
      int v9 = 0;
      unint64_t v10 = 0LL;
      unsigned int v11 = 0;
      while (1)
      {
        if (v10 >= *(unsigned int *)a3
          || ((*((unsigned __int8 *)a3 + (v10 >> 3) + 4) >> (v10 & 7)) & 1) == 0)
        {
          int v15 = 0;
          goto LABEL_13;
        }

        unint64_t v12 = &self->_blocks[v8];
        unint64_t v13 = *((void *)v12 + 1);
        if ((v13 & 7) == 1) {
          break;
        }
        uint64_t v14 = 0LL;
        if (v6) {
          goto LABEL_11;
        }
LABEL_12:
        ++v11;
        int v15 = v9;
LABEL_13:
        if (++v10 < blocksCount)
        {
          ++v8;
          if (!v15) {
            continue;
          }
        }

        goto LABEL_17;
      }

      uint64_t v14 = *(uint64_t *)((char *)self->_classInfos + ((v13 >> 38) & 0x3FFFFF8));
      if (!v6) {
        goto LABEL_12;
      }
LABEL_11:
      unint64_t var0 = v12->var0;
      int v17 = (void (*)(void *, unint64_t, void *, unsigned __int8 *))v6[2];
      v19[0] = var0;
      v19[1] = ((v13 & 7) << 60) | (v13 >> 5) & 0xFFFFFFFFFLL;
      v19[2] = v14;
      v17(v6, v10, v19, &v20);
      unint64_t blocksCount = self->_blocksCount;
      int v9 = v20;
      goto LABEL_12;
    }
  }

  unsigned int v11 = 0;
LABEL_17:

  return v11;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  char v9 = 0;
  if (self->_regionsCount)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      (*((void (**)(id, id, char *))a3 + 2))(a3, self->_regions[v5].var0, &v9);
      ++v6;
      ++v5;
    }

    while (v6 < self->_regionsCount && v9 == 0);
  }

  else
  {
    LODWORD(v6) = 0;
  }

  return v6;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  char v16 = 0;
  uint64_t v11 = 0LL;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_189DFD5C0;
  char v9 = v15;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  unint64_t v10 = &v11;
  -[VMUKernelCoreMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v7);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    unint64_t v6 = (void *)result;
    id v7 = *(void **)(result + 32);
    if (v7)
    {
      [v7 nodeDetails:a2];
      id v8 = (void *)v6[4];
      if (v8) {
        [v8 nodeDetails:a5];
      }
    }

    unsigned int result = (*(uint64_t (**)(void))(v6[5] + 16LL))();
    ++*(_DWORD *)(*(void *)(v6[7] + 8LL) + 24LL);
  }

  return result;
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v6 = var7 - var6;
  BOOL v7 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v6 || v7) {
    return self;
  }
  char v9 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v10 = a3 >> *MEMORY[0x1895FD580];
  if (v10)
  {
    var3 = regionMap->var3;
    unint64_t v12 = a3 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v12 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v12 & 0x3FFFFFF) >> 3) + 4) >> (v12 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }

      v12 >>= 26;
    }

    while (v12);
  }

  uint64_t v13 = (char *)regionMap + 4 * (v10 & 0x7FFFF);
  int v16 = *((_DWORD *)v13 + 16);
  int v15 = v13 + 64;
  int v14 = v16;
  unint64_t var4 = regionMap->var4;
  if (v16)
  {
    int v18 = &var4[(unint64_t)(v14 - 1)];
    if (a3 - *((void *)v18->var0 + 1) < *((void *)v18->var0 + 2)) {
      goto LABEL_10;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_39;
  }
  uint64_t v36 = regionMap->var4;
  while (1)
  {
    unint64_t v37 = var5 >> 1;
    int v18 = &v36[var5 >> 1];
    if (*((void *)v18->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v33 = var5 >= 2;
    unint64_t var5 = v37;
    if (!v33) {
      goto LABEL_39;
    }
  }

  if (*((void *)v18->var0 + 2) + *((void *)v18->var0 + 1) <= a3)
  {
    uint64_t v36 = v18 + 1;
    unint64_t v37 = --var5 >> 1;
    goto LABEL_33;
  }

  int v38 = [v18->var0 isSpecialPhysFootprintRegion];
  if (v38) {
    unint64_t v39 = 0LL;
  }
  else {
    unint64_t v39 = (unint64_t)v18;
  }
  if ((v38 & 1) != 0) {
    goto LABEL_39;
  }
  if ((*(_BYTE *)(*(void *)v39 + 132LL) & 1) == 0) {
    goto LABEL_55;
  }
  uint64_t v40 = (id *)(v39 + 64);
  unint64_t v41 = regionMap->var5 - ((uint64_t)(v39 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v41) {
    goto LABEL_52;
  }
  while (2)
  {
    unint64_t v42 = v41 >> 1;
    unint64_t v43 = &v40[8 * (v41 >> 1)];
    if (*((void *)*v43 + 1) > a3)
    {
LABEL_46:
      BOOL v44 = v41 > 1;
      unint64_t v41 = v42;
      if (!v44)
      {
        unint64_t v41 = 0LL;
        goto LABEL_52;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v43 + 2) + *((void *)*v43 + 1) <= a3)
  {
    uint64_t v40 = v43 + 8;
    unint64_t v42 = --v41 >> 1;
    goto LABEL_46;
  }

  else {
    unint64_t v41 = (unint64_t)v43;
  }
LABEL_52:
  if (v41) {
    unint64_t v39 = v41;
  }
  int v18 = (_VMURegionNode *)v39;
LABEL_55:
  *int v15 = ((v39 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v19 = v18->var3;
  if (!v19) {
    goto LABEL_39;
  }
  unint64_t var1 = v18->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v18->var2;
  BOOL v23 = &regionMap->var0[var2];
  if (var1)
  {
    unint64_t v24 = v23->var0;
    if (v24 <= a3)
    {
      uint64_t v25 = &var0[v19 - 1 + var2];
      if (((*((void *)v25 + 1) >> 5) & 0xFFFFFFFFFLL) + v25->var0 > a3)
      {
        unint64_t v26 = &var1[(a3 - (v24 & -*MEMORY[0x1895FD590])) >> *v9];
        uint64_t v27 = *v26;
        p_unint64_t var0 = &var0[v27].var0;
        if (*p_var0 <= a3)
        {
          uint64_t v29 = v26[1];
          if (v29 < regionMap->var1)
          {
            uint64_t v30 = &var0[v29].var0;
            if (*v30 <= a3) {
              return (unint64_t)((char *)v30 - (char *)var0) >> 4;
            }
          }

          unsigned int v31 = v29 - v27;
          if (v31)
          {
            do
            {
              uint64_t v32 = v31 >> 1;
              uint64_t v30 = &p_var0[2 * v32];
              if (*v30 <= a3)
              {
                if (((p_var0[2 * v32 + 1] >> 5) & 0xFFFFFFFFFLL) + *v30 > a3) {
                  return (unint64_t)((char *)v30 - (char *)var0) >> 4;
                }
                p_unint64_t var0 = v30 + 2;
                LODWORD(v32) = --v31 >> 1;
              }

              LODWORD(self) = -1;
              BOOL v33 = v31 >= 2;
              unsigned int v31 = v32;
            }

            while (v33);
            return self;
          }
        }
      }
    }

- (unsigned)_nodeForAddress:(unint64_t)a3 checkMaxInteriorOffset:(BOOL)a4
{
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v7 = var7 - var6;
  BOOL v8 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v7 || v8) {
    return self;
  }
  BOOL v9 = a4;
  uint64_t v11 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v12 = a3 >> *MEMORY[0x1895FD580];
  if (v12)
  {
    var3 = regionMap->var3;
    unint64_t v14 = a3 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }

      v14 >>= 26;
    }

    while (v14);
  }

  int v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  int v18 = *((_DWORD *)v15 + 16);
  int v17 = v15 + 64;
  int v16 = v18;
  unint64_t var4 = regionMap->var4;
  if (v18)
  {
    unsigned __int8 v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((void *)v20->var0 + 1) < *((void *)v20->var0 + 2)) {
      goto LABEL_10;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_39;
  }
  int v38 = regionMap->var4;
  while (1)
  {
    unint64_t v39 = var5 >> 1;
    unsigned __int8 v20 = &v38[var5 >> 1];
    if (*((void *)v20->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v35 = var5 >= 2;
    unint64_t var5 = v39;
    if (!v35) {
      goto LABEL_39;
    }
  }

  if (*((void *)v20->var0 + 2) + *((void *)v20->var0 + 1) <= a3)
  {
    int v38 = v20 + 1;
    unint64_t v39 = --var5 >> 1;
    goto LABEL_33;
  }

  int v40 = [v20->var0 isSpecialPhysFootprintRegion];
  if (v40) {
    unint64_t v41 = 0LL;
  }
  else {
    unint64_t v41 = (unint64_t)v20;
  }
  if ((v40 & 1) != 0) {
    goto LABEL_39;
  }
  if ((*(_BYTE *)(*(void *)v41 + 132LL) & 1) == 0) {
    goto LABEL_59;
  }
  unint64_t v42 = (id *)(v41 + 64);
  unint64_t v43 = regionMap->var5 - ((uint64_t)(v41 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v43) {
    goto LABEL_56;
  }
  while (2)
  {
    unint64_t v44 = v43 >> 1;
    unint64_t v45 = &v42[8 * (v43 >> 1)];
    if (*((void *)*v45 + 1) > a3)
    {
LABEL_46:
      BOOL v46 = v43 > 1;
      unint64_t v43 = v44;
      if (!v46)
      {
        unint64_t v43 = 0LL;
        goto LABEL_56;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v45 + 2) + *((void *)*v45 + 1) <= a3)
  {
    unint64_t v42 = v45 + 8;
    unint64_t v44 = --v43 >> 1;
    goto LABEL_46;
  }

  else {
    unint64_t v43 = (unint64_t)v45;
  }
LABEL_56:
  if (v43) {
    unint64_t v41 = v43;
  }
  unsigned __int8 v20 = (_VMURegionNode *)v41;
LABEL_59:
  *int v17 = ((v41 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v21 = v20->var3;
  if (!v21) {
    goto LABEL_39;
  }
  unint64_t var1 = v20->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v20->var2;
  uint64_t v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      unint64_t v26 = &var0[v21 - 1 + var2];
      if (((*((void *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        uint64_t v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1895FD590])) >> *v11];
        uint64_t v28 = *v27;
        p_unint64_t var0 = &var0[v28].var0;
        if (*p_var0 <= a3)
        {
          uint64_t v30 = v27[1];
          if (v30 < regionMap->var1 && (unsigned int v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
          {
LABEL_48:
            if (!v9) {
              return (unint64_t)((char *)v31 - (char *)var0) >> 4;
            }
            unint64_t v47 = v31[1];
            if ((v47 & 7) - 2 >= 3)
            {
              unint64_t v48 = a3 - v32;
              unint64_t v49 = regionMap->var2;
              if (v48 < v49 || ((v47 >> 5) & 0xFFFFFFFFFLL) - v48 <= v49) {
                return (unint64_t)((char *)v31 - (char *)var0) >> 4;
              }
            }
          }

          else
          {
            unsigned int v33 = v30 - v28;
            if (v33)
            {
              do
              {
                uint64_t v34 = v33 >> 1;
                unsigned int v31 = &p_var0[2 * v34];
                unint64_t v32 = *v31;
                if (*v31 <= a3)
                {
                  if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
                    goto LABEL_48;
                  }
                  p_unint64_t var0 = v31 + 2;
                  LODWORD(v34) = --v33 >> 1;
                }

                LODWORD(self) = -1;
                BOOL v35 = v33 >= 2;
                unsigned int v33 = v34;
              }

              while (v35);
              return self;
            }
          }
        }
      }
    }

- (void)copyUserMarked
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (!userMarkedAbandoned) {
    return 0LL;
  }
  size_t v3 = ((*userMarkedAbandoned + 7) >> 3) + 4;
  id v4 = malloc(v3);
  memcpy(v4, userMarkedAbandoned, v3);
  return v4;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)isTranslatedByRosetta
{
  return -[VMUTask isTranslated](self->_task, "isTranslated");
}

- (unsigned)vmPageSize
{
  return *MEMORY[0x1895FD590];
}

- (unsigned)kernelPageSize
{
  return *MEMORY[0x1895FD568];
}

- (unsigned)nodeNamespaceSize
{
  return self->_blocksCount;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  -[VMUKernelCoreMemoryScanner ledger](self, "ledger");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4) {
      *a4 = 1;
    }
    unint64_t v9 = [v8 unsignedLongLongValue];
  }

  else
  {
    unint64_t v9 = 0LL;
    if (a4) {
      *a4 = 0;
    }
  }

  return v9;
}

- (void)setNodeScanningLogger:(id)a3
{
  if (self->_nodeLogger != a3)
  {
    id v4 = (void *)MEMORY[0x186E33044](a3, a2);
    id nodeLogger = self->_nodeLogger;
    self->_id nodeLogger = v4;
  }

- (void)setReferenceScanningLogger:(id)a3
{
  if (self->_referenceLogger != a3)
  {
    id v4 = (void *)MEMORY[0x186E33044](a3, a2);
    id referenceLogger = self->_referenceLogger;
    self->_id referenceLogger = v4;
  }

- (int)pid
{
  return self->_pid;
}

- (VMUTaskMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (VMUObjectIdentifier)objectIdentifier
{
  return self->_objectIdentifier;
}

- (unint64_t)maxInteriorOffset
{
  return self->_maxInteriorOffset;
}

- (void)setMaxInteriorOffset:(unint64_t)a3
{
  self->_unint64_t maxInteriorOffset = a3;
}

- (BOOL)exactScanningEnabled
{
  return self->_exactScanningEnabled;
}

- (void)setExactScanningEnabled:(BOOL)a3
{
  self->_exactScanningEnabled = a3;
}

- (unsigned)nodeCount
{
  return self->_blocksCount;
}

- (unsigned)zoneCount
{
  return self->_zonesCount;
}

- (unsigned)regionCount
{
  return self->_regionsCount;
}

- (unsigned)scanningMask
{
  return self->_scanningMask;
}

- (void)setScanningMask:(unsigned int)a3
{
  self->_scanningMasunint64_t k = a3;
}

- (BOOL)abandonedMarkingEnabled
{
  return self->_abandonedMarkingEnabled;
}

- (void)setAbandonedMarkingEnabled:(BOOL)a3
{
  self->_abandonedMarkingEnabled = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processDescriptionString
{
  return self->_processDescriptionString;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (BOOL)recordRuntimeMetadataChunkInfo
{
  return self->_recordRuntimeMetadataChunkInfo;
}

- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3
{
  self->_recordRuntimeMetadataChunkInfo = a3;
}

- (unint64_t)suspendTimeContinuous
{
  return self->_suspendTimeContinuous;
}

- (VMUScanOverlay)scanOverlay
{
  return self->_scanOverlay;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  return *(_VMUBlockNode **)(v0 + 96);
}

- (void).cxx_destruct
{
}

- (void)initWithVMUTask:options:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "error: core's pointer size doesn't match the host system, cannot continue",  v0,  2u);
}

- (void)initWithVMUTask:(void *)a3 options:.cold.2( unint64_t a1,  uint8_t *buf,  void *a3)
{
  uint64_t v4 = *MEMORY[0x1895FD590] >> 10;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 >> 10;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue",  buf,  0xEu);
}

@end