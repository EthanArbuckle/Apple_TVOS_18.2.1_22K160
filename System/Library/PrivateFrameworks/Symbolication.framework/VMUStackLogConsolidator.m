@interface VMUStackLogConsolidator
- (VMUDebugTimer)debugTimer;
- (VMUStackLogConsolidator)initWithScannerOrGraph:(id)a3 stackLogReader:(id)a4;
- (id)callTreeWithOptions:(unint64_t)a3 nodeFilter:(id)a4;
- (id)stackIDsToNodesFilteredBy:(id)a3;
- (void)setDebugTimer:(id)a3;
@end

@implementation VMUStackLogConsolidator

- (VMUStackLogConsolidator)initWithScannerOrGraph:(id)a3 stackLogReader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VMUStackLogConsolidator;
  v9 = -[VMUStackLogConsolidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerOrGraph, a3);
    objc_storeStrong((id *)&v10->_stackLogReader, a4);
  }

  return v10;
}

- (id)stackIDsToNodesFilteredBy:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:259];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v7 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v7)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v9 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v8,  OS_SIGNPOST_INTERVAL_END,  v10,  "VMUStackLogConsolidator",  "",  buf,  2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUStackLogConsolidator",  "step 1 -- build map table with live malloc block addresses as keys");
  v11 = self->_debugTimer;
  if (v11)
  {
    -[VMUDebugTimer logHandle](v11, "logHandle");
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "VMUStackLogConsolidator",  "step 1 -- build map table with live malloc block addresses as keys",  buf,  2u);
      }
    }
  }

  *(void *)buf = 0LL;
  v58 = buf;
  uint64_t v59 = 0x2020000000LL;
  int v60 = 0;
  int v15 = -[VMUCommonGraphInterface nodeCount](self->_scannerOrGraph, "nodeCount");
  scannerOrGraph = self->_scannerOrGraph;
  uint64_t v17 = MEMORY[0x1895F87A8];
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  v52[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke;
  v52[3] = &unk_189DFE550;
  v52[4] = self;
  v55 = buf;
  int v56 = v15;
  id v18 = v4;
  id v54 = v18;
  v19 = v5;
  v53 = v19;
  -[VMUCommonGraphInterface enumerateRegionsWithBlock:](scannerOrGraph, "enumerateRegionsWithBlock:", v52);
  if ((!-[VMUStackLogReader inspectingLiveProcess](self->_stackLogReader, "inspectingLiveProcess")
     || (-[VMUStackLogReader usesLiteMode](self->_stackLogReader, "usesLiteMode") & 1) == 0)
    && (-[VMUStackLogReader usesCoreFile](self->_stackLogReader, "usesCoreFile") & 1) == 0)
  {
    v20 = self->_debugTimer;
    if (v20)
    {
      uint64_t v21 = -[VMUDebugTimer signpostID](v20, "signpostID");
      v20 = self->_debugTimer;
      if (v21)
      {
        -[VMUDebugTimer logHandle](v20, "logHandle");
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v23 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          LOWORD(v49._pi) = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v22,  OS_SIGNPOST_INTERVAL_END,  v23,  "VMUStackLogConsolidator",  "",  (uint8_t *)&v49,  2u);
        }

        v20 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v20, "endEvent:", "VMUStackLogConsolidator");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUStackLogConsolidator",  "step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest");
    v24 = self->_debugTimer;
    if (v24)
    {
      -[VMUDebugTimer logHandle](v24, "logHandle");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v26 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        LOWORD(v49._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v26,  "VMUStackLogConsolidator",  "step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest",  (uint8_t *)&v49,  2u);
      }
    }

    stackLogReader = self->_stackLogReader;
    v50[0] = v17;
    v50[1] = 3221225472LL;
    v50[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5;
    v50[3] = &unk_189DFDAB8;
    v51 = v19;
    -[VMUStackLogReader enumerateMSLRecordsAndPayloads:](stackLogReader, "enumerateMSLRecordsAndPayloads:", v50);
  }

  v28 = self->_debugTimer;
  if (v28)
  {
    uint64_t v29 = -[VMUDebugTimer signpostID](v28, "signpostID");
    v28 = self->_debugTimer;
    if (v29)
    {
      -[VMUDebugTimer logHandle](v28, "logHandle");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v31 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v49._pi) = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v30,  OS_SIGNPOST_INTERVAL_END,  v31,  "VMUStackLogConsolidator",  "",  (uint8_t *)&v49,  2u);
      }

      v28 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v28, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUStackLogConsolidator",  "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap");
  v32 = self->_debugTimer;
  if (v32)
  {
    -[VMUDebugTimer logHandle](v32, "logHandle");
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v34 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(v49._pi) = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v33,  OS_SIGNPOST_INTERVAL_BEGIN,  v34,  "VMUStackLogConsolidator",  "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap",  (uint8_t *)&v49,  2u);
    }
  }

  v35 = (void *)objc_opt_new();
  NSEnumerateMapTable(&v49, v19);
  value = 0LL;
  key = 0LL;
  while (NSNextMapEnumeratorPair(&v49, &key, &value))
  {
    uint64_t v36 = *(void *)value;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)value];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 objectForKeyedSubscript:v37];
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v38 = (void *)objc_opt_new();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v36];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v38 forKeyedSubscript:v39];
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)value + 4)];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 addObject:v40];
  }

  NSEndMapTableEnumeration(&v49);
  v41 = self->_debugTimer;
  if (v41)
  {
    uint64_t v42 = -[VMUDebugTimer signpostID](v41, "signpostID");
    v41 = self->_debugTimer;
    if (v42)
    {
      -[VMUDebugTimer logHandle](v41, "logHandle");
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v44 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)v46 = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v43,  OS_SIGNPOST_INTERVAL_END,  v44,  "VMUStackLogConsolidator",  "",  v46,  2u);
      }

      v41 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v41, "endEvent:", "VMUStackLogConsolidator");

  _Block_object_dispose(buf, 8);
  return v35;
}

void __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) zoneNameForIndex:*((unsigned int *)v3 + 37)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(*(void *)(a1 + 32) + 16) usesLiteMode])
  {
    id v5 = v4;
    else {
      int v6 = 0;
    }
  }

  else
  {
    int v6 = 0;
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) < *(_DWORD *)(a1 + 64))
  {
    while (1)
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8LL);
      if (v7)
      {
        [v7 nodeDetails:];
        id v8 = key[0];
      }

      else
      {
        id v8 = 0LL;
        key[0] = 0LL;
        key[1] = 0LL;
        uint64_t v19 = 0LL;
      }

      unint64_t v9 = (unint64_t)key[1];
      if ((((unint64_t)key[1] >> 60) | 4) == 5)
      {
        uint64_t v10 = *(void *)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 56);
        if (!v10) {
          goto LABEL_16;
        }
        uint64_t v12 = *(unsigned int *)(*(void *)(v11 + 8) + 24LL);
        unint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, __int128 *, void *))(v10 + 16);
        __int128 v16 = *(_OWORD *)key;
        uint64_t v17 = v19;
        if (v13(v10, v12, &v16, v4)) {
          break;
        }
      }

void *__53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5( uint64_t a1,  char a2,  const void *a3)
{
  result = (void *)msl_payload_get_uniquing_table_index();
  if ((a2 & 0x12) != 0)
  {
    uint64_t v7 = result;
    result = NSMapGet(*(NSMapTable **)(a1 + 32), a3);
    if (result) {
      void *result = v7;
    }
  }

  return result;
}

- (id)callTreeWithOptions:(unint64_t)a3 nodeFilter:(id)a4
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_END,  v11,  "VMUStackLogConsolidator",  "",  buf,  2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUStackLogConsolidator",  "step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap");
  uint64_t v12 = self->_debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "VMUStackLogConsolidator",  "step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap",  buf,  2u);
      }
    }
  }

  __int128 v16 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( objc_alloc(&OBJC_CLASS___VMUCallTreeRoot),  "initWithSymbolicator:sampler:options:",  0LL,  0LL,  0LL,  a3);
  -[VMUCallTreeRoot setStackLogReader:](v16, "setStackLogReader:", self->_stackLogReader);
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___VMUBacktrace);
  v17->_flavor = 32;
  if (self->_debugTimer) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%qu unique stacks\n", [v6 count]);
  }
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke;
  v29[3] = &unk_189DFE578;
  v29[4] = self;
  id v18 = v17;
  v30 = v18;
  uint64_t v19 = v16;
  os_signpost_id_t v31 = v19;
  [v6 enumerateKeysAndObjectsUsingBlock:v29];
  -[VMUCallTreeRoot allBacktracesHaveBeenAdded](v19, "allBacktracesHaveBeenAdded");
  v20 = -[VMUCommonGraphInterface binaryImagesDescription](self->_scannerOrGraph, "binaryImagesDescription");
  -[VMUCallTreeRoot setBinaryImagesDescription:](v19, "setBinaryImagesDescription:", v20);

  uint64_t v21 = self->_debugTimer;
  if (v21)
  {
    uint64_t v22 = -[VMUDebugTimer signpostID](v21, "signpostID");
    uint64_t v21 = self->_debugTimer;
    if (v22)
    {
      -[VMUDebugTimer logHandle](v21, "logHandle");
      os_signpost_id_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v24 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v23,  OS_SIGNPOST_INTERVAL_END,  v25,  "VMUStackLogConsolidator",  "",  buf,  2u);
        }
      }

      uint64_t v21 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v21, "endEvent:", "VMUStackLogConsolidator");
  os_signpost_id_t v26 = v31;
  v27 = v19;

  return v27;
}

void __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v28[512] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 unsignedLongValue];
  if (v7 != -1)
  {
    int v8 = [*(id *)(*(void *)(a1 + 32) + 16) getFramesForStackID:v7 stackFramesBuffer:v28];
    if (v8)
    {
      if ([*(id *)(*(void *)(a1 + 32) + 16) coldestFrameIsNotThreadId]) {
        LODWORD(v9) = -1;
      }
      else {
        uint64_t v9 = v28[--v8];
      }
      *(_DWORD *)(*(void *)(a1 + 40) + 28LL) = v9;
      *(_DWORD *)(*(void *)(a1 + 40) + 64LL) = v8;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0LL;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntValue];
            uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 8LL);
            if (v17)
            {
              uint64_t v17 = (void *)[v17 nodeDetails:v16];
            }

            else
            {
              uint64_t v20 = 0LL;
              uint64_t v21 = 0LL;
              uint64_t v22 = 0LL;
            }

            id v18 = (void *)MEMORY[0x186E32E40](v17);
            v13 += v21 & 0xFFFFFFFFFFFFFFFLL;
            objc_autoreleasePoolPop(v18);
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v12);
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      *(void *)(*(void *)(a1 + 40) + 48LL) = v28;
      objc_msgSend( *(id *)(a1 + 48),  "addBacktrace:count:numBytes:",  *(void *)(a1 + 40),  objc_msgSend(v10, "count"),  v13);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)(*(void *)(a1 + 40) + 48LL) = 0LL;
    }
  }
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end