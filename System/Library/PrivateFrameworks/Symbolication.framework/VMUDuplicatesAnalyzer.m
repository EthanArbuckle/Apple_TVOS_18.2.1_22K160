@interface VMUDuplicatesAnalyzer
- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 block:(id)a5;
- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 fieldBlock:(id)a5;
- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 block:(id)a6;
- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 fieldBlock:(id)a6;
- (BOOL)fullStacks;
- (BOOL)invertCallTrees;
- (BOOL)quiet;
- (BOOL)showCallTrees;
- (BOOL)showRawClassNames;
- (BOOL)showStacks;
- (BOOL)stringsOnly;
- (const)analyzerName;
- (id)_analysisSummaryWithGraphOrScanner:(id)a3;
- (id)analysisSummaryWithError:(id *)a3;
- (unint64_t)minimumLabelCount;
- (unsigned)objectContentLevel;
- (void)fullAnalysisWithBlock:(id)a3;
- (void)setFullStacks:(BOOL)a3;
- (void)setInvertCallTrees:(BOOL)a3;
- (void)setMinimumLabelCount:(unint64_t)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setQuiet:(BOOL)a3;
- (void)setShowCallTrees:(BOOL)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setShowStacks:(BOOL)a3;
- (void)setStringsOnly:(BOOL)a3;
- (void)summaryWithGraph:(id)a3 block:(id)a4;
@end

@implementation VMUDuplicatesAnalyzer

- (const)analyzerName
{
  return "DUPLICATE OBJECTS";
}

- (id)_analysisSummaryWithGraphOrScanner:(id)a3
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v6 = (void *)objc_opt_new();
  debugTimer = self->super._debugTimer;
  if (debugTimer)
  {
    uint64_t v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->super._debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_END,  v11,  "VMUDuplicatesAnalyzer",  "",  buf,  2u);
        }
      }

      debugTimer = self->super._debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUDuplicatesAnalyzer");
  -[VMUDebugTimer startWithCategory:message:]( self->super._debugTimer,  "startWithCategory:message:",  "VMUDuplicatesAnalyzer",  "Exctracting labels");
  v12 = self->super._debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "VMUDuplicatesAnalyzer",  "Exctracting labels",  buf,  2u);
      }
    }
  }

  v76[0] = MEMORY[0x1895F87A8];
  v76[1] = 3221225472LL;
  v76[2] = __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke;
  v76[3] = &unk_189E00A08;
  id v16 = v4;
  id v77 = v16;
  v78 = self;
  id v17 = v6;
  id v79 = v17;
  v61 = v16;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v16, v76);
  v18 = self->super._debugTimer;
  v62 = (void *)v5;
  if (v18)
  {
    uint64_t v19 = -[VMUDebugTimer signpostID](v18, "signpostID");
    v18 = self->super._debugTimer;
    if (v19)
    {
      -[VMUDebugTimer logHandle](v18, "logHandle");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v21 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v20,  OS_SIGNPOST_INTERVAL_END,  v22,  "VMUDuplicatesAnalyzer",  "",  buf,  2u);
        }
      }

      v18 = self->super._debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v18, "endEvent:", "VMUDuplicatesAnalyzer");
  -[VMUDebugTimer startWithCategory:message:]( self->super._debugTimer,  "startWithCategory:message:",  "VMUDuplicatesAnalyzer",  "Selecting labels that have duplicates");
  v23 = self->super._debugTimer;
  if (v23)
  {
    -[VMUDebugTimer logHandle](v23, "logHandle");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v25 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v26,  "VMUDuplicatesAnalyzer",  "Selecting labels that have duplicates",  buf,  2u);
      }
    }
  }

  v27 = (void *)objc_opt_new();
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  [v17 allKeys];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v28 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v73;
    do
    {
      for (uint64_t i = 0LL; i != v30; ++i)
      {
        if (*(void *)v73 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        [v17 objectForKeyedSubscript:v33];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v30 = [v28 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }

    while (v30);
  }

  v35 = self->super._debugTimer;
  if (v35)
  {
    uint64_t v36 = -[VMUDebugTimer signpostID](v35, "signpostID");
    v35 = self->super._debugTimer;
    v37 = v62;
    if (v36)
    {
      -[VMUDebugTimer logHandle](v35, "logHandle");
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v39 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v38,  OS_SIGNPOST_INTERVAL_END,  v40,  "VMUDuplicatesAnalyzer",  "",  buf,  2u);
        }
      }

      v35 = self->super._debugTimer;
    }
  }

  else
  {
    v37 = v62;
  }

  -[VMUDebugTimer endEvent:](v35, "endEvent:", "VMUDuplicatesAnalyzer");
  id v41 = v27;
  if (![v41 count])
  {
    v47 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
    v48 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v47,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisSummaryKey[0],  0LL,  @"No duplicates detected",  0LL);
    goto LABEL_58;
  }

  regionIdentifier = self->super._regionIdentifier;
  if (!regionIdentifier)
  {
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    *(_OWORD *)buf = 0u;
    goto LABEL_45;
  }

  -[VMUVMRegionIdentifier summaryStatisticsOfAllZones](regionIdentifier, "summaryStatisticsOfAllZones");
  unint64_t v43 = *(void *)buf;
  if (!*(void *)buf)
  {
LABEL_45:
    float v45 = 0.0;
    char v46 = 1;
    goto LABEL_46;
  }

  v44 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Total allocations size",  *(void *)buf,  0LL,  2LL);
  [v37 addObject:v44];
  float v45 = (float)v43;

  char v46 = 0;
LABEL_46:
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v49 = v41;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v80 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    unint64_t v52 = 0LL;
    uint64_t v53 = 0LL;
    uint64_t v54 = *(void *)v64;
    do
    {
      for (uint64_t j = 0LL; j != v51; ++j)
      {
        if (*(void *)v64 != v54) {
          objc_enumerationMutation(v49);
        }
        [v17 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * j)];
        v56 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v53 += -[NSMapTable count](v56, "count");
        v52 += totalSizeOfRanges(v56);
      }

      uint64_t v51 = [v49 countByEnumeratingWithState:&v63 objects:v80 count:16];
    }

    while (v51);
  }

  else
  {
    unint64_t v52 = 0LL;
    uint64_t v53 = 0LL;
  }

  v57 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Duplicates total size",  v52,  0LL,  2LL);
  v37 = v62;
  [v62 addObject:v57];
  if ((v46 & 1) == 0)
  {
    [NSString stringWithFormat:@"%2.1f" (float)((float)((float)v52 / v45) * 100.0)];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"% of total allocations",  0LL,  v58,  0LL);

    [v62 addObject:v59];
    v57 = v59;
  }

  v48 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Duplicates count",  v53,  0LL,  1LL);

LABEL_58:
  [v37 addObject:v48];

  return v37;
}

void __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (*(void *)(a3 + 8) >> 60 == 1LL)
  {
    v6 = (void *)MEMORY[0x186E32E40]();
    [*(id *)(a1 + 32) labelForNode:a2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      uint64_t v8 = *(void **)(a3 + 16);
      if (*(_BYTE *)(*(void *)(a1 + 40) + 33LL)) {
        [v8 className];
      }
      else {
        [v8 displayName];
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(void *)(a3 + 16))
      {
        [NSString stringWithFormat:@"%@  %@", v9, v7];
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v10 = v7;
      }

      os_signpost_id_t v11 = v10;
      [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
      v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:1282];
        v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
      }

      NSMapInsert(v12, *(const void **)a3, (const void *)(*(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL));
    }

    objc_autoreleasePoolPop(v6);
  }

- (id)analysisSummaryWithError:(id *)a3
{
  return -[VMUDuplicatesAnalyzer _analysisSummaryWithGraphOrScanner:]( self,  "_analysisSummaryWithGraphOrScanner:",  self->super._graph);
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 fieldBlock:(id)a6
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  v85 = (void (**)(id, void *))a6;
  id v10 = (void *)objc_opt_new();
  v80 = v9;
  if (v9)
  {
    [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:258];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ([v8 zoneCount])
  {
    uint64_t v11 = 0LL;
    do
    {
      v12 = (void *)objc_opt_new();
      [v8 zoneNameForIndex:v11];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v12 forKeyedSubscript:v13];

      uint64_t v11 = (v11 + 1);
    }

    while (v11 < [v8 zoneCount]);
  }

  int v14 = VMULiteZoneIndex(v8);
  v111[0] = MEMORY[0x1895F87A8];
  v111[1] = 3221225472LL;
  v111[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke;
  v111[3] = &unk_189E00A30;
  v111[4] = self;
  id v112 = v8;
  id v70 = v10;
  id v113 = v70;
  id v15 = v80;
  id v114 = v15;
  int v116 = v14;
  id v16 = (NSMapTable *)v9;
  v115 = v16;
  __int128 v68 = v112;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v112, v111);
  if (self->_minimumLabelCount > 1)
  {
    v110[0] = MEMORY[0x1895F87A8];
    v110[1] = 3221225472LL;
    v110[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2;
    v110[3] = &unk_189E00A58;
    v110[4] = self;
    [v70 enumerateKeysAndObjectsUsingBlock:v110];
  }

  uint64_t v106 = 0LL;
  v107 = &v106;
  uint64_t v108 = 0x2020000000LL;
  char v109 = 0;
  v105[0] = MEMORY[0x1895F87A8];
  v105[1] = 3221225472LL;
  v105[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3;
  v105[3] = &unk_189E00A80;
  v105[4] = &v106;
  [v70 enumerateKeysAndObjectsUsingBlock:v105];
  int v69 = *((unsigned __int8 *)v107 + 24);
  if (*((_BYTE *)v107 + 24))
  {
    [v70 allKeys];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x1895F87A8];
    v103[1] = 3221225472LL;
    v103[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4;
    v103[3] = &unk_189E00AA8;
    id v74 = v70;
    id v104 = v74;
    [v17 sortedArrayUsingComparator:v103];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80
      && (![v15 usesLiteMode] || (objc_msgSend(v15, "inspectingLiveProcess") & 1) == 0))
    {
      v101[0] = MEMORY[0x1895F87A8];
      v101[1] = 3221225472LL;
      v101[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5;
      v101[3] = &unk_189DFDAB8;
      v102 = v16;
      [v15 enumerateMSLRecordsAndPayloads:v101];
    }

    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    obuint64_t j = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v97 objects:v119 count:16];
    if (v19)
    {
      v20 = 0LL;
      unint64_t v21 = 0x189DFB000uLL;
      uint64_t v72 = v19;
      uint64_t v73 = *(void *)v98;
      do
      {
        for (uint64_t i = 0LL; i != v72; ++i)
        {
          if (*(void *)v98 != v73) {
            objc_enumerationMutation(obj);
          }
          os_signpost_id_t v22 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          id v23 = objc_alloc(*(Class *)(v21 + 3720));
          v24 = (void *)[v23 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"-----------------------------------------------------------------------" fieldType:0];

          v85[2](v85, v24);
          unint64_t v25 = (void *)NSString;
          id v26 = v22;
          [v25 stringWithFormat:@"Zone %s\n", [v26 UTF8String]];
          __int128 v75 = (void *)objc_claimAutoreleasedReturnValue();
          id v27 = objc_alloc(*(Class *)(v21 + 3720));
          v87 = (void *)[v27 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:v75 fieldType:0];

          v85[2](v85, v87);
          [v74 objectForKeyedSubscript:v26];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 allKeys];
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1895F87A8];
          v95[1] = 3221225472LL;
          v95[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6;
          v95[3] = &unk_189E00AA8;
          id v81 = v28;
          id v96 = v81;
          [v29 sortedArrayUsingComparator:v95];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v80)
          {
            id v31 = objc_alloc(*(Class *)(v21 + 3720));
            v32 = (void *)[v31 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    COUNT     BYTES   AVERAGE   CONTENT" fieldType:0];

            v85[2](v85, v32);
            id v33 = objc_alloc(*(Class *)(v21 + 3720));
            v87 = (void *)[v33 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

            v85[2](v85, v87);
          }

          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          id v77 = v30;
          uint64_t v34 = [v77 countByEnumeratingWithState:&v91 objects:v118 count:16];
          if (v34)
          {
            uint64_t v79 = *(void *)v92;
            do
            {
              uint64_t v83 = v34;
              for (uint64_t j = 0LL; j != v83; ++j)
              {
                if (*(void *)v92 != v79) {
                  objc_enumerationMutation(v77);
                }
                uint64_t v36 = *(void *)(*((void *)&v91 + 1) + 8 * j);
                [v81 objectForKeyedSubscript:v36];
                v37 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                uint64_t v38 = -[NSMapTable count](v37, "count");
                unint64_t v39 = v37;
                unint64_t v40 = v38;
                table = v39;
                uint64_t v41 = totalSizeOfRanges(v39);
                *(float *)&double v42 = (float)(unint64_t)v41 / (float)v40;
                if (v80)
                {
                  if (v40 < 2) {
                    [NSString stringWithFormat:@"Instances: %lu   Bytes: %lu   %@", v42, v40, v41, v36];
                  }
                  else {
                    [NSString stringWithFormat:@"Instances: %lu   Total bytes: %lu   Average bytes: %.1f   %@", v40, v41, *(float *)&v42, v36, v68];
                  }
                  unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                  id v44 = objc_alloc(*(Class *)(v21 + 3720));
                  uint64_t v45 = [v44 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v43 fieldType:0];

                  v85[2](v85, (void *)v45);
                  v87 = (void *)v45;

                  context = (void *)MEMORY[0x186E32E40]();
                  LODWORD(v45) = [v15 coldestFrameIsNotThreadId];
                  id v49 = objc_alloc(&OBJC_CLASS___VMUCallTreeRoot);
                  if ((_DWORD)v45) {
                    uint64_t v50 = 12LL;
                  }
                  else {
                    uint64_t v50 = 8LL;
                  }
                  uint64_t v51 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( v49,  "initWithSymbolicator:sampler:options:",  a4._opaque_1,  a4._opaque_2,  0LL,  v50);
                  -[VMUCallTreeRoot setStackLogReader:](v51, "setStackLogReader:", v15);
                  unint64_t v52 = objc_alloc_init(&OBJC_CLASS___VMUBacktrace);
                  v52->_callstack.frames = v117;
                  v52->_flavor = 32;
                  NSEnumerateMapTable(&enumerator, table);
                  unsigned int v53 = 0;
                  value = 0LL;
                  key = 0LL;
                  uint64_t v54 = -1LL;
                  while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
                  {
                    v55 = NSMapGet(v16, key);
                    if ((void *)v54 != v55)
                    {
                      unsigned int v53 = [v15 getFramesForStackID:v55 stackFramesBuffer:v117];
                      uint64_t v54 = (uint64_t)v55;
                    }

                    if (v53)
                    {
                      if ([v15 coldestFrameIsNotThreadId])
                      {
                        LODWORD(v56) = 0;
                        unsigned int v57 = v53;
                      }

                      else
                      {
                        unsigned int v57 = v53 - 1;
                        uint64_t v56 = v117[v53 - 1];
                      }

                      v52->_callstack.context.thread = v56;
                      v52->_callstack.length = v57;
                      id v58 =  -[VMUCallTreeRoot addBacktrace:count:numBytes:]( v51,  "addBacktrace:count:numBytes:",  v52,  1LL,  value);
                    }
                  }

                  NSEndMapTableEnumeration(&enumerator);
                  v52->_callstack.frames = 0LL;
                  -[VMUCallTreeRoot allBacktracesHaveBeenAdded](v51, "allBacktracesHaveBeenAdded");
                  if (self->_invertCallTrees)
                  {
                    -[VMUCallTreeNode invertedNode](v51, "invertedNode");
                    unint64_t v21 = 0x189DFB000LL;
                    v59 = (VMUCallTreeRoot *)objc_claimAutoreleasedReturnValue();
                  }

                  else
                  {
                    v59 = v51;
                    unint64_t v21 = 0x189DFB000uLL;
                  }
                  v60 = -[VMUCallTreeNode stringFromCallTreeIndentIfNoBranches:]( v59,  "stringFromCallTreeIndentIfNoBranches:",  1LL);
                  if ([v60 length])
                  {
                    v61 = "Inverted call tree:";
                    if (!self->_invertCallTrees) {
                      v61 = "Call tree:";
                    }
                    [NSString stringWithFormat:@"%s" v61];
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    id v63 = objc_alloc(*(Class *)(v21 + 3720));
                    __int128 v64 = (void *)[v63 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:v62 fieldType:0];

                    v85[2](v85, v64);
                    id v65 = objc_alloc(*(Class *)(v21 + 3720));
                    v87 = (void *)[v65 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v60 fieldType:0];

                    v85[2](v85, v87);
                  }

                  objc_autoreleasePoolPop(context);
                }

                else
                {
                  [NSString stringWithFormat:@"%9lu %9lu %9.1f   %@", v40, v41, *(float *)&v42, v36];
                  char v46 = (void *)objc_claimAutoreleasedReturnValue();
                  id v47 = objc_alloc(*(Class *)(v21 + 3720));
                  uint64_t v48 = [v47 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v46 fieldType:0];

                  v85[2](v85, (void *)v48);
                  v87 = (void *)v48;
                }
              }

              uint64_t v34 = [v77 countByEnumeratingWithState:&v91 objects:v118 count:16];
            }

            while (v34);
          }

          id v66 = objc_alloc(*(Class *)(v21 + 3720));
          v20 = (void *)[v66 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:&stru_189E010C8 fieldType:0];

          v85[2](v85, v20);
        }

        uint64_t v72 = [obj countByEnumeratingWithState:&v97 objects:v119 count:16];
      }

      while (v72);
    }
  }

  _Block_object_dispose(&v106, 8);

  return v69 != 0;
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4)
{
  if (a3[1] >> 60 == 1LL)
  {
    id v8 = (void *)MEMORY[0x186E32E40]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(void *)(a1 + 32) + 34LL)))
    {
      [*(id *)(a1 + 40) zoneNameForIndex:*(unsigned int *)(a4 + 148)];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        BOOL v11 = 1;
      }
      [*(id *)(a1 + 40) labelForNode:a2];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)a3[2];
        if (*(_BYTE *)(*(void *)(a1 + 32) + 33LL)) {
          [v13 className];
        }
        else {
          [v13 displayName];
        }
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3[2])
        {
          [NSString stringWithFormat:@"%@  %@", v14, v12];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v15 = v12;
        }

        id v16 = v15;
        [v10 objectForKeyedSubscript:v15];
        id v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:1282];
          id v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          [v10 setObject:v17 forKeyedSubscript:v16];
        }

        NSMapInsert(v17, (const void *)*a3, (const void *)(a3[1] & 0xFFFFFFFFFFFFFFFLL));
        if (*(void *)(a1 + 64))
        {
          if (([*(id *)(a1 + 56) inspectingLiveProcess] ^ 1 | v11))
          {
            uint64_t uniquing_table_index = -1LL;
          }

          else
          {
            [*(id *)(a1 + 56) liteMSLPayloadforMallocAddress:*a3 size:a3[1] & 0xFFFFFFFFFFFFFFFLL];
            uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
          }

          NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, (const void *)uniquing_table_index);
        }
      }
    }

    objc_autoreleasePoolPop(v8);
  }

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  [v4 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [v4 objectForKeyedSubscript:v10];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t result = [a3 count];
  if (result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 objectForKeyedSubscript:a2];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 count];

  [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v10 = [v9 count];
  if (v8 <= v10) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = -1LL;
  }
  if (v8 < v10) {
    return 1LL;
  }
  else {
    return v11;
  }
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5( uint64_t a1,  int a2,  void *key)
{
  if (a2 == 2)
  {
    if (NSMapGet(*(NSMapTable **)(a1 + 32), key))
    {
      uint64_t uniquing_table_index = (const void *)msl_payload_get_uniquing_table_index();
      NSMapInsert(*(NSMapTable **)(a1 + 32), key, uniquing_table_index);
    }
  }

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  uint64_t v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = -[NSMapTable count](v6, "count");
  uint64_t v9 = -[NSMapTable count](v7, "count") - v8;
  if (!v9)
  {
    uint64_t v10 = totalSizeOfRanges(v6);
    uint64_t v9 = totalSizeOfRanges(v7) - v10;
    if (!v9) {
      uint64_t v9 = [a2 compare:a3];
    }
  }

  return v9;
}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 fieldBlock:(id)a5
{
  uint64_t v133 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v81 = (void *)objc_opt_new();
  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:259];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = (void *)objc_opt_new();
  int v13 = VMULiteZoneIndex(v8);
  v122[0] = MEMORY[0x1895F87A8];
  v122[1] = 3221225472LL;
  v122[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke;
  v122[3] = &unk_189E00A30;
  int v128 = v13;
  id v123 = v9;
  __int128 v98 = self;
  v124 = self;
  id v14 = v8;
  id v15 = v123;
  id v16 = v14;
  id v125 = v14;
  id v78 = v12;
  id v126 = v78;
  uint64_t v17 = v11;
  v127 = v17;
  uint64_t v79 = v16;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v16, v122);
  if (v15
    && (![v15 usesLiteMode] || (objc_msgSend(v15, "inspectingLiveProcess") & 1) == 0))
  {
    v120[0] = MEMORY[0x1895F87A8];
    v120[1] = 3221225472LL;
    v120[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2;
    v120[3] = &unk_189DFDAB8;
    v121 = v17;
    [v15 enumerateMSLRecordsAndPayloads:v120];
  }

  v88 = v15;
  [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:259];
  v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v80 = v17;
  NSEnumerateMapTable(&enumerator, v17);
  value = 0LL;
  if (NSNextMapEnumeratorPair(&enumerator, 0LL, &value))
  {
    *(int64x2_t *)context = vdupq_n_s64(1uLL);
    do
    {
      uint64_t v19 = (void *)MEMORY[0x186E32E40]();
      uint64_t v20 = *((void *)value + 2);
      if (v20 != -1)
      {
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)value + 2)];
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v22 = -[NSMapTable objectForKey:](v18, "objectForKey:", v21);

        if (!v22)
        {
          os_signpost_id_t v22 = (int64x2_t *)malloc(0x18uLL);
          v22->i64[0] = 0LL;
          v22->i64[1] = 0LL;
          [MEMORY[0x189607920] mapTableWithKeyOptions:2 valueOptions:259];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v81 addObject:v23];
          v22[1].i64[0] = (uint64_t)v23;
          NSMapInsertKnownAbsent( v18,  (const void *)[MEMORY[0x189607968] numberWithUnsignedLongLong:v20],  v22);
        }

        v24.i64[1] = (uint64_t)context[1];
        v24.i64[0] = *(void *)value;
        unint64_t v25 = (char *)value + 8;
        *os_signpost_id_t v22 = vaddq_s64(*v22, v24);
        id v26 = (int64x2_t *)[(id)v22[1].i64[0] objectForKey:*v25];
        if (!v26)
        {
          id v26 = (int64x2_t *)malloc(0x10uLL);
          v26->i64[0] = 0LL;
          v26->i64[1] = 0LL;
          NSMapInsertKnownAbsent((NSMapTable *)v22[1].i64[0], *((const void **)value + 1), v26);
        }

        int64x2_t v27 = vdupq_n_s64(1uLL);
        v27.i64[0] = *(void *)value;
        *id v26 = vaddq_s64(*v26, v27);
      }

      objc_autoreleasePoolPop(v19);
    }

    while (NSNextMapEnumeratorPair(&enumerator, 0LL, &value));
  }

  NSEndMapTableEnumeration(&enumerator);
  if (self->_minimumLabelCount >= 2)
  {
    v86 = (void *)MEMORY[0x186E32E40]();
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    NSAllMapTableKeys(v18);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    __int128 v93 = (void *)[obj countByEnumeratingWithState:&v114 objects:v132 count:16];
    if (v93)
    {
      uint64_t v91 = *(void *)v115;
      uint64_t v83 = v18;
      do
      {
        for (uint64_t i = 0LL; i != v93; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v115 != v91) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v114 + 1) + 8LL * (void)i);
          contexta = (void *)MEMORY[0x186E32E40]();
          uint64_t v30 = -[NSMapTable objectForKey:](v18, "objectForKey:", v29);
          __int128 v112 = 0u;
          __int128 v113 = 0u;
          __int128 v110 = 0u;
          __int128 v111 = 0u;
          NSAllMapTableKeys(*(NSMapTable **)(v30 + 16));
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = [v31 countByEnumeratingWithState:&v110 objects:v131 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v111;
            do
            {
              for (uint64_t j = 0LL; j != v33; ++j)
              {
                if (*(void *)v111 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v110 + 1) + 8 * j);
                v37 = (void *)[*(id *)(v30 + 16) objectForKey:v36];
                unint64_t v38 = v37[1];
                if (v38 < v98->_minimumLabelCount)
                {
                  uint64_t v39 = *(void *)v30;
                  *(void *)(v30 + 8) -= v38;
                  *(void *)uint64_t v30 = v39 - *v37;
                  [*(id *)(v30 + 16) removeObjectForKey:v36];
                }
              }

              uint64_t v33 = [v31 countByEnumeratingWithState:&v110 objects:v131 count:16];
            }

            while (v33);
          }

          v18 = v83;
          if (![*(id *)(v30 + 16) count]) {
            -[NSMapTable removeObjectForKey:](v83, "removeObjectForKey:", v29);
          }
          objc_autoreleasePoolPop(contexta);
        }

        __int128 v93 = (void *)[obj countByEnumeratingWithState:&v114 objects:v132 count:16];
      }

      while (v93);
    }

    objc_autoreleasePoolPop(v86);
  }

  uint64_t v40 = -[NSMapTable count](v18, "count");
  uint64_t v41 = v80;
  if (v40)
  {
    NSAllMapTableKeys(v18);
    double v42 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = MEMORY[0x1895F87A8];
    v108[1] = 3221225472LL;
    v108[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3;
    v108[3] = &unk_189E00040;
    v87 = v18;
    char v109 = v87;
    [v42 sortedArrayUsingComparator:v108];
    unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    id v82 = v43;
    id obja = (id)[v82 countByEnumeratingWithState:&v104 objects:v130 count:16];
    if (obja)
    {
      uint64_t v77 = v40;
      v84 = v18;
      id v44 = 0LL;
      unint64_t v45 = 0x189DFB000uLL;
      uint64_t v85 = *(void *)v105;
      do
      {
        uint64_t v46 = 0LL;
        do
        {
          if (*(void *)v105 != v85) {
            objc_enumerationMutation(v82);
          }
          __int128 v92 = *(void **)(*((void *)&v104 + 1) + 8 * v46);
          __int128 v94 = (void *)MEMORY[0x186E32E40]();
          uint64_t v47 = -[NSMapTable objectForKey:](v87, "objectForKey:", v92);
          id v48 = objc_alloc(*(Class *)(v45 + 3720));
          id v49 = (void *)[v48 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    COUNT     BYTES   AVERAGE   CONTENT" fieldType:0];

          v10[2](v10, v49);
          id v50 = objc_alloc(*(Class *)(v45 + 3720));
          uint64_t v51 = (void *)[v50 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

          v10[2](v10, v51);
          uint64_t contextb = v46;
          if ((unint64_t)[*(id *)(v47 + 16) count] >= 2)
          {
            [NSString stringWithFormat:@"%9lu %9lu %9.1f   %s",  *(void *)(v47 + 8),  *(void *)v47,  (float)((float)*(unint64_t *)v47 / (float)*(unint64_t *)(v47 + 8)),  "TOTAL FOR STACK"];
            unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
            id v53 = objc_alloc(*(Class *)(v45 + 3720));
            uint64_t v54 = (void *)[v53 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v52 fieldType:0];

            v10[2](v10, v54);
            id v55 = objc_alloc(*(Class *)(v45 + 3720));
            uint64_t v51 = (void *)[v55 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

            v10[2](v10, v51);
          }

          unint64_t v56 = v45;
          NSAllMapTableKeys(*(NSMapTable **)(v47 + 16));
          unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue();
          v103[0] = MEMORY[0x1895F87A8];
          v103[1] = 3221225472LL;
          v103[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4;
          v103[3] = &__block_descriptor_40_e11_q24__0_8_16l;
          void v103[4] = v47;
          [v57 sortedArrayUsingComparator:v103];
          id v58 = (void *)objc_claimAutoreleasedReturnValue();

          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          id v59 = v58;
          uint64_t v60 = [v59 countByEnumeratingWithState:&v99 objects:v129 count:16];
          if (v60)
          {
            uint64_t v61 = v60;
            uint64_t v62 = *(void *)v100;
            do
            {
              uint64_t v63 = 0LL;
              __int128 v64 = v51;
              do
              {
                if (*(void *)v100 != v62) {
                  objc_enumerationMutation(v59);
                }
                uint64_t v65 = *(void *)(*((void *)&v99 + 1) + 8 * v63);
                id v66 = (void *)[*(id *)(v47 + 16) objectForKey:v65];
                [NSString stringWithFormat:@"%9lu %9lu %9.1f   %@", v66[1], *v66, (float)((float)(unint64_t)*v66 / (float)(unint64_t)v66[1]), v65];
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                id v68 = objc_alloc(*(Class *)(v56 + 3720));
                uint64_t v51 = (void *)[v68 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v67 fieldType:0];

                v10[2](v10, v51);
                ++v63;
                __int128 v64 = v51;
              }

              while (v61 != v63);
              uint64_t v61 = [v59 countByEnumeratingWithState:&v99 objects:v129 count:16];
            }

            while (v61);
          }

          unint64_t v45 = v56;
          id v69 = objc_alloc(*(Class *)(v56 + 3720));
          id v70 = (void *)[v69 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"======" fieldType:0];

          v10[2](v10, v70);
          [v88 symbolicatedBacktraceForStackID:[v92 unsignedLongLongValue] options:4 * v98->_fullStacks];
          __int128 v71 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithFormat:@"%@%@", @"STACK: ", v71];
          uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
          id v73 = objc_alloc(*(Class *)(v56 + 3720));
          id v74 = (void *)[v73 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v72 fieldType:0];

          v10[2](v10, v74);
          id v75 = objc_alloc(*(Class *)(v56 + 3720));
          id v44 = (void *)[v75 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:&stru_189E010C8 fieldType:0];

          v10[2](v10, v44);
          objc_autoreleasePoolPop(v94);
          uint64_t v46 = contextb + 1;
        }

        while ((id)(contextb + 1) != obja);
        id obja = (id)[v82 countByEnumeratingWithState:&v104 objects:v130 count:16];
      }

      while (obja);

      uint64_t v41 = v80;
      v18 = v84;
      uint64_t v40 = v77;
    }
  }

  return v40 != 0;
}

void __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4)
{
  else {
    BOOL v8 = 1;
  }
  if (a3[1] >> 60 == 1LL)
  {
    id v9 = (void *)MEMORY[0x186E32E40]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(void *)(a1 + 40) + 34LL)))
    {
      [*(id *)(a1 + 48) labelForNode:a2];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        uint64_t v11 = (void *)a3[2];
        if (v11)
        {
          if (*(_BYTE *)(*(void *)(a1 + 40) + 33LL)) {
            [v11 className];
          }
          else {
            [v11 displayName];
          }
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          id v16 = (void *)[objc_alloc(NSString) initWithFormat:@"%@  %@", v12, v10];
          id v17 = *(id *)(a1 + 56);
          id v13 = v16;
          [v17 member:v13];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            [v17 addObject:v13];
            id v15 = v13;
          }
        }

        else
        {
          id v12 = *(id *)(a1 + 56);
          id v13 = v10;
          [v12 member:v13];
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            [v12 addObject:v13];
            id v14 = v13;
          }

          id v15 = v14;
        }

        v18 = malloc(0x18uLL);
        void *v18 = a3[1] & 0xFFFFFFFFFFFFFFFLL;
        v18[1] = v15;
        if (([*(id *)(a1 + 32) inspectingLiveProcess] ^ 1 | v8))
        {
          uint64_t uniquing_table_index = -1LL;
        }

        else
        {
          [*(id *)(a1 + 32) liteMSLPayloadforMallocAddress:*a3 size:a3[1] & 0xFFFFFFFFFFFFFFFLL];
          uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
        }

        v18[2] = uniquing_table_index;
        NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, v18);
      }
    }

    objc_autoreleasePoolPop(v9);
  }

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2( uint64_t result,  int a2,  void *key)
{
  if (a2 == 2)
  {
    uint64_t result = (uint64_t)NSMapGet(*(NSMapTable **)(result + 32), key);
    if (result)
    {
      uint64_t v3 = result;
      uint64_t result = msl_payload_get_uniquing_table_index();
      *(void *)(v3 + 16) = result;
    }
  }

  return result;
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = (void *)[v5 objectForKey:a2];
  BOOL v8 = (void *)[*(id *)(a1 + 32) objectForKey:v6];

  if (*v7 <= *v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = -1LL;
  }
  if (*v7 < *v8) {
    return 1LL;
  }
  else {
    return v9;
  }
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v5];
  BOOL v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v6];
  if (*v7 <= *v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = -1LL;
  }
  if (*v7 < *v8) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v9;
  }
  if (*v7 == *v8) {
    uint64_t v10 = [v5 compare:v6];
  }

  return v10;
}

- (void)summaryWithGraph:(id)a3 block:(id)a4
{
  id v6 = a4;
  -[VMUDuplicatesAnalyzer _analysisSummaryWithGraphOrScanner:](self, "_analysisSummaryWithGraphOrScanner:", a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke;
  v10[3] = &unk_189E00AF0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 longestKeyLength];
  id v6 = (void *)NSString;
  id v7 = [v4 key];
  uint64_t v8 = [v7 UTF8String];
  [v4 formattedValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = v9;
  [v6 stringWithFormat:@"    %*s:  %s", v5, v8, [v10 UTF8String]];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 block:(id)a6
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  id v11 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke;
  v14[3] = &unk_189E00B18;
  id v15 = v11;
  id v12 = v11;
  LOBYTE(a5) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:]( self,  "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:",  a3,  opaque_1,  opaque_2,  a5,  v14);

  return (char)a5;
}

void __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 formattedValue];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 block:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke;
  v11[3] = &unk_189E00B18;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a4) = -[VMUDuplicatesAnalyzer findStringDupsByStack:stackLogReader:fieldBlock:]( self,  "findStringDupsByStack:stackLogReader:fieldBlock:",  a3,  a4,  v11);

  return (char)a4;
}

void __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 formattedValue];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fullAnalysisWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (self->_objectContentLevel != 1)
  {
    if (!self->_quiet)
    {
      id v7 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
      id v8 = kVMUAnalysisDataKey[0];
      -[VMUProcessObjectGraph processDescriptionString](self->super._graph, "processDescriptionString");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v7,  "initWithKey:numericalValue:objectValue:fieldType:",  v8,  0LL,  v9,  0LL);

      v4[2](v4, v10);
    }

    [NSString stringWithFormat:@"Showing object labels that have at least %lu duplicates.  Pass the -minimumCount <count> argument to change the threshold.\n",  self->_minimumLabelCount];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
    id v6 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v12,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisWarningKey[0],  0LL,  v11,  0LL);
    v4[2](v4, v6);
    if (self->_objectContentLevel == 2)
    {
      id v13 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
      uint64_t v14 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v13,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisWarningKey[0],  0LL,  @"The memory graph file only contains labels for contents of readonly memory of the target process, so only those items can be shown.\n",  0LL);

      v4[2](v4, (void *)v14);
      id v6 = (VMUAnalyzerSummaryField *)v14;
    }

    if (self->_showStacks)
    {
      -[VMUProcessObjectGraph stackLogReader](self->super._graph, "stackLogReader");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (!self->_showCallTrees)
        {
          graph = self->super._graph;
          v32[0] = MEMORY[0x1895F87A8];
          v32[1] = 3221225472LL;
          v32[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke;
          v32[3] = &unk_189E00B18;
          uint64_t v33 = v4;
          LOBYTE(graph) = -[VMUDuplicatesAnalyzer findStringDupsByStack:stackLogReader:fieldBlock:]( self,  "findStringDupsByStack:stackLogReader:fieldBlock:",  graph,  v15,  v32);

          if ((graph & 1) != 0)
          {
LABEL_20:
            if (self->_quiet) {
              goto LABEL_21;
            }
            id v26 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
            int64x2_t v27 = kVMUAnalysisDataKey[0];
            uint64_t v28 = -[VMUProcessObjectGraph binaryImagesDescription](self->super._graph, "binaryImagesDescription");
            uint64_t v24 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v26,  "initWithKey:numericalValue:objectValue:fieldType:",  v27,  0LL,  v28,  0LL);

            id v6 = (VMUAnalyzerSummaryField *)v28;
LABEL_18:

            v4[2](v4, (void *)v24);
            id v6 = (VMUAnalyzerSummaryField *)v24;
LABEL_21:

            goto LABEL_22;
          }

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)invertCallTrees
{
  return self->_invertCallTrees;
}

- (void)setInvertCallTrees:(BOOL)a3
{
  self->_invertCallTrees = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)stringsOnly
{
  return self->_stringsOnly;
}

- (void)setStringsOnly:(BOOL)a3
{
  self->_stringsOnly = a3;
}

- (unint64_t)minimumLabelCount
{
  return self->_minimumLabelCount;
}

- (void)setMinimumLabelCount:(unint64_t)a3
{
  self->_minimumLabelCount = a3;
}

- (BOOL)showStacks
{
  return self->_showStacks;
}

- (void)setShowStacks:(BOOL)a3
{
  self->_showStacks = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showCallTrees
{
  return self->_showCallTrees;
}

- (void)setShowCallTrees:(BOOL)a3
{
  self->_showCallTrees = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

@end