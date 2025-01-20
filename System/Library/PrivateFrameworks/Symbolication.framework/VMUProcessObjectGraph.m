@interface VMUProcessObjectGraph
+ (id)createWithTask:(unsigned int)a3;
- ($938B03310D06493B2963E5A84CB75A7E)autoreleasePoolOffsets;
- (BOOL)didPhysFootprintDirtyAccounting;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)nodeDetailIsAutoreleasePoolContentPage:(id)a3;
- (BOOL)nodeIsAutoreleasePoolContentPage:(unsigned int)a3;
- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8;
- (BOOL)showRawClassNames;
- (BOOL)showsPhysFootprint;
- (NSArray)backtraces;
- (NSDate)snapshotDate;
- (NSDictionary)ledger;
- (NSDictionary)srcAddressToExtraAutoreleaseCountDict;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUNodeToStringMap)nodeLabels;
- (VMUProcessObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUProcessObjectGraph)initWithPid:(int)a3 nodes:(_VMUBlockNode *)a4 nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:;
- (VMUStackLogReader)stackLogReader;
- (VMUSymbolStore)symbolStore;
- (VMUTaskMemoryScanner)scanner;
- (_CSArchitecture)parseMacOSArchitectureFromProcessDescription;
- (_VMURange)binarySectionRangeContainingAddress:(unint64_t)a3;
- (_VMURange)dyldSharedCacheRange;
- (_VMURange)rangeForSymbolName:(id)a3 inRegion:(id)a4;
- (_VMURange)regionSymbolRangeContainingAddress:(unint64_t)a3;
- (id)_descriptionForRegionAddress:(unint64_t)a3 withOffset:(unint64_t)a4 showSegment:(BOOL)a5;
- (id)_detailedNodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6;
- (id)binarySectionNameForAddress:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)labelForNode:(unsigned int)a3;
- (id)leakedNodesGraph;
- (id)nodeDescription:(unsigned int)a3;
- (id)nodeDescription:(unsigned int)a3 withDestinationNode:(unsigned int)a4 referenceInfo:(id *)a5;
- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4;
- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4 showLabel:(BOOL)a5;
- (id)nodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5;
- (id)referenceDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6;
- (id)regionSymbolNameForAddress:(unint64_t)a3;
- (id)sampleBacktracesString;
- (id)shortLabelForNode:(unsigned int)a3;
- (id)shortNodeDescription:(unsigned int)a3;
- (id)threadNameForAddress:(unint64_t)a3;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (id)vmuVMRegionForNode:(unsigned int)a3;
- (id)zoneNameForIndex:(unsigned int)a3;
- (int)pid;
- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unint64_t)serializationOptions;
- (unint64_t)snapshotMachTime;
- (unsigned)enumerateReferencesFromDataRegion:(id)a3 atGlobalSymbol:(id)a4 withBlock:(id)a5;
- (unsigned)enumerateRegionsWithBlock:(id)a3;
- (unsigned)idleExitStatus;
- (unsigned)kernelPageSize;
- (unsigned)nodeReferencedFromDataRegion:(id)a3 byGlobalSymbol:(id)a4;
- (unsigned)objectContentLevel;
- (unsigned)objectContentLevelForNodeLabels;
- (unsigned)regionCount;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_deriveObjcClassStructureRanges;
- (void)_generateSymbolStoreFromExistingGraph;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)_reorderLabelsWithNodeNameMap:(unsigned int *)a3;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)contentForNode:(unsigned int)a3;
- (void)copyUserMarked;
- (void)dealloc;
- (void)markLeafNodes:(void *)a3;
- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4;
- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4 options:(unsigned int)a5;
- (void)markRootNodes:(void *)a3;
- (void)parseAddressesFromNodeLabelsIntoSymbolStore;
- (void)refineEdges:(unsigned int)a3 withOptions:(unsigned int)a4 markingInvalid:(void *)a5;
- (void)refineTypesWithOverlay:(id)a3;
- (void)removeWeakEdges;
- (void)resymbolicateNonObjectsUsingStackBacktrace;
- (void)resymbolicatePrivateMaps;
- (void)setBacktraces:(id)a3;
- (void)setBinaryImagesDescription:(id)a3;
- (void)setBinarySectionName:(id)a3 forRange:(_VMURange)a4;
- (void)setDebugTimer:(id)a3;
- (void)setDidPhysFootprintDirtyAccounting:(BOOL)a3;
- (void)setDyldSharedCacheRange:(_VMURange)a3;
- (void)setIdleExitStatus:(unsigned int)a3;
- (void)setIsTranslatedByRosetta:(BOOL)a3;
- (void)setLabel:(id)a3 forNode:(unsigned int)a4;
- (void)setLedger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setObjectContentLevelForNodeLabels:(unsigned int)a3;
- (void)setPhysicalFootprint:(unint64_t)a3;
- (void)setPhysicalFootprintPeak:(unint64_t)a3;
- (void)setProcessDescriptionString:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setRegionSymbolName:(id)a3 forRange:(_VMURange)a4;
- (void)setScanner:(id)a3;
- (void)setSerializationOptions:(unint64_t)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setShowsPhysFootprint:(BOOL)a3;
- (void)setSnapshotDate:(id)a3;
- (void)setSnapshotMachTime:(unint64_t)a3;
- (void)setSrcAddressToExtraAutoreleaseCountDict:(id)a3;
- (void)setStackLogReader:(id)a3;
- (void)setSymbolStore:(id)a3;
- (void)setThreadName:(id)a3 forRange:(_VMURange)a4;
- (void)setUserMarked:(void *)a3;
@end

@implementation VMUProcessObjectGraph

+ (id)createWithTask:(unsigned int)a3
{
  id v3 = -[VMUTaskMemoryScanner initFullyWithTask:]( objc_alloc(&OBJC_CLASS___VMUTaskMemoryScanner),  "initFullyWithTask:",  *(void *)&a3);
  [v3 processSnapshotGraph];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VMUProcessObjectGraph)initWithPid:(int)a3 nodes:(_VMUBlockNode *)a4 nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:
{
  v8 = v7;
  v9 = v6;
  v10 = v5;
  uint64_t v11 = v4;
  v40[3] = *MEMORY[0x1895F89C0];
  id v15 = v5;
  id v36 = v9;
  id v16 = v8;
  id v35 = v41;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  v17 = -[VMUObjectGraph initWithNodesNoCopy:nodeCount:](&v38, sel_initWithNodesNoCopy_nodeCount_, a4, v11);
  v18 = v17;
  if (v17)
  {
    v37.receiver = v17;
    v37.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
    -[VMUObjectGraph setIndexedClassInfos:](&v37, sel_setIndexedClassInfos_, v36);
    *(&v18->super._referencingCount + 1) = a3;
    LODWORD(v18->_scanner) = *MEMORY[0x1895FD590];
    HIDWORD(v18->_scanner) = *MEMORY[0x1895FD568];
    objc_storeStrong((id *)&v18->_regionCount, v10);
    objc_storeStrong((id *)&v18->_machAbsolute, v8);
    LODWORD(v18->_regions) = [v16 count];
    uint64_t v19 = objc_opt_new();
    binaryImagesDescription = v18->_binaryImagesDescription;
    v18->_binaryImagesDescription = (NSString *)v19;

    uint64_t v21 = objc_opt_new();
    threadNameRanges = v18->_threadNameRanges;
    v18->_threadNameRanges = (VMURangeToStringMap *)v21;

    uint64_t v23 = objc_opt_new();
    binarySectionNameRanges = v18->_binarySectionNameRanges;
    v18->_binarySectionNameRanges = (VMURangeToStringMap *)v23;

    objc_storeStrong((id *)&v18->_gotObjcClassStructureRanges, v41);
    v39[0] = @"parentPageOffset";
    [MEMORY[0x189607968] numberWithUnsignedInt:v43[1]];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v39[1] = @"firstEntryOffset";
    [MEMORY[0x189607968] numberWithUnsignedInt:v43[2]];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v26;
    v39[2] = @"childPageOffset";
    [MEMORY[0x189607968] numberWithUnsignedInt:v43[6]];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v27;
    uint64_t v28 = [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:3];
    pthreadOffsets = v18->_pthreadOffsets;
    v18->_pthreadOffsets = (NSDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    symbolStore = v18->_symbolStore;
    v18->_symbolStore = (VMUSymbolStore *)v30;

    LODWORD(v18->_physicalFootprintPeak) = 0;
    if (v42)
    {
      size_t v32 = ((*v42 + 7) >> 3) + 4;
      v33 = (NSDictionary *)malloc(v32);
      memcpy(v33, v42, v32);
      v18->_autoreleasePoolOffsets = v33;
    }
  }

  return v18;
}

- (void)dealloc
{
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    free(autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  -[VMUObjectGraph dealloc](&v4, sel_dealloc);
}

- (VMUProcessObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v162[3] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  v160.receiver = self;
  v160.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  v14 = -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:]( &v160,  sel_initWithArchived_version_options_diskLogs_error_,  v12,  a4,  a5,  v13,  a7);
  if (!v14) {
    goto LABEL_91;
  }
  id v149 = v13;
  uint64_t v159 = 0LL;
  if (a7) {
    id v15 = a7;
  }
  else {
    id v15 = (id *)&v159;
  }
  [v12 objectForKeyedSubscript:@"processGraphInfo"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:@"pid"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 49) = [v17 intValue];

  [v16 objectForKeyedSubscript:@"processName"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 copy];
  v20 = (void *)*((void *)v14 + 31);
  *((void *)v14 + 31) = v19;

  [v16 objectForKeyedSubscript:@"processDescriptionString"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 copy];
  uint64_t v23 = (void *)*((void *)v14 + 32);
  *((void *)v14 + 32) = v22;

  [v16 objectForKeyedSubscript:@"isTranslatedByRosetta"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v14[264] = [v24 BOOLValue];

  [v16 objectForKeyedSubscript:@"binaryImagesDescription"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v25,  objc_opt_class(),  a5);
  v27 = (void *)*((void *)v14 + 35);
  *((void *)v14 + 35) = v26;

  unint64_t v150 = a5;
  [v16 objectForKeyedSubscript:@"showsPhysFootprint"];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v14[380] = [v28 BOOLValue];

  [v16 objectForKeyedSubscript:@"didPhysFootprintDirtyAccounting"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14[381] = [v29 BOOLValue];

  [v16 objectForKeyedSubscript:@"vmPageSize"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 52) = [v30 unsignedIntValue];

  [v16 objectForKeyedSubscript:@"kernPageSize"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 53) = [v31 unsignedIntValue];

  if (!*((_DWORD *)v14 + 52)) {
    *((_DWORD *)v14 + 52) = *((_DWORD *)v14 + 53);
  }
  [v16 objectForKeyedSubscript:@"dyldSharedCacheBase"];
  size_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [v32 unsignedLongLongValue];

  [v16 objectForKeyedSubscript:@"dyldSharedCacheLength"];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v34 unsignedLongLongValue];

  *((void *)v14 + 57) = v33;
  *((void *)v14 + 58) = v35;
  [v16 objectForKeyedSubscript:@"zoneNames"];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 copy];
  objc_super v38 = (void *)*((void *)v14 + 30);
  *((void *)v14 + 30) = v37;

  [v16 objectForKeyedSubscript:@"regionCount"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (unsigned int *)(v14 + 232);
  *((_DWORD *)v14 + 58) = [v39 unsignedIntValue];

  [v16 objectForKeyedSubscript:@"machTime"];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *((void *)v14 + 27) = [v41 unsignedLongLongValue];

  [v16 objectForKeyedSubscript:@"snapshotDate"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [v42 copy];
  v44 = (void *)*((void *)v14 + 54);
  *((void *)v14 + 54) = v43;

  [v16 objectForKeyedSubscript:@"physFootprint"];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *((void *)v14 + 45) = [v45 unsignedLongLongValue];

  [v16 objectForKeyedSubscript:@"physFootprintPeak"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *((void *)v14 + 46) = [v46 unsignedLongLongValue];

  [v16 objectForKeyedSubscript:@"pthreadOffsets"];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = [v47 copy];
  v49 = (void *)*((void *)v14 + 40);
  *((void *)v14 + 40) = v48;

  [v16 objectForKeyedSubscript:@"objectContentLevel"];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 96) = [v50 unsignedIntValue];

  *((_DWORD *)v14 + 97) = *((_DWORD *)v14 + 96);
  [v16 objectForKeyedSubscript:@"srcAddressToExtraAutoreleaseCountDict"];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v51,  objc_opt_class(),  a5);
  if (!v52)
  {
LABEL_18:
    [v16 objectForKeyedSubscript:@"VMUVMRegionCurrentVersion"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = [v63 integerValue];

    if (v64 <= [(id)objc_opt_class() version] && *v40)
    {
      [v16 objectForKeyedSubscript:@"regionData"];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v65,  0LL,  v150);

      uint64_t v66 = [v16 objectForKeyedSubscript:@"regionDataSerializer"];
      if (!v66)
      {
        [v16 objectForKeyedSubscript:@"regionDataSerializerCompressed"];
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v66 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v67,  objc_opt_class(),  v150);
      }

      v145 = v52;
      v143 = (void *)v66;
      v148 = -[VMUSimpleDeserializer initWithData:]( objc_alloc(&OBJC_CLASS___VMUSimpleDeserializer),  "initWithData:",  v66);
      v68 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*v40];
      if (*v40)
      {
        unint64_t v69 = 0LL;
        v70 = v144;
        while (1)
        {
          v71 = -[VMUVMRegion initWithVMRegionData:encodedVersion:simpleSerializer:error:]( objc_alloc(&OBJC_CLASS___VMUVMRegion),  "initWithVMRegionData:encodedVersion:simpleSerializer:error:",  v70,  v64,  v148,  v15);
          v72 = v71;
          if (*v15) {
            break;
          }
          [v68 addObject:v71];

          ++v69;
          v70 += 128;
          if (v69 >= *v40) {
            goto LABEL_29;
          }
        }

        v88 = 0LL;
        goto LABEL_55;
      }

void __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  unsigned int v4 = a2;
  [*(id *)(a1 + 32) vmuVMRegionForNode:a2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 40))
  {
    v7 = *(unsigned int **)(a1 + 48);
    if (*v7 > v4) {
      *((_BYTE *)v7 + (v4 >> 3) + 4) |= 1 << (v4 & 7);
    }
    *a3 = 1;
  }
}

id __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  return [super setClassInfoIndex:a3 forNode:a2];
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  stackLogReader = self->_stackLogReader;
  if (stackLogReader)
  {
    uint64_t v8 = -[VMUGraphStackLogReader signpostID](stackLogReader, "signpostID");
    stackLogReader = self->_stackLogReader;
    if (v8)
    {
      -[VMUGraphStackLogReader logHandle](stackLogReader, "logHandle");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_END,  v11,  "VMUProcessObjectGraph",  "",  buf,  2u);
        }
      }

      stackLogReader = self->_stackLogReader;
    }
  }

  -[VMUGraphStackLogReader endEvent:](stackLogReader, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:]( self->_stackLogReader,  "startWithCategory:message:",  "VMUProcessObjectGraph",  "archiving VMUObjectGraph and VMUDirectedGraph");
  id v12 = self->_stackLogReader;
  if (v12)
  {
    -[VMUGraphStackLogReader logHandle](v12, "logHandle");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "VMUProcessObjectGraph",  "archiving VMUObjectGraph and VMUDirectedGraph",  buf,  2u);
      }
    }
  }

  v150.receiver = self;
  v150.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  -[VMUObjectGraph archiveDictionaryRepresentation:options:]( &v150,  sel_archiveDictionaryRepresentation_options_,  v6,  a4);
  id v16 = self->_stackLogReader;
  if (v16)
  {
    uint64_t v17 = -[VMUGraphStackLogReader signpostID](v16, "signpostID");
    id v16 = self->_stackLogReader;
    if (v17)
    {
      -[VMUGraphStackLogReader logHandle](v16, "logHandle");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v18,  OS_SIGNPOST_INTERVAL_END,  v20,  "VMUProcessObjectGraph",  "",  buf,  2u);
        }
      }

      id v16 = self->_stackLogReader;
    }
  }

  -[VMUGraphStackLogReader endEvent:](v16, "endEvent:", "VMUProcessObjectGraph");
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  [MEMORY[0x189607968] numberWithInt:*((unsigned int *)&self->super._referencingCount + 1)];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v22 forKeyedSubscript:@"pid"];

  zoneNames = self->_zoneNames;
  if (zoneNames) {
    [v21 setObject:zoneNames forKeyedSubscript:@"processName"];
  }
  processName = self->_processName;
  if (processName) {
    [v21 setObject:processName forKeyedSubscript:@"processDescriptionString"];
  }
  if (LOBYTE(self->_processDescriptionString))
  {
    [MEMORY[0x189607968] numberWithBool:1];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v25 forKeyedSubscript:@"isTranslatedByRosetta"];
  }

  executablePath = self->_executablePath;
  if (executablePath)
  {
    v27 = +[VMUDirectedGraph _archivedObject:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedObject:options:",  executablePath,  a4);
    [v21 setObject:v27 forKeyedSubscript:@"binaryImagesDescription"];
  }

  [MEMORY[0x189607968] numberWithBool:BYTE4(self->_physicalFootprintPeak)];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v28 forKeyedSubscript:@"showsPhysFootprint"];

  [MEMORY[0x189607968] numberWithBool:BYTE5(self->_physicalFootprintPeak)];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v29 forKeyedSubscript:@"didPhysFootprintDirtyAccounting"];

  [MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(self->_scanner)];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v30 forKeyedSubscript:@"vmPageSize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:HIDWORD(self->_scanner)];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v31 forKeyedSubscript:@"kernPageSize"];

  uint64_t v32 = *(void *)&self->_regionCount;
  if (v32) {
    [v21 setObject:v32 forKeyedSubscript:@"zoneNames"];
  }
  [MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(self->_regions)];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v33 forKeyedSubscript:@"regionCount"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&self->_vmPageSize];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v34 forKeyedSubscript:@"machTime"];

  [v21 setObject:self->_nodeLabels forKeyedSubscript:@"snapshotDate"];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_debugTimer];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v35 forKeyedSubscript:@"physFootprint"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_physicalFootprint];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v36 forKeyedSubscript:@"physFootprintPeak"];

  [v21 setObject:*(void *)&self->_gotObjcClassStructureRanges forKeyedSubscript:@"pthreadOffsets"];
  [v21 setObject:self->_pthreadOffsets forKeyedSubscript:@"autoreleasePoolOffsets"];
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_idleExitStatus];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v37 forKeyedSubscript:@"objectContentLevel"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_ledger];
  objc_super v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v38 forKeyedSubscript:@"dyldSharedCacheBase"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_dyldSharedCacheRange.location];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v39 forKeyedSubscript:@"dyldSharedCacheLength"];

  unint64_t v147 = a4;
  if ([*(id *)&self->_objectContentLevel count])
  {
    v40 = (void *)objc_opt_new();
    [v40 serialize32:[self->_objectContentLevel count]];
    v41 = *(void **)&self->_objectContentLevel;
    v148[0] = MEMORY[0x1895F87A8];
    v148[1] = 3221225472LL;
    v148[2] = __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke;
    v148[3] = &unk_189DFF9B8;
    id v42 = v40;
    id v149 = v42;
    [v41 enumerateKeysAndObjectsUsingBlock:v148];
    uint64_t v43 = (void *)[v42 copyContiguousData];
    v44 = +[VMUDirectedGraph _archivedObject:options:](&OBJC_CLASS___VMUDirectedGraph, "_archivedObject:options:", v43, a4);
    [v21 setObject:v44 forKeyedSubscript:@"srcAddressToExtraAutoreleaseCountDict"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[srcAddressToExtraAutoreleaseCountDict] Count: %lu\n\n",  [*(id *)&self->_objectContentLevel count]);
    }

    a4 = v147;
  }

  v45 = self->_stackLogReader;
  if (v45 && (uint64_t v46 = -[VMUGraphStackLogReader signpostID](v45, "signpostID"), v45 = self->_stackLogReader, v46))
  {
    -[VMUGraphStackLogReader logHandle](v45, "logHandle");
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    unint64_t v49 = 0x189DFB000LL;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v50 = v48;
      if (os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v47,  OS_SIGNPOST_INTERVAL_END,  v50,  "VMUProcessObjectGraph",  "",  buf,  2u);
      }
    }

    v45 = self->_stackLogReader;
  }

  else
  {
    unint64_t v49 = 0x189DFB000uLL;
  }

  -[VMUGraphStackLogReader endEvent:](v45, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:]( self->_stackLogReader,  "startWithCategory:message:",  "VMUProcessObjectGraph",  "archiving region data");
  v51 = self->_stackLogReader;
  if (v51)
  {
    -[VMUGraphStackLogReader logHandle](v51, "logHandle");
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v54 = v53;
      if (os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v52,  OS_SIGNPOST_INTERVAL_BEGIN,  v54,  "VMUProcessObjectGraph",  "archiving region data",  buf,  2u);
      }
    }
  }

  if (LODWORD(self->_regions))
  {
    unsigned int v55 = (void *)objc_opt_new();
    uint64_t regions_low = LODWORD(self->_regions);
    uint64_t v57 = (char *)malloc(regions_low << 7);
    uint64_t v58 = v57;
    if ((_DWORD)regions_low)
    {
      unint64_t v59 = 0LL;
      v60 = v57;
      do
      {
        [(id)self->_machAbsolute objectAtIndexedSubscript:v59];
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 getVMRegionData:v60 withSimpleSerializer:v55];

        ++v59;
        unint64_t v62 = LODWORD(self->_regions);
        v60 += 128;
      }

      while (v59 < v62);
      a4 = v147;
      unint64_t v49 = 0x189DFB000LL;
    }

    else
    {
      LODWORD(v62) = 0;
    }

    [*(id *)(v49 + 3800) _archivedBytes:v58 length:(unint64_t)v62 << 7 options:a4];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v63 forKeyedSubscript:@"regionData"];

    v146 = v58;
    uint64_t v64 = LODWORD(self->_regions);
    v65 = (char *)malloc(16 * v64);
    uint64_t v66 = v65;
    if ((_DWORD)v64)
    {
      id v67 = v6;
      unint64_t v68 = 0LL;
      unint64_t v69 = v65;
      do
      {
        [(id)self->_machAbsolute objectAtIndexedSubscript:v68];
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v70 getVMRegionDataExtra:v69];

        ++v68;
        unint64_t v71 = LODWORD(self->_regions);
        v69 += 16;
      }

      while (v68 < v71);
      id v6 = v67;
      unint64_t v49 = 0x189DFB000LL;
    }

    else
    {
      LODWORD(v71) = 0;
    }

    [*(id *)(v49 + 3800) _archivedBytes:v66 length:16 * v71 options:v147];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v72 forKeyedSubscript:@"regionDataExtra"];

    if (LODWORD(self->_regions))
    {
      [(id)self->_machAbsolute objectAtIndexedSubscript:0];
      v73 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      int v74 = v73[232];

      if (v74)
      {
        uint64_t v75 = LODWORD(self->_regions);
        v76 = (char *)malloc(4 * v75);
        v77 = v76;
        if ((_DWORD)v75)
        {
          id v145 = v6;
          unint64_t v78 = 0LL;
          v79 = v76;
          do
          {
            [(id)self->_machAbsolute objectAtIndexedSubscript:v78];
            unint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
            [v80 getVMRegionExclaveFlagsData:v79];

            ++v78;
            unint64_t v81 = LODWORD(self->_regions);
            v79 += 4;
          }

          while (v78 < v81);
          id v6 = v145;
        }

        else
        {
          LODWORD(v81) = 0;
        }
        v82 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  v77,  4LL * v81,  v147);
        [v21 setObject:v82 forKeyedSubscript:@"exclaveFlagData"];

        free(v77);
      }
    }

    int v83 = (void *)[v55 copyContiguousData];
    v84 = +[VMUDirectedGraph _archivedObject:options:](&OBJC_CLASS___VMUDirectedGraph, "_archivedObject:options:", v83, v147);
    [v21 setObject:v84 forKeyedSubscript:@"regionDataSerializerCompressed"];

    [MEMORY[0x189607968] numberWithInteger:[objc_opt_class() version]];
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v85 forKeyedSubscript:@"VMUVMRegionCurrentVersion"];

    free(v146);
    free(v66);

    a4 = v147;
    unint64_t v49 = 0x189DFB000uLL;
  }

  v86 = self->_stackLogReader;
  if (v86)
  {
    uint64_t v87 = -[VMUGraphStackLogReader signpostID](v86, "signpostID");
    v86 = self->_stackLogReader;
    if (v87)
    {
      -[VMUGraphStackLogReader logHandle](v86, "logHandle");
      v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v89 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v89 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v90 = v89;
        if (os_signpost_enabled(v88))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v88,  OS_SIGNPOST_INTERVAL_END,  v90,  "VMUProcessObjectGraph",  "",  buf,  2u);
        }
      }

      v86 = self->_stackLogReader;
    }
  }

  -[VMUGraphStackLogReader endEvent:](v86, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:]( self->_stackLogReader,  "startWithCategory:message:",  "VMUProcessObjectGraph",  "archiving thread / binary / regionSymbol to range mappings");
  v91 = self->_stackLogReader;
  if (v91)
  {
    -[VMUGraphStackLogReader logHandle](v91, "logHandle");
    id v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v93 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v93 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v94 = v93;
      if (os_signpost_enabled(v92))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v92,  OS_SIGNPOST_INTERVAL_BEGIN,  v94,  "VMUProcessObjectGraph",  "archiving thread / binary / regionSymbol to range mappings",  buf,  2u);
      }
    }
  }

  [*(id *)(v49 + 3800) _archivedObject:self->_binaryImagesDescription options:a4];
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v95 forKeyedSubscript:@"threadNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n",  -[NSString count](self->_binaryImagesDescription, "count"),  -[NSString uniquedStringCount](self->_binaryImagesDescription, "uniquedStringCount"));
  }
  [*(id *)(v49 + 3800) _archivedObject:self->_threadNameRanges options:a4];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v96 forKeyedSubscript:@"binarySectionNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](self->_threadNameRanges, "count"),  -[VMURangeToStringMap uniquedStringCount](self->_threadNameRanges, "uniquedStringCount"));
  }
  [*(id *)(v49 + 3800) _archivedObject:self->_binarySectionNameRanges options:a4];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v97 forKeyedSubscript:@"regionSymbolNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](self->_binarySectionNameRanges, "count"),  -[VMURangeToStringMap uniquedStringCount](self->_binarySectionNameRanges, "uniquedStringCount"));
  }
  uint64_t v98 = self->_stackLogReader;
  if (v98)
  {
    uint64_t v99 = -[VMUGraphStackLogReader signpostID](v98, "signpostID");
    uint64_t v98 = self->_stackLogReader;
    if (v99)
    {
      -[VMUGraphStackLogReader logHandle](v98, "logHandle");
      uint64_t v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v101 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v101 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v102 = v101;
        if (os_signpost_enabled(v100))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v100,  OS_SIGNPOST_INTERVAL_END,  v102,  "VMUProcessObjectGraph",  "",  buf,  2u);
        }
      }

      uint64_t v98 = self->_stackLogReader;
    }
  }

  -[VMUGraphStackLogReader endEvent:](v98, "endEvent:", "VMUProcessObjectGraph");
  if (-[VMUSymbolStore count](self->_symbolStore, "count"))
  {
    v103 = self->_stackLogReader;
    if (v103)
    {
      uint64_t v104 = -[VMUGraphStackLogReader signpostID](v103, "signpostID");
      v103 = self->_stackLogReader;
      if (v104)
      {
        -[VMUGraphStackLogReader logHandle](v103, "logHandle");
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v106 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v106 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v107 = v106;
          if (os_signpost_enabled(v105))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v105,  OS_SIGNPOST_INTERVAL_END,  v107,  "VMUProcessObjectGraph",  "",  buf,  2u);
          }
        }

        v103 = self->_stackLogReader;
      }
    }

    -[VMUGraphStackLogReader endEvent:](v103, "endEvent:", "VMUProcessObjectGraph");
    -[VMUGraphStackLogReader startWithCategory:message:]( self->_stackLogReader,  "startWithCategory:message:",  "VMUProcessObjectGraph",  "archiving node labels");
    v108 = self->_stackLogReader;
    if (v108)
    {
      -[VMUGraphStackLogReader logHandle](v108, "logHandle");
      v109 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v110 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v110 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v111 = v110;
        if (os_signpost_enabled(v109))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v109,  OS_SIGNPOST_INTERVAL_BEGIN,  v111,  "VMUProcessObjectGraph",  "archiving node labels",  buf,  2u);
        }
      }
    }

    [*(id *)(v49 + 3800) _archivedObject:self->_symbolStore options:a4];
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v112 forKeyedSubscript:@"nodeLabels"];

    uint64_t v113 = self->_stackLogReader;
    if (v113)
    {
      uint64_t v114 = -[VMUGraphStackLogReader signpostID](v113, "signpostID");
      uint64_t v113 = self->_stackLogReader;
      if (v114)
      {
        -[VMUGraphStackLogReader logHandle](v113, "logHandle");
        v115 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v116 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v116 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v117 = v116;
          if (os_signpost_enabled(v115))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v115,  OS_SIGNPOST_INTERVAL_END,  v117,  "VMUProcessObjectGraph",  "",  buf,  2u);
          }
        }

        uint64_t v113 = self->_stackLogReader;
      }
    }

    -[VMUGraphStackLogReader endEvent:](v113, "endEvent:", "VMUProcessObjectGraph");
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Node Labels] Count: %u  Uniqued string count: %u\n\n",  -[VMUSymbolStore count](self->_symbolStore, "count"),  -[VMUSymbolStore uniquedStringCount](self->_symbolStore, "uniquedStringCount"));
    }
  }

  else if (kVMUPrintArchivingTiming)
  {
    fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }

  if (self->_autoreleasePoolOffsets)
  {
    v118 = self->_stackLogReader;
    if (v118)
    {
      uint64_t v119 = -[VMUGraphStackLogReader signpostID](v118, "signpostID");
      v118 = self->_stackLogReader;
      if (v119)
      {
        -[VMUGraphStackLogReader logHandle](v118, "logHandle");
        v120 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v121 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v121 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v122 = v121;
          if (os_signpost_enabled(v120))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v120,  OS_SIGNPOST_INTERVAL_END,  v122,  "VMUProcessObjectGraph",  "",  buf,  2u);
          }
        }

        v118 = self->_stackLogReader;
      }
    }

    -[VMUGraphStackLogReader endEvent:](v118, "endEvent:", "VMUProcessObjectGraph");
    -[VMUGraphStackLogReader startWithCategory:message:]( self->_stackLogReader,  "startWithCategory:message:",  "VMUProcessObjectGraph",  "archiving userMarked");
    v123 = self->_stackLogReader;
    if (v123)
    {
      -[VMUGraphStackLogReader logHandle](v123, "logHandle");
      uint64_t v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v125 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v125 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v126 = v125;
        if (os_signpost_enabled(v124))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v124,  OS_SIGNPOST_INTERVAL_BEGIN,  v126,  "VMUProcessObjectGraph",  "archiving userMarked",  buf,  2u);
        }
      }
    }

    [*(id *)(v49 + 3800) _archivedBytes:length:options:];
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v127 forKeyedSubscript:@"userMarked"];

    char v128 = self->_stackLogReader;
    if (v128)
    {
      uint64_t v129 = -[VMUGraphStackLogReader signpostID](v128, "signpostID");
      char v128 = self->_stackLogReader;
      if (v129)
      {
        -[VMUGraphStackLogReader logHandle](v128, "logHandle");
        v130 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v131 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v131 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v132 = v131;
          if (os_signpost_enabled(v130))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v130,  OS_SIGNPOST_INTERVAL_END,  v132,  "VMUProcessObjectGraph",  "",  buf,  2u);
          }
        }

        char v128 = self->_stackLogReader;
      }
    }

    -[VMUGraphStackLogReader endEvent:](v128, "endEvent:", "VMUProcessObjectGraph");
  }

  userMarked = self->_userMarked;
  if (userMarked)
  {
    [*(id *)(v49 + 3800) _archivedObject:userMarked options:a4];
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v134 forKeyedSubscript:@"stackLogReader"];
  }

  uint64_t v135 = *(void *)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v135)
  {
    [*(id *)(v49 + 3800) _archivedObject:v135 options:a4];
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v136 forKeyedSubscript:@"backtraces"];
  }

  backtraces = self->_backtraces;
  if (backtraces)
  {
    [*(id *)(v49 + 3800) _archivedObject:backtraces options:a4];
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v138 forKeyedSubscript:@"symbolStore"];
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:[self idleExitStatus]];
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setObject:v139 forKeyedSubscript:@"idleExitStatus"];

  [v21 setObject:self->_serializationOptions forKeyedSubscript:@"ledger"];
  [v6 setObject:v21 forKeyedSubscript:@"processGraphInfo"];
  uint64_t v140 = self->_stackLogReader;
  if (v140)
  {
    uint64_t v141 = -[VMUGraphStackLogReader signpostID](v140, "signpostID");
    uint64_t v140 = self->_stackLogReader;
    if (v141)
    {
      -[VMUGraphStackLogReader logHandle](v140, "logHandle");
      v142 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v143 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v143 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v144 = v143;
        if (os_signpost_enabled(v142))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v142,  OS_SIGNPOST_INTERVAL_END,  v144,  "VMUProcessObjectGraph",  "",  buf,  2u);
        }
      }

      uint64_t v140 = self->_stackLogReader;
    }
  }

  -[VMUGraphStackLogReader endEvent:](v140, "endEvent:", "VMUProcessObjectGraph");
}

uint64_t __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 serialize64:[a2 unsignedLongLongValue]];
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 unsignedIntValue];

  return [v7 serialize32:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  id v4 = -[VMUObjectGraph copyWithZone:](&v9, sel_copyWithZone_, a3);
  *((_DWORD *)v4 + 49) = *(&self->super._referencingCount + 1);
  *((void *)v4 + 26) = self->_scanner;
  *((void *)v4 + 27) = *(void *)&self->_vmPageSize;
  objc_storeStrong((id *)v4 + 28, (id)self->_machAbsolute);
  *((_DWORD *)v4 + 58) = self->_regions;
  objc_storeStrong((id *)v4 + 30, *(id *)&self->_regionCount);
  objc_storeStrong((id *)v4 + 31, self->_zoneNames);
  objc_storeStrong((id *)v4 + 32, self->_processName);
  objc_storeStrong((id *)v4 + 35, self->_executablePath);
  *((_BYTE *)v4 + 380) = BYTE4(self->_physicalFootprintPeak);
  *((_BYTE *)v4 + 381) = BYTE5(self->_physicalFootprintPeak);
  objc_storeStrong((id *)v4 + 36, self->_binaryImagesDescription);
  objc_storeStrong((id *)v4 + 37, self->_threadNameRanges);
  objc_storeStrong((id *)v4 + 38, self->_binarySectionNameRanges);
  objc_storeStrong((id *)v4 + 40, *(id *)&self->_gotObjcClassStructureRanges);
  objc_storeStrong((id *)v4 + 41, self->_pthreadOffsets);
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    size_t v6 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
    v7 = malloc(v6);
    memcpy(v7, autoreleasePoolOffsets, v6);
  }

  else
  {
    v7 = 0LL;
  }

  *((void *)v4 + 42) = v7;
  objc_storeStrong((id *)v4 + 43, self->_userMarked);
  objc_storeStrong((id *)v4 + 49, *(id *)&self->_objectContentLevel);
  *((_DWORD *)v4 + 96) = self->_idleExitStatus;
  *((_DWORD *)v4 + 97) = *(_DWORD *)&self->_showsPhysFootprint;
  objc_storeStrong((id *)v4 + 51, *(id *)&self->_hasClassInfosDerivedFromStackBacktraces);
  objc_storeStrong((id *)v4 + 52, self->_backtraces);
  objc_storeStrong((id *)v4 + 53, self->_symbolStore);
  *((_DWORD *)v4 + 94) = self->_physicalFootprintPeak;
  objc_storeStrong((id *)v4 + 56, (id)self->_serializationOptions);
  return v4;
}

- (void)setThreadName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)threadNameForAddress:(unint64_t)a3
{
  return (id)-[NSString stringForAddress:](self->_binaryImagesDescription, "stringForAddress:", a3);
}

- (void)setBinarySectionName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)binarySectionNameForAddress:(unint64_t)a3
{
  backtraces = self->_backtraces;
  if (backtraces
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0)
    && (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (uint64_t Name = CSRegionGetName()) != 0))
  {
    [NSString stringWithUTF8String:Name];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = -[VMURangeToStringMap stringForAddress:](self->_threadNameRanges, "stringForAddress:", a3);
  }

  return v7;
}

- (_VMURange)binarySectionRangeContainingAddress:(unint64_t)a3
{
  backtraces = self->_backtraces;
  if (!backtraces
    || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
    || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (unint64_t Range = CSRegionGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t Range = -[VMURangeToStringMap rangeContainingAddress:](self->_threadNameRanges, "rangeContainingAddress:", a3);
  }

  result.length = v7;
  result.location = Range;
  return result;
}

- (void)_deriveObjcClassStructureRanges
{
  if (!LOBYTE(self->_regionSymbolNameRanges))
  {
    unint64_t v3 = +[VMUClassInfo sizeofClassStructure](&OBJC_CLASS___VMUClassInfo, "sizeofClassStructure");
    -[VMUProcessObjectGraph realizedClasses](self, "realizedClasses");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke;
    v5[3] = &unk_189DFF9E0;
    v5[4] = self;
    v5[5] = v3;
    [v4 enumerateInfosWithBlock:v5];

    LOBYTE(self->_regionSymbolNameRanges) = 1;
  }

void __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    BOOL v6 = ([v5 infoType] & 9) == 0;
    id v5 = v11;
    if (!v6)
    {
      unint64_t v7 = (void *)MEMORY[0x186E32E40](v11);
      uint64_t v8 = (void *)NSString;
      [v11 className];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"OBJC_CLASS_$_%@", v9];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(*(void *)(a1 + 32) + 304) setString:v10 forRange:a2];
      objc_autoreleasePoolPop(v7);
      id v5 = v11;
    }
  }
}

- (void)setRegionSymbolName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)regionSymbolNameForAddress:(unint64_t)a3
{
  if (!LOBYTE(self->_regionSymbolNameRanges)) {
    -[VMUProcessObjectGraph _deriveObjcClassStructureRanges](self, "_deriveObjcClassStructureRanges");
  }
  backtraces = self->_backtraces;
  if (backtraces
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0)
    && (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (uint64_t Name = CSSymbolGetName()) != 0))
  {
    [NSString stringWithUTF8String:Name];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[VMURangeToStringMap stringForAddress:](self->_binarySectionNameRanges, "stringForAddress:", a3);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (_VMURange)regionSymbolRangeContainingAddress:(unint64_t)a3
{
  if (!LOBYTE(self->_regionSymbolNameRanges)) {
    -[VMUProcessObjectGraph _deriveObjcClassStructureRanges](self, "_deriveObjcClassStructureRanges");
  }
  backtraces = self->_backtraces;
  if (!backtraces
    || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
    || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (unint64_t Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t Range = -[VMURangeToStringMap rangeContainingAddress:]( self->_binarySectionNameRanges,  "rangeContainingAddress:",  a3);
  }

  result.length = v7;
  result.location = Range;
  return result;
}

- (_VMURange)rangeForSymbolName:(id)a3 inRegion:(id)a4
{
  id v6 = a3;
  unint64_t v7 = a4;
  uint64_t v8 = v7;
  unint64_t v9 = 0LL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 && v7)
  {
    backtraces = self->_backtraces;
    if (!backtraces
      || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
      || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
          CSSymbolicatorGetSymbolWithAddressAtTime(),
          (CSIsNull() & 1) != 0)
      || (id v12 = (const char *)[v6 UTF8String],
          uint64_t Name = (const char *)CSSymbolGetName(),
          strcmp(v12, Name))
      || (uint64_t Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t Range = -[VMURangeToStringMap rangeForString:startingAtAddress:]( self->_binarySectionNameRanges,  "rangeForString:startingAtAddress:",  v6,  v8[1]);
    }

    uint64_t v10 = Range;
    unint64_t v9 = v15;
  }

  unint64_t v16 = v10;
  unint64_t v17 = v9;
  result.length = v17;
  result.location = v16;
  return result;
}

- (unsigned)enumerateReferencesFromDataRegion:(id)a3 atGlobalSymbol:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke;
  v15[3] = &unk_189DFFA30;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  uint64_t v19 = &v20;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v15);
  LODWORD(self) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return self;
}

void __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke( uint64_t a1,  uint64_t a2,  __int128 *a3,  _BYTE *a4)
{
  if (*((void *)a3 + 1) >> 60 == 2LL)
  {
    [*(id *)(a1 + 32) vmuVMRegionForNode:a2];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 type];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 hasPrefix:@"__DATA"])
    {
      [v18 path];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 lastPathComponent];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

      id v12 = v18;
      if (!v11)
      {
LABEL_8:

        return;
      }

      uint64_t v13 = [*(id *)(a1 + 32) rangeForSymbolName:*(void *)(a1 + 48) inRegion:v18];
      uint64_t v14 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2;
      v19[3] = &unk_189DFFA08;
      __int128 v22 = *a3;
      uint64_t v23 = *((void *)a3 + 2);
      uint64_t v24 = v13;
      uint64_t v25 = v15;
      id v16 = *(id *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 64);
      id v20 = v16;
      uint64_t v21 = v17;
      [v14 enumerateReferencesOfNode:a2 withBlock:v19];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
        *a4 = 1;
      }
      id v8 = v20;
    }

    id v12 = v18;
    goto LABEL_8;
  }

void *__84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2( void *result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  _BYTE *a6)
{
  id v6 = result;
  if (*(void *)(a5 + 8) + result[6] - result[9] >= result[10])
  {
    if (*(_DWORD *)(*(void *)(result[5] + 8LL) + 24LL)) {
      *a6 = 1;
    }
  }

  else
  {
    uint64_t v7 = result[4];
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v7 + 16);
    __int128 v9 = *(_OWORD *)(a5 + 16);
    v10[0] = *(_OWORD *)a5;
    v10[1] = v9;
    uint64_t v11 = *(void *)(a5 + 32);
    _VMURange result = (void *)v8(v7, a2, a3, a4, v10);
    ++*(_DWORD *)(*(void *)(v6[5] + 8LL) + 24LL);
  }

  return result;
}

- (unsigned)nodeReferencedFromDataRegion:(id)a3 byGlobalSymbol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke;
  v9[3] = &unk_189DFFA58;
  v9[4] = &v10;
  -[VMUProcessObjectGraph enumerateReferencesFromDataRegion:atGlobalSymbol:withBlock:]( self,  "enumerateReferencesFromDataRegion:atGlobalSymbol:withBlock:",  v6,  v7,  v9);
  LODWORD(self) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return self;
}

uint64_t __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a4;
  return result;
}

- (void)setLabel:(id)a3 forNode:(unsigned int)a4
{
}

- (id)labelForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((-[VMUProcessObjectGraph objectContentLevelForNodeLabels](self, "objectContentLevelForNodeLabels") & 0xFFFFFFFE) == 2)
  {
    -[VMUSymbolStore stringForNode:](self->_symbolStore, "stringForNode:", v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)hasLabelsForNodes
{
  return -[VMUSymbolStore count](self->_symbolStore, "count") != 0;
}

- (void)contentForNode:(unsigned int)a3
{
  return 0LL;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = v3;
    shortenString(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (VMUClassInfoMap)realizedClasses
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  -[VMUObjectGraph indexedClassInfos](&v3, sel_indexedClassInfos);
  return (VMUClassInfoMap *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)zoneCount
{
  return [*(id *)&self->_regionCount count];
}

- (id)zoneNameForIndex:(unsigned int)a3
{
  if ([*(id *)&self->_regionCount count] <= (unint64_t)a3)
  {
    id v5 = 0LL;
  }

  else
  {
    [*(id *)&self->_regionCount objectAtIndex:a3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  char v9 = 0;
  if (LODWORD(self->_regions))
  {
    uint64_t v5 = 0LL;
    do
    {
      [(id)self->_machAbsolute objectAtIndexedSubscript:v5];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, &v9);
    }

    while (++v5 < (unint64_t)LODWORD(self->_regions) && v9 == 0);
  }

  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (void)_reorderLabelsWithNodeNameMap:(unsigned int *)a3
{
  uint64_t v5 = (VMUSymbolStore *)objc_opt_new();
  unsigned int v6 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = v6;
    do
    {
      if (a3[v7] != -1)
      {
        -[VMUSymbolStore stringForNode:](self->_symbolStore, "stringForNode:", v7);
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUSymbolStore setString:forNode:](v5, "setString:forNode:", v9, a3[v7]);
      }

      ++v7;
    }

    while (v8 != v7);
  }

  symbolStore = self->_symbolStore;
  self->_symbolStore = v5;
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  -[VMUProcessObjectGraph _reorderLabelsWithNodeNameMap:](self, "_reorderLabelsWithNodeNameMap:");
  if (self->_autoreleasePoolOffsets)
  {
    id v20 = a5;
    unsigned int v21 = v6;
    uint64_t v11 = (NSDictionary *)calloc(1uLL, ((v8 + 7) >> 3) + 4);
    unsigned int v19 = v8;
    LODWORD(v11->super.isa) = v8;
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    uint64_t v24 = __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke;
    uint64_t v25 = &__block_descriptor_48_e8_v12__0I8l;
    uint64_t v26 = v11;
    v27 = a3;
    int v13 = v23;
    unsigned int isa = autoreleasePoolOffsets->super.isa;
    if (LODWORD(autoreleasePoolOffsets->super.isa))
    {
      uint64_t v15 = 0LL;
      do
      {
        id v16 = (char *)autoreleasePoolOffsets + (v15 >> 3);
        unsigned int v17 = v16[4];
        uint64_t v18 = v15;
        if (v16[4])
        {
          do
          {
            if ((v17 & 1) != 0) {
              v24((uint64_t)v13, v18);
            }
            if (v17 < 2) {
              break;
            }
            uint64_t v18 = (v18 + 1);
            v17 >>= 1;
          }

          while (v18 < isa);
        }

        uint64_t v15 = (v15 + 8);
      }

      while (v15 < isa);
    }

    free(self->_autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = v11;
    uint64_t v6 = v21;
    a5 = v20;
    uint64_t v8 = v19;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  -[VMUObjectGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:]( &v22,  sel__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace_,  a3,  v8,  a5,  v6);
}

uint64_t __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke( uint64_t result,  unsigned int a2)
{
  v2 = *(_DWORD **)(result + 32);
  unint64_t v3 = *(unsigned int *)(*(void *)(result + 40) + 4LL * a2);
  return result;
}

- (void)copyUserMarked
{
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (!autoreleasePoolOffsets) {
    return 0LL;
  }
  size_t v3 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
  id v4 = malloc(v3);
  memcpy(v4, autoreleasePoolOffsets, v3);
  return v4;
}

- (void)setUserMarked:(void *)a3
{
  if (a3)
  {
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    if (autoreleasePoolOffsets) {
      free(autoreleasePoolOffsets);
    }
    size_t v6 = ((*(_DWORD *)a3 + 7) >> 3) + 4;
    uint64_t v7 = (NSDictionary *)malloc(v6);
    memcpy(v7, a3, v6);
    self->_autoreleasePoolOffsets = v7;
  }

- (NSString)processDescriptionString
{
  if (self->_processName) {
    return self->_processName;
  }
  else {
    return (NSString *)@"< process and analysis tool header unavailable >\n";
  }
}

- (void)setProcessDescriptionString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  processuint64_t Name = self->_processName;
  self->_processuint64_t Name = v4;
}

- (NSString)binaryImagesDescription
{
  if (self->_executablePath) {
    return self->_executablePath;
  }
  else {
    return (NSString *)@"< binary images list unavailable >\n";
  }
}

- (void)setBinaryImagesDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  executablePath = self->_executablePath;
  self->_executablePath = v4;
}

- (NSString)processName
{
  if (self->_zoneNames) {
    return (NSString *)self->_zoneNames;
  }
  else {
    return (NSString *)@"Unknown";
  }
}

- (void)setProcessName:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  zoneNames = self->_zoneNames;
  self->_zoneNames = v4;
}

- (BOOL)is64bit
{
  if (!LODWORD(self->_regions)) {
    return 1;
  }
  [(id)self->_machAbsolute lastObject];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2[1] > 0x100000000uLL;

  return v3;
}

- (void)setStackLogReader:(id)a3
{
}

- (id)sampleBacktracesString
{
  if (*(void *)&self->_hasClassInfosDerivedFromStackBacktraces
    && (backtraces = self->_backtraces) != 0LL
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0))
  {
    uint64_t v5 = -[VMUFakeSampler initWithProcessObjectGraph:]( objc_alloc(&OBJC_CLASS___VMUFakeSampler),  "initWithProcessObjectGraph:",  self);
    uint64_t v6 = *(void *)&self->_hasClassInfosDerivedFromStackBacktraces;
    uint64_t v7 = -[NSArray symbolicator](self->_backtraces, "symbolicator");
    +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:]( &OBJC_CLASS___VMUCallTreeNode,  "rootForSamples:symbolicator:sampler:options:",  v6,  v7,  v8,  v5,  0LL);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 fullOutputWithThreshold:5];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = (void *)-[NSString mutableCopy](self->_processName, "mutableCopy");
    [v4 appendString:v10];
    [v4 appendFormat:@"\n%@", self->_executablePath];
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  -[VMUProcessObjectGraph ledger](self, "ledger");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

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

- (id)_descriptionForRegionAddress:(unint64_t)a3 withOffset:(unint64_t)a4 showSegment:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = a4 + a3;
  -[VMUProcessObjectGraph binarySectionNameForAddress:](self, "binarySectionNameForAddress:", a4 + a3);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[VMUProcessObjectGraph binarySectionRangeContainingAddress:](self, "binarySectionRangeContainingAddress:", v8);
  -[VMUProcessObjectGraph regionSymbolNameForAddress:](self, "regionSymbolNameForAddress:", v8);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = -[VMUProcessObjectGraph regionSymbolRangeContainingAddress:](self, "regionSymbolRangeContainingAddress:", v8);
  unint64_t v13 = v12;
  uint64_t v14 = &stru_189E010C8;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v8 > v12)
  {
    [NSString stringWithFormat:@" + %llu", v8 - v12];
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (!v9)
  {
    if (v11)
    {
      if ([v11 isEqualToString:@"<PTHREAD_T>"])
      {
        unint64_t v15 = v8 - v13;
        if (v8 <= v13)
        {
          uint64_t v23 = 0LL;
          goto LABEL_30;
        }

        [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"FirstTLSslotKey"];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v17 = [v16 unsignedLongLongValue] + v13;

        [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"LastTLSslotKey"];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 unsignedLongLongValue];

        if (v8 >= v17 && v8 <= v19 + v13)
        {
          unsigned int v28 = -[VMUDirectedGraph pointerSize](self, "pointerSize");
          uint64_t v29 = [kVMUThreadSpecificDataKeyString stringByAppendingFormat:@" %llu" v8 - v17) / v28];
LABEL_29:
          uint64_t v23 = (__CFString *)v29;
LABEL_30:
          unint64_t v9 = 0LL;
          goto LABEL_31;
        }

        [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"StartRoutineArgumentOffsetKey"];
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v21 unsignedLongLongValue];

        if (v15 == v22)
        {
          unint64_t v9 = 0LL;
          uint64_t v23 = @"pthread start routine argument";
          goto LABEL_31;
        }

        [NSString stringWithFormat:@"pthread_t structure %+4lld" v15, v30];
      }

      else
      {
        [NSString stringWithFormat:@"%@%@", v11, v14];
      }
    }

    else
    {
      uint64_t v26 = "";
      if (v5) {
        uint64_t v26 = "region ";
      }
      [NSString stringWithFormat:@"%s+ %llu" v26, a4];
    }
    uint64_t v29 = ;
    goto LABEL_29;
  }

  if (v11)
  {
    if (v5) {
      [NSString stringWithFormat:@"%@: '%@'%@", v9, v11, v14];
    }
    else {
      [NSString stringWithFormat:@"%@%@", v11, v14, v31];
    }
  }

  else
  {
    if (!v5)
    {
      uint64_t v24 = [v9 rangeOfString:@" "];
      if (v24)
      {
        uint64_t v25 = [v9 substringFromIndex:v24 + 1];

        unint64_t v9 = (void *)v25;
      }
    }

    [NSString stringWithFormat:@"%@ + %llu", v9, v8 - v10, v31];
  }

  uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v23;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  BOOL v5 = (void *)[(id)self->_machAbsolute count];
  if (v5)
  {
    unint64_t v6 = (unint64_t)v5;
    uint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    unint64_t v18 = a3;
    while (1)
    {
      unint64_t v9 = v7 + (v6 >> 1);
      if (v9 >= [(id)self->_machAbsolute count])
      {
        if (v8 == [(id)self->_machAbsolute count] - 1) {
          return 0LL;
        }
        --v9;
      }

      unint64_t v19 = v9;
      unint64_t v10 = v9;
      do
      {
        [(id)self->_machAbsolute objectAtIndexedSubscript:v10];
        uint64_t v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        char v12 = v11[132];

        ++v10;
      }

      while ((v12 & 1) != 0);
      [(id)self->_machAbsolute objectAtIndexedSubscript:v10 - 1];
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v14 = [v13 range];
      unint64_t v16 = v15;

      if (v18 - v14 < v16) {
        break;
      }
      if (v18 >= v14) {
        v6 += ~(v6 >> 1);
      }
      else {
        v6 >>= 1;
      }
      if (v18 >= v14) {
        uint64_t v7 = v10;
      }
      unint64_t v8 = v19;
      if (!v6) {
        return 0LL;
      }
    }

    [(id)self->_machAbsolute objectAtIndexedSubscript:v10 - 1];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v3);
    -[VMUProcessObjectGraph vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)shortNodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3) {
    return 0LL;
  }
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v3);
  if (v21 >> 60 != 1)
  {
    if (VMUGraphNodeType_IsVMRegion(v21 >> 60))
    {
      -[VMUProcessObjectGraph vmuVMRegionForNode:](self, "vmuVMRegionForNode:", v3);
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = v6;
      if (v6)
      {
        [v6 path];
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        int v9 = [v8 hasPrefix:@"/"];

        if (v9)
        {
          [MEMORY[0x189607940] string];
          unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          [v7 path];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 lastPathComponent];
          char v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v10, "appendFormat:", @"%@ ", v12);

          [v7 type];
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](v10, "appendString:", v13);
        }

        else
        {
          if (![v7 isStack])
          {
            [v7 type];
            unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_26;
          }

          unint64_t v19 = (void *)NSString;
          [v7 path];
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 stringWithFormat:@"Stack %@", v13];
          unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }

      else
      {
        unint64_t v10 = @"Unknown";
      }

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:]( self,  "nodeDescription:withOffset:showLabel:",  v3,  0LL,  1LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4
{
  return -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:]( self,  "nodeDescription:withOffset:showLabel:",  *(void *)&a3,  a4,  1LL);
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4 showLabel:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3) {
    return 0LL;
  }
  int v9 = (void *)MEMORY[0x186E32E40]();
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
  if (v26 >> 60 == 1)
  {
    if (v27)
    {
      if (BYTE1(self->_regionSymbolNameRanges)) {
        [v27 className];
      }
      else {
        [v27 displayName];
      }
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v26 & 0xFFFFFFFFFFFFFFFLL) != 0) {
        [NSString stringWithFormat:@"<%@ %#llx> [%llu]", v17, v25, v26 & 0xFFFFFFFFFFFFFFFLL];
      }
      else {
        [NSString stringWithFormat:@"<%@>", v17, v23, v24];
      }
      unint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v5) {
        goto LABEL_29;
      }
      goto LABEL_22;
    }

    [NSString stringWithFormat:@"%#llx [%llu]" v25, v26 & 0xFFFFFFFFFFFFFFFLL];
    unint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_22:
      -[VMUProcessObjectGraph shortLabelForNode:](self, "shortLabelForNode:", v7);
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        || (p_pid = &self->_pid,
            id WeakRetained = objc_loadWeakRetained((id *)p_pid),
            WeakRetained,
            WeakRetained)
        && (id v22 = objc_loadWeakRetained((id *)p_pid),
            [v22 shortLabelForNode:v7],
            unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v22,
            v18))
      {
        uint64_t v19 = -[__CFString stringByAppendingFormat:](v16, "stringByAppendingFormat:", @"  %@", v18);

        unint64_t v16 = (__CFString *)v19;
      }
    }
  }

  else
  {
    if (VMUGraphNodeType_IsVMRegion(v26 >> 60))
    {
      uint64_t v11 = (void *)NSString;
      +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:]( &OBJC_CLASS___VMUVMRegionIdentifier,  "descriptionForRange:inSortedRegions:options:",  v25 + a4,  1LL,  self->_machAbsolute,  513LL);
      char v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"VM: %@", v12, v23];
    }

    else
    {
      if (v26 >> 60 == 3)
      {
        unint64_t v16 = @"Kernel Pointers Into User Space";
        goto LABEL_29;
      }

      if (v26 >> 60 != 4)
      {
        unint64_t v16 = 0LL;
        goto LABEL_29;
      }

      unint64_t v13 = (void *)NSString;
      uint64_t v14 = -[VMUProcessObjectGraph threadNameForAddress:](self, "threadNameForAddress:", v25);
      char v12 = (void *)v14;
      uint64_t v15 = &stru_189E010C8;
      if (v14) {
        uint64_t v15 = (const __CFString *)v14;
      }
      [v13 stringWithFormat:@"Thread %llu  %@", v25, v15];
    }

    unint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

- (id)nodeDescription:(unsigned int)a3 withDestinationNode:(unsigned int)a4 referenceInfo:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3) {
    return 0LL;
  }
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
  if (VMUGraphNodeType_IsVMRegion(v19 >> 60))
  {
    +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:]( &OBJC_CLASS___VMUVMRegionIdentifier,  "descriptionForRange:inSortedRegions:options:",  a5->var0 + v18,  1LL,  self->_machAbsolute,  8193LL);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 hasPrefix:@"__DATA "])
    {
      uint64_t v10 = [v9 substringFromIndex:7];

      int v9 = (void *)v10;
    }

    [NSString stringWithFormat:@"Region %@", v9];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[VMUProcessObjectGraph nodeDescription:](self, "nodeDescription:", v7);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v16 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  -[VMUProcessObjectGraph _detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:]( self,  "_detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:",  &v16,  v7,  v6,  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringByAppendingFormat:@" %@", v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5->var2)
  {
    uint64_t v15 = [v14 stringByAppendingFormat:@" --> offset %llu" a5->var2];

    uint64_t v14 = (void *)v15;
  }

  return v14;
}

- (id)nodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4) {
    return 0LL;
  }
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v6);
  unint64_t v9 = v30 >> 60;
  if (v30 >> 60 == 3) {
    return &stru_189E010C8;
  }
  if ((_DWORD)v9 == 4)
  {
    unint64_t var0 = a3->var0;
    unsigned int v11 = -[VMUDirectedGraph pointerSize](self, "pointerSize");
    char v12 = (void *)NSString;
    VMURegisterNameForIndex(var0 / v11);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringWithFormat:@"$%@", v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }

  if (VMUGraphNodeType_IsVMRegion(v9))
  {
    -[VMUProcessObjectGraph _descriptionForRegionAddress:withOffset:showSegment:]( self,  "_descriptionForRegionAddress:withOffset:showSegment:",  v29,  a3->var0,  0LL);
    return (id)objc_claimAutoreleasedReturnValue();
  }

  if (v31)
  {
    [v31 fieldAtOrBeforeOffset:LODWORD(a3->var0)];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v16 = 0LL;
  }

  [v16 ivarName];
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 length];

  if (v18)
  {
    uint64_t v19 = [v16 fullIvarNameAtOffset:LODWORD(a3->var0) - [v16 offset]];
  }

  else
  {
    uint64_t v20 = [v31 genericInfo];
    if (v20)
    {
      unint64_t v21 = (void *)v20;
      unint64_t v22 = a3->var0;
      unsigned int v23 = [v31 instanceSize];

      if (v22 < v23)
      {
        -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v5);
        [v28 className];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = [v24 containsString:@"BlockVariable"];
        unint64_t v26 = @"[capture]";
        if (v25) {
          unint64_t v26 = @"__block [capture]";
        }
        v27 = v26;

        goto LABEL_21;
      }
    }

    uint64_t v19 = [NSString stringWithFormat:@"+%llu bytes" a3->var0];
  }

  v27 = (__CFString *)v19;
LABEL_21:

  return v27;
}

- (id)_detailedNodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4) {
    return 0LL;
  }
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v8);
  if (v35 >> 60 == 3) {
    return &stru_189E010C8;
  }
  if (v35 >> 60 != 4)
  {
    [MEMORY[0x189607940] stringWithCapacity:200];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __s[0] = 0;
    if (VMUGraphNodeType_IsVMRegion(v35 >> 60))
    {
      -[VMUProcessObjectGraph _descriptionForRegionAddress:withOffset:showSegment:]( self,  "_descriptionForRegionAddress:withOffset:showSegment:",  v34,  a3->var0,  1LL);
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 appendString:v17];
    }

    else
    {
      uint64_t v18 = VMUScanTypeKeywordDescription(a3->var1);
      uint64_t v19 = "";
      if (v18 && *v18) {
        uint64_t v19 = " ";
      }
      [v15 appendFormat:@"%+6lld: %s%s", a3->var0, v18, v19];
      if (v36)
      {
        [v36 fieldAtOrBeforeOffset:LODWORD(a3->var0)];
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        unint64_t v17 = 0LL;
      }

      [v17 ivarName];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 length];

      if (v21)
      {
        [v17 fullIvarNameAtOffset:LODWORD(a3->var0) - [v17 offset]];
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v36 instanceSize];
        goto LABEL_18;
      }

      uint64_t v27 = [v36 genericInfo];
      if (v27)
      {
        unsigned int v28 = (void *)v27;
        unint64_t var0 = a3->var0;
        unsigned int v30 = [v36 instanceSize];

        if (var0 < v30)
        {
          -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
          [v38 className];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          int v32 = [v31 containsString:@"BlockVariable"];
          uint64_t v33 = @"[capture]";
          if (v32) {
            uint64_t v33 = @"__block [capture]";
          }
          uint64_t v14 = v33;

          goto LABEL_18;
        }
      }
    }

    uint64_t v14 = &stru_189E010C8;
LABEL_18:

    snprintf(__str, 0x20uLL, "%#llx", a3->var0 + v34);
    int v22 = [v15 length];
    int v23 = strlen(__str);
    unsigned int v24 = v23 + -[__CFString length](v14, "length") + strlen(__s) + v22;
    unsigned int v25 = a6 - v24;
    if (a6 < v24) {
      unsigned int v25 = 0;
    }
    if (v24 >= a6) {
      uint64_t v26 = 1LL;
    }
    else {
      uint64_t v26 = v25;
    }
    [v15 appendFormat:@"%@%s%*s%s", v14, __s, v26, "", __str];
    goto LABEL_24;
  }

  unint64_t v11 = a3->var0;
  unsigned int v12 = -[VMUDirectedGraph pointerSize](self, "pointerSize");
  unint64_t v13 = (void *)NSString;
  VMURegisterNameForIndex(v11 / v12);
  uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v13 stringWithFormat:@"$%@", v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v15;
}

- (id)referenceDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4
    || -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= v7)
  {
    return 0LL;
  }

  __int128 v16 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  -[VMUProcessObjectGraph _detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:]( self,  "_detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:",  &v16,  v8,  v7,  v6);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessObjectGraph nodeDescription:](self, "nodeDescription:", v7);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->var2)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%lld bytes into %@", a3->var2, v12];

    unsigned int v12 = (void *)v13;
  }

  [v11 stringByAppendingFormat:@" --> %@", v12];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)refineTypesWithOverlay:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  -[VMUObjectGraph _refineTypesWithOverlay:](&v3, sel__refineTypesWithOverlay_, a3);
}

- (void)refineEdges:(unsigned int)a3 withOptions:(unsigned int)a4 markingInvalid:(void *)a5
{
  char v6 = a4;
  if (-[VMUProcessObjectGraph is64bit](self, "is64bit")) {
    uint64_t v9 = 7LL;
  }
  else {
    uint64_t v9 = 3LL;
  }
  if ((v6 & 1) != 0)
  {
    unsigned int v11 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    uint64_t v10 = calloc(1uLL, ((v11 + 7) >> 3) + 4);
    _DWORD *v10 = v11;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  int v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  int v23 = 0;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  int v19 = 0;
  BOOL v12 = (v6 & 2) == 0;
  uint64_t v13 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke;
  v15[3] = &unk_189DFFAA0;
  v15[4] = self;
  void v15[5] = v18;
  BOOL v17 = v12;
  v15[8] = v9;
  v15[9] = a5;
  v15[6] = v20;
  v15[7] = v24;
  unsigned int v16 = a3;
  v15[10] = v10;
  -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](self, "_internalAccessRawEdgesWithBlock:", v15);
  if (v10)
  {
    v14[0] = v13;
    v14[1] = 3221225472LL;
    v14[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2;
    v14[3] = &unk_189DFFAC8;
    v14[7] = v10;
    v14[8] = a5;
    v14[4] = self;
    v14[5] = v20;
    v14[6] = v22;
    -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](self, "_internalAccessRawEdgesWithBlock:", v14);
    free(v10);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke( void *result,  unsigned int *a2,  unsigned int a3)
{
  if (a3)
  {
    id v4 = result;
    uint64_t v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        ++*(_DWORD *)(*(void *)(v4[5] + 8LL) + 24LL);
        _VMURange result = (void *)v4[4];
        if (result)
        {
          _VMURange result = (void *)[result _rawReferenceInfoWithName:*a2];
        }

        else
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = 0LL;
          uint64_t v14 = 0LL;
        }

        if (!*((_BYTE *)v4 + 92) && (v4[8] & v12) != 0)
        {
          char v6 = (_DWORD *)v4[9];
          unint64_t v7 = *a2;
          ++*(_DWORD *)(*(void *)(v4[6] + 8LL) + 24LL);
          ++*(_DWORD *)(*(void *)(v4[7] + 8LL) + 24LL);
        }

        if (((*((_DWORD *)v4 + 22) >> v13) & 1) == 0)
        {
          uint64_t v8 = (_DWORD *)v4[9];
          unint64_t v9 = *a2;
          ++*(_DWORD *)(*(void *)(v4[6] + 8LL) + 24LL);
        }

        uint64_t v10 = (_DWORD *)v4[10];
        if (v10)
        {
          if (!v14)
          {
            unint64_t v11 = a2[2];
          }
        }
      }

      a2 += 3;
      --v5;
    }

    while (v5);
  }

  return result;
}

void *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2( void *result,  unsigned int *a2,  unsigned int a3)
{
  if (a3)
  {
    id v4 = result;
    uint64_t v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        char v6 = (_DWORD *)v4[7];
        unint64_t v7 = a2[2];
        if (*v6 > v7 && ((*((unsigned __int8 *)v6 + (v7 >> 3) + 4) >> (v7 & 7)) & 1) != 0)
        {
          _VMURange result = (void *)v4[4];
          if (result)
          {
            _VMURange result = [result _rawReferenceInfoWithName:];
            if (v10)
            {
              uint64_t v8 = (_DWORD *)v4[8];
              unint64_t v9 = *a2;
              ++*(_DWORD *)(*(void *)(v4[5] + 8LL) + 24LL);
              ++*(_DWORD *)(*(void *)(v4[6] + 8LL) + 24LL);
            }
          }
        }
      }

      a2 += 3;
      --v5;
    }

    while (v5);
  }

  return result;
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4
{
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4 options:(unsigned int)a5
{
  char v55 = a5;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  uint64_t v67 = 0LL;
  unint64_t v68 = &v67;
  uint64_t v69 = 0x2020000000LL;
  int v70 = 0;
  v52 = a4;
  size_t v8 = 4LL * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  unint64_t v9 = (unsigned int *)malloc(v8);
  __pattern4[0] = -1;
  memset_pattern4(v9, __pattern4, v8);
  os_signpost_id_t v54 = self;
  unsigned int v10 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  unint64_t v11 = calloc(1uLL, ((v10 + 7) >> 3) + 4);
  *unint64_t v11 = v10;
  v66[0] = MEMORY[0x1895F87A8];
  v66[1] = 3221225472LL;
  v66[2] = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke;
  v66[3] = &unk_189DFDA18;
  v66[4] = &v67;
  v66[5] = v9;
  v66[6] = v11;
  uint64_t v12 = (void (**)(id, void))(id)MEMORY[0x186E33044](v66);
  unsigned int v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    unsigned int v14 = 0;
    int v15 = 1;
    do
    {
      unsigned int v16 = (char *)a3 + (v14 >> 3);
      unsigned int v17 = v16[4];
      unsigned int v18 = v15;
      if (v16[4])
      {
        do
        {
          if ((v17 & 1) != 0) {
            v12[2](v12, v18 - 1);
          }
          if (v17 < 2) {
            break;
          }
          v17 >>= 1;
          BOOL v19 = v18++ >= v13;
        }

        while (!v19);
      }

      v14 += 8;
      v15 += 8;
    }

    while (v14 < v13);
  }

  uint64_t v20 = v68 + 3;
  int v21 = *((_DWORD *)v68 + 6);
  uint64_t v22 = MEMORY[0x1895F87A8];
  int v23 = v54;
  if (v21)
  {
    char v24 = 1;
    int v25 = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2;
    uint64_t v53 = v11;
    do
    {
      int v26 = v21 - 1;
      _DWORD *v20 = v26;
      uint64_t v27 = v9[v26];
      BOOL v28 = (v55 & 2) != 0
         && -[VMUProcessObjectGraph nodeIsAutoreleasePoolContentPage:]( v23,  "nodeIsAutoreleasePoolContentPage:",  v9[v26]);
      v62[0] = v22;
      v62[1] = 3221225472LL;
      v62[2] = v25;
      v62[3] = &unk_189DFFAF0;
      v62[4] = v23;
      uint64_t v64 = v11;
      BOOL v65 = v28;
      uint64_t v29 = v12;
      id v63 = v29;
      -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:]( v23,  "_internalEnumerateEdgesOfNode:withBlock:",  v27,  v62);
      if (((*((_DWORD *)v68 + 6) == 0) & v24) == 1)
      {
        size_t v30 = ((*v11 + 7) >> 3) + 4;
        uint64_t v31 = (int *)malloc(v30);
        memcpy(v31, v11, v30);
        int v32 = *v31;
        unint64_t v33 = (*v31 + 7);
        if (v33 >= 8)
        {
          uint64_t v34 = v31 + 1;
          uint64_t v35 = v33 >> 3;
          if (v33 >> 3 <= 1) {
            uint64_t v35 = 1LL;
          }
          do
          {
            _BYTE *v34 = ~*v34;
            ++v34;
            --v35;
          }

          while (v35);
        }

        id v36 = v25;
        uint64_t v37 = v9;
        int v38 = v32 & 7;
        if (v38) {
          *((_BYTE *)v31 + (v33 >> 3) + 3) ^= -1 << v38;
        }
        v56[0] = v22;
        v56[1] = 3221225472LL;
        uint64_t v57 = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3;
        uint64_t v58 = &unk_189DFFB18;
        unint64_t v59 = v23;
        char v61 = v55 & 1;
        v60 = v29;
        v39 = v56;
        unsigned int v40 = *v31;
        if (*v31)
        {
          unsigned int v41 = 0;
          int v42 = 1;
          do
          {
            uint64_t v43 = (char *)v31 + (v41 >> 3);
            unsigned int v44 = v43[4];
            unsigned int v45 = v42;
            if (v43[4])
            {
              do
              {
                if ((v44 & 1) != 0) {
                  v57((uint64_t)v39, v45 - 1);
                }
                if (v44 < 2) {
                  break;
                }
                v44 >>= 1;
                BOOL v19 = v45++ >= v40;
              }

              while (!v19);
            }

            v41 += 8;
            v42 += 8;
          }

          while (v41 < v40);
        }

        free(v31);
        char v24 = 0;
        unint64_t v9 = v37;
        unint64_t v11 = v53;
        uint64_t v22 = MEMORY[0x1895F87A8];
        int v25 = v36;
        int v23 = v54;
      }

      uint64_t v20 = v68 + 3;
      int v21 = *((_DWORD *)v68 + 6);
    }

    while (v21);
  }

  int v46 = *v52;
  if (*v52 >= *v11) {
    int v46 = *v11;
  }
  unint64_t v47 = (v46 + 7);
  if (v47 >= 8)
  {
    uint64_t v48 = (char *)(v11 + 1);
    unint64_t v49 = v52 + 1;
    unint64_t v50 = v47 >> 3;
    do
    {
      char v51 = *v48++;
      *v49++ |= v51;
      --v50;
    }

    while (v50);
  }

  if (v9) {
    free(v9);
  }
  free(v11);

  _Block_object_dispose(&v67, 8);
}

void *__67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke( void *result,  unsigned int a2)
{
  uint64_t v2 = result[5];
  uint64_t v3 = *(void *)(result[4] + 8LL);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  uint64_t v5 = (unsigned int *)result[6];
  if (*v5 > a2) {
    *((_BYTE *)v5 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t result = VMUIsOwningReference([*(id *)(a1 + 32) scanTypeOfReferenceWithName:a2]);
  if ((_DWORD)result)
  {
    unint64_t v9 = *(_DWORD **)(a1 + 48);
    if (*v9 <= a6 || ((*((unsigned __int8 *)v9 + (a6 >> 3) + 4) >> (a6 & 7)) & 1) == 0)
    {
      if (!*(_BYTE *)(a1 + 56)) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
      uint64_t result = [*(id *)(a1 + 32) nodeIsAutoreleasePoolContentPage:a6];
      if ((_DWORD)result) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }
  }

  return result;
}

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = [(id)result nodeDetails:a2];
  }
  else {
    unint64_t v4 = 0LL;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t result = VMUGraphNodeType_IsVMRegion(v4 >> 60);
    if ((_DWORD)result) {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  if (v4 == 0x1000000000000000LL) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  return result;
}

- (id)leakedNodesGraph
{
  unsigned int v3 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  unint64_t v4 = calloc(1uLL, ((v3 + 7) >> 3) + 4);
  _DWORD *v4 = v3;
  uint64_t v5 = VMUCreateRootNodeMarkingMap(self);
  -[VMUProcessObjectGraph markReachableNodesFromRoots:inMap:options:]( self,  "markReachableNodesFromRoots:inMap:options:",  v5,  v4,  0LL);
  int v6 = *v4;
  unint64_t v7 = (*v4 + 7);
  if (v7 >= 8)
  {
    size_t v8 = v4 + 1;
    uint64_t v9 = v7 >> 3;
    if (v7 >> 3 <= 1) {
      uint64_t v9 = 1LL;
    }
    do
    {
      _BYTE *v8 = ~*v8;
      ++v8;
      --v9;
    }

    while (v9);
  }

  int v10 = v6 & 7;
  if (v10) {
    *((_BYTE *)v4 + (v7 >> 3) + 3) ^= -1 << v10;
  }
  -[VMUDirectedGraph subgraphWithMarkedNodes:](self, "subgraphWithMarkedNodes:", v4);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);
  free(v5);
  return v11;
}

- (BOOL)nodeIsAutoreleasePoolContentPage:(unsigned int)a3
{
  __int128 v5 = v7;
  uint64_t v6 = v8;
  return -[VMUProcessObjectGraph nodeDetailIsAutoreleasePoolContentPage:]( self,  "nodeDetailIsAutoreleasePoolContentPage:",  &v5);
}

- ($938B03310D06493B2963E5A84CB75A7E)autoreleasePoolOffsets
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v4 = [v3 intValue];
  -[NSDictionary objectForKeyedSubscript:](self->_pthreadOffsets, "objectForKeyedSubscript:", @"childPageOffset");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 intValue];
  -[NSDictionary objectForKeyedSubscript:](self->_pthreadOffsets, "objectForKeyedSubscript:", @"firstEntryOffset");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 intValue];

  unint64_t v9 = v4 | (unint64_t)(v6 << 32);
  unsigned int v10 = v8;
  result.unint64_t var0 = v9;
  result.var1 = HIDWORD(v9);
  result.unint64_t var2 = v10;
  return result;
}

- (BOOL)nodeDetailIsAutoreleasePoolContentPage:(id)a3
{
  if (*(void *)(a3.var0 + 8) >> 60 != 1LL) {
    return 0;
  }
  [*(id *)(a3.var0 + 16) className];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 isEqualToString:@"@autoreleasepool content"];

  return v5;
}

- (void)removeWeakEdges
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke;
  v2[3] = &unk_189DFFB68;
  v2[4] = self;
  -[VMUDirectedGraph withEdgeMarkingMap:](self, "withEdgeMarkingMap:", v2);
}

uint64_t __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2;
  v6[3] = &unk_189DFFB40;
  v6[4] = v4;
  v6[5] = a2;
  [v4 enumerateEdgesWithBlock:v6];
  return [*(id *)(a1 + 32) removeMarkedEdges:a2];
}

void *__40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  $938B03310D06493B2963E5A84CB75A7E result = *(void **)(a1 + 32);
  if (!result)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
LABEL_9:
    uint64_t v6 = *(unsigned int **)(a1 + 40);
    if (*v6 > v2) {
      *((_BYTE *)v6 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
    }
    return result;
  }

  $938B03310D06493B2963E5A84CB75A7E result = (void *)[result referenceInfoWithName:a2];
  return result;
}

- (void)markRootNodes:(void *)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__VMUProcessObjectGraph_markRootNodes___block_invoke;
  v3[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  v3[4] = a3;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v3);
}

BOOL __39__VMUProcessObjectGraph_markRootNodes___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
  if (result)
  {
    uint64_t v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2) {
      *((_BYTE *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
  }

  return result;
}

- (void)markLeafNodes:(void *)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke;
  v3[3] = &unk_189DFFBB8;
  v3[4] = self;
  void v3[5] = a3;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v3);
}

void __39__VMUProcessObjectGraph_markLeafNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  unsigned int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2;
  v6[3] = &unk_189DFFB90;
  v6[4] = &v7;
  [v4 enumerateEdgesOfNode:a2 withBlock:v6];
  if (!*((_DWORD *)v8 + 6))
  {
    char v5 = *(unsigned int **)(a1 + 40);
    if (*v5 > v2) {
      *((_BYTE *)v5 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
    }
  }

  _Block_object_dispose(&v7, 8);
}

uint64_t __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)resymbolicatePrivateMaps
{
  binarySectionNameRanges = self->_binarySectionNameRanges;
  uint64_t v4 = -[NSArray symbolicator](self->_backtraces, "symbolicator");
  -[VMURangeToStringMap resymbolicateStringsWithSymbolicator:]( binarySectionNameRanges,  "resymbolicateStringsWithSymbolicator:",  v4,  v5);
  -[VMUProcessObjectGraph resymbolicateNonObjectsUsingStackBacktrace]( self,  "resymbolicateNonObjectsUsingStackBacktrace");
}

- (void)resymbolicateNonObjectsUsingStackBacktrace
{
  userMarked = self->_userMarked;
  if (userMarked)
  {
    -[VMUObjectGraph indexedClassInfos](self, "indexedClassInfos");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke;
    v7[3] = &unk_189DFD328;
    v7[4] = self;
    [userMarked identifyNonObjectsUsingStackBacktraces:self classInfoMap:v4 classInfoSetterBlock:v7];

    -[VMUObjectGraph indexedClassInfos](self, "indexedClassInfos");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
    -[VMUObjectGraph setIndexedClassInfos:](&v6, sel_setIndexedClassInfos_, v5);
  }

id __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
  return [super setClassInfoIndex:a3 forNode:a2];
}

- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  backtraces = self->_backtraces;
  if (!backtraces)
  {
    -[VMUProcessObjectGraph _generateSymbolStoreFromExistingGraph](self, "_generateSymbolStoreFromExistingGraph");
    backtraces = self->_backtraces;
  }

  char v18 = -[NSArray resymbolicateWithDsymPath:libraryNames:all:progress:showDebugInfo:error:]( backtraces,  "resymbolicateWithDsymPath:libraryNames:all:progress:showDebugInfo:error:",  v14,  v15,  v11,  v16,  v9,  a8);

  return v18;
}

- (_CSArchitecture)parseMacOSArchitectureFromProcessDescription
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  processuint64_t Name = self->_processName;
  [MEMORY[0x189607810] newlineCharacterSet];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString componentsSeparatedByCharactersInSet:](processName, "componentsSeparatedByCharactersInSet:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", @"Code Type", (void)v17))
        {
          if ([v11 containsString:@"X86-64"])
          {
            _CSArchitecture v12 = (_CSArchitecture)0x301000007LL;
            goto LABEL_19;
          }

          if ([v11 containsString:@"ARM64E"])
          {
            _CSArchitecture v12 = (_CSArchitecture)0x20100000CLL;
            goto LABEL_19;
          }

          if ([v11 containsString:@"ARM64"])
          {
            +[VMUProcessDescription parseBinaryImagesDescription:]( &OBJC_CLASS___VMUProcessDescription,  "parseBinaryImagesDescription:",  self->_executablePath);
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 objectAtIndexedSubscript:0];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 objectForKeyedSubscript:@"ExecutablePath"];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();

            _CSArchitecture v12 = (_CSArchitecture)0x20100000CLL;
            if (([v15 hasPrefix:@"/System"] & 1) == 0
              && ![v15 hasPrefix:@"/usr"])
            {
              _CSArchitecture v12 = (_CSArchitecture)16777228LL;
            }

            goto LABEL_19;
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  _CSArchitecture v12 = 0LL;
LABEL_19:

  return v12;
}

- (void)parseAddressesFromNodeLabelsIntoSymbolStore
{
  symbolStore = self->_symbolStore;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke;
  v3[3] = &unk_189DFFBE0;
  v3[4] = self;
  -[VMUSymbolStore enumerateHexAddressesInStrings:](symbolStore, "enumerateHexAddressesInStrings:", v3);
}

uint64_t __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:4];
}

- (void)_generateSymbolStoreFromExistingGraph
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = +[VMUProcessDescription symbolicatorFromBinaryImagesDescription:withArchitecture:]( &OBJC_CLASS___VMUProcessDescription,  "symbolicatorFromBinaryImagesDescription:withArchitecture:",  self->_executablePath,  -[VMUProcessObjectGraph parseMacOSArchitectureFromProcessDescription]( self,  "parseMacOSArchitectureFromProcessDescription"));
  uint64_t v5 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]( objc_alloc(&OBJC_CLASS___VMUSymbolStore),  "initWithSymbolicator:debugTimer:",  v3,  v4,  0LL);
  p_backtraces = &self->_backtraces;
  objc_storeStrong((id *)&self->_backtraces, v5);
  -[NSArray setGraph:](self->_backtraces, "setGraph:", self);
  binarySectionNameRanges = self->_binarySectionNameRanges;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke;
  v21[3] = &unk_189DFFBE0;
  v21[4] = self;
  -[VMURangeToStringMap enumerateHexAddressesInStrings:]( binarySectionNameRanges,  "enumerateHexAddressesInStrings:",  v21);
  -[VMUProcessObjectGraph parseAddressesFromNodeLabelsIntoSymbolStore]( self,  "parseAddressesFromNodeLabelsIntoSymbolStore");
  userMarked = self->_userMarked;
  if (userMarked)
  {
    v20[0] = v8;
    v20[1] = 3221225472LL;
    v20[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2;
    void v20[3] = &unk_189DFFBE0;
    v20[4] = self;
    [userMarked enumerateUniquingTable:v20];
  }

  int v10 = *(void **)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v10)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NSArray addBacktrace:origin:]( *p_backtraces,  "addBacktrace:origin:",  *(void *)(*((void *)&v16 + 1) + 8 * v15++),  0LL,  (void)v16);
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }

      while (v13);
    }
  }

  CSRelease();
}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:2];
}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:3];
}

- (int)pid
{
  return *(&self->super._referencingCount + 1);
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_pid);
}

- (void)setScanner:(id)a3
{
}

- (unsigned)vmPageSize
{
  return self->_scanner;
}

- (unsigned)kernelPageSize
{
  return HIDWORD(self->_scanner);
}

- (unsigned)regionCount
{
  return self->_regions;
}

- (unint64_t)snapshotMachTime
{
  return *(void *)&self->_vmPageSize;
}

- (void)setSnapshotMachTime:(unint64_t)a3
{
  *(void *)&self->_vmPageSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return (VMUDebugTimer *)self->_stackLogReader;
}

- (void)setDebugTimer:(id)a3
{
}

- (VMUStackLogReader)stackLogReader
{
  return (VMUStackLogReader *)self->_userMarked;
}

- (BOOL)showRawClassNames
{
  return BYTE1(self->_regionSymbolNameRanges);
}

- (void)setShowRawClassNames:(BOOL)a3
{
  BYTE1(self->_regionSymbolNameRanges) = a3;
}

- (unint64_t)physicalFootprint
{
  return (unint64_t)self->_debugTimer;
}

- (void)setPhysicalFootprint:(unint64_t)a3
{
  self->_debugTimer = (VMUDebugTimer *)a3;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprint;
}

- (void)setPhysicalFootprintPeak:(unint64_t)a3
{
  self->_physicalFootprint = a3;
}

- (BOOL)isTranslatedByRosetta
{
  return (BOOL)self->_processDescriptionString;
}

- (void)setIsTranslatedByRosetta:(BOOL)a3
{
  LOBYTE(self->_processDescriptionString) = a3;
}

- (NSString)executablePath
{
  return *(NSString **)&self->_isTranslatedByRosetta;
}

- (BOOL)showsPhysFootprint
{
  return BYTE4(self->_physicalFootprintPeak);
}

- (void)setShowsPhysFootprint:(BOOL)a3
{
  BYTE4(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevel
{
  return self->_idleExitStatus;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_idleExitStatus = a3;
}

- (NSDictionary)srcAddressToExtraAutoreleaseCountDict
{
  return *(NSDictionary **)&self->_objectContentLevel;
}

- (void)setSrcAddressToExtraAutoreleaseCountDict:(id)a3
{
}

- (NSArray)backtraces
{
  return *(NSArray **)&self->_hasClassInfosDerivedFromStackBacktraces;
}

- (void)setBacktraces:(id)a3
{
}

- (VMUSymbolStore)symbolStore
{
  return (VMUSymbolStore *)self->_backtraces;
}

- (void)setSymbolStore:(id)a3
{
}

- (VMUNodeToStringMap)nodeLabels
{
  return (VMUNodeToStringMap *)self->_symbolStore;
}

- (_VMURange)dyldSharedCacheRange
{
  p_ledger = &self->_ledger;
  ledger = self->_ledger;
  unint64_t v4 = (unint64_t)p_ledger[1];
  result.length = v4;
  result.location = (unint64_t)ledger;
  return result;
}

- (void)setDyldSharedCacheRange:(_VMURange)a3
{
  *(_VMURange *)&self->_ledger = a3;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return (BOOL)self->_srcAddressToExtraAutoreleaseCountDict;
}

- (NSDate)snapshotDate
{
  return (NSDate *)self->_nodeLabels;
}

- (void)setSnapshotDate:(id)a3
{
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return BYTE5(self->_physicalFootprintPeak);
}

- (void)setDidPhysFootprintDirtyAccounting:(BOOL)a3
{
  BYTE5(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevelForNodeLabels
{
  return *(_DWORD *)&self->_showsPhysFootprint;
}

- (void)setObjectContentLevelForNodeLabels:(unsigned int)a3
{
  *(_DWORD *)&self->_showsPhysFootprint = a3;
}

- (unint64_t)serializationOptions
{
  return (unint64_t)self->_snapshotDate;
}

- (void)setSerializationOptions:(unint64_t)a3
{
  self->_snapshotDate = (NSDate *)a3;
}

- (NSDictionary)ledger
{
  return (NSDictionary *)self->_serializationOptions;
}

- (void)setLedger:(id)a3
{
}

- (unsigned)idleExitStatus
{
  return self->_physicalFootprintPeak;
}

- (void)setIdleExitStatus:(unsigned int)a3
{
  LODWORD(self->_physicalFootprintPeak) = a3;
}

- (void).cxx_destruct
{
}

@end