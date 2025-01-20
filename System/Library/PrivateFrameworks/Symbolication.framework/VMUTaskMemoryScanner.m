@interface VMUTaskMemoryScanner
+ (void)initialize;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUTaskMemoryScanner *)self;
- (BOOL)_callRemoteMallocEnumerators:(unsigned int)a3 error:(id *)a4 block:(id)a5;
- (BOOL)_suspend;
- (BOOL)abandonedMarkingEnabled;
- (BOOL)addAllNodesFromTaskWithError:(id *)a3;
- (BOOL)addMallocNodesFromTaskWithError:(id *)a3;
- (BOOL)addRootNodesFromTaskWithError:(id *)a3;
- (BOOL)addressIsInDataSegment:(unint64_t)a3;
- (BOOL)doesTargetProcessHaveObjCPatches;
- (BOOL)exactScanningEnabled;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)mallocEnumerationShouldFail;
- (BOOL)recordRuntimeMetadataChunkInfo;
- (BOOL)showRawClassNames;
- (NSDictionary)ledger;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUObjectIdentifier)objectIdentifier;
- (VMUScanOverlay)scanOverlay;
- (VMUTaskMemoryCache)memoryCache;
- (VMUTaskMemoryScanner)initWithSelfTaskAndOptions:(unint64_t)a3;
- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3;
- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (VMUTaskMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (_VMUBlockNode)blocks;
- (_VMURegionNode)regions;
- (_VMURegionNode)validateAddressRangeForSwiftRemoteMirror:(_VMURange)a3 allowUnusedSplitLibs:(BOOL)a4;
- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4;
- (id)_initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (id)_readonlyRegionRanges;
- (id)_recursivelyIdentifySwiftAsyncTaskSlabs:(unint64_t)a3 containerRange:(_VMURange)a4 remoteBlock:(unint64_t)a5 mappedBlock:(unint64_t)a6 asyncTaskSlabMetadataIsa:(unint64_t)a7 nestingLevel:(unsigned int)a8;
- (id)classInfoForObjectAtAddress:(unint64_t)a3;
- (id)initFullyWithTask:(unsigned int)a3;
- (id)initFullyWithTask:(unsigned int)a3 error:(id *)a4;
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
- (uint64_t)_shouldScanVMregion:(uint64_t)a1;
- (uint64_t)getCachedScanInfoForClassWithIsa:(void *)a3 classInfo:(_BYTE *)a4 returnedShouldApplySwiftPointerMaskingToIsa:;
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
- (unsigned)task;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_addSpecialNodesFromTask;
- (void)_addThreadNodesFromTask;
- (void)_buildRegionFirstBlockIndexOnPageArrays;
- (void)_destroyLinearClassInfos;
- (void)_findMarkedAbandonedBlocks;
- (void)_findSwiftClassesInExclaveCore;
- (void)_fixupBlockIsas;
- (void)_identifyAttributeGraphAllocations;
- (void)_identifyNonObjectsPointedToByTypedIvars;
- (void)_identifyNonObjectsPointingToSwiftMetadata;
- (void)_identifyNonObjectsUsingStackBacktrace;
- (void)_identifyObjCClassStructureBlocks;
- (void)_identifySwiftAsyncTaskSlabs;
- (void)_identifySwiftTypeNameCache;
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
- (void)detachFromTask;
- (void)mapDyldSharedCacheFromTargetWithRegions:(id)a3;
- (void)printRuntimeMetadataInfo;
- (void)refineTypesWithOverlay:(id)a3;
- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(unsigned int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:;
- (void)scanNodesWithReferenceRecorder:(id)a3;
- (void)setAbandonedMarkingEnabled:(BOOL)a3;
- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4;
- (void)setDebugTimer:(id)a3;
- (void)setExactScanningEnabled:(BOOL)a3;
- (void)setMallocEnumerationShouldFail:(BOOL)a3;
- (void)setMaxInteriorOffset:(unint64_t)a3;
- (void)setNodeScanningLogger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3;
- (void)setReferenceScanningLogger:(id)a3;
- (void)setScanningMask:(unsigned int)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)unmapAllRegions;
@end

@implementation VMUTaskMemoryScanner

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

    s_enumeratorDebugging = v6;
    pthread_t v7 = 0LL;
    if (pthread_create(&v7, 0LL, (void *(__cdecl *)(void *))_determine_pthread_offsets, (void *)0x123456789ABCDEF1LL))
    {
      fwrite("couldn't create new pthread for determine_pthread_offsets\n", 0x3AuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      exit(1);
    }

    pthread_join(v7, 0LL);
  }

- (unsigned)task
{
  return -[VMUTask taskPort](self->_task, "taskPort");
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
      memoryCache = self->_memoryCache;
      v8 = self->_objectIdentifier;
      v9 = memoryCache;
      v10 = v9;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v13[0] = v5;
          v13[1] = 3221225472LL;
          v13[2] = ___unmapRegion_block_invoke;
          v13[3] = &unk_189DFD5E8;
          v14 = v9;
          v16 = &regions[v3];
          v15 = v8;
          v17 = regions;
          v12 = (void (**)(void))MEMORY[0x186E33044](v13);
          v12[2]();
        }

        else
        {
          v11 = &regions[v3];
          v11->var6 = 0LL;
          v11->var7 = 0LL;
          v11->var8 = 0LL;
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

- (VMUTaskMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v129.receiver = self;
  v129.super_class = (Class)&OBJC_CLASS___VMUTaskMemoryScanner;
  v8 = -[VMUTaskMemoryScanner init](&v129, sel_init);
  if (v8)
  {
    v9 = v8;
    v10 = +[VMUDebugTimer sharedTimerIfCreated](&OBJC_CLASS___VMUDebugTimer, "sharedTimerIfCreated");
    objc_storeStrong((id *)&v9->_task, a3);
    v9->_pid = -[VMUTask pid](v9->_task, "pid");
    if (-[VMUTask pid](v9->_task, "pid") < 0)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"[%@] Invalid task port provided to initializer.", v14);

      goto LABEL_8;
    }

    if ([v7 taskType] == 2)
    {
      NSLog(@"VMUTaskMemoryScanner does not support kernel cores.");
LABEL_8:

LABEL_9:
      v11 = 0LL;
LABEL_10:
      v12 = 0LL;
      goto LABEL_11;
    }

    if (v10)
    {
      if ([v10 signpostID])
      {
        [v10 logHandle];
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v10 signpostID];
        if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v18 = v17;
          if (os_signpost_enabled(v16))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v16,  OS_SIGNPOST_INTERVAL_END,  v18,  "initMemoryScanner",  "",  (uint8_t *)buf,  2u);
          }
        }
      }

      [v10 endEvent:"initMemoryScanner"];
      [v10 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
      [v10 logHandle];
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v10 signpostID];
      if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v21 = v20;
        if (os_signpost_enabled(v19))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "initMemoryScanner",  "building VMUProcessDescription",  (uint8_t *)buf,  2u);
        }
      }
    }

    else
    {
      [0 endEvent:"initMemoryScanner"];
      [0 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
    }
    v22 = -[VMUTask processDescription](v9->_task, "processDescription");
    if ((int)[v22 pid] >= 1)
    {
      uint64_t v23 = [v22 description];
      processDescriptionString = v9->_processDescriptionString;
      v9->_processDescriptionString = (NSString *)v23;

      uint64_t v25 = [v22 date];
      suspendDate = v9->_suspendDate;
      v9->_suspendDate = (NSDate *)v25;

      uint64_t v27 = [v22 processName];
      processName = v9->_processName;
      v9->_processName = (NSString *)v27;

      if ((a4 & 0x8000) != 0)
      {
        uint64_t v29 = [v22 binaryImagesDescription];
        binaryImagesDescription = v9->_binaryImagesDescription;
        v9->_binaryImagesDescription = (NSString *)v29;
      }

      uint64_t v31 = [v22 executablePath];
      executablePath = v9->_executablePath;
      v9->_executablePath = (NSString *)v31;

      v9->_physicalFootprint = [v22 physicalFootprint];
      v9->_physicalFootprintPeak = [v22 physicalFootprintPeak];
      v9->_idleExitStatus = [v22 idleExitStatus];
    }

    if (v10 && [v10 signpostID])
    {
      [v10 logHandle];
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = [v10 signpostID];
      if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v35 = v34;
        if (os_signpost_enabled(v33))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v33,  OS_SIGNPOST_INTERVAL_END,  v35,  "initMemoryScanner",  "",  (uint8_t *)buf,  2u);
        }
      }
    }

    [v10 endEvent:"initMemoryScanner"];
    if (!-[VMUTaskMemoryScanner _suspend](v9, "_suspend"))
    {

      goto LABEL_9;
    }

    p_task = &v9->_task;
    mach_get_times();
    v9->_maxInteriorOffset = *MEMORY[0x1895FD590];
    v9->_scanningMask = VMUScanningMaskForOwningReferences();
    v9->_exactScanningEnabled = 1;
    v9->_abandonedMarkingEnabled = 1;
    uint64_t v36 = objc_opt_new();
    variantCachesByIsaIndex = v9->_variantCachesByIsaIndex;
    v9->_variantCachesByIsaIndex = (NSMutableDictionary *)v36;

    uint64_t v38 = objc_opt_new();
    srcAddressToExtraAutoreleaseCountDict = v9->_srcAddressToExtraAutoreleaseCountDict;
    v9->_srcAddressToExtraAutoreleaseCountDict = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_opt_new();
    mappedFileNameToLengthDict = v9->_mappedFileNameToLengthDict;
    v9->_mappedFileNameToLengthDict = (NSMutableDictionary *)v40;

    unint64_t v42 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
    v43 = -[VMUVMRegionIdentifier initWithVMUTask:options:]( objc_alloc(&OBJC_CLASS___VMUVMRegionIdentifier),  "initWithVMUTask:options:",  v9->_task,  v42);
    regionIdentifier = v9->_regionIdentifier;
    v9->_regionIdentifier = v43;
    v45 = -[VMUVMRegionIdentifier regions](v9->_regionIdentifier, "regions");
    unsigned int v46 = [v45 count];
    v9->_unint64_t regionsCount = v46;
    v119 = v22;
    if (v46)
    {
      unint64_t v115 = v42;
      v47 = (_VMURegionNode *)calloc(v46, 0x40uLL);
      v9->_regions = v47;
      v116 = v45;
      id v117 = v7;
      if (v9->_regionsCount)
      {
        uint64_t v48 = 0LL;
        for (unint64_t i = 0LL; i < regionsCount; ++i)
        {
          id v50 = (id)[v45 objectAtIndexedSubscript:i];
          regions = v9->_regions;
          regions[v48].var0 = v50;
          unint64_t regionsCount = v9->_regionsCount;
          ++v48;
        }
      }

      else
      {
        regions = v47;
        LODWORD(regionsCount) = 0;
      }

      v54 = calloc(1uLL, 0x200040uLL);
      v54[6] = -1LL;
      v55 = calloc(1uLL, 0x800004uLL);
      _DWORD *v55 = 0x4000000;
      v54[3] = v55;
      v54[4] = regions;
      *((_DWORD *)v54 + 10) = regionsCount;
      if ((_DWORD)regionsCount)
      {
        uint64_t v56 = 0LL;
        v57 = (_DWORD *)MEMORY[0x1895FD580];
        uint64_t v58 = regionsCount;
        do
        {
          p_var0 = &regions[v56].var0;
          if (([*p_var0 isSpecialPhysFootprintRegion] & 1) == 0)
          {
            v60 = (unint64_t *)((char *)*p_var0 + 8);
            unint64_t v61 = *v60;
            unint64_t v62 = *((void *)*p_var0 + 2) + *v60;
            unint64_t v63 = v54[6];
            unint64_t v64 = v54[7];
            if (v63 >= v61) {
              unint64_t v63 = v61;
            }
            if (v64 <= v62) {
              unint64_t v64 = v62;
            }
            v54[6] = v63;
            v54[7] = v64;
            unint64_t v65 = v61 >> *v57;
            if (v65)
            {
              unint64_t v66 = (~*MEMORY[0x1895FD578] & (*MEMORY[0x1895FD578] + v62)) >> *v57;
              do
              {
                if (v65 + 1 > v66) {
                  unint64_t v67 = v65 + 1;
                }
                else {
                  unint64_t v67 = v66;
                }
                v68 = (unsigned int *)v54[3];
                unsigned int v69 = v65 & 0x3FFFFFF;
                unsigned int v70 = *v68;
                if (*v68 > (v65 & 0x3FFFFFF))
                {
                  unsigned int v71 = ((v67 - v65) & 0x3FFFFFF) + v69;
                  if (v70 < v71) {
                    unsigned int v71 = *v68;
                  }
                  unsigned int v72 = (v69 + 7) & 0x7FFFFF8;
                  if (v72 >= v71) {
                    unsigned int v72 = v71;
                  }
                  if (v69 < v72)
                  {
                    do
                    {
                      if (v70 > v69) {
                        *((_BYTE *)v68 + (v69 >> 3) + 4) |= 1 << (v69 & 7);
                      }
                      ++v69;
                    }

                    while (v72 != v69);
                    unsigned int v69 = v72;
                  }

                  unsigned int v73 = v71 & 0x7FFFFF8;
                  if ((v71 & 0x7FFFFF8) <= v69) {
                    unsigned int v73 = v69;
                  }
                  if (v71 > v73)
                  {
                    unsigned int v74 = v71 - 1;
                    do
                    {
                      if (v70 > v74) {
                        *((_BYTE *)v68 + (v74 >> 3) + 4) |= 1 << (v74 & 7);
                      }
                      unsigned int v75 = v74 - 1;
                    }

                    while (v74-- > v73);
                    unsigned int v71 = v75 + 1;
                  }

                  memset((char *)v68 + (v69 >> 3) + 4, 255, (v71 - v69) >> 3);
                }

                v65 >>= 26;
                unint64_t v66 = v67 >> 26;
              }

              while (v65);
            }
          }

          ++v56;
        }

        while (v56 != v58);
      }

      v9->_regionMap = (_VMURegionMap *)v54;
      uint64_t v77 = -[VMUTask memoryCache](v9->_task, "memoryCache");
      memoryCache = v9->_memoryCache;
      v9->_memoryCache = (VMUTaskMemoryCache *)v77;

      if (v9->_memoryCache)
      {
        -[VMUTaskMemoryScanner unmapAllRegions](v9, "unmapAllRegions");
        v45 = v116;
        -[VMUTaskMemoryScanner mapDyldSharedCacheFromTargetWithRegions:]( v9,  "mapDyldSharedCacheFromTargetWithRegions:",  v116);
        regionMap = v9->_regionMap;
        buf[0] = 0LL;
        buf[1] = buf;
        buf[2] = 0x3032000000LL;
        buf[3] = __Block_byref_object_copy_;
        buf[4] = __Block_byref_object_dispose_;
        id v128 = 0LL;
        uint64_t v80 = MEMORY[0x1895F87A8];
        v126[0] = MEMORY[0x1895F87A8];
        v126[1] = 3221225472LL;
        v126[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke;
        v126[3] = &unk_189DFCDB0;
        v126[4] = buf;
        v126[5] = regionMap;
        uint64_t v81 = MEMORY[0x186E33044](v126);
        id regionInfoBlock = v9->_regionInfoBlock;
        v9->_id regionInfoBlock = (id)v81;

        -[VMUTaskMemoryCache setRegionInfoBlock:](v9->_memoryCache, "setRegionInfoBlock:", v9->_regionInfoBlock);
        id v7 = v117;
        v83 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
        dataSegmentsRangeArrayOutsideSharedCache = v9->_dataSegmentsRangeArrayOutsideSharedCache;
        v9->_dataSegmentsRangeArrayOutsideSharedCache = v83;

        uint64_t v85 = -[VMUVMRegionIdentifier taskThreadStates](v9->_regionIdentifier, "taskThreadStates");
        threadStates = v9->_threadStates;
        v9->_threadStates = (VMUTaskThreadStates *)v85;

        v9->_threadsCount = -[VMUTaskThreadStates threadCount](v9->_threadStates, "threadCount");
        if (v10 && [v10 signpostID])
        {
          [v10 logHandle];
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v88 = [v10 signpostID];
          if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v87,  OS_SIGNPOST_INTERVAL_END,  v88,  "initMemoryScanner",  "",  v121,  2u);
          }
        }

        [v10 endEvent:"initMemoryScanner"];
        [v10 startWithCategory:"initMemoryScanner" message:"get malloc zones array"];
        if (v10)
        {
          [v10 logHandle];
          v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v90 = [v10 signpostID];
          if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v89,  OS_SIGNPOST_INTERVAL_BEGIN,  v90,  "initMemoryScanner",  "get malloc zones array",  v121,  2u);
          }
        }

        uint64_t v91 = objc_opt_new();
        zoneNames = v9->_zoneNames;
        v9->_zoneNames = (NSMutableArray *)v91;

        task = v9->_task;
        v124[0] = v80;
        v124[1] = 3221225472LL;
        v124[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_38;
        v124[3] = &unk_189DFCDD8;
        v94 = v9;
        v125 = v94;
        VMUTask_foreach_malloc_zone(task, v124);
        if (v10 && [v10 signpostID])
        {
          [v10 logHandle];
          v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v96 = [v10 signpostID];
          if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v95,  OS_SIGNPOST_INTERVAL_END,  v96,  "initMemoryScanner",  "",  v121,  2u);
          }
        }

        [v10 endEvent:"initMemoryScanner"];
        size_t v97 = *((unsigned int *)v94 + 54);
        if ((_DWORD)v97 && v9->_regions)
        {
          id v98 = v94[26];
          __compar[0] = v80;
          __compar[1] = 3221225472LL;
          __compar[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2;
          __compar[3] = &unk_189DFCE40;
          v123 = (id *)&__block_literal_global;
          mergesort_b(v98, v97, 0x18uLL, __compar);
          -[NSMutableArray sortUsingComparator:](v9->_zoneNames, "sortUsingComparator:", &__block_literal_global);
          v99 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]( objc_alloc(&OBJC_CLASS___VMUObjectIdentifier),  "initWithVMUTask:symbolicator:scanner:",  *p_task,  0LL,  0LL,  v94);
          id v100 = v94[8];
          v94[8] = v99;

          id v101 = v94[8];
          if (!v101) {
            goto LABEL_120;
          }
          uint64_t v102 = [v101 realizedClasses];
          id v103 = v94[34];
          v94[34] = (id)v102;

          if (v10 && [v10 signpostID])
          {
            [v10 logHandle];
            v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_signpost_id_t v105 = [v10 signpostID];
            if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v104,  OS_SIGNPOST_INTERVAL_END,  v105,  "initMemoryScanner",  "",  v121,  2u);
            }
          }

          [v10 endEvent:"initMemoryScanner"];
          [v10 startWithCategory:"initMemoryScanner" message:"setting up VMUScanOverlay"];
          if (v10)
          {
            [v10 logHandle];
            v106 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_signpost_id_t v107 = [v10 signpostID];
            if (v107 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v106,  OS_SIGNPOST_INTERVAL_BEGIN,  v107,  "initMemoryScanner",  "setting up VMUScanOverlay",  v121,  2u);
            }
          }

          v108 = -[VMUScanOverlay initWithScanner:](objc_alloc(&OBJC_CLASS___VMUScanOverlay), "initWithScanner:", v94);
          id v109 = v94[69];
          v94[69] = v108;

          [v94 refineTypesWithOverlay:v94[69]];
          if (v10 && [v10 signpostID])
          {
            [v10 logHandle];
            v110 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_signpost_id_t v111 = [v10 signpostID];
            if (v111 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v110,  OS_SIGNPOST_INTERVAL_END,  v111,  "initMemoryScanner",  "",  v121,  2u);
            }
          }

          [v10 endEvent:"initMemoryScanner"];
          v94[66] = (id)[v94[8] addressOfSymbol:"___CFPasteboardReservedBase" inLibrary:"CoreFoundation"];
          *((_BYTE *)v94 + 192) = [v94 doesTargetProcessHaveObjCPatches];
          v94[58] = (id)v115;
          *(void *)v121 = 0LL;
          int v120 = 0;
          v112 = *p_task;
          uint64_t v113 = [v94[8] symbolicator];
          if (task_get_malloc_zones_array_address_and_count(v112, v113, v114, v121, &v120, 0LL))
          {
            int v53 = 0;
            if (v120) {
              v94[67] = *(id *)v121;
            }
          }

          else
          {
LABEL_120:

            v94 = 0LL;
            int v53 = 1;
          }

          v11 = (VMUTaskMemoryScanner *)v94;
          v94 = v123;
        }

        else
        {
          v11 = 0LL;
          int v53 = 1;
        }

        _Block_object_dispose(buf, 8);
      }

      else
      {

        v11 = 0LL;
        int v53 = 1;
        v45 = v116;
        id v7 = v117;
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[VMUTaskMemoryScanner initWithVMUTask:options:].cold.1();
      }

      v11 = 0LL;
      int v53 = 1;
    }

    if (v53) {
      goto LABEL_10;
    }
  }

  else
  {
    v11 = 0LL;
  }

  v11 = v11;
  v12 = v11;
LABEL_11:

  return v12;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v4 + 4 * ((a2 >> *MEMORY[0x1895FD580]) & 0x7FFFF);
  int v8 = *(_DWORD *)(v5 + 64);
  id v7 = (_DWORD *)(v5 + 64);
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

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_38( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(v8 + 220);
  if (v9 <= *(_DWORD *)(v8 + 216))
  {
    int v10 = 2 * v9;
    *(_DWORD *)(v8 + 220) = v10;
    while (1)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = *(_DWORD *)(v11 + 220);
      if (v12 >= *(_DWORD *)(v11 + 216)) {
        break;
      }
      *(_DWORD *)(v11 + 220) = 2 * v12;
    }

    *(void *)(*(void *)(a1 + 32) + 208LL) = realloc(*(void **)(v11 + 208), 24LL * v12);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 208);
    if (!v14)
    {
      NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_zones",  v9,  *(unsigned int *)(v13 + 220));
      abort();
    }

    bzero((void *)(v14 + 24LL * v9), 24LL * (*(_DWORD *)(v13 + 220) - v9));
  }

  if (!v7) {
    id v7 = [objc_alloc(NSString) initWithFormat:@"UnknownZone (%#llx)" a2];
  }
  [*(id *)(*(void *)(a1 + 32) + 144) addObject:v7];
  BOOL v15 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 208LL) + 24LL * *(unsigned int *)(*(void *)(a1 + 32) + 216LL));
  uint64_t *v15 = a2;
  v15[1] = (uint64_t)v7;
  v15[2] = a3;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 216LL);

  return 0LL;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 rangeOfString:@"DefaultMallocZone"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"DefaultMallocZone"] == 0x7FFFFFFFFFFFFFFFLL) {
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

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)_initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  uint64_t v6 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", *(void *)&a3);
  id v7 = -[VMUTaskMemoryScanner initWithVMUTask:options:](self, "initWithVMUTask:options:", v6, a4);

  return v7;
}

- (VMUTaskMemoryScanner)initWithSelfTaskAndOptions:(unint64_t)a3
{
  return (VMUTaskMemoryScanner *)-[VMUTaskMemoryScanner _initWithTask:options:]( self,  "_initWithTask:options:",  *MEMORY[0x1895FBBE0],  a3);
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if ((VMUTaskIsSelf() & 1) != 0)
  {
    NSLog(@"Illegal attempt to scan memory of mach_task_self()");
    id v7 = 0LL;
  }

  else
  {
    self = (VMUTaskMemoryScanner *) -[VMUTaskMemoryScanner _initWithTask:options:]( self,  "_initWithTask:options:",  v5,  a4);
    id v7 = self;
  }

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = -[VMUTaskMemoryScanner initWithTask:options:](self, "initWithTask:options:", *(void *)&a3, 0LL);
  BOOL v6 = -[VMUTaskMemoryScanner addAllNodesFromTaskWithError:](v5, "addAllNodesFromTaskWithError:", a4);
  id v7 = 0LL;
  if (v6) {
    id v7 = v5;
  }

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3
{
  return -[VMUTaskMemoryScanner initFullyWithTask:error:](self, "initFullyWithTask:error:", *(void *)&a3, 0LL);
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3
{
  return -[VMUTaskMemoryScanner initWithTask:options:](self, "initWithTask:options:", *(void *)&a3, 0LL);
}

- (BOOL)doesTargetProcessHaveObjCPatches
{
  unint64_t v3 = -[VMUObjectIdentifier addressOfSymbol:inLibrary:]( self->_objectIdentifier,  "addressOfSymbol:inLibrary:",  "_dyld_process_has_objc_patches",  "libdyld.dylib");
  if (v3)
  {
    unint64_t v4 = v3;
    -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
    uint64_t v5 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    BOOL v6 = (_BYTE *)v5[2](v5, v4, 1LL);

    if (v6) {
      LOBYTE(v3) = *v6 != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)mapDyldSharedCacheFromTargetWithRegions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend((id)v12, "isSubmap", (void)v15) & 1) == 0)
        {
          if (-[VMUTask rangeIsInSharedCache:]( self->_task,  "rangeIsInSharedCache:",  *(void *)(v12 + 8),  *(void *)(v12 + 16)))
          {
            int v13 = *(_DWORD *)(v12 + 24);
            if (v13 == v9)
            {
              uint64_t v14 = *(void *)(v12 + 8);
            }

            else
            {
              if (v7 && v8)
              {
                -[VMUTaskMemoryCache mapAddress:size:](self->_memoryCache, "mapAddress:size:", v7, v8);
                int v13 = *(_DWORD *)(v12 + 24);
              }

              uint64_t v14 = *(void *)(v12 + 8);
              uint64_t v7 = v14;
              int v9 = v13;
            }

            uint64_t v8 = v14 - v7 + *(void *)(v12 + 16);
          }

          else if (v7)
          {
            goto LABEL_19;
          }
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
LABEL_19:

    if (v7 && v8) {
      -[VMUTaskMemoryCache mapAddress:size:](self->_memoryCache, "mapAddress:size:", v7, v8);
    }
  }

  else
  {
  }
}

- (BOOL)_suspend
{
  kern_return_t v4;
  mach_error_t v5;
  FILE *v6;
  char *v7;
  VMUTask *task;
  if (-[VMUTask isCore](self->_task, "isCore")) {
    goto LABEL_2;
  }
  unsigned int v3 = -[VMUTask taskPort](self->_task, "taskPort");
  if (!v3) {
    return v3;
  }
  if (-[VMUTask taskPort](self->_task, "taskPort") == -1)
  {
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }

  -[VMUTask taskPort](self->_task, "taskPort");
  if ((VMUTaskIsSelf() & 1) == 0)
  {
    id v4 = task_suspend2(-[VMUTask taskPort](self->_task, "taskPort"), &self->_suspensionToken);
    if (v4)
    {
      uint64_t v5 = v4;
      if (task_exists(self->_task))
      {
        uint64_t v6 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v7 = mach_error_string(v5);
        fprintf(v6, "Unable to suspend target task: %s (%d)\n", v7, v5);
      }

      task = self->_task;
      self->_task = 0LL;

      goto LABEL_10;
    }
  }

- (void)detachFromTask
{
  kern_return_t v3;
  mach_error_t v4;
  FILE *v5;
  char *v6;
  VMUTask *task;
  if (!-[VMUTask isCore](self->_task, "isCore"))
  {
    if (-[VMUTask taskPort](self->_task, "taskPort"))
    {
      if (-[VMUTask taskPort](self->_task, "taskPort") != -1)
      {
        -[VMUTask taskPort](self->_task, "taskPort");
        if ((VMUTaskIsSelf() & 1) == 0)
        {
          unsigned int v3 = task_resume2(self->_suspensionToken);
          if (v3)
          {
            id v4 = v3;
            if (task_exists(self->_task))
            {
              uint64_t v5 = (FILE *)*MEMORY[0x1895F89D0];
              uint64_t v6 = mach_error_string(v4);
              fprintf(v5, "Unable to resume target task: %s (%d)\n", v6, v4);
            }
          }

          task = self->_task;
          self->_task = 0LL;

          -[VMUTaskMemoryScanner setNodeScanningLogger:](self, "setNodeScanningLogger:", 0LL);
          -[VMUTaskMemoryScanner setReferenceScanningLogger:](self, "setReferenceScanningLogger:", 0LL);
        }
      }
    }
  }

- (void)dealloc
{
  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0LL;
  }

  -[VMUTaskMemoryCache setRegionInfoBlock:](self->_memoryCache, "setRegionInfoBlock:", 0LL);
  if (self->_regionsCount)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    uint64_t v6 = MEMORY[0x1895F87A8];
    do
    {
      regions = self->_regions;
      memoryCache = self->_memoryCache;
      int v9 = self->_objectIdentifier;
      uint64_t v10 = memoryCache;
      uint64_t v11 = v10;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v22[0] = v6;
          v22[1] = 3221225472LL;
          v22[2] = ___unmapRegion_block_invoke;
          v22[3] = &unk_189DFD5E8;
          uint64_t v23 = v10;
          uint64_t v25 = &regions[v4];
          v24 = v9;
          v26 = regions;
          int v13 = (void (**)(void))MEMORY[0x186E33044](v22);
          v13[2]();
        }

        else
        {
          uint64_t v12 = &regions[v4];
          v12->var6 = 0LL;
          v12->var7 = 0LL;
          v12->var8 = 0LL;
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

  __int128 v15 = self->_regions;
  if (v15)
  {
    free(v15);
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

  -[VMUTaskMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VMUTaskMemoryScanner;
  -[VMUTaskMemoryScanner dealloc](&v21, sel_dealloc);
}

- (void)_withMemoryReaderBlock:(id)a3
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_189DFCED0;
  v5[4] = self;
  id v6 = 0LL;
  unsigned int v3 = (void (**)(id, void *))a3;
  uint64_t v4 = (void *)MEMORY[0x186E33044](v5);
  v3[2](v3, v4);
}

uint64_t __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke( uint64_t a1,  unint64_t a2,  uint64_t a3)
{
  uint64_t result = 0LL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 112LL);
  unint64_t v7 = *(void *)(v5 + 48);
  unint64_t v6 = *(void *)(v5 + 56);
  unint64_t v8 = v6 - v7;
  BOOL v9 = v6 < v7;
  if (a2 - v7 >= v8 || v9) {
    return result;
  }
  uint64_t v12 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v13 = a2 >> *MEMORY[0x1895FD580];
  if (v13)
  {
    uint64_t v14 = *(unsigned int **)(v5 + 24);
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
  __int128 v18 = (_DWORD *)(v16 + 64);
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
      goto LABEL_79;
    }
    v54 = (id *)(v53 + 64);
    unint64_t v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(void *)(v5 + 32)) >> 6);
    if (!v55) {
      goto LABEL_76;
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
LABEL_76:
          if (v55) {
            unint64_t v53 = v55;
          }
          unint64_t v21 = v53;
LABEL_79:
          *__int128 v18 = ((v53 - v20) >> 6) + 1;
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
            v26 = *(void **)(a1 + 40);
            v28 = *(void **)(v25 + 56);
            uint64_t v27 = *(void **)(v25 + 64);
            id v29 = *(id *)(v25 + 8);
            id v82 = v27;
            id v83 = v28;
            v84 = v26;
            uint64_t v30 = 0LL;
            if ((_DWORD)v23)
            {
              uint64_t v31 = v23;
              v32 = (uint64_t *)v21;
              do
              {
                uint64_t v33 = *v32;
                v32 += 8;
                v30 += *(void *)(v33 + 16);
                --v31;
              }

              while (v31);
            }

            v92[0] = 0LL;
            uint64_t v86 = 0LL;
            uint64_t v34 = (void *)[v83 findMappedAddress:*(void *)(*(void *)v21 + 8) size:v30];
            if (v34)
            {
              uint64_t v35 = v34[1];
              uint64_t v36 = *(void *)(*(void *)v21 + 8LL) - *v34;
              v92[0] = v34[2] + v36;
              uint64_t v86 = v35 - v36;
              goto LABEL_19;
            }

            uint64_t v81 = v29;
            if ((_DWORD)v23)
            {
              uint64_t v72 = 0LL;
              do
              {
                id v73 = v82;
                id v74 = v83;
                unsigned int v75 = v84;
                if (*(void *)(v21 + v72 + 48))
                {
                  if (v21 + v72 == *(void *)(v21 + v72 + 56))
                  {
                    v87[0] = MEMORY[0x1895F87A8];
                    v87[1] = 3221225472LL;
                    v87[2] = ___unmapRegion_block_invoke;
                    v87[3] = &unk_189DFD5E8;
                    id v88 = v74;
                    uint64_t v90 = v21 + v72;
                    id v89 = v73;
                    unint64_t v91 = v21;
                    uint64_t v77 = (void (**)(void))MEMORY[0x186E33044](v87);
                    v78 = v77;
                    if (v84) {
                      dispatch_async(v75, v77);
                    }
                    else {
                      v77[2](v77);
                    }
                  }

                  else
                  {
                    v76 = (void *)(v21 + v72);
                    v76[5] = 0LL;
                    v76[6] = 0LL;
                    v76[7] = 0LL;
                  }
                }

                v72 += 64LL;
              }

              while ((unint64_t)v23 << 6 != v72);
            }

            int v79 = [v83 mapAddress:*(void *)(*(void *)v21 + 8) size:v30 returnedAddress:v92 returnedSize:&v86];
            uint64_t v12 = (_DWORD *)MEMORY[0x1895FD580];
            id v29 = v81;
            if (v79)
            {
              if (task_exists(v81)) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *(void *)(*(void *)v21 + 8LL),  *(void *)(*(void *)v21 + 8LL) + v30);
              }
            }

            else
            {
LABEL_19:
              if ((_DWORD)v23)
              {
                uint64_t v37 = 0LL;
                uint64_t v38 = v86;
                do
                {
                  v39 = (void *)(v21 + v37);
                  v39[7] = v21;
                  v39[5] = v38;
                  uint64_t v40 = v92[0];
                  v39[6] = v92[0];
                  uint64_t v41 = *(void *)(v21 + v37) + 8LL;
                  v92[0] = *(void *)(*(void *)(v21 + v37) + 16LL) + v40;
                  uint64_t v38 = v86 - *(void *)(v41 + 8);
                  uint64_t v86 = v38;
                  v37 += 64LL;
                }

                while ((unint64_t)v23 << 6 != v37);
              }
            }
          }

          uint64_t v42 = *(void *)(a1 + 32);
          v43 = *(void **)(v42 + 56);
          uint64_t v44 = *(void *)(v42 + 96);
          int v45 = *(_DWORD *)(v42 + 104);
          id v46 = *(id *)(v42 + 8);
          id v47 = v43;
          if (*(void *)(v21 + 48))
          {
LABEL_24:

            return *(void *)(v21 + 48) + a2 - *(void *)(*(void *)v21 + 8LL);
          }

          if (![*(id *)v21 isSpecialPhysFootprintRegion])
          {
            int v59 = [v47 mapAddress:*(void *)(*(void *)v21 + 8) size:*(void *)(*(void *)v21 + 16) returnedAddress:v87 returnedSize:v92];
            if (!v59)
            {
              uint64_t v80 = v87[0];
              *(void *)(v21 + 40) = v92[0];
              *(void *)(v21 + 48) = v80;
              *(void *)(v21 + 56) = v21;
              goto LABEL_24;
            }

            if ((*(_DWORD *)(*(void *)v21 + 52LL) & 3u) - 1 >= 2)
            {
              int v60 = v59;
              BOOL v61 = task_exists(v46);
              if (v21 != v44 + ((unint64_t)(v45 - 1) << 6) && v61)
              {
                uint64_t v85 = (FILE *)*MEMORY[0x1895F89D0];
                uint64_t v63 = [*(id *)v21 address];
                uint64_t v64 = *(unsigned int *)(*(void *)v21 + 24LL);
                unint64_t v65 = vm_prot_strings[v64];
                uint64_t v66 = *(void *)(*(void *)v21 + 16LL) + *(void *)(*(void *)v21 + 8LL);
                id v67 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*(void *)v21 + 232LL),  *(unsigned __int8 *)(*(void *)v21 + 104LL),  *(unsigned __int8 *)(*(void *)v21 + 50LL),  v64,  *(unsigned __int8 *)(*(void *)v21 + 49LL));
                v68 = (const char *)[v67 UTF8String];
                uint64_t v69 = *(void *)(*(void *)v21 + 16LL) >> *v12;
                unsigned int v70 = "pages";
                if (v69 == 1) {
                  unsigned int v70 = "page";
                }
                if (*(void *)(v21 + 24) == *(void *)(v21 + 32)) {
                  unsigned int v71 = "";
                }
                else {
                  unsigned int v71 = " [root]";
                }
                fprintf( v85,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v63,  v66,  v65,  v68,  v69,  v70,  v71,  v60);
              }
            }
          }

          return 0LL;
        }

        v54 = v57 + 8;
        unint64_t v56 = --v55 >> 1;
      }

      BOOL v58 = v55 > 1;
      unint64_t v55 = v56;
      if (!v58)
      {
        unint64_t v55 = 0LL;
        goto LABEL_76;
      }
    }
  }

  return result;
}

- (BOOL)_callRemoteMallocEnumerators:(unsigned int)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  unint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0LL;
  if (self->_mallocEnumerationShouldFail && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Passing bad task peek function to malloc enumerators because VMUTaskMemoryScanner.mallocEnumerationShouldFail is YES",  buf,  2u);
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke;
  v12[3] = &unk_189DFCF50;
  v12[4] = self;
  id v9 = v8;
  unsigned int v15 = a3;
  id v13 = v9;
  uint64_t v14 = &v17;
  -[VMUTaskMemoryScanner _withMemoryReaderBlock:](self, "_withMemoryReaderBlock:", v12);
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke( uint64_t a1,  void *a2)
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2;
  v7[3] = &unk_189DFCF28;
  uint64_t v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v5 = v4;
  int v10 = *(_DWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  _withPeekTransformerFunctionForMemoryReader(a2, v7);
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2( uint64_t a1,  uint64_t (*a2)())
{
  v21[1] = *MEMORY[0x1895F89C0];
  unsigned int v3 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 544)) {
    a2 = failingPeekFunction;
  }
  if (*(_DWORD *)(v2 + 216))
  {
    uint64_t v6 = 0LL;
    for (unint64_t i = 0LL; i < *(unsigned int *)(v2 + 216); ++i)
    {
      if (*(void *)(*(void *)(v2 + 208) + v6 + 16))
      {
        get_local_zone_count();
        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 3221225472LL;
        v17[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3;
        v17[3] = &unk_189DFCF00;
        id v18 = *(id *)(a1 + 40);
        int v19 = i;
        id v8 = (void *)MEMORY[0x186E33044](v17);
        uint64_t v9 = (**(uint64_t (***)(uint64_t, void *, void, void, uint64_t (*)(), uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(void *)(*(void *)(a1 + 32) + 208) + v6 + 16))( [*(id *)(*(void *)(a1 + 32) + 8) taskPort],  v8,  *(unsigned int *)(a1 + 56),  *(void *)(*(void *)(*(void *)(a1 + 32) + 208) + v6),  a2,  _pointerRecorderBlockContextAdapter);
        unregister_new_local_zones();
        if ((_DWORD)v9)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1( (uint64_t)v3,  i,  v9);
          }
          int v10 = (void *)MEMORY[0x189607870];
          uint64_t v20 = *MEMORY[0x1896075E0];
          if (*(void *)(*(void *)(*(void *)(a1 + 32) + 208LL) + v6 + 8)) {
            uint64_t v11 = *(const __CFString **)(*(void *)(*(void *)(a1 + 32) + 208LL) + v6 + 8);
          }
          else {
            uint64_t v11 = @"UNKNOWN";
          }
          [NSString stringWithFormat:@"Malloc enumeration of zone %@ failed to get full information about malloc metadata and/or allocations with the error %s (%d). It is likely that the target was suspended while malloc metadata was being modified.", v11, mach_error_string(v9), v9];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v12;
          [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v10 errorWithDomain:@"Malloc enumeration" code:(int)v9 userInfo:v13];
          uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
          uint64_t v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          return;
        }

        uint64_t v2 = *v3;
      }

      v6 += 24LL;
    }
  }

uint64_t __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40),  a2,  a3,  a4);
}

- (uint64_t)_shouldScanVMregion:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (_shouldScanVMregion__onceToken != -1) {
      dispatch_once(&_shouldScanVMregion__onceToken, &__block_literal_global_80);
    }
    if (*(void *)(a2 + 32) - *(void *)(a2 + 24) >= 8uLL)
    {
      uint64_t v4 = (id *)*(id *)a2;
      id v5 = v4;
      if (!_shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar
        && *((_BYTE *)v4 + 49)
        && ([v4 path],
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 hasPrefix:kVMUUnknownMappedFileNamePrefix[0]],
            v6,
            (v7 & 1) != 0)
        || (*((_DWORD *)v5 + 13) & 3) == 2)
      {
        uint64_t v2 = 0LL;
      }

      else
      {
        uint64_t v2 = [v5 protection] != 1
          || ([v5[4] isEqualToString:@"MALLOC metadata"] & 1) != 0
          || ([v5 isActivityTracing] & 1) != 0
          || [v5 address] == *(void *)(v2 + 536);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

char *__44__VMUTaskMemoryScanner__shouldScanVMregion___block_invoke()
{
  uint64_t result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
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
        uint64_t v6 = self->_scanCaches[i];
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
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5
{
  classInfoIndexer = self->_classInfoIndexer;
  id v9 = a3;
  uint64_t v10 = -[VMUClassInfoMap indexForClassInfo:](classInfoIndexer, "indexForClassInfo:", a4);
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  [MEMORY[0x189607968] numberWithUnsignedInt:v10];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v12);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    id v13 = self->_variantCachesByIsaIndex;
    [MEMORY[0x189607968] numberWithUnsignedInt:v10];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a5];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)_addSpecialNodesFromTask
{
  unsigned int blocksCount = self->_blocksCount;
  uint64_t blocksSize = self->_blocksSize;
  if (blocksSize <= blocksCount)
  {
    else {
      int v6 = 2 * blocksSize;
    }
    do
    {
      unsigned int v7 = v6;
      v6 *= 2;
    }

    while (v7 < blocksCount);
    self->_uint64_t blocksSize = v7;
    blocks = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v7);
    self->_blocks = blocks;
    if (!blocks) {
      goto LABEL_41;
    }
    unsigned int blocksCount = self->_blocksCount;
  }

  else
  {
    blocks = self->_blocks;
  }

  unint64_t v8 = blocksCount;
  id v9 = &blocks[blocksCount];
  v9->var0 = v8;
  *((void *)v9 + 1) = 3LL;
  ++self->_blocksCount;
  unint64_t v10 = -[VMUObjectIdentifier ObjCclassCount](self->_objectIdentifier, "ObjCclassCount");
  if (v10 + -[VMUObjectIdentifier SwiftClassCount](self->_objectIdentifier, "SwiftClassCount"))
  {
    if (_addSpecialNodesFromTask_onceToken != -1) {
      dispatch_once(&_addSpecialNodesFromTask_onceToken, &__block_literal_global_85);
    }
    unsigned int v11 = self->_blocksCount;
    uint64_t blocksSize = self->_blocksSize;
    if (blocksSize <= v11)
    {
      else {
        int v13 = 2 * blocksSize;
      }
      do
      {
        unsigned int v14 = v13;
        v13 *= 2;
      }

      while (v14 < v11);
      self->_uint64_t blocksSize = v14;
      uint64_t v12 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v14);
      self->_blocks = v12;
      if (!v12) {
        goto LABEL_41;
      }
      unsigned int v11 = self->_blocksCount;
    }

    else
    {
      uint64_t v12 = self->_blocks;
    }

    unint64_t v15 = v11;
    id v16 = &v12[v11];
    uint64_t v17 = -[VMUClassInfoMap indexForClassInfo:]( self->_classInfoIndexer,  "indexForClassInfo:",  _addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo);
    v16->var0 = v15;
    *((void *)v16 + 1) = (v17 << 41) | 1;
    unsigned int v18 = self->_blocksCount;
    self->_autoreleasePoolBoundaryNode = v18;
    self->_unsigned int blocksCount = v18 + 1;
  }

  self->_webKitZoneIndex = -1;
  if (!getenv("SYMBOLICATION_DISABLE_WEBKIT_POINTER_PACKING_WORKAROUND") && self->_zonesCount)
  {
    unint64_t v19 = 0LL;
    uint64_t v20 = 8LL;
    do
    {
      id v21 = *(id *)((char *)&self->_zones->var0 + v20);
      id v22 = v21;

      ++v19;
      v20 += 24LL;
    }

    while (v19 < self->_zonesCount);
    if (self->_webKitZoneIndex != -1)
    {
      if (_addSpecialNodesFromTask_onceToken_92 != -1) {
        dispatch_once(&_addSpecialNodesFromTask_onceToken_92, &__block_literal_global_93);
      }
      unsigned int v23 = self->_blocksCount;
      uint64_t blocksSize = self->_blocksSize;
      if (blocksSize > v23)
      {
        v24 = self->_blocks;
LABEL_40:
        unint64_t v27 = v23;
        v28 = &v24[v23];
        uint64_t v29 = -[VMUClassInfoMap indexForClassInfo:]( self->_classInfoIndexer,  "indexForClassInfo:",  _addSpecialNodesFromTask_webKitMallocFakeRootClassInfo);
        v28->var0 = v27;
        *((void *)v28 + 1) = (v29 << 41) | 1;
        unsigned int v30 = self->_blocksCount;
        self->_webKitMallocFakeRootNode = v30;
        self->_unsigned int blocksCount = v30 + 1;
        return;
      }

      else {
        int v25 = 2 * blocksSize;
      }
      do
      {
        unsigned int v26 = v25;
        v25 *= 2;
      }

      while (v26 < v23);
      self->_uint64_t blocksSize = v26;
      v24 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v26);
      self->_blocks = v24;
      if (v24)
      {
        unsigned int v23 = self->_blocksCount;
        goto LABEL_40;
      }

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke()
{
  uint64_t v0 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  kVMUAutoreleasePoolBoundaryClassName,  @"/usr/lib/libobjc.A.dylib",  16LL);
  v1 = (void *)_addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo;
  _addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo = v0;
}

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke_2()
{
  uint64_t v0 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"WebKit Malloc Fake Root",  @"/System/Library/Frameworks/WebKit.framework/Versions/A/WebKit",  16LL);
  v1 = (void *)_addSpecialNodesFromTask_webKitMallocFakeRootClassInfo;
  _addSpecialNodesFromTask_webKitMallocFakeRootClassInfo = v0;
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
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_11:
    off_t st_size = 0LL;
    goto LABEL_16;
  }

  unsigned int v7 = v6;
  if (([v6 containsString:@"*"] & 1) != 0
    || ([v7 hasPrefix:@"/"] & 1) == 0)
  {
    -[VMUTask memoryCache](self->_task, "memoryCache");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 procRegionFileNameForAddress:*((void *)v4 + 1) buffer:v16 bufferSize:1024];

    if (v9 >= 1)
    {
      *((_BYTE *)&v16[0].st_dev + v9) = 0;
      uint64_t v10 = [NSString stringWithUTF8String:v16];

      unsigned int v7 = (void *)v10;
    }
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mappedFileNameToLengthDict, "objectForKeyedSubscript:", v7);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
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
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
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
  unint64_t v6 = -[VMUTaskMemoryScanner _lengthOfMappedFileOfRegion:](self, "_lengthOfMappedFileOfRegion:", v9);
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
  unsigned int v5 = self->_regionsCount - 1;
  do
  {
    unsigned int v6 = v5;
    if (!v5) {
      break;
    }
    int v7 = *((unsigned __int8 *)self->_regions[(unint64_t)v5--].var0 + 50);
  }

  while (v7 == 5);
  unsigned int v8 = 0;
  do
  {
    uint64_t v9 = v8;
    uint64_t v10 = self->_regions[(unint64_t)v8].var0;
    unsigned int v11 = v10;
    if (v10[50] != 3
      && ([v10 isSubmap] & 1) == 0
      && ([v11 isSpecialPhysFootprintRegion] & 1) == 0)
    {
      unint64_t v12 = *((void *)v11 + 1);
      uint64_t v13 = *((void *)v11 + 2);
      BOOL v14 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v12, v13);
      if (([v11 isMallocHeapRelated] & 1) == 0
        && ([v11 ignoreRegionDuringScanning] & 1) == 0)
      {
        if ([v11 willNotHoldPointers])
        {
          unint64_t v15 = &self->_regions[v9];
          v15->unint64_t var4 = v12;
          v15->unint64_t var5 = v12 + 1;
        }

        else
        {
          if ((~[v11 protection] & 3) != 0)
          {
            int v17 = *((_DWORD *)v11 + 6);
            char v18 = (~v17 & 5) != 0 || v14;
            if ((v18 & 1) == 0 || (v17 != 1 ? (char v19 = 1) : (char v19 = v14), (v19 & 1) == 0))
            {
              if ((v11[132] & 2) == 0)
              {
                uint64_t v20 = &self->_regions[v9];
                v20->unint64_t var4 = *((void *)v11 + 1);
                v20->unint64_t var5 = v13 + v12;
              }
            }
          }

          else if ((v11[132] & 4) == 0 || self->_targetProcessHasObjCPatches && [v11 dirtyLength])
          {
            id v16 = &self->_regions[v9];
            v16->unint64_t var4 = v12;
            v16->unint64_t var5 = v13 + v12;
          }

          else
          {
            id v21 = &self->_regions[v9];
            v21->unint64_t var4 = 0LL;
            v21->unint64_t var5 = 0LL;
          }

          if ((v11[132] & 2) != 0
            && (v11[132] & 4) == 0
            && ([v11 protection] & 1) != 0
            && ([v11 protection] & 4) == 0)
          {
            [v11 type];
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            char v164 = [v166 isEqualToString:@"__LINKEDIT"];

            if ((v164 & 1) == 0)
            {
              uint64_t v22 = 21LL;
              if (v14) {
                uint64_t v22 = 19LL;
              }
              unsigned int v23 = &(&self->super.isa)[v22];
              unint64_t v24 = (unint64_t)*v23;
              if (!*v23)
              {
                *unsigned int v23 = (Class)v12;
                unint64_t v24 = v12;
              }

              v23[1] = (Class)(v13 + v12 - v24);
              if (!v14) {
                -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v12, v13);
              }
            }
          }

          if (self->_regions[v9].var5 && v11[49]) {
            -[VMUTaskMemoryScanner _shortenScannableRangeOfMappedFile:](self, "_shortenScannableRangeOfMappedFile:", v9);
          }
        }
      }
    }

    unsigned int v8 = v9 + 1;
  }

  while ((int)v9 + 1 <= v6);
  uint64_t v170 = 0LL;
  v171 = &v170;
  uint64_t v172 = 0x3032000000LL;
  v173 = __Block_byref_object_copy_;
  v174 = __Block_byref_object_dispose_;
  id v175 = (id)objc_opt_new();
  int v25 = (LODWORD(self->_regionDescriptionOptions) >> 23) & 1;
  v168[0] = MEMORY[0x1895F87A8];
  v168[1] = 3221225472LL;
  v168[2] = __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v168[3] = &unk_189DFD018;
  v168[4] = self;
  v168[5] = &v170;
  char v169 = v25;
  BOOL v26 = -[VMUTaskMemoryScanner _callRemoteMallocEnumerators:error:block:]( self,  "_callRemoteMallocEnumerators:error:block:",  6LL,  a3,  v168);
  if (!v26) {
    goto LABEL_195;
  }
  if (!self->_stackRanges)
  {
    unint64_t v27 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v27;
  }

  unsigned int regionsCount = self->_regionsCount;
  BOOL v167 = v26;
  if (regionsCount)
  {
    regions = self->_regions;
    uint64_t v31 = &regions[(unint64_t)(regionsCount - 1)];
  }

  else
  {
    regions = 0LL;
    uint64_t v31 = 0LL;
  }

  if (!self->_threadsCount) {
    goto LABEL_105;
  }
  uint64_t v32 = 0LL;
  do
  {
    unint64_t v33 = -[VMUTaskThreadStates stackPointerForThreadNum:](self->_threadStates, "stackPointerForThreadNum:", v32);
    unint64_t v34 = v33;
    if (!v33) {
      goto LABEL_88;
    }
    regionMap = self->_regionMap;
    unint64_t var6 = regionMap->var6;
    unint64_t var7 = regionMap->var7;
    BOOL v38 = var7 >= var6;
    unint64_t v39 = var7 - var6;
    if (!v38 || v33 - var6 >= v39) {
      goto LABEL_88;
    }
    unint64_t v40 = v33 >> *MEMORY[0x1895FD580];
    if (v40)
    {
      var3 = (unsigned int *)regionMap->var3;
      unint64_t v42 = v33 >> *MEMORY[0x1895FD580];
      do
      {
        if (*var3 <= (v42 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)var3 + ((v42 & 0x3FFFFFF) >> 3) + 4) >> (v42 & 7)) & 1) == 0)
        {
          goto LABEL_88;
        }

        v42 >>= 26;
      }

      while (v42);
    }

    v43 = (char *)regionMap + 4 * (v40 & 0x7FFFF);
    int v46 = *((_DWORD *)v43 + 16);
    int v45 = v43 + 64;
    int v44 = v46;
    unint64_t var4 = regionMap->var4;
    if (v46)
    {
      unint64_t v48 = &var4[(unint64_t)(v44 - 1)];
      if (v33 - *((void *)v48->var0 + 1) < *((void *)v48->var0 + 2)) {
        goto LABEL_64;
      }
    }

    unint64_t var5 = regionMap->var5;
    if (!(_DWORD)var5) {
      goto LABEL_88;
    }
    v54 = regionMap->var4;
    while (1)
    {
      unint64_t v55 = var5 >> 1;
      unint64_t v48 = &v54[var5 >> 1];
      if (*((void *)v48->var0 + 1) <= v33) {
        break;
      }
LABEL_77:
      BOOL v38 = var5 >= 2;
      unint64_t var5 = v55;
      if (!v38) {
        goto LABEL_88;
      }
    }

    if (*((void *)v48->var0 + 2) + *((void *)v48->var0 + 1) <= v33)
    {
      v54 = v48 + 1;
      unint64_t v55 = --var5 >> 1;
      goto LABEL_77;
    }

    int v57 = [v48->var0 isSpecialPhysFootprintRegion];
    if (v57) {
      unint64_t v58 = 0LL;
    }
    else {
      unint64_t v58 = (unint64_t)v48;
    }
    if ((v57 & 1) != 0) {
      goto LABEL_88;
    }
    if ((*(_BYTE *)(*(void *)v58 + 132LL) & 1) != 0)
    {
      unint64_t v59 = v58;
      int v60 = (id *)(v58 + 64);
      unint64_t v61 = regionMap->var5 - ((uint64_t)(v58 + 64 - (unint64_t)regionMap->var4) >> 6);
      if (v61)
      {
        while (1)
        {
          unint64_t v62 = v61 >> 1;
          uint64_t v63 = &v60[8 * (v61 >> 1)];
          if (*((void *)*v63 + 1) <= v34)
          {
            if (*((void *)*v63 + 2) + *((void *)*v63 + 1) > v34)
            {
              else {
                unint64_t v61 = (unint64_t)v63;
              }
              break;
            }

            int v60 = v63 + 8;
            unint64_t v62 = --v61 >> 1;
          }

          BOOL v64 = v61 > 1;
          unint64_t v61 = v62;
          if (!v64)
          {
            unint64_t v61 = 0LL;
            break;
          }
        }
      }

      if (v61) {
        unint64_t v58 = v61;
      }
      else {
        unint64_t v58 = v59;
      }
      unint64_t v48 = (_VMURegionNode *)v58;
    }

    _DWORD *v45 = ((v58 - (unint64_t)var4) >> 6) + 1;
LABEL_64:
    v48->unint64_t var4 = v34;
    uint64_t v49 = *((void *)v48->var0 + 1);
    unint64_t v50 = *((void *)v48->var0 + 2) + v49;
    v48->unint64_t var5 = v50;
    unint64_t v51 = (unint64_t)&v48[-1];
    if (&v48[-1] >= regions)
    {
      do
      {
        if (*(void *)(*(void *)v51 + 16LL) + *(void *)(*(void *)v51 + 8LL) != v49) {
          break;
        }
        if (!*(_DWORD *)(*(void *)v51 + 24LL)) {
          break;
        }
        uint64_t v49 = *(void *)(*(void *)v51 + 8LL);
        *(void *)(v51 + 24) = 0LL;
        *(void *)(v51 + 32) = 0LL;
        v51 -= 64LL;
      }

      while (v51 >= (unint64_t)regions);
    }

    unint64_t v52 = (unint64_t)&v48[1];
    if (&v48[1] <= v31)
    {
      do
      {
        if (v50 != *(void *)(*(void *)v52 + 8LL)) {
          break;
        }
        if (!*(_DWORD *)(*(void *)v52 + 24LL)) {
          break;
        }
        unint64_t v56 = (void *)(*(void *)v52 + 8LL);
        *(void *)(v52 + 24) = *v56;
        unint64_t v50 = v56[1] + *v56;
        *(void *)(v52 + 32) = v50;
        v52 += 64LL;
      }

      while (v52 <= (unint64_t)v31);
    }

    -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v34, v50 - v34);
LABEL_88:
    uint64_t v32 = (v32 + 1);
  }

  while (v32 < self->_threadsCount);
LABEL_105:
  unint64_t mallocZonesBufferAddress = self->_mallocZonesBufferAddress;
  if (!mallocZonesBufferAddress) {
    goto LABEL_123;
  }
  p_unint64_t var0 = 0LL;
  id v67 = self->_regionMap;
  unint64_t v69 = v67->var6;
  unint64_t v68 = v67->var7;
  unint64_t v70 = v68 - v69;
  BOOL v71 = v68 < v69;
  if (mallocZonesBufferAddress - v69 >= v70 || v71) {
    goto LABEL_122;
  }
  unint64_t v72 = mallocZonesBufferAddress >> *MEMORY[0x1895FD580];
  if (v72)
  {
    id v73 = (unsigned int *)v67->var3;
    unint64_t v74 = mallocZonesBufferAddress >> *MEMORY[0x1895FD580];
    while (*v73 > (v74 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)v73 + ((v74 & 0x3FFFFFF) >> 3) + 4) >> (v74 & 7)) & 1) != 0)
    {
      v74 >>= 26;
      if (!v74) {
        goto LABEL_113;
      }
    }

void __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke( uint64_t a1,  unsigned int a2,  int a3,  uint64_t a4,  unsigned int a5)
{
  if (a5)
  {
    uint64_t v5 = a4;
    uint64_t v7 = 0LL;
    uint64_t v93 = a5;
    do
    {
      unsigned int v8 = (unint64_t *)(v5 + 16 * v7);
      uint64_t v10 = v8 + 1;
      unint64_t v9 = v8[1];
      if (v9)
      {
        unint64_t v11 = *v8;
        uint64_t v12 = *(void *)(a1 + 32);
        if (a3 == 2 && *(_DWORD *)(v12 + 216))
        {
          uint64_t v13 = 0LL;
          unint64_t v14 = 0LL;
          do
          {
            if (*(void *)(*(void *)(v12 + 208) + v13) - v11 < v9)
            {
              unint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
              [MEMORY[0x189607968] numberWithUnsignedInt:v14];
              id v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 addObject:v16];

              uint64_t v12 = *(void *)(a1 + 32);
            }

            ++v14;
            v13 += 24LL;
          }

          while (v14 < *(unsigned int *)(v12 + 216));
          unint64_t v11 = *v8;
          uint64_t v5 = a4;
        }

        uint64_t v17 = *(void *)(v12 + 112);
        unint64_t v18 = *(void *)(v17 + 48);
        unint64_t v19 = *(void *)(v17 + 56);
        BOOL v20 = v19 >= v18;
        unint64_t v21 = v19 - v18;
        if (v20 && v11 - v18 < v21)
        {
          unint64_t v22 = v11 >> *MEMORY[0x1895FD580];
          if (v22)
          {
            unsigned int v23 = *(unsigned int **)(v17 + 24);
            unint64_t v24 = v11 >> *MEMORY[0x1895FD580];
            do
            {
              if (*v23 <= (v24 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
              {
                goto LABEL_81;
              }

              v24 >>= 26;
            }

            while (v24);
          }

          uint64_t v25 = v17 + 4 * (v22 & 0x7FFFF);
          int v28 = *(_DWORD *)(v25 + 64);
          unint64_t v27 = (_DWORD *)(v25 + 64);
          int v26 = v28;
          uint64_t v29 = *(void *)(v17 + 32);
          if (v28)
          {
            unint64_t v30 = v29 + ((unint64_t)(v26 - 1) << 6);
            if (v11 - *(void *)(*(void *)v30 + 8LL) < *(void *)(*(void *)v30 + 16LL)) {
              goto LABEL_21;
            }
          }

          unint64_t v70 = *(unsigned int *)(v17 + 40);
          if ((_DWORD)v70)
          {
            unint64_t v71 = *(void *)(v17 + 32);
            do
            {
              unint64_t v72 = v70 >> 1;
              unint64_t v30 = v71 + (v70 >> 1 << 6);
              if (*(void *)(*(void *)v30 + 8LL) <= v11)
              {
                if (*(void *)(*(void *)v30 + 16LL) + *(void *)(*(void *)v30 + 8LL) > v11)
                {
                  int v73 = [*(id *)v30 isSpecialPhysFootprintRegion];
                  if (v73) {
                    unint64_t v74 = 0LL;
                  }
                  else {
                    unint64_t v74 = v30;
                  }
                  if ((v73 & 1) == 0)
                  {
                    if ((*(_BYTE *)(*(void *)v74 + 132LL) & 1) == 0) {
                      goto LABEL_96;
                    }
                    unsigned int v75 = (id *)(v74 + 64);
                    unint64_t v76 = *(unsigned int *)(v17 + 40) - ((uint64_t)(v74 + 64 - *(void *)(v17 + 32)) >> 6);
                    if (!v76) {
                      goto LABEL_93;
                    }
                    while (1)
                    {
                      unint64_t v77 = v76 >> 1;
                      int v78 = &v75[8 * (v76 >> 1)];
                      if (*((void *)*v78 + 1) <= v11)
                      {
                        if (*((void *)*v78 + 2) + *((void *)*v78 + 1) > v11)
                        {
                          unint64_t v79 = v74;
                          int v80 = [*v78 isSpecialPhysFootprintRegion];
                          unint64_t v74 = v79;
                          if (v80) {
                            unint64_t v76 = 0LL;
                          }
                          else {
                            unint64_t v76 = (unint64_t)v78;
                          }
LABEL_93:
                          if (v76) {
                            unint64_t v30 = v76;
                          }
                          else {
                            unint64_t v30 = v74;
                          }
LABEL_96:
                          *unint64_t v27 = ((v30 - v29) >> 6) + 1;
LABEL_21:
                          unint64_t v31 = *v10 + *v8;
LABEL_22:
                          while (2)
                          {
                            id v32 = *(id *)v30;
                            if (v31 <= *(void *)(*(void *)v30 + 8LL)) {
                              goto LABEL_81;
                            }
                            *((_DWORD *)v32 + 37) = a2;
                            if (![*((id *)v32 + 5) length])
                            {
                              uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 144) objectAtIndexedSubscript:a2];
                              unint64_t v34 = *(void **)(*(void *)v30 + 40LL);
                              *(void *)(*(void *)v30 + 40LL) = v33;

                              if (*(_BYTE *)(a1 + 48))
                              {
                                id v35 = [*(id *)v30 description];
                                printf( "Setting region name in %s based on _zoneNames[zone_index] for  %s\n",  "-[VMUTaskMemoryScanner addRootNodesFromTaskWithError:]_block_invoke",  (const char *)[v35 UTF8String]);
                              }
                            }

                            uint64_t v36 = *(char **)v30;
                            *(_DWORD *)(*(void *)v30 + 144LL) |= a3;
                            *(void *)(v30 + 24) = 0LL;
                            *(void *)(v30 + 32) = 0LL;
                            if (s_enumeratorDebugging)
                            {
                              BOOL v64 = (FILE **)MEMORY[0x1895F89D0];
                              fprintf( (FILE *)*MEMORY[0x1895F89D0],  "zone %s ",  (const char *)objc_msgSend( objc_retainAutorelease(*(id *)(*(void *)(*(void *)(a1 + 32) + 208)
                                                                             + 24LL * a2
                                                                             + 8)),
                                                "UTF8String"));
                              int v88 = *v64;
                              uint64_t v86 = [*(id *)v30 address];
                              uint64_t v85 = *(void *)(*(void *)v30 + 16LL) + *(void *)(*(void *)v30 + 8LL);
                              uint64_t v65 = *(unsigned int *)(*(void *)v30 + 24LL);
                              v84 = vm_prot_strings[v65];
                              id v83 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*(void *)v30 + 232LL),  *(unsigned __int8 *)(*(void *)v30 + 104LL),  *(unsigned __int8 *)(*(void *)v30 + 50LL),  v65,  *(unsigned __int8 *)(*(void *)v30 + 49LL));
                              unint64_t v82 = (const char *)[v83 UTF8String];
                              uint64_t v66 = *(void *)(*(void *)v30 + 16LL) >> *MEMORY[0x1895FD580];
                              if (v66 == 1) {
                                id v67 = "page";
                              }
                              else {
                                id v67 = "pages";
                              }
                              if (*(void *)(v30 + 24) == *(void *)(v30 + 32)) {
                                unint64_t v68 = "";
                              }
                              else {
                                unint64_t v68 = " [root]";
                              }
                              unint64_t v69 = VMUMallocRangeTypeString(a3);
                              uint64_t v81 = v67;
                              uint64_t v5 = a4;
                              fprintf( v88,  "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n",  v86,  v85,  v84,  v82,  v66,  v81,  v68,  v69,  *v8,  *v10 + *v8);

                              uint64_t v36 = *(char **)v30;
                            }

                            uint64_t v37 = (uint64_t *)(v36 + 8);
                            uint64_t v39 = *v37;
                            uint64_t v38 = v37[1];
                            if (v31 <= v38 + v39) {
                              goto LABEL_81;
                            }
                            uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 112LL);
                            unint64_t v41 = *(void *)(v40 + 48);
                            unint64_t v42 = *(void *)(v40 + 56);
                            BOOL v20 = v42 >= v41;
                            unint64_t v43 = v42 - v41;
                            if (!v20) {
                              goto LABEL_81;
                            }
                            v11 += v38;
                            if (v11 - v41 >= v43) {
                              goto LABEL_81;
                            }
                            unint64_t v44 = v11 >> *MEMORY[0x1895FD580];
                            if (v44)
                            {
                              int v45 = *(unsigned int **)(v40 + 24);
                              unint64_t v46 = v11 >> *MEMORY[0x1895FD580];
                              while (*v45 > (v46 & 0x3FFFFFF)
                                   && ((*((unsigned __int8 *)v45 + ((v46 & 0x3FFFFFF) >> 3) + 4) >> (v46 & 7)) & 1) != 0)
                              {
                                v46 >>= 26;
                                if (!v46) {
                                  goto LABEL_36;
                                }
                              }

                              goto LABEL_81;
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
      unsigned int v6 = self->_regions[v4].var0;
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
      -[VMUTaskMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v5);
    }
  }

- (void)_sortBlocks
{
}

uint64_t __35__VMUTaskMemoryScanner__sortBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke;
  v6[3] = &unk_189DFD080;
  v6[4] = self;
  BOOL v4 = -[VMUTaskMemoryScanner _callRemoteMallocEnumerators:error:block:]( self,  "_callRemoteMallocEnumerators:error:block:",  1LL,  a3,  v6);
  if (v4) {
    -[VMUTaskMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  }
  return v4;
}

void __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  int a5)
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(v8 + 92);
  if (v9 <= a5 - 1 + *(_DWORD *)(v8 + 88))
  {
    int v10 = 2 * v9;
    *(_DWORD *)(v8 + 92) = v10;
    while (1)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = *(_DWORD *)(v11 + 92);
      if (v12 >= a5 - 1 + *(_DWORD *)(v11 + 88)) {
        break;
      }
      *(_DWORD *)(v11 + 92) = 2 * v12;
    }

    *(void *)(*(void *)(a1 + 32) + 80LL) = realloc(*(void **)(v11 + 80), 16LL * *(unsigned int *)(v11 + 92));
    uint64_t v13 = *(void *)(a1 + 32);
    if (!*(void *)(v13 + 80))
    {
      NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  v9,  *(unsigned int *)(v13 + 92));
      abort();
    }
  }

  if (!a5) {
    return;
  }
  uint64_t v14 = 0LL;
  do
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 112LL);
    id v16 = (unint64_t *)(a4 + 16 * v14);
    unint64_t v17 = *(void *)(v15 + 48);
    unint64_t v18 = *(void *)(v15 + 56);
    BOOL v19 = v18 >= v17;
    unint64_t v20 = v18 - v17;
    if (!v19) {
      goto LABEL_40;
    }
    unint64_t v21 = *v16;
    if (*v16 - v17 >= v20) {
      goto LABEL_40;
    }
    unint64_t v22 = v21 >> *MEMORY[0x1895FD580];
    if (v22)
    {
      unsigned int v23 = *(unsigned int **)(v15 + 24);
      unint64_t v24 = v21 >> *MEMORY[0x1895FD580];
      while (*v23 > (v24 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) != 0)
      {
        v24 >>= 26;
        if (!v24) {
          goto LABEL_18;
        }
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
      int v10 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v9);
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
        uint64_t v14 = (unint64_t *)(*((void *)v5 + 2) + v11);
        unint64_t v16 = *v14;
        unint64_t v15 = v14[1];
        unint64_t v17 = &self->_blocks[blocksCount];
        if (v15 >= 0xFFFFFFFFFLL) {
          unint64_t v15 = 0xFFFFFFFFFLL;
        }
        v17->unint64_t var0 = v16;
        *((void *)v17 + 1) = (32 * v15) | 1;
        unsigned int blocksCount = self->_blocksCount + 1;
        self->_unsigned int blocksCount = blocksCount;
        ++v12;
        v11 += 16LL;
      }

      while (v12 < v5[2]);
    }

    -[VMUTaskMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  }
}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  BOOL v5 = -[VMUTaskMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5) {
    LOBYTE(v5) = -[VMUTaskMemoryScanner addMallocNodesFromTaskWithError:](self, "addMallocNodesFromTaskWithError:", a3);
  }
  return v5;
}

- (void)_sortAndClassifyBlocks
{
  if ((self->_regionDescriptionOptions & 0x200000) == 0) {
    -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");
  }
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

- (void)_identifyObjCClassStructureBlocks
{
  unint64_t v3 = -[VMUObjectIdentifier ObjCclassCount](self->_objectIdentifier, "ObjCclassCount");
  if (v3 + -[VMUObjectIdentifier SwiftClassCount](self->_objectIdentifier, "SwiftClassCount"))
  {
    -[VMUObjectIdentifier _generateClassInfosForObjCClassStructurePointerTypes]( self->_objectIdentifier,  "_generateClassInfosForObjCClassStructurePointerTypes");
    self->_objcClassStructureClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:]( self->_objectIdentifier,  "classInfoIndexForObjCClassStructurePointerType:",  0LL);
    self->_classDataMethodsClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:]( self->_objectIdentifier,  "classInfoIndexForObjCClassStructurePointerType:",  6LL);
    self->_swiftClassStructureClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:]( self->_objectIdentifier,  "classInfoIndexForObjCClassStructurePointerType:",  1LL);
    self->_swiftMetadataClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:]( self->_objectIdentifier,  "classInfoIndexForObjCClassStructurePointerType:",  12LL);
    BOOL v4 = (NSMutableDictionary *)objc_opt_new();
    addressToRuntimeMetadataChunkInfoDict = self->_addressToRuntimeMetadataChunkInfoDict;
    self->_addressToRuntimeMetadataChunkInfoDict = v4;

    objectIdentifier = self->_objectIdentifier;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke;
    v7[3] = &unk_189DFD0D0;
    v7[4] = self;
    -[VMUObjectIdentifier enumerateRealizedClassInfosWithBlock:]( objectIdentifier,  "enumerateRealizedClassInfosWithBlock:",  v7);
  }

  else
  {
    *(void *)&self->_objcClassStructureClassInfoIndex = -1LL;
    *(void *)&self->_swiftClassStructureClassInfoIndex = -1LL;
  }

void __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2;
  v7[3] = &unk_189DFD0A8;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v6 identifyObjCClassStructureBlocksWithScanner:v5 addressIdentifierBlock:v7];
}

uint64_t __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2( uint64_t a1,  unint64_t a2,  uint64_t a3,  char a4)
{
  if (!a2 || ([*(id *)(*(void *)(a1 + 32) + 8) addressIsInSharedCache:a2] & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = [*(id *)(a1 + 32) nodeForAddress:a2];
  uint64_t v9 = v8;
  if ((_DWORD)v8 == -1) {
    return v9;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 80);
  unint64_t v12 = *(void *)(v11 + 16LL * v8 + 8);
  if ((v12 & 7) != 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_BYTE *)(v10 + 193))
  {
    if (*(void *)(v11 + 16LL * v8) + 16LL < a2
      || ((unint64_t v13 = *((unsigned int *)&VMUObjCClassStructureTypeInfoArray + 6 * a3 + 4),
           unint64_t v14 = (v12 >> 5) & 0xFFFFFFFFFLL,
           (_DWORD)v13)
        ? (BOOL v15 = v14 > v13)
        : (BOOL v15 = 0),
          v15))
    {
      uint64_t v16 = objc_opt_new();
      *(_BYTE *)(v16 + 8) = a4;
      *(_DWORD *)(v16 + 12) = a3;
      objc_storeStrong((id *)(v16 + 16), *(id *)(a1 + 40));
      unint64_t v17 = *(void **)(*(void *)(a1 + 32) + 200LL);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setObject:v16 forKeyedSubscript:v18];
    }
  }

  int v19 = [*(id *)(a1 + 40) infoType];
  uint64_t v20 = *(void *)(a1 + 32);
  if (v19 == 8 && (uint64_t v21 = *(void *)(v20 + 80), *(void *)(v21 + 16LL * v9) + 16LL < a2))
  {
    *(void *)(v21 + 16LL * v9 + 8) = *(void *)(v21 + 16LL * v9 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(v20 + 340) << 41);
    uint64_t v22 = *(void *)(a1 + 32);
    unsigned int v23 = *(_DWORD *)(v22 + 348);
    *(_DWORD *)(v22 + 348) = v23;
    uint64_t v24 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v24 + 348))
    {
      *(_DWORD *)(v24 + 348) = v9;
      uint64_t v24 = *(void *)(a1 + 32);
    }

    unsigned int v25 = *(_DWORD *)(v24 + 352);
    *(_DWORD *)(v24 + 352) = v25;
  }

  else
  {
    unsigned int v27 = [*(id *)(v20 + 64) classInfoIndexForObjCClassStructurePointerType:a3];
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * v9;
    *(void *)(v28 + 8) = *(void *)(v28 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v27 << 41);
  }

  return v9;
}

- (void)printRuntimeMetadataInfo
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v28[3] = &unk_189DFD0F8;
  v28[4] = self;
  unint64_t v3 = (void (**)(void, void, void, void))MEMORY[0x186E33044](v28, a2);
  -[NSMutableDictionary allKeys](self->_addressToRuntimeMetadataChunkInfoDict, "allKeys");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 sortedArrayUsingSelector:sel_compare_];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
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
        unint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:]( self->_addressToRuntimeMetadataChunkInfoDict,  "objectForKeyedSubscript:",  v13);
        unint64_t v14 = (id *)objc_claimAutoreleasedReturnValue();
        unint64_t v15 = [v13 unsignedLongLongValue];
        uint64_t v16 = &self->_blocks[v10];
        if (v15 >= ((*((void *)v16 + 1) >> 5) & 0xFFFFFFFFFLL) + v16->var0)
        {
          uint64_t v10 = -[VMUTaskMemoryScanner nodeForAddress:](self, "nodeForAddress:", v15);
          uint64_t v20 = v14;

          uint64_t v8 = v20;
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
            int v19 = &self->_blocks[v10];
            uint64_t v21 = v18;
            uint64_t v11 = v17;
            unint64_t v3 = v22;
            printf( "%s %#llx-%#llx[%llu]\n",  v21,  v19->var0,  ((*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL) + v19->var0,  (*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL);
            ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v9, v8);

            uint64_t v8 = 0LL;
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
    uint64_t v8 = 0LL;
  }
}

void __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke( uint64_t a1,  unsigned int a2,  uint64_t a3,  unsigned int *a4)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (char *)&VMUObjCClassStructureTypeInfoArray + 24 * a4[3];
  int v9 = *((_DWORD *)v8 + 4);
  strchr(*((const char **)v8 + 1), 40);
  uint64_t v10 = a4;
  __strcpy_chk();
  *strchr(__s, 41) = 0;
  uint64_t v11 = a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * a2);
  if (*((_BYTE *)v10 + 8)) {
    unint64_t v12 = "metaclass";
  }
  else {
    unint64_t v12 = "class";
  }
  unint64_t v13 = (void *)*((void *)v10 + 2);

  id v14 = [v13 className];
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)[v14 UTF8String]);
}

- (void)_findSwiftClassesInExclaveCore
{
  if (self->_blocksCount)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = (uint64_t *)&self->_blocks[v3];
      if ((v5[1] & 0xFFFFFE0000000007LL) == 1)
      {
        if (vmu_swift_reflection_interop_ownsObject(*(void *)-[VMUObjectIdentifier swiftMirror]( self->_objectIdentifier,  "swiftMirror")))
        {
          uint64_t v6 = vmu_swift_reflection_interop_metadataForObject( *(void *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"),  *v5);
          if (v6)
          {
            uint64_t v7 = v6;
            -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v6);
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v8)
            {
              vmu_swift_reflection_infoForInstance( *(void *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"),  *v5,  (uint64_t)v14);
              if (v14[0] == 17)
              {
                int v9 = objc_alloc(&OBJC_CLASS___VMUMutableClassInfo);
                classInfoIndexer = self->_classInfoIndexer;
                objectIdentifier = self->_objectIdentifier;
                -[VMUObjectIdentifier memoryReader](objectIdentifier, "memoryReader");
                unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
                unint64_t v13 = -[VMUClassInfo initWithClass:type:infoMap:objectIdentifier:reader:]( v9,  "initWithClass:type:infoMap:objectIdentifier:reader:",  v7,  8LL,  classInfoIndexer,  objectIdentifier,  v12);

                -[VMUTaskMemoryScanner applyTypeOverlayToMutableInfo:](self, "applyTypeOverlayToMutableInfo:", v13);
              }
            }
          }
        }
      }

      ++v4;
      ++v3;
    }

    while (v4 < self->_blocksCount);
  }

- (void)_fixupBlockIsas
{
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    -[VMUTaskMemoryScanner _findSwiftClassesInExclaveCore](self, "_findSwiftClassesInExclaveCore");
    -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  }

  unint64_t blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    unint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    unint64_t regionDescriptionOptions = self->_regionDescriptionOptions;
    LODWORD(v7) = -1;
    do
    {
      blocks = self->_blocks;
      unint64_t v9 = *((void *)&blocks[v4] + 1);
      if ((v9 & 7) == 1)
      {
        unint64_t var0 = blocks[v4].var0;
        if (var0 >= v6)
        {
          uint64_t v11 = ((uint64_t)(int)v7 << 6) + 64;
          uint64_t v12 = (int)v7 + 1LL;
          do
          {
            if (v12 >= (int)self->_regionsCount)
            {
              unint64_t v5 = -1LL;
              unint64_t v6 = -1LL;
            }

            else
            {
              unint64_t v13 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v11) + 8);
              unint64_t v5 = *v13;
              unint64_t v6 = (*(void **)((char *)&self->_regions->var0 + v11))[2] + *v13;
            }

            LODWORD(v7) = v7 + 1;
            v11 += 64LL;
            ++v12;
          }

          while (var0 >= v6);
        }

        unint64_t v14 = var0 + ((v9 >> 5) & 0xFFFFFFFFFLL);
        if (v14 > v5)
        {
          uint64_t v15 = (uint64_t)(int)v7 << 6;
          uint64_t v7 = (int)v7;
          regions = self->_regions;
          do
          {
            uint64_t v17 = &self->_blocks[v4];
            unint64_t v18 = *((void *)v17 + 1);
            if ((v18 & 0x18) == 8)
            {
              if (s_enumeratorDebugging)
              {
                int v25 = (*(_DWORD **)((char *)&regions->var0 + v15))[37];
                unint64_t v26 = v18 >> 41;
                if (v25 != -1 && v25 != (_DWORD)v26)
                {
                  fprintf( (FILE *)*MEMORY[0x1895F89D0], "warning: zone fixup failed - block %#llx from zone %s discovered in region [%#llx-%#llx] already claimed by %s\n", v17->var0, (const char *)[self->_zones[v26].var1 UTF8String], v5, v6, (const char *)objc_msgSend( self->_zones[(*(unsigned int **)((char *)&self->_regions->var0 + v15))[37]].var1, "UTF8String"));
                  unint64_t v18 = *((void *)&self->_blocks[v4] + 1);
                  regions = self->_regions;
                }
              }

              uint64_t v19 = *(uint64_t *)((char *)&regions->var0 + v15);
              *(_DWORD *)(v19 + 148) = v18 >> 41;
              if (![*(id *)(v19 + 40) length])
              {
                uint64_t v20 = -[NSMutableArray objectAtIndexedSubscript:]( self->_zoneNames,  "objectAtIndexedSubscript:",  *((void *)&self->_blocks[v4] + 1) >> 41);
                uint64_t v21 = *(uint64_t *)((char *)&self->_regions->var0 + v15);
                uint64_t v22 = *(void **)(v21 + 40);
                *(void *)(v21 + 40) = v20;

                if ((regionDescriptionOptions & 0x800000) != 0)
                {
                  id v23 = [*(id *)((char *)&self->_regions->var0 + v15) description];
                  printf( "Setting region name in %s based on _zoneNames[_blocks[i].isa_index for  %s\n",  "-[VMUTaskMemoryScanner _fixupBlockIsas]",  (const char *)[v23 UTF8String]);
                }
              }

              *((void *)&self->_blocks[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((void *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7LL;
              regions = self->_regions;
            }

            uint64_t v24 = *(uint64_t *)((char *)&regions->var0 + v15);
            ++*(void *)(v24 + 136);
            *(_DWORD *)(v24 + 144) |= 1u;
            if (v14 <= v6) {
              break;
            }
            if (++v7 >= (int)self->_regionsCount)
            {
              unint64_t v6 = -1LL;
              unint64_t v5 = -1LL;
              break;
            }

            unint64_t v5 = (*(void **)((char *)&regions[1].var0 + v15))[1];
            unint64_t v6 = (*(void **)((char *)&regions[1].var0 + v15))[2] + v5;
            v15 += 64LL;
          }

          while (v14 > v5);
          unint64_t blocksCount = self->_blocksCount;
        }
      }

      ++v4;
    }

    while (v4 < blocksCount);
  }

  self->_initializedRegionMallocBlockCounts = 1;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier swiftRuntimeInfoStableABI](self->_objectIdentifier, "swiftRuntimeInfoStableABI");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }

  else
  {
    -[VMUObjectIdentifier swiftRuntimeInfoPreABI](self->_objectIdentifier, "swiftRuntimeInfoPreABI");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
  }

  unint64_t v32 = v31;

  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke;
  v36[3] = &unk_189DFD198;
  id v37 = v32;
  id v38 = v28;
  v36[4] = self;
  id v33 = v32;
  id v34 = v28;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v36);
  -[VMUTaskMemoryScanner _identifySwiftTypeNameCache](self, "_identifySwiftTypeNameCache");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyObjCClassStructureBlocks](self, "_identifyObjCClassStructureBlocks");
  -[VMUTaskMemoryScanner _identifyNonObjectsPointingToSwiftMetadata](self, "_identifyNonObjectsPointingToSwiftMetadata");
  -[VMUTaskMemoryScanner _identifySwiftAsyncTaskSlabs](self, "_identifySwiftAsyncTaskSlabs");
  -[VMUTaskMemoryScanner _identifyAttributeGraphAllocations](self, "_identifyAttributeGraphAllocations");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyNonObjectsPointedToByTypedIvars](self, "_identifyNonObjectsPointedToByTypedIvars");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyNonObjectsUsingStackBacktrace](self, "_identifyNonObjectsUsingStackBacktrace");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_145);
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 8LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      if ((*(void *)(*(void *)(v2 + 80) + v6) & 0xFFFFFE0000000007LL) == 1)
      {
        v8[0] = v7;
        v8[1] = 3221225472LL;
        v8[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2;
        v8[3] = &unk_189DFD170;
        v8[4] = v2;
        int v11 = v5;
        id v10 = *(id *)(a1 + 48);
        id v9 = *(id *)(a1 + 40);
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1LL, v8);

        uint64_t v2 = *(void *)(a1 + 32);
      }

      ++v5;
      v6 += 16LL;
    }

    while (v5 < *(unsigned int *)(v2 + 88));
  }

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x186E32E40]();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(void *)(v6 + 16 * v7))) {
    BOOL v8 = (*(void *)(v6 + 16 * v7) & 7LL) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8
    && (objc_msgSend( *(id *)(v5 + 64),  "classInfoForMemory:length:remoteAddress:",  a2,  (*(void *)(v6 + 16 * v7 + 8) >> 5) & 0xFFFFFFFFFLL),  (id v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    if ([v9 hasSpecificLayout])
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v10];
      uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 512LL);
      [MEMORY[0x189607968] numberWithUnsignedInt:v11];
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectForKeyedSubscript:v13];
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        unint64_t v14 = (void *)objc_opt_new();
        uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 512LL);
        [MEMORY[0x189607968] numberWithUnsignedInt:v11];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setObject:v14 forKeyedSubscript:v16];
      }

      uint64_t v17 = (void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * *(unsigned int *)(a1 + 56));
      uint64_t v18 = [v10 instanceSpecificInfoForObject:*v17 ofSize:v17[1] >> 5 withScanner:v17[2] memoryReader:v17[3]];

      id v10 = (void *)v18;
    }

    uint64_t v19 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v31[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3;
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
    unsigned int v25 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v24];
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * *(unsigned int *)(a1 + 56);
    *(void *)(v26 + 8) = *(void *)(v26 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v25 << 41);
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(*(void *)(v27 + 80) + 16LL * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v30[0] = v21;
    v30[1] = 3221225472LL;
    v30[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4;
    v30[3] = &unk_189DFD148;
    v30[4] = v27;
    [v24 enumerateExternalValuesFromObject:a2 withSize:v28 block:v30];
  }

  else
  {
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * *(unsigned int *)(a1 + 56);
    *(void *)(v29 + 8) &= 0x1FFFFFFFFFFuLL;
  }

  objc_autoreleasePoolPop(v4);
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3( uint64_t a1,  void *a2,  unsigned int a3,  int a4)
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
  uint64_t v16 = *(uint64_t **)(*(void *)(a1 + 48) + 112LL);
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
      id v37 = (unsigned int *)(v32 + 4 * ((v6 - (*v35 & -*MEMORY[0x1895FD590])) >> *v21));
      uint64_t v38 = *v37;
      uint64_t v39 = (unint64_t *)(v33 + 16 * v38);
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

        uint64_t v63 = *(void *)(*(void *)(a1 + 48) + 80LL);
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
              unint64_t v68 = (void *)MEMORY[0x186E32E40]();
              [a2 instanceSpecificInfoForObject:v6 ofSize:*v66 >> 5 withScanner:*(void *)(a1 + 48) memoryReader:*(void *)(a1 + 56)];
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69) {
                *uint64_t v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)[*(id *)(*(void *)(a1 + 48) + 272) indexForClassInfo:v69] << 41);
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
            unint64_t v41 = &v39[2 * v44];
            unint64_t v42 = *v41;
            if (*v41 <= v6)
            {
              if (((v39[2 * v44 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
                goto LABEL_63;
              }
              uint64_t v39 = v41 + 2;
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
        unint64_t v41 = &v35[2 * v46];
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

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = *(uint64_t **)(*(void *)(a1 + 32) + 112LL);
  unint64_t v8 = v6[6];
  unint64_t v7 = v6[7];
  unint64_t v9 = v7 - v8;
  BOOL v10 = v7 < v8;
  if (a2 - v8 >= v9 || v10) {
    goto LABEL_72;
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
        goto LABEL_72;
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
    goto LABEL_72;
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
      goto LABEL_72;
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
    goto LABEL_72;
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
  _DWORD *v17 = ((v41 - v19) >> 6) + 1;
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
        goto LABEL_72;
      }
      int v26 = (void *)(v23 + 16LL * (v21 + v24 - 1));
      if (((v26[1] >> 5) & 0xFFFFFFFFFuLL) + *v26 <= a2) {
        goto LABEL_72;
      }
      uint64_t v27 = (unsigned int *)(v22 + 4 * ((a2 - (*v25 & -*MEMORY[0x1895FD590])) >> *v11));
      uint64_t v28 = *v27;
      uint64_t v29 = (unint64_t *)(v23 + 16 * v28);
      if (*v29 > a2) {
        goto LABEL_72;
      }
      uint64_t v30 = v27[1];
      if (v30 < *((_DWORD *)v6 + 2)
        && (unsigned int v31 = (unint64_t *)(v23 + 16 * v30), v32 = *v31, *v31 <= a2))
      {
LABEL_46:
        unint64_t v47 = v31[1];
        if ((v47 & 7) - 2 < 3) {
          goto LABEL_72;
        }
        unint64_t v48 = (unint64_t)v31 - v23;
        unint64_t v49 = ((unint64_t)v31 - v23) >> 4;
        unint64_t v50 = a2 - v32;
        unint64_t v51 = v6[2];
        if (v50 >= v51)
        {
          if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || (_DWORD)v49 == -1) {
            goto LABEL_72;
          }
        }

        else if ((_DWORD)v49 == -1)
        {
          goto LABEL_72;
        }

        uint64_t v53 = *(void *)(a1 + 32);
        uint64_t v54 = *(void *)(v53 + 80);
        if (v54)
        {
          uint64_t v55 = (v48 >> 4);
          if ((*(void *)(v54 + 16 * v55 + 8) & 7LL) == 1)
          {
            unsigned int v56 = *(_DWORD *)(v53 + 248);
            uint64_t v57 = *(unsigned int *)(v53 + 252);
            if (v57 <= v56)
            {
              int v60 = 2 * v57;
              *(_DWORD *)(v53 + 252) = v60;
              uint64_t v61 = *(void *)(a1 + 32);
              uint64_t v63 = (_DWORD *)(v61 + 252);
              unsigned int v62 = *(_DWORD *)(v61 + 252);
              for (id i = v5; v62 < *(_DWORD *)(v61 + 248); v62 = *(_DWORD *)(v61 + 252))
              {
                *uint64_t v63 = 2 * v62;
                uint64_t v61 = *(void *)(a1 + 32);
                uint64_t v63 = (_DWORD *)(v61 + 252);
              }

              *(void *)(*(void *)(a1 + 32) + 240LL) = realloc(*(void **)(v61 + 240), 16LL * v62);
              uint64_t v64 = *(void *)(a1 + 32);
              uint64_t v58 = *(void *)(v64 + 240);
              if (!v58)
              {
                NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_instanceValues",  v57,  *(unsigned int *)(v64 + 252));
                abort();
              }

              unsigned int v56 = *(_DWORD *)(v64 + 248);
              id v5 = i;
            }

            else
            {
              uint64_t v58 = *(void *)(v53 + 240);
            }

            uint64_t v65 = (void *)(v58 + 16LL * v56);
            *uint64_t v65 = v55;
            v65[1] = 0LL;
            ++*(_DWORD *)(*(void *)(a1 + 32) + 248LL);
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

uint64_t __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (void)_identifySwiftTypeNameCache
{
  BOOL v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v6 = SymbolOwner;
  uint64_t v7 = v5;
  if ((CSIsNull() & 1) != 0) {
    return;
  }
  unint64_t v65 = 0LL;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  _copy_remote_mangled_symbol_value(v8, (uint64_t)"__ZL13TypeNameCache", v6, v7, 8uLL, &v65);

  unint64_t v9 = v65;
  if (!v65) {
    return;
  }
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v13 = var7 - var6;
  BOOL v14 = var7 < var6;
  if (v65 - var6 >= v13 || v14) {
    return;
  }
  uint64_t v15 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v16 = v65 >> *MEMORY[0x1895FD580];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v18 = v65 >> *MEMORY[0x1895FD580];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        return;
      }

      v18 >>= 26;
    }

    while (v18);
  }

  uint64_t v19 = (char *)regionMap + 4 * (v16 & 0x7FFFF);
  int v22 = *((_DWORD *)v19 + 16);
  unsigned int v21 = v19 + 64;
  int v20 = v22;
  unint64_t var4 = regionMap->var4;
  if (v22)
  {
    uint64_t v24 = &var4[(unint64_t)(v20 - 1)];
    if (v65 - *((void *)v24->var0 + 1) < *((void *)v24->var0 + 2)) {
      goto LABEL_15;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    return;
  }
  unint64_t v42 = regionMap->var4;
  while (1)
  {
    unint64_t v43 = var5 >> 1;
    uint64_t v24 = &v42[var5 >> 1];
    if (*((void *)v24->var0 + 1) <= v65) {
      break;
    }
LABEL_38:
    BOOL v39 = var5 >= 2;
    unint64_t var5 = v43;
    if (!v39) {
      return;
    }
  }

  if (*((void *)v24->var0 + 2) + *((void *)v24->var0 + 1) <= v65)
  {
    unint64_t v42 = v24 + 1;
    unint64_t v43 = --var5 >> 1;
    goto LABEL_38;
  }

  int v44 = [v24->var0 isSpecialPhysFootprintRegion];
  if (v44) {
    unint64_t v45 = 0LL;
  }
  else {
    unint64_t v45 = (unint64_t)v24;
  }
  if ((v44 & 1) != 0) {
    return;
  }
  if ((*(_BYTE *)(*(void *)v45 + 132LL) & 1) == 0) {
    goto LABEL_71;
  }
  BOOL v46 = (id *)(v45 + 64);
  unint64_t v47 = regionMap->var5 - ((uint64_t)(v45 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v47) {
    goto LABEL_68;
  }
  while (2)
  {
    unint64_t v48 = v47 >> 1;
    unint64_t v49 = &v46[8 * (v47 >> 1)];
    if (*((void *)*v49 + 1) > v9)
    {
LABEL_49:
      BOOL v50 = v47 > 1;
      unint64_t v47 = v48;
      if (!v50)
      {
        unint64_t v47 = 0LL;
        goto LABEL_68;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v49 + 2) + *((void *)*v49 + 1) <= v9)
  {
    BOOL v46 = v49 + 8;
    unint64_t v48 = --v47 >> 1;
    goto LABEL_49;
  }

  unint64_t v63 = v45;
  int v64 = [*v49 isSpecialPhysFootprintRegion];
  unint64_t v45 = v63;
  if (v64) {
    unint64_t v47 = 0LL;
  }
  else {
    unint64_t v47 = (unint64_t)v49;
  }
LABEL_68:
  if (v47) {
    unint64_t v45 = v47;
  }
  uint64_t v24 = (_VMURegionNode *)v45;
LABEL_71:
  *unsigned int v21 = ((v45 - (unint64_t)var4) >> 6) + 1;
LABEL_15:
  unsigned int v25 = v24->var3;
  if (v25)
  {
    var1 = v24->var1;
    unint64_t var0 = regionMap->var0;
    uint64_t var2 = v24->var2;
    uint64_t v29 = &regionMap->var0[var2];
    if (var1)
    {
      if (v29->var0 > v9) {
        return;
      }
      uint64_t v30 = &var0[v25 - 1 + var2];
      if (((*((void *)v30 + 1) >> 5) & 0xFFFFFFFFFLL) + v30->var0 <= v9) {
        return;
      }
      unsigned int v31 = &var1[(v9 - (v29->var0 & -*MEMORY[0x1895FD590])) >> *v15];
      uint64_t v32 = *v31;
      p_unint64_t var0 = &var0[v32].var0;
      if (*p_var0 > v9) {
        return;
      }
      uint64_t v34 = v31[1];
      if (v34 < regionMap->var1)
      {
        BOOL v35 = &var0[v34].var0;
        unint64_t v36 = *v35;
        if (*v35 <= v9)
        {
LABEL_51:
          unint64_t v51 = v35[1];
          if ((v51 & 7) - 2 < 3) {
            return;
          }
          int64_t v52 = (char *)v35 - (char *)var0;
          unint64_t v53 = (unint64_t)((char *)v35 - (char *)var0) >> 4;
          unint64_t v54 = v9 - v36;
          unint64_t v55 = regionMap->var2;
          if (v54 >= v55)
          {
            if (((v51 >> 5) & 0xFFFFFFFFFLL) - v54 > v55 || (_DWORD)v53 == -1) {
              return;
            }
          }

          else if ((_DWORD)v53 == -1)
          {
            return;
          }

          unsigned int v56 = objc_alloc(&OBJC_CLASS___VMUClassInfo);
          uint64_t v57 = (void *)NSString;
          uint64_t Path = CSSymbolOwnerGetPath();
          if (Path) {
            int v59 = (const char *)Path;
          }
          else {
            int v59 = "";
          }
          [v57 stringWithUTF8String:v59];
          int v60 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v61 = -[VMUClassInfo initWithClassName:binaryPath:type:]( v56,  "initWithClassName:binaryPath:type:",  @"llvm::DenseMap<TypeNameCacheKey, std::pair<const char *, size_t>>",  v60,  2LL);

          *(void *)((char *)self->_blocks + (v52 & 0xFFFFFFFF0LL) + 8) = *(void *)((char *)self->_blocks
                                                                                     + (v52 & 0xFFFFFFFF0LL)
                                                                                     + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)-[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v61) << 41);

          return;
        }
      }

      unsigned int v37 = v34 - v32;
      if (v37)
      {
        do
        {
          uint64_t v38 = v37 >> 1;
          BOOL v35 = &p_var0[2 * v38];
          unint64_t v36 = *v35;
          if (*v35 <= v9)
          {
            if (((p_var0[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v36 > v9) {
              goto LABEL_51;
            }
            p_unint64_t var0 = v35 + 2;
            LODWORD(v38) = --v37 >> 1;
          }

          BOOL v39 = v37 >= 2;
          unsigned int v37 = v38;
        }

        while (v39);
      }
    }

    else
    {
      do
      {
        uint64_t v40 = v25 >> 1;
        BOOL v35 = &v29[v40].var0;
        unint64_t v36 = *v35;
        if (*v35 <= v9)
        {
          if (((*((void *)&v29[v40] + 1) >> 5) & 0xFFFFFFFFFLL) + v36 > v9) {
            goto LABEL_51;
          }
          uint64_t v29 = (_VMUBlockNode *)(v35 + 2);
          LODWORD(v40) = --v25 >> 1;
        }

        BOOL v39 = v25 >= 2;
        unsigned int v25 = v40;
      }

      while (v39);
    }
  }

- (void)_identifyNonObjectsPointedToByTypedIvars
{
  unsigned int classInfosCount = self->_classInfosCount;
  unint64_t v4 = calloc(1uLL, ((classInfosCount + 8) >> 3) + 4);
  *unint64_t v4 = classInfosCount + 1;
  uint64_t v5 = MEMORY[0x1895F87A8];
  classInfoIndexer = self->_classInfoIndexer;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke;
  v12[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  v12[4] = v4;
  -[VMUClassInfoMap enumerateInfosWithBlock:](classInfoIndexer, "enumerateInfosWithBlock:", v12);
  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:1282];
  v8[0] = v5;
  v8[1] = 3221225472LL;
  v8[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2;
  v8[3] = &unk_189DFD250;
  unsigned int v11 = classInfosCount;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v4;
  v8[4] = self;
  id v7 = v9;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v8);
  free(v4);
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  unsigned int a4)
{
  id v9 = a3;
  if ([v9 infoType] != 1
    && [v9 infoType] != 128
    && [v9 infoType] != 8
    || ([v9 className],
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
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

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 8LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v2 + 80) + v6) >> 41;
      if ((*(void *)(*(void *)(v2 + 80) + v6) & 7LL) == 1
        && (_DWORD)v8 != 0
        && *(_DWORD *)(a1 + 56) > v8)
      {
        BOOL v10 = *(_DWORD **)(a1 + 48);
        if (*v10 <= v8
          || ((*((unsigned __int8 *)v10 + (v8 >> 3) + 4) >> (v8 & 7)) & 1) == 0)
        {
          v13[0] = v7;
          v13[1] = 3221225472LL;
          v13[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3;
          v13[3] = &unk_189DFD228;
          void v13[4] = v2;
          int v16 = v8;
          id v11 = *(id *)(a1 + 40);
          uint64_t v12 = *(void *)(a1 + 48);
          id v14 = v11;
          uint64_t v15 = v12;
          (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1LL, v13);

          uint64_t v2 = *(void *)(a1 + 32);
        }
      }

      ++v5;
      v6 += 16LL;
    }

    while (v5 < *(unsigned int *)(v2 + 88));
  }

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3( uint64_t a1,  uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x186E32E40]();
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 256LL) + 8LL * *(unsigned int *)(a1 + 56));
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4;
  v10[3] = &unk_189DFD200;
  unint64_t v13 = &v15;
  uint64_t v14 = a2;
  uint64_t v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v7 = v5;
  id v12 = v7;
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v7, (uint64_t)v10);
  if (!*((_BYTE *)v16 + 24))
  {
    uint64_t v8 = *(_DWORD **)(a1 + 48);
    unint64_t v9 = *(unsigned int *)(a1 + 56);
  }

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v4);
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4( uint64_t a1,  void *a2,  void *a3,  uint64_t a4)
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
  id v11 = *(uint64_t **)(*(void *)(a1 + 32) + 112LL);
  unint64_t v13 = v11[6];
  unint64_t v12 = v11[7];
  unint64_t v14 = v12 - v13;
  BOOL v15 = v12 < v13;
  if (v9 - v13 >= v14 || v15) {
    return;
  }
  int v16 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v17 = v9 >> *MEMORY[0x1895FD580];
  if (v17)
  {
    char v18 = (unsigned int *)v11[3];
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
  int v22 = (_DWORD *)(v20 + 64);
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
  int v16 = (_DWORD *)MEMORY[0x1895FD580];
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
    BOOL v50 = &v47[8 * (v48 >> 1)];
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
  int v16 = (_DWORD *)MEMORY[0x1895FD580];
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
      uint64_t v32 = (unsigned int *)(v27 + 4 * ((v9 - (*v30 & -*MEMORY[0x1895FD590])) >> *v16));
      uint64_t v33 = *v32;
      uint64_t v34 = (unint64_t *)(v28 + 16 * v33);
      if (*v34 > v9) {
        return;
      }
      uint64_t v35 = v32[1];
      if (v35 < *((_DWORD *)v11 + 2)
        && (unint64_t v36 = (unint64_t *)(v28 + 16 * v35), v37 = *v36, *v36 <= v9))
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

        uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 80LL);
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
              unint64_t v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
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
                  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
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
                unint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

                unint64_t v71 = (void *)NSString;
                uint64_t v72 = [*(id *)(a1 + 48) displayName];
                uint64_t v73 = (void *)v72;
                __int16 v74 = @"malloc";
                if (v70) {
                  __int16 v74 = v70;
                }
                [v71 stringWithFormat:@"%@.%@ (%@)", v72, v79, v74];
                unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue();

                [*(id *)(a1 + 48) binaryPath];
                __int16 v76 = (void *)objc_claimAutoreleasedReturnValue();
                +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v75,  v76,  v80);
                unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();

                unint64_t v78 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v77];
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
            unint64_t v36 = &v34[2 * v39];
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
        unint64_t v36 = &v30[2 * v41];
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

- (void)_identifyNonObjectsPointingToSwiftMetadata
{
  BOOL v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  if ((CSIsNull() & 1) != 0 || (CSSymbolOwnerGetSymbolWithMangledName(), CSIsNull()))
  {
    -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t Range = CSSymbolGetRange();
    uint64_t v4 = v6;
    -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
    if (Range) {
      goto LABEL_10;
    }
  }

  if (!self->_swiftMetadataMaxBlockIndex) {
    return;
  }
  uint64_t Range = 0LL;
LABEL_10:
  +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"Swift HeapGenericLocalVariable",  @"/usr/lib/swift/libswiftCore.dylib",  16LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_swiftHeapGenericLocalVariableClassInfoIndex = -[VMUClassInfoMap indexForClassInfo:]( self->_classInfoIndexer,  "indexForClassInfo:",  v7);
  unsigned int swiftMetadataMinBlockIndex = self->_swiftMetadataMinBlockIndex;
  unsigned int swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
  if (swiftMetadataMinBlockIndex <= swiftMetadataMaxBlockIndex)
  {
    id v11 = 0LL;
    unsigned int v10 = 0;
    uint64_t v12 = 0LL;
    do
    {
      blocks = self->_blocks;
      uint64_t v14 = swiftMetadataMinBlockIndex;
      unint64_t v15 = *((void *)&blocks[swiftMetadataMinBlockIndex] + 1);
      if ((v15 & 7) == 1 && self->_swiftMetadataClassInfoIndex == v15 >> 41)
      {
        if (v12 <= v10)
        {
          LODWORD(v17) = 2 * v12;
          else {
            uint64_t v17 = v17;
          }
          do
          {
            uint64_t v16 = v17;
            uint64_t v17 = (2 * v17);
          }

          while (v16 < v10);
          char v18 = (_VMUBlockNode *)realloc(v11, 16LL * v16);
          if (!v18)
          {
            NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "swiftMetadataBlocks",  v12,  v16);
            abort();
          }

          id v11 = v18;
          bzero(&v18[v12], 16LL * (v16 - v12));
          blocks = self->_blocks;
        }

        else
        {
          uint64_t v16 = v12;
        }

        v11[v10++] = blocks[v14];
        unsigned int swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
        uint64_t v12 = v16;
      }

      unsigned int swiftMetadataMinBlockIndex = v14 + 1;
    }

    while ((int)v14 + 1 <= swiftMetadataMaxBlockIndex);
  }

  else
  {
    unsigned int v10 = 0;
    id v11 = 0LL;
  }

  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke;
  v19[3] = &unk_189DFD2A0;
  v19[4] = self;
  v19[5] = Range;
  v19[6] = v4;
  v19[7] = v11;
  unsigned int v20 = v10;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v19);
  if (v11) {
    free(v11);
  }
}

uint64_t __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    uint64_t v4 = result;
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    uint64_t v7 = (__int128 *)(result + 40);
    uint64_t v8 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v9 = *(void *)(v2 + 80) + v5;
      if ((*(void *)(v9 + 8) & 0xFFFFFE0000000007LL) == 1)
      {
        v11[0] = v8;
        v11[1] = 3221225472LL;
        v11[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2;
        v11[3] = &unk_189DFD278;
        __int128 v12 = *v7;
        uint64_t v10 = *(void *)(v4 + 56);
        v11[4] = v2;
        uint64_t v13 = v10;
        uint64_t v14 = v9;
        int v15 = *(_DWORD *)(v4 + 64);
        uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v6, 1LL, v11);
        uint64_t v2 = *(void *)(v4 + 32);
      }

      ++v6;
      v5 += 16LL;
    }

    while (v6 < *(unsigned int *)(v2 + 88));
  }

  return result;
}

void __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2( uint64_t a1,  uint64_t *a2)
{
  unint64_t v3 = -[VMUTask ptrauthStripDataPointer:](*(void *)(*(void *)(a1 + 32) + 8LL), *a2);
  if (HIDWORD(v3)) {
    BOOL v4 = (v3 & 7) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    unint64_t v5 = v3;
    if (v3 - *(void *)(a1 + 40) >= *(void *)(a1 + 48))
    {
      unsigned int v8 = *(_DWORD *)(a1 + 72);
      if (v8)
      {
        uint64_t v9 = *(void **)(a1 + 56);
        do
        {
          uint64_t v10 = v8 >> 1;
          id v11 = &v9[2 * v10];
          if (*v11 <= v3)
          {
            if (((v9[2 * v10 + 1] >> 5) & 0xFFFFFFFFFLL) + *v11 > v3) {
              goto LABEL_7;
            }
            uint64_t v9 = v11 + 2;
            LODWORD(v10) = --v8 >> 1;
          }

          BOOL v12 = v8 >= 2;
          unsigned int v8 = v10;
        }

        while (v12);
      }
    }

    else
    {
LABEL_7:
      [*(id *)(*(void *)(a1 + 32) + 64) memoryReader];
      uint64_t v13 = (uint64_t (**)(id, void, uint64_t))objc_claimAutoreleasedReturnValue();
      unint64_t v6 = (uint64_t *)v13[2](v13, v5, 8LL);
      if (v6)
      {
        uint64_t v7 = *v6;

        if (v7 == 1280) {
          *(void *)(*(void *)(a1 + 64) + 8LL) = *(void *)(*(void *)(a1 + 64) + 8LL) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(*(void *)(a1 + 32) + 344LL) << 41);
        }
      }

      else
      {
      }
    }
  }

- (id)_recursivelyIdentifySwiftAsyncTaskSlabs:(unint64_t)a3 containerRange:(_VMURange)a4 remoteBlock:(unint64_t)a5 mappedBlock:(unint64_t)a6 asyncTaskSlabMetadataIsa:(unint64_t)a7 nestingLevel:(unsigned int)a8
{
  unint64_t length = a4.length;
  unint64_t location = a4.location;
  vmu_reflection_interop_asyncTaskSlabAllocations( *(void *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"),  v38);
  if (!v38[0])
  {
    uint64_t v15 = v39;
    if (!VMURangeContainsRange(location, length, a3, v39))
    {
      goto LABEL_31;
    }

    unint64_t v37 = self;
    uint64_t v16 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
    uint64_t v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v16,  "initWithName:type:scan:offset:size:",  @"slab",  0LL,  0LL,  (a3 - location),  v39);
    char v18 = (void *)v17;
    if (v40)
    {
      uint64_t v19 = 0LL;
      uint64_t v32 = v15;
      unint64_t v33 = a3;
      uint64_t v34 = (void *)v17;
      while (2)
      {
        unsigned int v20 = (void *)MEMORY[0x186E32E40]();
        uint64_t v21 = v41 + 16 * v19;
        unint64_t v22 = *(void *)v21;
        uint64_t v23 = *(unsigned int *)(v21 + 8);
        if (!VMURangeContainsRange(a3, v15, *(void *)v21, v23))
        {
          objc_autoreleasePoolPop(v20);
          id v29 = 0LL;
          goto LABEL_35;
        }

        uint64_t v35 = v19;
        context = v20;
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        {
          id v24 = VMURangeDescription(v22, v23);
          _debugSwiftAsyncPrintf(a8 + 1, "Chunk %s\n", (const char *)[v24 UTF8String]);
        }

        unint64_t v25 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"chunk",  0LL,  1LL,  (v22 - a3),  v23);
        [v18 addSubField:v25];
        unint64_t v26 = ((v22 + 7) & 0xFFFFFFFFFFFFFFF8LL) - a5;
        while (v26 <= v22 - a5 + v23 - 8)
        {
          if (!VMURangeContainsRange(v22, v23, v26 + a5, 8LL)) {
            goto LABEL_33;
          }
          if (*(void *)(v26 + a6) == a7)
          {
            LODWORD(v31) = a8 + 2;
            uint64_t v27 = -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:]( v37,  "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:",  v26 + a5,  v22,  v23,  a5,  a6,  a7,  v31);
            if (!v27)
            {
LABEL_33:

              objc_autoreleasePoolPop(context);
              id v29 = 0LL;
              char v18 = v34;
              goto LABEL_35;
            }

            uint64_t v28 = (void *)v27;
            -[VMUMutableFieldInfo addSubField:](v25, "addSubField:", v27);
            unint64_t v26 = ((v26 + a5 + [v28 size] + 7) & 0xFFFFFFFFFFFFFFF8) - a5;
          }

          else
          {
            v26 += 8LL;
          }
        }

        objc_autoreleasePoolPop(context);
        char v18 = v34;
        uint64_t v19 = v35 + 1;
        uint64_t v15 = v32;
        a3 = v33;
        break;
      }
    }

    id v29 = v18;
LABEL_35:

    return v29;
  }

- (void)_identifyAttributeGraphAllocations
{
  BOOL v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  if ((CSIsNull() & 1) == 0)
  {
    -[NSMutableArray indexesOfObjectsPassingTest:]( self->_zoneNames,  "indexesOfObjectsPassingTest:",  &__block_literal_global_181);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if ([v22 count] && self->_regionsCount)
    {
      unint64_t v4 = 0LL;
      unsigned int v5 = -1;
      do
      {
        regions = self->_regions;
        uint64_t v7 = (unsigned int *)regions[v4].var0;
        if ([v22 containsIndex:v7[37]])
        {
          unsigned int v8 = &regions[v4];
          unsigned int var2 = v8->var2;
          p_unsigned int var2 = &v8->var2;
          uint64_t v9 = var2;
          if (*((void *)v7 + 17) + (unint64_t)var2 > var2)
          {
            unsigned int v12 = v9 + 1;
            unsigned int v13 = v9;
            do
            {
              uint64_t v14 = &self->_blocks[v9];
              unint64_t v17 = *((void *)v14 + 1);
              uint64_t v16 = (unint64_t *)v14 + 1;
              unint64_t v15 = v17;
              if (!(v17 >> 41))
              {
                if (v5 == -1)
                {
                  uint64_t Path = CSSymbolOwnerGetPath();
                  if (Path)
                  {
                    [NSString stringWithUTF8String:Path];
                    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }

                  else
                  {
                    uint64_t v19 = &stru_189E010C8;
                  }

                  unsigned int v20 = -[VMUClassInfo initWithClassName:binaryPath:type:]( objc_alloc(&OBJC_CLASS___VMUMutableClassInfo),  "initWithClassName:binaryPath:type:",  @"AttributeGraph Data",  v19,  8LL);
                  -[VMUMutableClassInfo setDefaultScanType:](v20, "setDefaultScanType:", 1LL);
                  unsigned int v5 = -[VMUTaskMemoryScanner _indexForClassInfo:](self, "_indexForClassInfo:", v20);

                  unint64_t v15 = *v16;
                }

                unint64_t *v16 = v15 & 0x1FFFFFFFFFFLL | ((unint64_t)v5 << 41);
                unsigned int v13 = *p_var2;
              }

              uint64_t v9 = v12;
            }

            while (*((void *)v7 + 17) + (unint64_t)v13 > v12++);
          }
        }

        else if ([*((id *)v7 + 4) isEqualToString:@"AttributeGraph Data"])
        {
          self->_attributeGraphVMRegionBlockIndex = regions[v4].var2;
        }

        ++v4;
      }

      while (v4 < self->_regionsCount);
    }
  }

uint64_t __58__VMUTaskMemoryScanner__identifyAttributeGraphAllocations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"AttributeGraph graph data"];
}

- (void)_identifySwiftAsyncTaskSlabs
{
  v37[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[VMUObjectIdentifier swiftConcurrencyDebugAsyncTaskMetadataIsa]( self->_objectIdentifier,  "swiftConcurrencyDebugAsyncTaskMetadataIsa");
  unint64_t v4 = -[VMUObjectIdentifier swiftConcurrencyDebugAsyncTaskSlabMetadataIsa]( self->_objectIdentifier,  "swiftConcurrencyDebugAsyncTaskSlabMetadataIsa");
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
      _debugSwiftAsyncPrintf( 0,  "One or both of the AsyncTask and AsyncTask Slab metadata isas isn't known, so skipping precise scanning of Async Tasks and AsyncTask Slabs.\n");
    }
  }

  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v3);
    unint64_t v32 = v6;
    uint64_t v8 = -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v6);
    unint64_t v33 = (void *)v7;
    unsigned int v9 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v7);
    uint64_t v34 = (void *)v8;
    unsigned int v10 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v8);
    unint64_t blocksCount = self->_blocksCount;
    if ((_DWORD)blocksCount)
    {
      unsigned int v12 = v10;
      uint64_t v13 = 0LL;
      unint64_t v14 = 0LL;
      while (1)
      {
        unint64_t v15 = &self->_blocks[v13];
        unint64_t v16 = *((void *)v15 + 1);
        if ((v16 & 7) != 1) {
          goto LABEL_49;
        }
        if (v9 != v16 >> 41 && v12 != v16 >> 41) {
          goto LABEL_49;
        }
        unint64_t var0 = (const void *)v15->var0;
        uint64_t v19 = (v16 >> 5) & 0xFFFFFFFFFLL;
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        {
          unsigned int v20 = "AsyncTask Slab";
          if (v9 == *((void *)v15 + 1) >> 41) {
            unsigned int v20 = "AsyncTask";
          }
          _debugSwiftAsyncPrintf(0, "Block %p [%llu] is %s\n", var0, (v16 >> 5) & 0xFFFFFFFFFLL, v20);
        }

        if (v9 != *((void *)v15 + 1) >> 41) {
          break;
        }
        uint64_t v21 = vmu_swift_reflection_asyncTaskSlabPointer(*(void *)-[VMUObjectIdentifier swiftMirror]( self->_objectIdentifier,  "swiftMirror"));
        if (!v21)
        {
          unint64_t v25 = (const void *)v22;
          BOOL v29 = VMURangeContainsRange((unint64_t)var0, v19, v22, 8LL);
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
          {
            uint64_t v30 = " not";
            if (v29) {
              uint64_t v30 = "";
            }
            _debugSwiftAsyncPrintf(1, "Found first slab at %p,%s in same block\n", v25, v30);
          }

          if (!v29) {
            goto LABEL_48;
          }
          id v24 = (void *)[v33 mutableCopy];
          goto LABEL_31;
        }

        uint64_t v23 = v21;
LABEL_48:
        unint64_t blocksCount = self->_blocksCount;
LABEL_49:
        ++v14;
        ++v13;
        if (v14 >= blocksCount) {
          goto LABEL_50;
        }
      }

      id v24 = (void *)[v34 mutableCopy];
      [v24 setDefaultScanType:0];
      unint64_t v25 = var0;
LABEL_31:
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      if (!-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self->_memoryCache,  "mapAddress:size:returnedAddress:returnedSize:",  var0,  v19,  &v36,  &v35))
      {
        LODWORD(v31) = 1;
        uint64_t v26 = -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:]( self,  "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:",  v25,  var0,  v19,  var0,  v36,  v32,  v31);
        uint64_t v27 = (void *)v26;
        if (v26)
        {
          v37[0] = v26;
          [MEMORY[0x189603F18] arrayWithObjects:v37 count:1];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 setFields:v28];

          *((void *)v15 + 1) = *((void *)v15 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)-[VMUClassInfoMap addClassInfo:forAddress:]( self->_classInfoIndexer,  "addClassInfo:forAddress:",  v24,  0LL) << 41);
        }

        else
        {
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
            _debugSwiftAsyncPrintf( 1,  "Error getting info for slab, scanning block %p [%llu] conservatively\n",  var0,  v19);
          }
        }
      }

      goto LABEL_48;
    }

- (void)_identifyNonObjectsUsingStackBacktrace
{
  if (!-[VMUTask isCore](self->_task, "isCore"))
  {
    unint64_t v3 = objc_alloc(&OBJC_CLASS___VMUTaskStackLogReader);
    uint64_t v4 = -[VMUTask taskPort](self->_task, "taskPort");
    uint64_t v5 = -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
    uint64_t v8 = -[VMUTaskStackLogReader initWithTask:symbolicator:](v3, "initWithTask:symbolicator:", v4, v5, v6);
    classInfoIndexer = self->_classInfoIndexer;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke;
    v9[3] = &unk_189DFD328;
    v9[4] = self;
    -[VMUStackLogReaderBase identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:]( v8,  "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:",  self,  classInfoIndexer,  v9);
  }

uint64_t __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke( uint64_t result,  unsigned int a2,  unsigned int a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 80LL) + 16LL * a2;
  *(void *)(v3 + 8) = *(void *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (void)_findMarkedAbandonedBlocks
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0LL;
  }

  if (!self->_abandonedMarkingEnabled || !self->_regionsCount) {
    return;
  }
  unint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  unsigned int v6 = 0;
  uint64_t v7 = 0LL;
  do
  {
    regions = self->_regions;
    unsigned int v9 = &regions[v4];
    memoryCache = self->_memoryCache;
    unsigned int regionsCount = self->_regionsCount;
    unsigned int v12 = self->_task;
    uint64_t v13 = memoryCache;
    if (v9->var7) {
      goto LABEL_8;
    }
    int v65 = v13;
    if ([v9->var0 isSpecialPhysFootprintRegion])
    {

      goto LABEL_51;
    }

    int v38 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v65,  "mapAddress:size:returnedAddress:returnedSize:",  *((void *)v9->var0 + 1),  *((void *)v9->var0 + 2),  v66,  &v71);
    if (!v38)
    {
      uint64_t v13 = v65;
      unint64_t v49 = v71;
      v9->unint64_t var7 = (void *)v66[0];
      BOOL v50 = &regions[v4];
      v50->unint64_t var6 = v49;
      v50->var8 = v9;
LABEL_8:

      unint64_t v14 = self->_regions;
      unint64_t var7 = (unint64_t)v14[v4].var7;
      if (var7)
      {
        unint64_t v16 = (unint64_t *)MEMORY[0x1895FD590];
        unint64_t v17 = *MEMORY[0x1895FD590];
        uint64_t v18 = v7;
        do
        {
          unint64_t v19 = v17 + var7;
          if (*(void *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            unsigned int v20 = *(_DWORD *)(var7 + 20);
            unsigned int v21 = v6 + v20 - 1;
            if (v18 <= v21)
            {
              uint64_t v22 = v17 >> 3;
              else {
                uint64_t v22 = v22;
              }
              do
              {
                uint64_t v7 = v22;
                uint64_t v22 = (2 * v22);
              }

              while (v7 < v21);
              uint64_t v23 = realloc(v5, 8LL * v7);
              if (!v23)
              {
                NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "allMarkedAddresses",  v18,  v7);
                abort();
              }

              uint64_t v5 = v23;
              unsigned int v20 = *(_DWORD *)(var7 + 20);
            }

            else
            {
              uint64_t v7 = v18;
            }

            unint64_t v24 = *(unsigned int *)(var7 + 12) + var7;
            uint64_t v25 = v20;
            if (v20)
            {
              uint64_t v26 = (uint64_t *)(*(unsigned int *)(var7 + 12) + var7);
              uint64_t v27 = v25;
              do
              {
                uint64_t v29 = *v26++;
                uint64_t v28 = v29;
                if (v29) {
                  *((void *)v5 + v6++) = v28;
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
            uint64_t v7 = v18;
          }

          BOOL v31 = (void *)v19 >= (char *)v14[v4].var7 + v14[v4].var6 || v19 == 0;
          uint64_t v18 = v7;
          unint64_t var7 = v19;
        }

        while (!v31);
      }

      unint64_t v32 = self->_memoryCache;
      unint64_t v33 = self->_objectIdentifier;
      uint64_t v34 = v32;
      uint64_t v35 = v34;
      uint64_t v36 = &v14[v4];
      if (v36->var7)
      {
        if (v36->var8 == v36)
        {
          v66[0] = MEMORY[0x1895F87A8];
          v66[1] = 3221225472LL;
          v66[2] = ___unmapRegion_block_invoke;
          v66[3] = &unk_189DFD5E8;
          uint64_t v67 = v34;
          id v69 = &v14[v4];
          int v68 = v33;
          unint64_t v70 = v14;
          unint64_t v48 = (void (**)(void))MEMORY[0x186E33044](v66);
          v48[2]();
        }

        else
        {
          unint64_t v37 = &v14[v4];
          v37->unint64_t var6 = 0LL;
          v37->unint64_t var7 = 0LL;
          v37->var8 = 0LL;
        }
      }

      goto LABEL_51;
    }

    int v64 = v38;
    unsigned int v39 = v12;
    if ((*((_DWORD *)v9->var0 + 13) & 3u) - 1 >= 2)
    {
      BOOL v40 = task_exists(v12);
      if (v4 != regionsCount - 1 && v40)
      {
        unint64_t v63 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v62 = [v9->var0 address];
        uint64_t v61 = *((void *)v9->var0 + 2) + *((void *)v9->var0 + 1);
        uint64_t v41 = *((unsigned int *)v9->var0 + 6);
        unint64_t v42 = vm_prot_strings[v41];
        id v43 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)v9->var0 + 232),  *((unsigned __int8 *)v9->var0 + 104),  *((unsigned __int8 *)v9->var0 + 50),  v41,  *((unsigned __int8 *)v9->var0 + 49));
        unint64_t v44 = (const char *)[v43 UTF8String];
        uint64_t v45 = *((void *)v9->var0 + 2) >> *MEMORY[0x1895FD580];
        unint64_t v46 = "pages";
        if (v45 == 1) {
          unint64_t v46 = "page";
        }
        unint64_t v47 = " [root]";
        if (regions[v4].var4 == regions[v4].var5) {
          unint64_t v47 = "";
        }
        uint64_t v60 = v42;
        unsigned int v39 = v12;
        fprintf( v63,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v62,  v61,  v60,  v44,  v45,  v46,  v47,  v64);
      }
    }

LABEL_51:
    ++v4;
  }

  while (v4 < self->_regionsCount);
  if (v5)
  {
    unsigned int blocksCount = self->_blocksCount;
    unint64_t v52 = calloc(1uLL, ((blocksCount + 7) >> 3) + 4);
    *unint64_t v52 = blocksCount;
    self->_userMarkedAbandoned = v52;
    mergesort_b(v5, v6, 8uLL, &__block_literal_global_200);
    if (v6)
    {
      uint64_t v53 = 0LL;
      unint64_t v54 = 0LL;
      do
      {
        unint64_t v55 = self->_blocksCount;
        if (v54 >= v55) {
          break;
        }
        blocks = self->_blocks;
        uint64_t v57 = (void *)&blocks[v54] + 1;
        while (1)
        {
          if ((*v57 & 7LL) == 1)
          {
            unint64_t v58 = *((void *)v5 + v53);
            if (*(v57 - 1) >= v58) {
              break;
            }
          }

          ++v54;
          v57 += 2;
          if (v55 == v54) {
            goto LABEL_67;
          }
        }

        unint64_t v55 = v54;
        if (blocks[v54].var0 != v58)
        {
LABEL_67:
          unint64_t v54 = v55;
          goto LABEL_68;
        }

        uint64_t v59 = self->_userMarkedAbandoned;
        unint64_t v54 = v54;
LABEL_68:
        ++v53;
      }

      while (v53 != v6);
    }

    free(v5);
  }

uint64_t __50__VMUTaskMemoryScanner__findMarkedAbandonedBlocks__block_invoke( uint64_t a1,  void *a2,  void *a3)
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

- (uint64_t)getCachedScanInfoForClassWithIsa:(void *)a3 classInfo:(_BYTE *)a4 returnedShouldApplySwiftPointerMaskingToIsa:
{
  if (result)
  {
    if (a2 && a3)
    {
      uint64_t v7 = result;
      if (!*(void *)(*(void *)(result + 280) + 8LL * a2))
      {
        int v8 = *(_DWORD *)(result + 344);
        unsigned int v9 = [a3 infoType] - 8;
        BOOL v10 = v9 <= 0x38 && ((1LL << v9) & 0x100000001000001LL) != 0 || v8 == a2;
        id v11 = *(unsigned int **)(v7 + 288);
        if (*v11 > a2)
        {
          int v12 = 1 << (a2 & 7);
          uint64_t v13 = (char *)v11 + (a2 >> 3);
          char v14 = v13[4];
          char v15 = v14 | v12;
          char v16 = v14 & ~(_BYTE)v12;
          if (v10) {
            char v17 = v15;
          }
          else {
            char v17 = v16;
          }
          void v13[4] = v17;
        }

        uint64_t v18 = [a3 instanceSize];
        v34[0] = 0LL;
        v34[1] = v34;
        v34[2] = 0x2020000000LL;
        unsigned int v35 = (v18 >> 3) + 2;
        *(void *)(*(void *)(v7 + 280) + 8LL * a2) = malloc(4 * v35);
        uint64_t v30 = 0LL;
        BOOL v31 = &v30;
        uint64_t v32 = 0x2020000000LL;
        int v33 = 0;
        v28[0] = MEMORY[0x1895F87A8];
        v28[1] = 3221225472LL;
        v28[2] = __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke;
        v28[3] = &unk_189DFD370;
        void v28[5] = &v30;
        v28[6] = v34;
        v28[4] = v7;
        unsigned int v29 = a2;
        [a3 enumerateScanningLocationsForSize:v18 withBlock:v28];
        int v19 = [a3 defaultScanType];
        uint64_t v20 = *(void *)(*(void *)(v7 + 280) + 8LL * a2);
        uint64_t v21 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v21 + 1;
        char v22 = [a3 defaultScanType];
        int v23 = (v18 + 7) & 0xFFFFF8;
        if (v19 == 1) {
          int v23 = v18;
        }
        *(_DWORD *)(v20 + 4 * v21) = v23 & 0xFFFFFF | ((v22 & 0x7F) << 24);
        uint64_t v24 = *(void *)(*(void *)(v7 + 280) + 8LL * a2);
        uint64_t v25 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v25 + 1;
        *(_DWORD *)(v24 + 4 * v25) = (([a3 defaultScanType] & 0x7F) << 24) | 0xFFFFFF;
        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(v34, 8);
      }

      if (a4)
      {
        uint64_t v26 = *(unsigned int **)(v7 + 288);
        if (*v26 <= a2) {
          LOBYTE(v27) = 0;
        }
        else {
          int v27 = (*((unsigned __int8 *)v26 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
        }
        *a4 = v27;
      }

      return *(void *)(*(void *)(v7 + 280) + 8LL * a2);
    }

    else
    {
      uint64_t result = 0LL;
      if (a4) {
        *a4 = 0;
      }
    }
  }

  return result;
}

void __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke( uint64_t a1,  void *a2,  int a3,  char a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v9 = *(_DWORD *)(v8 + 24);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  unsigned int v11 = *(_DWORD *)(v10 + 24);
  if (v9 + 2 >= v11)
  {
    *(_DWORD *)(v10 + 24) = 2 * v11;
    uint64_t v13 = realloc( *(void **)(*(void *)(*(void *)(a1 + 32) + 280LL) + 8LL * *(unsigned int *)(a1 + 56)),  4LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
    uint64_t v12 = *(unsigned int *)(a1 + 56);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 280LL) + 8 * v12) = v13;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned int v9 = *(_DWORD *)(v8 + 24);
  }

  else
  {
    uint64_t v12 = *(unsigned int *)(a1 + 56);
  }

  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 280LL) + 8 * v12);
  *(_DWORD *)(v8 + 24) = v9 + 1;
  uint64_t v15 = v9;
  int v16 = a3 & 0xFFFFFF | ((a4 & 0x7F) << 24);
  if (a2)
  {
    [a2 typeName];
    char v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      int v19 = v17;
      [a2 typeName];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v14 + 4 * v15) = v16 | (([v18 length] == 0) << 31);

      char v17 = v19;
    }

    else
    {
      *(_DWORD *)(v14 + 4 * v15) = v16;
    }
  }

  else
  {
    *(_DWORD *)(v14 + 4LL * v9) = v16;
  }

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(unsigned int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  if (a1)
  {
    [*(id *)(a1 + 64) swiftRuntimeInfoStableABI];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }

    else
    {
      [*(id *)(a1 + 64) swiftRuntimeInfoPreABI];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    v215 = v17;

    int v218 = [*(id *)(a1 + 64) hasSwiftContent];
    if (*(_DWORD *)(a1 + 328) == a6 || *(_DWORD *)(a1 + 332) == a6 || *(_DWORD *)(a1 + 336) == a6)
    {
      BOOL v18 = 1;
      if (!a6) {
        goto LABEL_13;
      }
    }

    else
    {
      BOOL v18 = *(_DWORD *)(a1 + 340) == a6;
      if (!a6) {
        goto LABEL_13;
      }
    }

    if (*(_BYTE *)(a1 + 360)) {
      char v19 = v18;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      unint64_t v73 = a5 - 8;
      if (a5 < 8) {
        goto LABEL_193;
      }
      id v74 = *(id *)(*(void *)(a1 + 256) + 8LL * a6);
      char v232 = 0;
      id v226 = v74;
      uint64_t v75 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:]( a1,  a6,  v74,  &v232);
      unsigned int v76 = 0;
      unint64_t v77 = 0LL;
      uint64_t v228 = a2 + a3;
LABEL_88:
      unsigned int v78 = *(_DWORD *)(v75 + 4LL * v76);
      uint64_t v79 = HIBYTE(v78) & 0x7F;
      uint64_t v80 = *(void *)&v78 & 0xFFFFFFLL;
      unint64_t v81 = v77 + 8;
      if ((_DWORD)v79 == 1) {
        unint64_t v81 = v77 + 1;
      }
      if ((_DWORD)v80 == 0xFFFFFF) {
        unint64_t v77 = v81;
      }
      else {
        unint64_t v77 = v80;
      }
      if ((_DWORD)v80 == 0xFFFFFF) {
        unsigned int v82 = v76;
      }
      else {
        unsigned int v82 = v76 + 1;
      }
      if (((*(_DWORD *)(a1 + 376) >> HIBYTE(*(_DWORD *)(v75 + 4LL * v76))) & 1) == 0 || v77 > v73) {
        goto LABEL_116;
      }
      unint64_t v83 = *(void *)(v228 + v77);
      if ((_DWORD)v79 == 3)
      {
        v83 &= ~1uLL;
        uint64_t v79 = (*(void *)(v228 + v77) & 1LL) != 0 ? 2LL : 3LL;
      }

      else if ((_DWORD)v79 == 5)
      {
        id v84 = v226;
        id v85 = v215;
        if (v215)
        {
          if ([v84 usesSwiftRefcounting]
            && v77 == [v84 pointerSize])
          {
            id v86 = v85;
            uint64_t v222 = [v86 refcountIsSideTableMarkerMask] & v83;
            if (v222 == [v86 refcountIsSideTableMarkerValue])
            {
              unint64_t v87 = [v86 sideTablePointerMask] & v83;
              unint64_t v88 = v87 >> [v86 sideTablePointerRightShift];
              unint64_t v83 = v88 << [v86 sideTablePointerLeftShift];
            }

            else
            {
              unint64_t v83 = 0LL;
            }
          }

          else
          {
            v83 &= [v85 nativeWeakReferencePointerMask];
          }
        }

        uint64_t v79 = 5LL;
      }

      if (v232 || (*(_DWORD *)(v75 + 4LL * v76) & 0x80000000) != 0) {
        v83 &= 0xFFFFFFFFFFFFF8uLL;
      }
      unint64_t v89 = *(uint64_t **)(a1 + 112);
      if (v89[6] > v83) {
        goto LABEL_116;
      }
      uint64_t v223 = *(void *)(*(void *)(a1 + 80) + 16LL * a4);
      unint64_t v90 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v83);
      unint64_t v91 = v89[6];
      unint64_t v92 = v89[7];
      BOOL v146 = v92 >= v91;
      unint64_t v93 = v92 - v91;
      if (!v146) {
        goto LABEL_116;
      }
      unint64_t v94 = v90;
      if (v90 - v91 >= v93) {
        goto LABEL_116;
      }
      unint64_t v95 = v90 >> *MEMORY[0x1895FD580];
      if (v95)
      {
        unint64_t v96 = (unsigned int *)v89[3];
        unint64_t v97 = v90 >> *MEMORY[0x1895FD580];
        do
        {
          if (*v96 <= (v97 & 0x3FFFFFF)
            || ((*((unsigned __int8 *)v96 + ((v97 & 0x3FFFFFF) >> 3) + 4) >> (v97 & 7)) & 1) == 0)
          {
            goto LABEL_116;
          }

          v97 >>= 26;
        }

        while (v97);
      }

      uint64_t v98 = (uint64_t)v89 + 4 * (v95 & 0x7FFFF);
      int v101 = *(_DWORD *)(v98 + 64);
      unint64_t v100 = (_DWORD *)(v98 + 64);
      int v99 = v101;
      if (v101)
      {
        unint64_t v102 = v89[4] + ((unint64_t)(v99 - 1) << 6);
        if (v90 - *(void *)(*(void *)v102 + 8LL) < *(void *)(*(void *)v102 + 16LL)) {
          goto LABEL_128;
        }
      }

      unint64_t v118 = *((unsigned int *)v89 + 10);
      if (!(_DWORD)v118) {
        goto LABEL_116;
      }
      unint64_t v119 = v89[4];
      while (1)
      {
        unint64_t v120 = v118 >> 1;
        unint64_t v102 = v119 + (v118 >> 1 << 6);
        if (*(void *)(*(void *)v102 + 8LL) <= v90)
        {
          if (*(void *)(*(void *)v102 + 16LL) + *(void *)(*(void *)v102 + 8LL) > v90)
          {
            uint64_t v220 = v89[4];
            int v121 = [*(id *)v102 isSpecialPhysFootprintRegion];
            uint64_t v122 = v220;
            if (v121) {
              unint64_t v123 = 0LL;
            }
            else {
              unint64_t v123 = v102;
            }
            if ((v121 & 1) != 0) {
              goto LABEL_116;
            }
            if ((*(_BYTE *)(*(void *)v123 + 132LL) & 1) == 0) {
              goto LABEL_179;
            }
            unint64_t v124 = (id *)(v123 + 64);
            unint64_t v125 = *((unsigned int *)v89 + 10) - ((uint64_t)(v123 + 64 - v89[4]) >> 6);
            if (!v125) {
              goto LABEL_176;
            }
            while (1)
            {
              unint64_t v126 = v125 >> 1;
              v127 = &v124[8 * (v125 >> 1)];
              if (*((void *)*v127 + 1) <= v94)
              {
                if (*((void *)*v127 + 2) + *((void *)*v127 + 1) > v94)
                {
                  unint64_t v213 = v123;
                  int v132 = [*v127 isSpecialPhysFootprintRegion];
                  unint64_t v123 = v213;
                  uint64_t v122 = v220;
                  if (v132) {
                    unint64_t v125 = 0LL;
                  }
                  else {
                    unint64_t v125 = (unint64_t)v127;
                  }
LABEL_176:
                  if (v125) {
                    unint64_t v123 = v125;
                  }
                  unint64_t v102 = v123;
LABEL_179:
                  *unint64_t v100 = ((v123 - v122) >> 6) + 1;
LABEL_128:
                  unsigned int v103 = *(_DWORD *)(v102 + 20);
                  if (v103)
                  {
                    uint64_t v104 = *(void *)(v102 + 8);
                    uint64_t v105 = *v89;
                    uint64_t v106 = *(unsigned int *)(v102 + 16);
                    os_signpost_id_t v107 = (unint64_t *)(*v89 + 16 * v106);
                    if (v104)
                    {
                      if (*v107 > v94) {
                        goto LABEL_116;
                      }
                      unint64_t v108 = (void *)(v105 + 16LL * (v103 + v106 - 1));
                      if (((v108[1] >> 5) & 0xFFFFFFFFFuLL) + *v108 <= v94) {
                        goto LABEL_116;
                      }
                      id v109 = (unsigned int *)(v104
                                            + 4 * ((v94 - (*v107 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
                      uint64_t v110 = *v109;
                      os_signpost_id_t v111 = (unint64_t *)(v105 + 16 * v110);
                      if (*v111 > v94) {
                        goto LABEL_116;
                      }
                      uint64_t v112 = v109[1];
                      if (v112 < *((_DWORD *)v89 + 2)
                        && (uint64_t v113 = (unint64_t *)(v105 + 16 * v112), v114 = *v113, *v113 <= v94))
                      {
LABEL_164:
                        unint64_t v128 = v113[1];
                        if ((v128 & 7) - 2 >= 3)
                        {
                          unint64_t v129 = ((unint64_t)v113 - v105) >> 4;
                          unint64_t v130 = v89[2];
                          if (v94 - v114 >= v130)
                          {
                            if (((v128 >> 5) & 0xFFFFFFFFFLL) - (v94 - v114) > v130 || (_DWORD)v129 == -1) {
                              goto LABEL_116;
                            }
                          }

                          else if ((_DWORD)v129 == -1)
                          {
                            goto LABEL_116;
                          }

                          (*(void (**)(uint64_t, void, unint64_t, uint64_t))(a9 + 16))( a9,  a4,  v77 + a3 + v223,  v79);
                        }
                      }

                      else
                      {
                        unsigned int v115 = v112 - v110;
                        if (v115)
                        {
                          do
                          {
                            uint64_t v116 = v115 >> 1;
                            uint64_t v113 = &v111[2 * v116];
                            unint64_t v114 = *v113;
                            if (*v113 <= v94)
                            {
                              if (((v111[2 * v116 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94) {
                                goto LABEL_164;
                              }
                              os_signpost_id_t v111 = v113 + 2;
                              LODWORD(v116) = --v115 >> 1;
                            }

                            BOOL v146 = v115 >= 2;
                            unsigned int v115 = v116;
                          }

                          while (v146);
                        }
                      }
                    }

                    else
                    {
                      do
                      {
                        uint64_t v117 = v103 >> 1;
                        uint64_t v113 = &v107[2 * v117];
                        unint64_t v114 = *v113;
                        if (*v113 <= v94)
                        {
                          if (((v107[2 * v117 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94) {
                            goto LABEL_164;
                          }
                          os_signpost_id_t v107 = v113 + 2;
                          LODWORD(v117) = --v103 >> 1;
                        }

                        BOOL v146 = v103 >= 2;
                        unsigned int v103 = v117;
                      }

                      while (v146);
                    }
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
    v6[2] = __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke;
    v6[3] = &unk_189DFD398;
    uint64_t v8 = v16;
    unsigned int v9 = v12;
    uint64_t v10 = v14;
    unsigned int v11 = v13;
    v6[4] = self;
    id v7 = 0LL;
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke( uint64_t *a1,  unsigned int a2,  int a3,  uint64_t a4)
{
  if (!a4) {
    return;
  }
  uint64_t v5 = a1[4];
  if (*(_DWORD *)(v5 + 88) <= a2) {
    return;
  }
  uint64_t v8 = (unint64_t *)(*(void *)(v5 + 80) + 16LL * a2);
  unint64_t v9 = *v8;
  unsigned int v11 = v8 + 1;
  unint64_t v10 = v8[1];
  if (a3 || (uint64_t v34 = *(unsigned int *)(*(void *)(a1[6] + 8) + 24LL), (_DWORD)v34 == -1))
  {
    unint64_t v12 = v8[1];
  }

  else
  {
    unint64_t v12 = v8[1];
    if (*(void *)(*(void *)(a1[7] + 8) + 24LL) <= v9)
    {
      uint64_t v136 = *(void *)(v5 + 80) + 16LL * a2;
      unint64_t v35 = *(void **)(v5 + 96);
      uint64_t v36 = *(void **)(v5 + 56);
      id v37 = *(id *)(v5 + 64);
      id v38 = v36;
      int v39 = v35;
      unint64_t v40 = v38;
      unsigned int v41 = &v35[8 * v34];
      if (v41[6])
      {
        if ((void *)v41[7] == v41)
        {
          uint64_t v139 = MEMORY[0x1895F87A8];
          uint64_t v140 = 3221225472LL;
          unint64_t v83 = v39;
          BOOL v141 = ___unmapRegion_block_invoke;
          char v142 = &unk_189DFD5E8;
          id v143 = v38;
          BOOL v145 = v41;
          id v144 = v37;
          BOOL v146 = v83;
          id v84 = (void (**)(void))MEMORY[0x186E33044](&v139);
          v84[2]();
        }

        else
        {
          uint64_t v42 = &v39[8 * v34];
          v42[5] = 0LL;
          v42[6] = 0LL;
          v42[7] = 0LL;
        }
      }

      *(_DWORD *)(*(void *)(a1[6] + 8) + 24LL) = -1;
      unint64_t v12 = *v11;
      uint64_t v8 = (unint64_t *)v136;
    }
  }

  int v13 = v12 & 7;
  if (v13 == 4)
  {
    uint64_t v14 = [*(id *)(a1[4] + 224) threadStateForThreadNum:v12 >> 41];
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v14);
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24LL) = -1;
    return;
  }

  if ((v12 & 0x1FFFFFFFFE0LL) == 0) {
    return;
  }
  if (v13 == 1)
  {
    for (;
          *(void *)(*(void *)(a1[7] + 8) + 24LL) <= *v8;
          *(void *)(*(void *)(a1[7] + 8) + 24LL) = *(void *)(*(void *)(*(void *)(a1[4] + 96)
                                                                             + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24LL) << 6))
                                                                 + 16LL)
                                                     + *(void *)(*(void *)(a1[9] + 8) + 24LL))
    {
      *(void *)(*(void *)(a1[9] + 8) + 24LL) = *(void *)(*(void *)(*(void *)(a1[4] + 96)
    }

    uint64_t v15 = a1[4];
    uint64_t v16 = *(void *)(v15 + 96);
    uint64_t v17 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24LL);
    BOOL v18 = (id *)(v16 + (v17 << 6));
    if ((*((_DWORD *)*v18 + 13) & 3) != 2)
    {
      unint64_t v19 = ((v10 >> 5) & 0xFFFFFFFFFLL) + v9;
      uint64_t v20 = *(void *)(a1[7] + 8);
      unint64_t v22 = *(void *)(v20 + 24);
      unint64_t v21 = (void *)(v20 + 24);
      BOOL v135 = v8;
      if (v22 < v19)
      {
        unsigned int v23 = v17 + 1;
        do
        {
          unsigned int v24 = v23;
          unint64_t v25 = (void *)(*(void *)(*(void *)(a1[4] + 96) + ((unint64_t)v23 << 6)) + 8LL);
          *unint64_t v21 = v25[1] + *v25;
          ++v23;
          uint64_t v26 = *(void *)(a1[7] + 8);
          unint64_t v27 = *(void *)(v26 + 24);
          unint64_t v21 = (void *)(v26 + 24);
        }

        while (v27 < v19);
        uint64_t v28 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24LL);
        int v29 = v23 - v28;
        uint64_t v30 = a1[4];
        uint64_t v121 = v28;
        unint64_t v126 = (void *)(*(void *)(v30 + 96) + (v28 << 6));
        unint64_t v31 = *(void **)(v30 + 56);
        unint64_t v32 = *(void **)(v30 + 64);
        uint64_t v119 = *(void *)(v30 + 96);
        if (a3 == 1) {
          unint64_t v33 = (void *)a1[5];
        }
        else {
          unint64_t v33 = 0LL;
        }
        uint64_t v85 = v24;
        id v86 = *(id *)(v30 + 8);
        id v123 = v32;
        id v131 = v31;
        id v134 = v33;
        int v120 = v29;
        if (v29)
        {
          uint64_t v87 = 0LL;
          uint64_t v88 = v23 - v121;
          unint64_t v89 = v126;
          unint64_t v90 = v126;
          unint64_t v91 = v135;
          do
          {
            uint64_t v92 = *v90;
            v90 += 8;
            v87 += *(void *)(v92 + 16);
            --v88;
          }

          while (v88);
        }

        else
        {
          uint64_t v87 = 0LL;
          unint64_t v91 = v135;
          unint64_t v89 = v126;
        }

        LODWORD(v125) = v23 - 1;
        v147[0] = 0LL;
        uint64_t v138 = 0LL;
        unint64_t v93 = (void *)[v131 findMappedAddress:*(void *)(*v89 + 8) size:v87];
        if (v93)
        {
          uint64_t v94 = v93[1];
          uint64_t v95 = *(void *)(*v89 + 8LL) - *v93;
          v147[0] = v93[2] + v95;
          uint64_t v138 = v94 - v95;
        }

        else
        {
          uint64_t v117 = v86;
          uint64_t v118 = v85;
          unint64_t v102 = v123;
          if (v120)
          {
            uint64_t v103 = v23 - v121;
            uint64_t v104 = v126;
            do
            {
              id v105 = v102;
              id v106 = v131;
              os_signpost_id_t v107 = (dispatch_queue_s *)v134;
              if (v104[6])
              {
                if (v104 == (void *)v104[7])
                {
                  uint64_t v139 = MEMORY[0x1895F87A8];
                  uint64_t v140 = 3221225472LL;
                  BOOL v141 = ___unmapRegion_block_invoke;
                  char v142 = &unk_189DFD5E8;
                  id v143 = v106;
                  BOOL v145 = v104;
                  id v144 = v105;
                  BOOL v146 = v126;
                  unint64_t v108 = (void (**)(void))MEMORY[0x186E33044](&v139);
                  id v109 = v108;
                  if (v134) {
                    dispatch_async(v107, v108);
                  }
                  else {
                    v108[2](v108);
                  }

                  unint64_t v102 = v123;
                }

                else
                {
                  v104[5] = 0LL;
                  v104[6] = 0LL;
                  v104[7] = 0LL;
                }
              }

              v104 += 8;
              --v103;
            }

            while (v103);
          }

          unint64_t v89 = v126;
          unint64_t v91 = v135;
          id v86 = v117;
          uint64_t v85 = v118;
          if ([v131 mapAddress:*(void *)(*v126 + 8) size:v87 returnedAddress:v147 returnedSize:&v138])
          {
            if (task_exists(v117)) {
              fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *(void *)(*v126 + 8LL),  *(void *)(*v126 + 8LL) + v87);
            }
            goto LABEL_65;
          }
        }

        if (v120)
        {
          uint64_t v96 = v138;
          uint64_t v97 = v147[0];
          uint64_t v98 = (void *)(v119 + (v121 << 6) + 56);
          uint64_t v99 = v23 - v121;
          do
          {
            *(v98 - 1) = v97;
            *uint64_t v98 = v89;
            *(v98 - 2) = v96;
            uint64_t v100 = *(v98 - 7) + 8LL;
            v97 += *(void *)(*(v98 - 7) + 16LL);
            v147[0] = v97;
            v96 -= *(void *)(v100 + 8);
            uint64_t v138 = v96;
            v98 += 8;
            --v99;
          }

          while (v99);
        }

- (void)scanNodesWithReferenceRecorder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x186E33044]();
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (self->_referenceLogger
    || (unint64_t maxInteriorOffset = self->_maxInteriorOffset, maxInteriorOffset != -1LL)
    && (!maxInteriorOffset || (maxInteriorOffset & ~(-1 << *MEMORY[0x1895FD580])) != 0))
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v13[3] = &unk_189DFD3C0;
    void v13[4] = self;
    id v14 = v4;
    uint64_t v7 = MEMORY[0x186E33044](v13);

    uint64_t v5 = (void *)v7;
  }

  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v10[3] = &unk_189DFD4D0;
  v10[4] = self;
  id v11 = v5;
  int v12 = 0;
  id v8 = v5;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  unsigned int a5,  uint64_t a6)
{
  uint64_t v6 = *(void **)(result + 32);
  if ((unint64_t)(a6 - *(void *)(v6[10] + 16LL * a5)) <= v6[46])
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0LL;
    while (1)
    {
      int v6 = *(_DWORD *)(*(void *)(v2 + 80) + 16 * v5 + 8);
      if (*(void *)(v2 + 480))
      {
        uint64_t v7 = (void *)MEMORY[0x186E32E40]();
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 480LL) + 16LL))();
        objc_autoreleasePoolPop(v7);
      }

      int v8 = v6 & 7;
      if (v8 == 1)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        if (*(_DWORD *)(v9 + 308) != -1)
        {
          uint64_t v10 = *(void *)(v9 + 112);
          unint64_t v11 = *(void *)(v10 + 48);
          unint64_t v12 = *(void *)(v10 + 56);
          BOOL v35 = v12 >= v11;
          unint64_t v13 = v12 - v11;
          if (v35)
          {
            unint64_t v14 = *(void *)(*(void *)(v9 + 80) + 16 * v5);
            if (v14 - v11 < v13)
            {
              unint64_t v15 = v14 >> *MEMORY[0x1895FD580];
              if (v15)
              {
                uint64_t v16 = *(unsigned int **)(v10 + 24);
                unint64_t v17 = v14 >> *MEMORY[0x1895FD580];
                do
                {
                  if (*v16 <= (v17 & 0x3FFFFFF)
                    || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
                  {
                    goto LABEL_137;
                  }

                  v17 >>= 26;
                }

                while (v17);
              }

              uint64_t v18 = v10 + 4 * (v15 & 0x7FFFF);
              int v21 = *(_DWORD *)(v18 + 64);
              uint64_t v20 = (_DWORD *)(v18 + 64);
              int v19 = v21;
              uint64_t v22 = *(void *)(v10 + 32);
              if (v21)
              {
                unsigned int v23 = (id *)(v22 + ((unint64_t)(v19 - 1) << 6));
                if (v14 - *((void *)*v23 + 1) < *((void *)*v23 + 2)) {
                  goto LABEL_17;
                }
              }

              unint64_t v62 = *(unsigned int *)(v10 + 40);
              if ((_DWORD)v62)
              {
                int v63 = *(id **)(v10 + 32);
                do
                {
                  unint64_t v64 = v62 >> 1;
                  unsigned int v23 = &v63[8 * (v62 >> 1)];
                  if (*((void *)*v23 + 1) <= v14)
                  {
                    if (*((void *)*v23 + 2) + *((void *)*v23 + 1) > v14)
                    {
                      int v120 = [*v23 isSpecialPhysFootprintRegion];
                      if (v120) {
                        uint64_t v121 = 0LL;
                      }
                      else {
                        uint64_t v121 = v23;
                      }
                      if ((v120 & 1) != 0) {
                        break;
                      }
                      if ((*((_BYTE *)*v121 + 132) & 1) == 0) {
                        goto LABEL_159;
                      }
                      unint64_t v128 = v121 + 8;
                      unint64_t v129 = *(unsigned int *)(v10 + 40) - (((uint64_t)v121 - *(void *)(v10 + 32) + 64) >> 6);
                      if (!v129) {
                        goto LABEL_156;
                      }
                      while (1)
                      {
                        unint64_t v130 = v129 >> 1;
                        id v131 = &v128[8 * (v129 >> 1)];
                        if (*((void *)*v131 + 1) <= v14)
                        {
                          if (*((void *)*v131 + 2) + *((void *)*v131 + 1) > v14)
                          {
                            else {
                              unint64_t v129 = (unint64_t)v131;
                            }
LABEL_156:
                            if (v129) {
                              uint64_t v121 = (id *)v129;
                            }
                            unsigned int v23 = v121;
LABEL_159:
                            *uint64_t v20 = (((unint64_t)v121 - v22) >> 6) + 1;
LABEL_17:
                            if (*((_DWORD *)*v23 + 37) == *(_DWORD *)(*(void *)(a1 + 32) + 308LL)) {
                              (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
                            }
                            goto LABEL_137;
                          }

                          unint64_t v128 = v131 + 8;
                          unint64_t v130 = --v129 >> 1;
                        }

                        BOOL v108 = v129 > 1;
                        unint64_t v129 = v130;
                        if (!v108)
                        {
                          unint64_t v129 = 0LL;
                          goto LABEL_156;
                        }
                      }
                    }

                    int v63 = v23 + 8;
                    unint64_t v64 = --v62 >> 1;
                  }

                  BOOL v35 = v62 >= 2;
                  unint64_t v62 = v64;
                }

                while (v35);
              }
            }
          }
        }

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  unint64_t v6 = *(void *)(*(void *)(v4 + 80) + 16 * v5 + 8);
  unint64_t v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(v2 + 2048) == -1583242847
     && !strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    char v18 = *(_BYTE *)(v4 + 360);
    *(_DWORD *)(v4 + 300) = 1;
    *(_BYTE *)(*(void *)(a1 + 32) + 360LL) = 0;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = (uint64_t *)(*(void *)(v19 + 80) + 16LL * *(unsigned int *)(a1 + 48));
    uint64_t v21 = *v20;
    unint64_t v22 = ((unint64_t)v20[1] >> 5) & 0xFFFFFFFFFLL;
    if (v22 == 10240)
    {
      if (*(_DWORD *)(v2 + 2048) == -1583242847)
      {
        int v23 = strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL);
        if (v23) {
          unint64_t v22 = 10240LL;
        }
        else {
          unint64_t v22 = 0x2000LL;
        }
        if (!v23)
        {
          v21 += 2048LL;
          v2 += 2048LL;
        }
      }

      else
      {
        unint64_t v22 = 10240LL;
      }
    }

    unint64_t v24 = *(void *)(v2 + *(unsigned int *)[*(id *)(v19 + 64) autoreleasePoolPageLayout]) - v21;
    if (v22 < v24) {
      unint64_t v24 = v22;
    }
    if (v24 >= 0x4000) {
      unint64_t v25 = 0x4000LL;
    }
    else {
      unint64_t v25 = v24;
    }
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( *(void *)(a1 + 32),  v2,  0LL,  *(_DWORD *)(a1 + 48),  v25,  *(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * *(unsigned int *)(a1 + 48) + 8) >> 41,  0LL,  8u,  *(void *)(a1 + 40));
    *(_BYTE *)(*(void *)(a1 + 32) + 360LL) = v18;
    *(_DWORD *)(*(void *)(a1 + 32) + 300LL) = 0;
  }

  else
  {
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( v4,  v2,  0LL,  v5,  (v6 >> 5) & 0xFFFFFFFFFLL,  v6 >> 41,  0LL,  1u,  *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(const void **)(v8 + 240);
    size_t v10 = *(unsigned int *)(v8 + 248);
    uint64_t v11 = MEMORY[0x1895F87A8];
    __compar[0] = MEMORY[0x1895F87A8];
    __compar[1] = 3221225472LL;
    __compar[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    int v32 = *(_DWORD *)(a1 + 48);
    unint64_t v12 = bsearch_b(0LL, v9, v10, 0x10uLL, __compar);
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      unint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(unsigned int *)(a1 + 48);
      uint64_t v16 = *(void **)(*(void *)(v13 + 256) + ((*(void *)(*(void *)(v13 + 80) + 16 * v15 + 8) >> 38) & 0x3FFFFF8LL));
      uint64_t v17 = v12[1];
      v27[0] = v11;
      v27[1] = 3221225472LL;
      v27[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v27[3] = &unk_189DFD408;
      v27[4] = v13;
      uint64_t v29 = v2;
      int v30 = v15;
      id v28 = v14;
      id v26 = v16;
      [v26 enumerateStoredEntriesForObject:v2 ofSize:v6 >> 5 externalValues:v17 block:v27];
    }
  }

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4( uint64_t a1,  uint64_t a2,  unint64_t *a3)
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5( uint64_t a1,  void *a2,  unsigned int a3,  unsigned int a4)
{
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 32);
  uint64_t v5 = *(void *)(a2 + *(void *)(v4 + 528) - *(void *)(result + 48));
  if (v5)
  {
    uint64_t v6 = result;
    unint64_t v7 = v5 + 0x2000;
    uint64_t v8 = *(uint64_t **)(v4 + 112);
    unint64_t v10 = v8[6];
    unint64_t v9 = v8[7];
    unint64_t v11 = v9 - v10;
    BOOL v12 = v9 < v10;
    if (v7 - v10 < v11 && !v12)
    {
      uint64_t v13 = (_DWORD *)MEMORY[0x1895FD580];
      unint64_t v14 = v7 >> *MEMORY[0x1895FD580];
      if (v14)
      {
        uint64_t v15 = (unsigned int *)v8[3];
        unint64_t v16 = v7 >> *MEMORY[0x1895FD580];
        do
        {
          if (*v15 <= (v16 & 0x3FFFFFF)
            || ((*((unsigned __int8 *)v15 + ((v16 & 0x3FFFFFF) >> 3) + 4) >> (v16 & 7)) & 1) == 0)
          {
            goto LABEL_47;
          }

          v16 >>= 26;
        }

        while (v16);
      }

      uint64_t v17 = (uint64_t)v8 + 4 * (v14 & 0x7FFFF);
      int v20 = *(_DWORD *)(v17 + 64);
      uint64_t v19 = (_DWORD *)(v17 + 64);
      int v18 = v20;
      uint64_t v21 = v8[4];
      if (v20)
      {
        unint64_t v22 = v21 + ((unint64_t)(v18 - 1) << 6);
        if (v7 - *(void *)(*(void *)v22 + 8LL) < *(void *)(*(void *)v22 + 16LL)) {
          goto LABEL_11;
        }
      }

      unint64_t v40 = *((unsigned int *)v8 + 10);
      if ((_DWORD)v40)
      {
        unint64_t v41 = v8[4];
        do
        {
          unint64_t v42 = v40 >> 1;
          unint64_t v22 = v41 + (v40 >> 1 << 6);
          uint64_t result = *(void *)v22;
          if (*(void *)(*(void *)v22 + 8LL) <= v7)
          {
            if (*(void *)(*(void *)v22 + 16LL) + *(void *)(*(void *)v22 + 8LL) > v7)
            {
              uint64_t result = [result isSpecialPhysFootprintRegion:a3, a4, 0xFFFFFFFFLL];
              if ((_DWORD)result) {
                unint64_t v43 = 0LL;
              }
              else {
                unint64_t v43 = v22;
              }
              if ((result & 1) != 0) {
                break;
              }
              if ((*(_BYTE *)(*(void *)v43 + 132LL) & 1) == 0) {
                goto LABEL_56;
              }
              unint64_t v44 = (uint64_t *)(v43 + 64);
              unint64_t v45 = *((unsigned int *)v8 + 10) - ((uint64_t)(v43 + 64 - v8[4]) >> 6);
              if (!v45) {
                goto LABEL_53;
              }
              while (1)
              {
                unint64_t v46 = v45 >> 1;
                uint64_t v47 = &v44[8 * (v45 >> 1)];
                uint64_t result = *v47;
                if (*(void *)(*v47 + 8) <= v7)
                {
                  if (*(void *)(*v47 + 16) + *(void *)(*v47 + 8) > v7)
                  {
                    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
                    if ((_DWORD)result) {
                      unint64_t v45 = 0LL;
                    }
                    else {
                      unint64_t v45 = (unint64_t)v47;
                    }
LABEL_53:
                    if (v45) {
                      unint64_t v43 = v45;
                    }
                    unint64_t v22 = v43;
LABEL_56:
                    _DWORD *v19 = ((v43 - v21) >> 6) + 1;
LABEL_11:
                    unsigned int v23 = *(_DWORD *)(v22 + 20);
                    if (v23)
                    {
                      uint64_t v24 = *(void *)(v22 + 8);
                      uint64_t v25 = *v8;
                      uint64_t v26 = *(unsigned int *)(v22 + 16);
                      unint64_t v27 = (unint64_t *)(*v8 + 16 * v26);
                      if (v24)
                      {
                        if (*v27 <= v7)
                        {
                          id v28 = (void *)(v25 + 16LL * (v23 + v26 - 1));
                          if (((v28[1] >> 5) & 0xFFFFFFFFFuLL) + *v28 > v7)
                          {
                            uint64_t v29 = (unsigned int *)(v24 + 4 * ((v7 - (*v27 & -*MEMORY[0x1895FD590])) >> *v13));
                            uint64_t v30 = *v29;
                            id v31 = (unint64_t *)(v25 + 16 * v30);
                            if (*v31 <= v7)
                            {
                              uint64_t v32 = v29[1];
                              if (v32 >= *((_DWORD *)v8 + 2)
                                || (uint64_t v33 = (unint64_t *)(v25 + 16 * v32), *v33 > v7))
                              {
                                unsigned int v34 = v32 - v30;
                                if (v34)
                                {
                                  do
                                  {
                                    uint64_t v35 = v34 >> 1;
                                    uint64_t v36 = &v31[2 * v35];
                                    if (*v36 <= v7)
                                    {
                                      if (((v31[2 * v35 + 1] >> 5) & 0xFFFFFFFFFLL) + *v36 > v7) {
                                        goto LABEL_47;
                                      }
                                      id v31 = v36 + 2;
                                      LODWORD(v35) = --v34 >> 1;
                                    }

                                    BOOL v37 = v34 >= 2;
                                    unsigned int v34 = v35;
                                  }

                                  while (v37);
                                }
                              }
                            }
                          }
                        }
                      }

                      else
                      {
                        do
                        {
                          uint64_t v38 = v23 >> 1;
                          uint64_t v39 = &v27[2 * v38];
                          if (*v39 <= v7)
                          {
                            if (((v27[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + *v39 > v7) {
                              goto LABEL_47;
                            }
                            unint64_t v27 = v39 + 2;
                            LODWORD(v38) = --v23 >> 1;
                          }

                          BOOL v37 = v23 >= 2;
                          unsigned int v23 = v38;
                        }

                        while (v37);
                      }
                    }

                    goto LABEL_47;
                  }

                  unint64_t v44 = v47 + 8;
                  unint64_t v46 = --v45 >> 1;
                }

                BOOL v48 = v45 > 1;
                unint64_t v45 = v46;
                if (!v48)
                {
                  unint64_t v45 = 0LL;
                  goto LABEL_53;
                }
              }
            }

            unint64_t v41 = v22 + 64;
            unint64_t v42 = --v40 >> 1;
          }

          BOOL v37 = v40 >= 2;
          unint64_t v40 = v42;
        }

        while (v37);
      }
    }

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  if (*(void *)(*(void *)(result + 32) + 528LL) != a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16LL))();
  }
  return result;
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8(uint64_t a1, uint64_t a2)
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
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
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
              -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:]( *(void *)(a1 + 32),  v29,  v20 - *(void *)(a1 + 72),  *(_DWORD *)(a1 + 88),  v21,  0,  0LL,  8u,  *(void *)(a1 + 48));
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9(uint64_t a1, uint64_t a2)
{
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10( uint64_t result,  uint64_t a2,  uint64_t a3)
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
    unint64_t v9 = *(uint64_t **)(*(void *)(v5 + 32) + 112LL);
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
    unint64_t v44 = (uint64_t *)(v43 + 64);
    unint64_t v45 = *((unsigned int *)v9 + 10) - ((uint64_t)(v43 + 64 - v9[4]) >> 6);
    if (!v45) {
      goto LABEL_64;
    }
    while (2)
    {
      unint64_t v46 = v45 >> 1;
      uint64_t v47 = &v44[8 * (v45 >> 1)];
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
      unint64_t v44 = v47 + 8;
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
        uint64_t v32 = (unint64_t *)(v26 + 16 * v31);
        if (*v32 > v14) {
          goto LABEL_53;
        }
        uint64_t v33 = v30[1];
        if (v33 < *((_DWORD *)v9 + 2))
        {
          unsigned int v34 = (unint64_t *)(v26 + 16 * v33);
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
            unsigned int v34 = &v32[2 * v37];
            unint64_t v35 = *v34;
            if (*v34 <= v14)
            {
              if (((v32[2 * v37 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14) {
                goto LABEL_49;
              }
              uint64_t v32 = v34 + 2;
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
          unsigned int v34 = &v28[2 * v38];
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
  LODWORD(v5) = a4;
  id v8 = a5;
  if (!(_DWORD)v5)
  {
    unsigned int v32 = 0;
    goto LABEL_5;
  }

  unint64_t v9 = getenv("DT_REPORT_IOKIT_REGION_LEAKS");
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
    while (1)
    {
      uint64_t v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3) {
        break;
      }
      if (blocksCount == ++v13) {
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    LODWORD(v13) = -1;
  }

  uint64_t v16 = 0LL;
  char v33 = 0;
  unsigned int v32 = 0;
  else {
    uint64_t v5 = v5;
  }
  uint64_t v17 = 0xFFFFFFFFLL;
  uint64_t v31 = v13;
  id v29 = v8;
  uint64_t v30 = v13;
  unsigned int v26 = -1;
  BOOL v28 = v10;
  do
  {
    uint64_t v18 = a3[v16];
    if (!(_DWORD)v18 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v18] + 2) & 7)) {
      goto LABEL_47;
    }
    int v19 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                  + ((*((void *)&self->_blocks[v18] + 1) >> 35) & 0x1FFFFFC0LL)));
    if (([v19 willNotHoldPointers] & 1) != 0 || !*((_DWORD *)v19 + 26) && *((_BYTE *)v19 + 50) == 5)
    {
      if (v10)
      {
        if ((v33 & 1) != 0)
        {
          char v33 = 1;
        }

        else
        {
          char v33 = 1;
          fwrite( "The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n",  0x97uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
        }
      }

      else
      {
        (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v8 + 2))( v8,  v31,  self->_blocks[v30].var0,  1LL,  v18,  self->_blocks[v18].var0);
      }

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  uint64_t v130 = *MEMORY[0x1895F89C0];
  int v81 = objc_alloc(&OBJC_CLASS___VMUProcessObjectGraph);
  uint64_t pid = self->_pid;
  blocks = self->_blocks;
  uint64_t blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  -[VMUVMRegionIdentifier regions](self->_regionIdentifier, "regions");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[VMUProcessObjectGraph initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:]( v81,  "initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:",  pid,  blocks,  blocksCount,  zoneNames,  classInfoIndexer,  v9,  gPthreadOffsets,  self->_userMarkedAbandoned,  -[VMUObjectIdentifier autoreleasePoolPageLayout](self->_objectIdentifier, "autoreleasePoolPageLayout"));
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v10;

  -[VMUProcessObjectGraph setSnapshotMachTime:](self->_processObjectGraph, "setSnapshotMachTime:", self->_suspendTime);
  -[VMUProcessObjectGraph setSnapshotDate:](self->_processObjectGraph, "setSnapshotDate:", self->_suspendDate);
  -[VMUProcessObjectGraph setScanner:](self->_processObjectGraph, "setScanner:", self);
  -[VMUProcessObjectGraph setDebugTimer:](self->_processObjectGraph, "setDebugTimer:", self->_debugTimer);
  -[VMUProcessObjectGraph setShowRawClassNames:]( self->_processObjectGraph,  "setShowRawClassNames:",  self->_showRawClassNames);
  -[VMUProcessObjectGraph setProcessDescriptionString:]( self->_processObjectGraph,  "setProcessDescriptionString:",  self->_processDescriptionString);
  -[VMUProcessObjectGraph setIsTranslatedByRosetta:]( self->_processObjectGraph,  "setIsTranslatedByRosetta:",  -[VMUTaskMemoryScanner isTranslatedByRosetta](self, "isTranslatedByRosetta"));
  -[VMUProcessObjectGraph setProcessName:](self->_processObjectGraph, "setProcessName:", self->_processName);
  -[VMUProcessObjectGraph setBinaryImagesDescription:]( self->_processObjectGraph,  "setBinaryImagesDescription:",  self->_binaryImagesDescription);
  -[VMUProcessObjectGraph setPhysicalFootprint:]( self->_processObjectGraph,  "setPhysicalFootprint:",  self->_physicalFootprint);
  -[VMUTaskMemoryScanner ledger](self, "ledger");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessObjectGraph setLedger:](self->_processObjectGraph, "setLedger:", v12);

  -[VMUProcessObjectGraph setPhysicalFootprintPeak:]( self->_processObjectGraph,  "setPhysicalFootprintPeak:",  self->_physicalFootprintPeak);
  uint64_t v13 = -[VMUTask taskDyldSharedCacheRange](self->_task, "taskDyldSharedCacheRange");
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  -[VMUProcessObjectGraph setObjectContentLevel:]( self->_processObjectGraph,  "setObjectContentLevel:",  -[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setObjectContentLevelForNodeLabels:]( self->_processObjectGraph,  "setObjectContentLevelForNodeLabels:",  -[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setSrcAddressToExtraAutoreleaseCountDict:]( self->_processObjectGraph,  "setSrcAddressToExtraAutoreleaseCountDict:",  self->_srcAddressToExtraAutoreleaseCountDict);
  -[VMUProcessObjectGraph setShowsPhysFootprint:]( self->_processObjectGraph,  "setShowsPhysFootprint:",  -[VMUVMRegionIdentifier recordedPhysFootprint](self->_regionIdentifier, "recordedPhysFootprint"));
  -[VMUProcessObjectGraph setDidPhysFootprintDirtyAccounting:]( self->_processObjectGraph,  "setDidPhysFootprintDirtyAccounting:",  -[VMUVMRegionIdentifier didPhysFootprintDirtyAccounting](self->_regionIdentifier, "didPhysFootprintDirtyAccounting"));
  uint64_t v15 = -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  uint64_t v78 = v16;
  uint64_t v79 = v15;
  if (self->_targetProcessHasObjCPatches)
  {
    uint64_t v80 = CSSymbolicatorCreateForTaskSharedCache();
    uint64_t v82 = v17;
  }

  else
  {
    uint64_t v80 = 0LL;
    uint64_t v82 = 0LL;
  }

  v128[0] = 0LL;
  v128[1] = v128;
  v128[2] = 0x3010000000LL;
  v128[5] = 0LL;
  v128[3] = &unk_1861837AD;
  v128[4] = 0LL;
  v127[0] = 0LL;
  v127[1] = v127;
  v127[2] = 0x3010000000LL;
  v127[5] = 0LL;
  v127[3] = &unk_1861837AD;
  v127[4] = 0LL;
  v125[0] = 0LL;
  v125[1] = v125;
  v125[2] = 0x2020000000LL;
  char v126 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v19 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v19)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v21 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "processSnapshotGraph",  "",  buf,  2u);
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "processSnapshotGraph");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "sampling all threads");
  uint64_t v22 = self->_debugTimer;
  if (v22)
  {
    -[VMUDebugTimer logHandle](v22, "logHandle");
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v24 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "processSnapshotGraph",  "sampling all threads",  buf,  2u);
    }
  }

  if (-[VMUTask isCore](self->_task, "isCore"))
  {
    uint64_t v25 = 0LL;
    unsigned int v26 = 0LL;
  }

  else
  {
    unsigned int v26 = -[VMUSampler initWithTask:options:]( objc_alloc(&OBJC_CLASS___VMUSampler),  "initWithTask:options:",  -[VMUTask taskPort](self->_task, "taskPort"),  257LL);
    -[VMUSampler sampleAllThreadsOnceWithFramePointers:](v26, "sampleAllThreadsOnceWithFramePointers:", 1LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  int v27 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v27
    && ([NSString stringWithUTF8String:v27],
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(),
        [v28 uppercaseString],
        id v29 = (void *)objc_claimAutoreleasedReturnValue(),
        char v30 = [v29 isEqualToString:@"NO"],
        v29,
        v28,
        (v30 & 1) != 0))
  {
    uint64_t v31 = 0LL;
  }

  else
  {
    -[VMUProcessObjectGraph setBacktraces:](self->_processObjectGraph, "setBacktraces:", v25);
    uint64_t v31 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]( objc_alloc(&OBJC_CLASS___VMUSymbolStore),  "initWithSymbolicator:debugTimer:",  v79,  v78,  self->_debugTimer);
    -[VMUProcessObjectGraph setSymbolStore:](self->_processObjectGraph, "setSymbolStore:", v31);
    unsigned int v32 = self->_processObjectGraph;
    -[VMUProcessObjectGraph symbolStore](v32, "symbolStore");
    char v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 setGraph:v32];
  }

  if (v25)
  {
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    id v34 = v25;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v121 objects:v129 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v122;
      do
      {
        for (uint64_t i = 0LL; i != v35; ++i)
        {
          if (*(void *)v122 != v36) {
            objc_enumerationMutation(v34);
          }
          -[VMUSymbolStore addBacktrace:origin:]( v31,  "addBacktrace:origin:",  *(void *)(*((void *)&v121 + 1) + 8 * i),  0LL);
        }

        uint64_t v35 = [v34 countByEnumeratingWithState:&v121 objects:v129 count:16];
      }

      while (v35);
    }
  }

  *(void *)buf = 0LL;
  mach_vm_size_t v116 = buf;
  uint64_t v117 = 0x3010000000LL;
  uint64_t v120 = 0LL;
  mach_vm_address_t v118 = &unk_1861837AD;
  uint64_t v119 = 0LL;
  id v113 = 0LL;
  v114[0] = 0LL;
  v114[1] = v114;
  v114[2] = 0x3010000000LL;
  v114[5] = 0LL;
  v114[3] = &unk_1861837AD;
  v114[4] = 0LL;
  v112[0] = 0LL;
  v112[1] = v112;
  v112[2] = 0x3032000000LL;
  v112[3] = __Block_byref_object_copy_;
  v112[4] = __Block_byref_object_dispose_;
  v110[0] = 0LL;
  v110[1] = v110;
  v110[2] = 0x2020000000LL;
  int v111 = 0;
  if ((a3 & 2) != 0 && (-[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel") & 0xFFFFFFFE) == 2)
  {
    uint64_t v38 = self->_debugTimer;
    if (v38)
    {
      uint64_t v39 = -[VMUDebugTimer signpostID](v38, "signpostID");
      uint64_t v38 = self->_debugTimer;
      if (v39)
      {
        -[VMUDebugTimer logHandle](v38, "logHandle");
        unint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v41 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)unint64_t v105 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v40,  OS_SIGNPOST_INTERVAL_END,  v41,  "processSnapshotGraph",  "",  v105,  2u);
        }

        uint64_t v38 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v38, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "getting node labels");
    unint64_t v42 = self->_debugTimer;
    if (v42)
    {
      -[VMUDebugTimer logHandle](v42, "logHandle");
      unint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v44 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)unint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v43,  OS_SIGNPOST_INTERVAL_BEGIN,  v44,  "processSnapshotGraph",  "getting node labels",  v105,  2u);
      }
    }

    v109[0] = MEMORY[0x1895F87A8];
    v109[1] = 3221225472LL;
    v109[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v109[3] = &unk_189DFD4F8;
    v109[4] = self;
    -[VMUTaskMemoryScanner enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v109);
    -[VMUProcessObjectGraph parseAddressesFromNodeLabelsIntoSymbolStore]( self->_processObjectGraph,  "parseAddressesFromNodeLabelsIntoSymbolStore");
  }

  size_t regionsCount = self->_regionsCount;
  if ((_DWORD)regionsCount)
  {
    unint64_t v46 = self->_debugTimer;
    if (v46)
    {
      uint64_t v47 = -[VMUDebugTimer signpostID](v46, "signpostID");
      unint64_t v46 = self->_debugTimer;
      if (v47)
      {
        -[VMUDebugTimer logHandle](v46, "logHandle");
        BOOL v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v49 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)unint64_t v105 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v48,  OS_SIGNPOST_INTERVAL_END,  v49,  "processSnapshotGraph",  "",  v105,  2u);
        }

        unint64_t v46 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v46, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "scan nodes into the graph, while recording symbols of __DATA regions and stacks");
    unint64_t v50 = self->_debugTimer;
    if (v50)
    {
      -[VMUDebugTimer logHandle](v50, "logHandle");
      unint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v52 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)unint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v51,  OS_SIGNPOST_INTERVAL_BEGIN,  v52,  "processSnapshotGraph",  "scan nodes into the graph, while recording symbols of __DATA regions and stacks",  v105,  2u);
      }
    }

    int v53 = (char *)calloc(regionsCount, 4uLL);
    *(void *)unint64_t v105 = 0LL;
    unint64_t v106 = v105;
    uint64_t v107 = 0x2020000000LL;
    char v108 = 0;
    BOOL v54 = self->_processObjectGraph;
    uint64_t v55 = MEMORY[0x1895F87A8];
    v104[0] = MEMORY[0x1895F87A8];
    v104[1] = 3221225472LL;
    v104[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_225;
    v104[3] = &unk_189DFD548;
    v104[4] = self;
    v104[5] = v105;
    -[VMUObjectGraph enumerateObjectsWithBlock:](v54, "enumerateObjectsWithBlock:", v104);
    v86[0] = v55;
    v86[1] = 3221225472LL;
    v86[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3;
    v86[3] = &unk_189DFD570;
    uint64_t v98 = v53;
    unint64_t v99 = a3;
    uint64_t v100 = v80;
    uint64_t v101 = v82;
    uint64_t v102 = v79;
    uint64_t v103 = v78;
    v86[4] = self;
    unint64_t v90 = v128;
    uint64_t v91 = v125;
    uint64_t v92 = v127;
    uint64_t v87 = v31;
    uint64_t v93 = buf;
    uint64_t v94 = v114;
    unint64_t v95 = v112;
    unsigned int v96 = v110;
    id v88 = v25;
    unint64_t v89 = v26;
    uint64_t v97 = v105;
    -[VMUTaskMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v86);
    id v56 = self->_debugTimer;
    if (v56)
    {
      uint64_t v57 = -[VMUDebugTimer signpostID](v56, "signpostID");
      id v56 = self->_debugTimer;
      if (v57)
      {
        -[VMUDebugTimer logHandle](v56, "logHandle");
        id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v59 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_WORD *)uint64_t v85 = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v58,  OS_SIGNPOST_INTERVAL_END,  v59,  "processSnapshotGraph",  "",  v85,  2u);
        }

        id v56 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v56, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "processSnapshotGraph",  "find unreferenced VM regions");
    uint64_t v60 = self->_debugTimer;
    if (v60)
    {
      -[VMUDebugTimer logHandle](v60, "logHandle");
      int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v62 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)uint64_t v85 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v61,  OS_SIGNPOST_INTERVAL_BEGIN,  v62,  "processSnapshotGraph",  "find unreferenced VM regions",  v85,  2u);
      }
    }

    int v63 = malloc(4 * regionsCount);
    unint64_t v64 = v63;
    uint64_t v65 = self->_blocksCount;
    if ((_DWORD)v65)
    {
      uint64_t v66 = 0LL;
      uint64_t v67 = 0LL;
      unint64_t v68 = (unint64_t *)self->_blocks + 1;
      do
      {
        unint64_t v70 = *v68;
        v68 += 2;
        unint64_t v69 = v70;
        if ((v70 & 7) == 5 && !*(_DWORD *)&v53[(v69 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v63 + v67) = v66;
          uint64_t v67 = (v67 + 1);
        }

        ++v66;
      }

      while (v65 != v66);
      if ((_DWORD)v67)
      {
        v84[0] = v55;
        v84[1] = 3221225472LL;
        v84[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_246;
        v84[3] = &unk_189DFD598;
        v84[4] = self;
        -[VMUTaskMemoryScanner _removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:]( self,  "_removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:",  v63,  v67,  v84);
      }
    }

    free(v64);
    free(v53);

    _Block_object_dispose(v105, 8);
  }

  CSRelease();
  -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");
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
        *(_WORD *)unint64_t v105 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v73,  OS_SIGNPOST_INTERVAL_END,  v74,  "processSnapshotGraph",  "",  v105,  2u);
      }

      unint64_t v71 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v71, "endEvent:", "processSnapshotGraph");
  if ((a3 & 1) != 0 && !-[VMUTask isCore](self->_task, "isCore"))
  {
    unint64_t v75 = -[VMUGraphStackLogReader initWithTask:symbolicator:graph:debugTimer:collectDisklogs:]( objc_alloc(&OBJC_CLASS___VMUGraphStackLogReader),  "initWithTask:symbolicator:graph:debugTimer:collectDisklogs:",  self->_task,  v79,  v78,  self->_processObjectGraph,  self->_debugTimer,  (a3 >> 3) & 1);
    if (v75) {
      -[VMUProcessObjectGraph setStackLogReader:](self->_processObjectGraph, "setStackLogReader:", v75);
    }
  }

  -[VMUProcessObjectGraph setIdleExitStatus:](self->_processObjectGraph, "setIdleExitStatus:", self->_idleExitStatus);
  uint64_t v76 = self->_processObjectGraph;
  _Block_object_dispose(v110, 8);
  _Block_object_dispose(v112, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);
  _Block_object_dispose(v128, 8);
  return v76;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
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

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_225( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4)
{
  if (a3[1] >> 60 == 2LL)
  {
    [*(id *)(*(void *)(a1 + 32) + 496) vmuVMRegionForNode:a2];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [v19 type];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 hasPrefix:@"__DATA"])
    {
      [v19 path];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 lastPathComponent];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 hasPrefix:@"dyld"];

      if (v11)
      {
        uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 496) rangeForSymbolName:@"_main_thread" inRegion:v19];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v12;
          int v14 = [*(id *)(*(void *)(a1 + 32) + 496) is64bit];
          uint64_t v15 = 348LL;
          if (v14) {
            uint64_t v15 = 568LL;
          }
          uint64_t v16 = v13 - *a3 + v15;
          uint64_t v17 = *(void *)(a1 + 40);
          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 496LL);
          v20[0] = MEMORY[0x1895F87A8];
          v20[1] = 3221225472LL;
          v20[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2;
          v20[3] = &unk_189DFD520;
          v20[4] = v17;
          v20[5] = v16;
          v20[6] = a4;
          [v18 enumerateReferencesOfNode:a2 withBlock:v20];
        }
      }
    }

    else
    {
    }
  }

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  _BYTE *a6)
{
  if (*(void *)(a5 + 8) == *(void *)(result + 40))
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a6 = 1;
    **(_BYTE **)(result + 48) = 1;
  }

  return result;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3( uint64_t a1,  uint64_t a2,  unint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  unsigned int v8 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5)] != -1)
  {
    if (v8 != (_DWORD)a5
      && (*(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * a5 + 8) & 7LL) == 5)
    {
      unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * a5 + 8);
      ++*(_DWORD *)(*(void *)(a1 + 128) + ((v10 >> 39) & 0x1FFFFFC));
    }

    if ((*(_BYTE *)(a1 + 136) & 4) != 0)
    {
      uint64_t v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16LL * v8 + 8) & 7))
      {
        uint64_t v12 = (void *)MEMORY[0x186E32E40]();
        uint64_t v13 = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32) + 96LL)
                                + ((*(void *)(*(void *)(*(void *)(a1 + 32) + 80LL) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0LL)));
        int v14 = v13;
        if ((v13[132] & 2) != 0)
        {
          if ((v13[132] & 4) == 0) {
            goto LABEL_17;
          }
        }

        else if ((v13[132] & 4) == 0)
        {
          if (![v13 isStack]
            || a3 - *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 32LL) < *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL)
                                                                                            + 40LL))
          {
            goto LABEL_32;
          }

          if (a3 - *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 32LL) >= *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL)
                                                                                             + 40LL))
          {
            uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 136) indexForLocation:a3];
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
              uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 136) rangeAtIndex:v15];
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
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
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

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_246( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5)];
}

- (id)processSnapshotGraph
{
  return -[VMUTaskMemoryScanner processSnapshotGraphWithOptions:](self, "processSnapshotGraphWithOptions:", 5LL);
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

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUTaskMemoryScanner *)self
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
  if (-[VMUTaskMemoryScanner nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    -[VMUTaskMemoryScanner nodeDetails:](self, "nodeDetails:", v3);
    -[VMUTaskMemoryScanner vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
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
  os_signpost_id_t v21 = v19 + 64;
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
  *os_signpost_id_t v21 = ((unint64_t)((char *)v5 - (char *)var4) >> 6) + 1;
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
    -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:]( self->_objectIdentifier,  "labelForMemory:length:remoteAddress:classInfo:",  -[VMUTaskMemoryScanner contentForNode:](self, "contentForNode:", v3),  (*((void *)v5 + 1) >> 5) & 0xFFFFFFFFFLL,  v5->var0,  v7);
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
  uint64_t v12 = (_DWORD *)MEMORY[0x1895FD580];
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
    os_signpost_id_t v21 = &var4[(unint64_t)(v17 - 1)];
    if (var0 - *((void *)v21->var0 + 1) < *((void *)v21->var0 + 2)) {
      goto LABEL_12;
    }
  }

  unint64_t var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    return 0LL;
  }
  uint64_t v45 = regionMap->var4;
  while (1)
  {
    unint64_t v46 = var5 >> 1;
    os_signpost_id_t v21 = &v45[var5 >> 1];
    if (*((void *)v21->var0 + 1) <= var0) {
      break;
    }
LABEL_29:
    BOOL v8 = var5 >= 2;
    unint64_t var5 = v46;
    if (!v8) {
      return 0LL;
    }
  }

  if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) <= var0)
  {
    uint64_t v45 = v21 + 1;
    unint64_t v46 = --var5 >> 1;
    goto LABEL_29;
  }

  int v63 = [v21->var0 isSpecialPhysFootprintRegion];
  uint64_t result = 0LL;
  if (v63) {
    unint64_t v64 = 0LL;
  }
  else {
    unint64_t v64 = (unint64_t)v21;
  }
  if ((v63 & 1) == 0)
  {
    if ((*(_BYTE *)(*(void *)v64 + 132LL) & 1) == 0) {
      goto LABEL_75;
    }
    uint64_t v65 = (id *)(v64 + 64);
    unint64_t v66 = regionMap->var5 - ((uint64_t)(v64 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v66) {
      goto LABEL_72;
    }
    while (1)
    {
      unint64_t v67 = v66 >> 1;
      unint64_t v68 = &v65[8 * (v66 >> 1)];
      if (*((void *)*v68 + 1) <= var0)
      {
        if (*((void *)*v68 + 2) + *((void *)*v68 + 1) > var0)
        {
          else {
            unint64_t v66 = (unint64_t)v68;
          }
LABEL_72:
          if (v66) {
            unint64_t v64 = v66;
          }
          os_signpost_id_t v21 = (_VMURegionNode *)v64;
LABEL_75:
          *unint64_t v18 = ((v64 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          uint64_t v22 = a3;
          BOOL v23 = &self->_blocks[a3];
          unint64_t v24 = ((*((void *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            unsigned int regionsCount = self->_regionsCount;
            unint64_t v29 = self->_task;
            unint64_t v83 = memoryCache;
            if (!v21->var7 && ([v21->var0 isSpecialPhysFootprintRegion] & 1) == 0)
            {
              int v50 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v83,  "mapAddress:size:returnedAddress:returnedSize:",  *((void *)v21->var0 + 1),  *((void *)v21->var0 + 2),  v85,  v90);
              if (v50)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  int v51 = v50;
                  BOOL v52 = task_exists(v29);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v52)
                  {
                    uint64_t v79 = (FILE *)*MEMORY[0x1895F89D0];
                    uint64_t v81 = v22;
                    uint64_t v53 = [v21->var0 address];
                    uint64_t v54 = *((unsigned int *)v21->var0 + 6);
                    uint64_t v55 = vm_prot_strings[v54];
                    uint64_t v56 = *((void *)v21->var0 + 2) + *((void *)v21->var0 + 1);
                    VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)v21->var0 + 232),  *((unsigned __int8 *)v21->var0 + 104),  *((unsigned __int8 *)v21->var0 + 50),  v54,  *((unsigned __int8 *)v21->var0 + 49));
                    id v58 = v57 = v29;
                    os_signpost_id_t v59 = (const char *)[v58 UTF8String];
                    uint64_t v60 = *((void *)v21->var0 + 2) >> *v12;
                    int v61 = "pages";
                    if (v60 == 1) {
                      int v61 = "page";
                    }
                    if (v21->var4 == v21->var5) {
                      os_signpost_id_t v62 = "";
                    }
                    else {
                      os_signpost_id_t v62 = " [root]";
                    }
                    uint64_t v78 = v53;
                    uint64_t v22 = v81;
                    fprintf( v79,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v78,  v56,  v55,  v59,  v60,  v61,  v62,  v51);

                    unint64_t v29 = v57;
                  }
                }
              }

              else
              {
                uint64_t v76 = (void *)v85[0];
                v21->unint64_t var6 = v90[0];
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
            unint64_t v28 = self->_memoryCache;
            objectIdentifier = self->_objectIdentifier;
            unint64_t v29 = self->_task;
            unint64_t v83 = objectIdentifier;
            unint64_t v30 = v28;
            unint64_t v31 = v30;
            uint64_t v32 = 0LL;
            if ((_DWORD)v25)
            {
              uint64_t v33 = v25;
              uint64_t v34 = v21;
              do
              {
                uint64_t v35 = v34->var0;
                ++v34;
                v32 += v35[2];
                --v33;
              }

              while (v33);
            }

            v90[0] = 0LL;
            unint64_t v84 = 0LL;
            uint64_t v36 = -[VMUTaskMemoryCache findMappedAddress:size:]( v30,  "findMappedAddress:size:",  *((void *)v21->var0 + 1),  v32);
            if (v36)
            {
              unint64_t var1 = v36->var1;
              unint64_t v38 = *((void *)v21->var0 + 1) - v36->var0;
              v90[0] = v36->var2 + v38;
              unint64_t v84 = var1 - v38;
              goto LABEL_20;
            }

            uint64_t v80 = v29;
            uint64_t v82 = v22;
            if ((_DWORD)v25)
            {
              unint64_t v70 = 0LL;
              do
              {
                unint64_t v71 = v83;
                uint64_t v72 = v31;
                unint64_t v73 = v72;
                if (v21[v70 / 0x40].var7)
                {
                  if (&v21[v70 / 0x40] == v21[v70 / 0x40].var8)
                  {
                    v85[0] = MEMORY[0x1895F87A8];
                    v85[1] = 3221225472LL;
                    v85[2] = ___unmapRegion_block_invoke;
                    v85[3] = &unk_189DFD5E8;
                    uint64_t v86 = v72;
                    id v88 = &v21[v70 / 0x40];
                    uint64_t v87 = v71;
                    unint64_t v89 = v21;
                    unint64_t v75 = (void (**)(void))MEMORY[0x186E33044](v85);
                    v75[2]();
                  }

                  else
                  {
                    os_signpost_id_t v74 = &v21[v70 / 0x40];
                    v74->unint64_t var6 = 0LL;
                    v74->unint64_t var7 = 0LL;
                    v74->var8 = 0LL;
                  }
                }

                v70 += 64LL;
              }

              while ((unint64_t)v25 << 6 != v70);
            }

            unint64_t v29 = v80;
            uint64_t v22 = v82;
            if (-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( v31,  "mapAddress:size:returnedAddress:returnedSize:",  *((void *)v21->var0 + 1),  v32,  v90,  &v84))
            {
              if (task_exists(v80)) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *((void *)v21->var0 + 1),  *((void *)v21->var0 + 1) + v32);
              }
            }

            else
            {
LABEL_20:
              if ((_DWORD)v25)
              {
                unint64_t v39 = 0LL;
                unint64_t v40 = v84;
                do
                {
                  uint64_t v41 = &v21[v39 / 0x40];
                  v41->var8 = v21;
                  v41->unint64_t var6 = v40;
                  uint64_t v42 = v90[0];
                  v41->unint64_t var7 = (void *)v90[0];
                  uint64_t v43 = (uint64_t)v21[v39 / 0x40].var0 + 8;
                  v90[0] = *((void *)v21[v39 / 0x40].var0 + 2) + v42;
                  unint64_t v40 = v84 - *(void *)(v43 + 8);
                  unint64_t v84 = v40;
                  v39 += 64LL;
                }

                while ((unint64_t)v25 << 6 != v39);
              }
            }
          }

          unint64_t v77 = (char *)v21->var7;
          if (v77) {
            return &v77[self->_blocks[v22].var0 - *((void *)v21->var0 + 1)];
          }
          return 0LL;
        }

        uint64_t v65 = v68 + 8;
        unint64_t v67 = --v66 >> 1;
      }

      BOOL v69 = v66 > 1;
      unint64_t v66 = v67;
      if (!v69)
      {
        unint64_t v66 = 0LL;
        goto LABEL_72;
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
  uint64_t v43 = (id *)(v42 + 64);
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
    uint64_t v43 = v46 + 8;
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
  _DWORD *v17 = ((v42 - (unint64_t)var4) >> 6) + 1;
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
        if (v30 < regionMap->var1 && (unint64_t v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
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
              unint64_t v31 = &p_var0[2 * v34];
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

- (_VMURegionNode)validateAddressRangeForSwiftRemoteMirror:(_VMURange)a3 allowUnusedSplitLibs:(BOOL)a4
{
  id v4 = 0LL;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v8 = var7 >= var6;
  unint64_t v9 = var7 - var6;
  if (!v8) {
    return v4;
  }
  unint64_t location = a3.location;
  if (a3.location - var6 >= v9) {
    return v4;
  }
  BOOL v11 = a4;
  unint64_t length = a3.length;
  unint64_t v14 = (_DWORD *)MEMORY[0x1895FD580];
  unint64_t v15 = a3.location >> *MEMORY[0x1895FD580];
  if (v15)
  {
    var3 = regionMap->var3;
    unint64_t v17 = a3.location >> *MEMORY[0x1895FD580];
    while (*var3 > (v17 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) != 0)
    {
      v17 >>= 26;
      if (!v17) {
        goto LABEL_9;
      }
    }

    return 0LL;
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
      unint64_t v17 = (void (*)(void *, unint64_t, void *, unsigned __int8 *))v6[2];
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
  v7[2] = __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_189DFD5C0;
  char v9 = v15;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  unint64_t v10 = &v11;
  -[VMUTaskMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v7);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
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
  unsigned int v36 = regionMap->var4;
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
    unsigned int v36 = v18 + 1;
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
  unint64_t v40 = (id *)(v39 + 64);
  unint64_t v41 = regionMap->var5 - ((uint64_t)(v39 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v41) {
    goto LABEL_52;
  }
  while (2)
  {
    unint64_t v42 = v41 >> 1;
    uint64_t v43 = &v40[8 * (v41 >> 1)];
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
    unint64_t v40 = v43 + 8;
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
  _DWORD *v15 = ((v39 - (unint64_t)var4) >> 6) + 1;
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
            unint64_t v30 = &var0[v29].var0;
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
              unint64_t v30 = &p_var0[2 * v32];
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
  unint64_t v17 = v15 + 64;
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
  _DWORD *v17 = ((v41 - (unint64_t)var4) >> 6) + 1;
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

- (NSDictionary)ledger
{
  return -[VMUVMRegionIdentifier ledger](self->_regionIdentifier, "ledger");
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  -[VMUTaskMemoryScanner ledger](self, "ledger");
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
  self->_scanningMask = a3;
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

- (BOOL)mallocEnumerationShouldFail
{
  return self->_mallocEnumerationShouldFail;
}

- (void)setMallocEnumerationShouldFail:(BOOL)a3
{
  self->_mallocEnumerationShouldFail = a3;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  return *(_VMUBlockNode **)(v0 + 80);
}

- (void).cxx_destruct
{
}

- (void)initWithVMUTask:options:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "-[VMUTaskMemoryScanner _initWithTask:options:]: region identifier detected no regions, so returning nil VMUTaskMemoryScanner",  v0,  2u);
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1( uint64_t a1,  uint64_t a2,  mach_error_t error_value)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*(void *)(*(void *)(*(void *)a1 + 208LL) + 24 * a2 + 8)) {
    id v4 = *(const __CFString **)(*(void *)(*(void *)a1 + 208LL) + 24 * a2 + 8);
  }
  else {
    id v4 = @"UNKNOWN";
  }
  int v5 = 138412802;
  id v6 = v4;
  __int16 v7 = 2080;
  BOOL v8 = mach_error_string(error_value);
  __int16 v9 = 1024;
  mach_error_t v10 = error_value;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "error: malloc enumeration of zone %@ failed to get full information about malloc metadata and/or allocations wit h the error %s (%d). It is likely that the target was suspended while malloc metadata was being modified.",  (uint8_t *)&v5,  0x1Cu);
}

@end