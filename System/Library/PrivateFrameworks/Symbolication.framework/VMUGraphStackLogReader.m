@interface VMUGraphStackLogReader
+ (BOOL)supportsSecureCoding;
- (BOOL)containsTimestampsByNode;
- (BOOL)copyOriginalUniquingTable:(id)a3;
- (BOOL)inspectingLiveProcess;
- (BOOL)is64bit;
- (BOOL)populateBacktraceUniquingTableWithCore:(id)a3 zones:(_VMUZoneNode *)a4 zonesCount:(unsigned int)a5;
- (NSData)diskLogs;
- (VMUGraphStackLogReader)initWithCoder:(id)a3;
- (VMUGraphStackLogReader)initWithCore:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 zones:(_VMUZoneNode *)a7 zonesCount:(unsigned int)a8;
- (VMUGraphStackLogReader)initWithTask:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 collectDisklogs:(BOOL)a7;
- (VMUProcessObjectGraph)graph;
- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3;
- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3;
- (_VMURange)sourceLineRangeContainingPCaddress:(unint64_t)a3;
- (id)binaryImagePathForPCaddress:(unint64_t)a3;
- (id)functionNameForPCaddress:(unint64_t)a3;
- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4;
- (id)sourceFileNameForPCaddress:(unint64_t)a3;
- (id)sourcePathForPCaddress:(unint64_t)a3;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (int)enumerateMSLRecordsAndPayloads:(id)a3;
- (int)streamFullStackLogsToBlock:(id)a3;
- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6;
- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5;
- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4;
- (unint64_t)maxTimestampDelta;
- (unint64_t)mslRecordsCount;
- (unint64_t)nodesInUniquingTable;
- (unint64_t)stackIDForNode:(unsigned int)a3;
- (unint64_t)timestampForNode:(unsigned int)a3;
- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3;
- (void)_parseSourceInfoString:(id)a3 intoComponents:(unsigned int *)a4;
- (void)_setFunctionName:(id)a3 forPCAddressRange:(_VMURange)a4;
- (void)_setSourcePath:(id)a3 lineNumber:(unsigned int)a4 forPCAddressRange:(_VMURange)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateUniquingTable:(id)a3;
- (void)populateBacktraceUniquingTableWithStackLogs:(id)a3;
- (void)setDiskLogs:(id)a3;
- (void)setGraph:(id)a3;
- (void)symbolicateBacktraceUniquingTable;
@end

@implementation VMUGraphStackLogReader

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUGraphStackLogReader)initWithCore:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 zones:(_VMUZoneNode *)a7 zonesCount:(unsigned int)a8
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader;
  v17 = -[VMUGraphStackLogReader init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->super._symbolicator._unint64_t opaque_1 = opaque_1;
    v17->super._symbolicator._unint64_t opaque_2 = opaque_2;
    -[VMUGraphStackLogReader setGraph:](v17, "setGraph:", v15);
    objc_storeStrong((id *)&v18->_debugTimer, a6);
    v18->super._usesCoreFile = 1;
    v18->super._coldestFrameIsNotThreadId = 1;
    v19 = objc_alloc_init(&OBJC_CLASS___VMUVMRegionTracker);
    regionTracker = v18->super._regionTracker;
    v18->super._regionTracker = v19;

    uint64_t v21 = objc_opt_new();
    functionNameRanges = v18->_functionNameRanges;
    v18->_functionNameRanges = (VMURangeToStringMap *)v21;

    uint64_t v23 = objc_opt_new();
    sourceInfoRanges = v18->_sourceInfoRanges;
    v18->_sourceInfoRanges = (VMURangeToStringMap *)v23;

    if (!-[VMUGraphStackLogReader populateBacktraceUniquingTableWithCore:zones:zonesCount:]( v18,  "populateBacktraceUniquingTableWithCore:zones:zonesCount:",  v14,  a7,  a8))
    {
      v25 = 0LL;
      goto LABEL_6;
    }

    -[VMUGraphStackLogReader symbolicateBacktraceUniquingTable](v18, "symbolicateBacktraceUniquingTable");
  }

  v25 = v18;
LABEL_6:

  return v25;
}

- (VMUGraphStackLogReader)initWithTask:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 collectDisklogs:(BOOL)a7
{
  BOOL v7 = a7;
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader;
  v17 = -[VMUGraphStackLogReader init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._vmuTask, a3);
    v18->super._task = -[VMUTask taskPort](v18->super._vmuTask, "taskPort");
    v18->super._symbolicator._unint64_t opaque_1 = opaque_1;
    v18->super._symbolicator._unint64_t opaque_2 = opaque_2;
    -[VMUGraphStackLogReader setGraph:](v18, "setGraph:", v15);
    objc_storeStrong((id *)&v18->_debugTimer, a6);
    v19 = -[VMUTaskStackLogReader initWithTask:symbolicator:]( objc_alloc(&OBJC_CLASS___VMUTaskStackLogReader),  "initWithTask:symbolicator:",  v18->super._task,  opaque_1,  opaque_2);
    if (!v19)
    {
      objc_super v27 = 0LL;
      goto LABEL_9;
    }

    v20 = v19;
    v18->super._coldestFrameIsNotThreadId = -[VMUStackLogReaderBase coldestFrameIsNotThreadId]( v19,  "coldestFrameIsNotThreadId");
    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___VMUVMRegionTracker);
    regionTracker = v18->super._regionTracker;
    v18->super._regionTracker = v21;

    uint64_t v23 = objc_opt_new();
    functionNameRanges = v18->_functionNameRanges;
    v18->_functionNameRanges = (VMURangeToStringMap *)v23;

    uint64_t v25 = objc_opt_new();
    sourceInfoRanges = v18->_sourceInfoRanges;
    v18->_sourceInfoRanges = (VMURangeToStringMap *)v25;

    if (!v7 || !-[VMUGraphStackLogReader copyOriginalUniquingTable:](v18, "copyOriginalUniquingTable:", v20)) {
      -[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:]( v18,  "populateBacktraceUniquingTableWithStackLogs:",  v20);
    }
    -[VMUGraphStackLogReader symbolicateBacktraceUniquingTable](v18, "symbolicateBacktraceUniquingTable");
  }

  objc_super v27 = v18;
LABEL_9:

  return v27;
}

- (void)setGraph:(id)a3
{
  id v9 = a3;
  objc_storeWeak((id *)&self->_graph, v9);
  [v9 symbolStore];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v9 symbolStore];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._symbolicator._unint64_t opaque_1 = [v5 symbolicator];
    self->super._symbolicator._unint64_t opaque_2 = v6;
  }

  unsigned int v7 = VMULiteZoneIndex(v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  self->super._usesLiteMode = v7 < [WeakRetained zoneCount];

  if (self->super._usesLiteMode) {
    self->super._coldestFrameIsNotThreadId = 1;
  }
}

- (void)dealloc
{
  backtraceUniquingTable = self->_backtraceUniquingTable;
  if (backtraceUniquingTable) {
    vmu_destroy_backtrace_uniquing_table((uint64_t)backtraceUniquingTable);
  }
  nodeToStackIndexTable = self->_nodeToStackIndexTable;
  if (nodeToStackIndexTable) {
    free(nodeToStackIndexTable);
  }
  nodeToTimestampTable = self->_nodeToTimestampTable;
  if (nodeToTimestampTable) {
    free(nodeToTimestampTable);
  }
  nodeToMSLPayloadTable = self->_nodeToMSLPayloadTable;
  if (nodeToMSLPayloadTable) {
    free(nodeToMSLPayloadTable);
  }
  originalUniquingTable = self->_originalUniquingTable;
  if (originalUniquingTable) {
    MEMORY[0x186E32DF8](originalUniquingTable, a2);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader;
  -[VMUGraphStackLogReader dealloc](&v8, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  uint64_t v6 = [WeakRetained serializationOptions];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"classVersion"];

  if (self->_backtraceUniquingTable)
  {
    debugTimer = self->_debugTimer;
    if (debugTimer)
    {
      uint64_t v9 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = self->_debugTimer;
      if (v9)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v11 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v10,  OS_SIGNPOST_INTERVAL_END,  v12,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        debugTimer = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving backtrace uniquing table");
    v13 = self->_debugTimer;
    if (v13)
    {
      -[VMUDebugTimer logHandle](v13, "logHandle");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v15 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "VMUGraphStackLogReader",  "archiving backtrace uniquing table",  buf,  2u);
        }
      }
    }

    [v4 encodeInt64:self->_backtraceUniquingTable->var3 forKey:@"backtraceUniquingTableSize"];
    [v4 encodeInt32:self->_backtraceUniquingTable->var9 forKey:@"backtraceUniquingTableFlags"];
    v17 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_backtraceUniquingTable->var0,  SLODWORD(self->_backtraceUniquingTable->var3),  v6);
    [v4 encodeObject:v17 forKey:@"backtraceUniquingTableContents"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Backtrace Uniquing Table] %llu node capacity  %u nodes full  %llu bytes\n\n",  self->_backtraceUniquingTable->var2,  self->_backtraceUniquingTable->var7,  self->_backtraceUniquingTable->var3);
    }
  }

  if (self->_originalUniquingTable)
  {
    *(void *)buf = 0LL;
    uint64_t v18 = msl_uniquing_table_serialize();
    if (v18 && *(void *)buf != 0LL)
    {
      mach_vm_address_t v20 = v18;
      if (*(void *)buf == -1LL)
      {
        mach_vm_size_t v22 = -1LL;
      }

      else
      {
        +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  v18);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 encodeObject:v21 forKey:@"originalUniquingTableContents"];

        mach_vm_size_t v22 = *(void *)buf;
        if (kVMUPrintArchivingTiming)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "[Original Uniquing Table] %llu bytes\n\n", *(void *)buf);
          mach_vm_size_t v22 = *(void *)buf;
        }
      }

      mach_vm_deallocate(*MEMORY[0x1895FBBE0], v20, v22);
    }
  }

  if (self->_nodeToStackIndexTable)
  {
    uint64_t v23 = self->_debugTimer;
    if (v23)
    {
      uint64_t v24 = -[VMUDebugTimer signpostID](v23, "signpostID");
      uint64_t v23 = self->_debugTimer;
      if (v24)
      {
        -[VMUDebugTimer logHandle](v23, "logHandle");
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v26 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v25,  OS_SIGNPOST_INTERVAL_END,  v27,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        uint64_t v23 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v23, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving nodeToStackIDTable");
    v28 = self->_debugTimer;
    if (v28)
    {
      -[VMUDebugTimer logHandle](v28, "logHandle");
      objc_super v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v30 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v31 = v30;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v31,  "VMUGraphStackLogReader",  "archiving nodeToStackIDTable",  buf,  2u);
        }
      }
    }

    uint64_t v32 = 4LL * self->_nodeNamespaceSize;
    v33 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_nodeToStackIndexTable,  v32,  v6);
    [v4 encodeObject:v33 forKey:@"nodeToStackIdTable"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[nodeToStackIdTable] nodeNamespaceSize %u  %lu bytes\n\n",  self->_nodeNamespaceSize,  v32);
    }
  }

  if (self->_nodeToTimestampTable)
  {
    v34 = self->_debugTimer;
    if (v34)
    {
      uint64_t v35 = -[VMUDebugTimer signpostID](v34, "signpostID");
      v34 = self->_debugTimer;
      if (v35)
      {
        -[VMUDebugTimer logHandle](v34, "logHandle");
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v37 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v38 = v37;
          if (os_signpost_enabled(v36))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v36,  OS_SIGNPOST_INTERVAL_END,  v38,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        v34 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v34, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving nodeToTimestampTable");
    v39 = self->_debugTimer;
    if (v39)
    {
      -[VMUDebugTimer logHandle](v39, "logHandle");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v41 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v40,  OS_SIGNPOST_INTERVAL_BEGIN,  v42,  "VMUGraphStackLogReader",  "archiving nodeToTimestampTable",  buf,  2u);
        }
      }
    }

    uint64_t v43 = 8LL * self->_nodeNamespaceSize;
    v44 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_nodeToTimestampTable,  v43,  v6);
    [v4 encodeObject:v44 forKey:@"nodeToTimestampTable"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[nodeToTimestampTable] nodeNamespaceSize %u  %lu bytes\n\n",  self->_nodeNamespaceSize,  v43);
    }
  }

  if (self->_nodeToMSLPayloadTable)
  {
    v45 = self->_debugTimer;
    if (v45)
    {
      uint64_t v46 = -[VMUDebugTimer signpostID](v45, "signpostID");
      v45 = self->_debugTimer;
      if (v46)
      {
        -[VMUDebugTimer logHandle](v45, "logHandle");
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v48 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v49 = v48;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v47,  OS_SIGNPOST_INTERVAL_END,  v49,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        v45 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v45, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving nodeToMSLPayloadTable");
    v50 = self->_debugTimer;
    if (v50)
    {
      -[VMUDebugTimer logHandle](v50, "logHandle");
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v52 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v53 = v52;
        if (os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v51,  OS_SIGNPOST_INTERVAL_BEGIN,  v53,  "VMUGraphStackLogReader",  "archiving nodeToMSLPayloadTable",  buf,  2u);
        }
      }
    }

    uint64_t v54 = 8LL * self->_nodeNamespaceSize;
    v55 = +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_nodeToMSLPayloadTable,  v54,  v6);
    [v4 encodeObject:v55 forKey:@"nodeToMSLPayloadTable"];
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[nodeToMSLPayloadTable] nodeNamespaceSize %u  %lu bytes\n\n",  self->_nodeNamespaceSize,  v54);
    }
  }

  if (-[VMURangeToStringMap count](self->_functionNameRanges, "count"))
  {
    v56 = +[VMUDirectedGraph _archivedObject:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedObject:options:",  self->_functionNameRanges,  v6);
    [v4 encodeObject:v56 forKey:@"functionNameRanges"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Function Name Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](self->_functionNameRanges, "count"),  -[VMURangeToStringMap uniquedStringCount](self->_functionNameRanges, "uniquedStringCount"));
    }
  }

  if (-[VMURangeToStringMap count](self->_sourceInfoRanges, "count"))
  {
    v57 = +[VMUDirectedGraph _archivedObject:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedObject:options:",  self->_sourceInfoRanges,  v6);
    [v4 encodeObject:v57 forKey:@"sourceInfoRanges"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[SourceInfo Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](self->_sourceInfoRanges, "count"),  -[VMURangeToStringMap uniquedStringCount](self->_sourceInfoRanges, "uniquedStringCount"));
    }
  }

  if (self->super._regionTracker)
  {
    v58 = self->_debugTimer;
    if (v58)
    {
      uint64_t v59 = -[VMUDebugTimer signpostID](v58, "signpostID");
      v58 = self->_debugTimer;
      if (v59)
      {
        -[VMUDebugTimer logHandle](v58, "logHandle");
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v61 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v62 = v61;
          if (os_signpost_enabled(v60))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v60,  OS_SIGNPOST_INTERVAL_END,  v62,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        v58 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v58, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving VM regionTracker");
    v63 = self->_debugTimer;
    if (v63)
    {
      -[VMUDebugTimer logHandle](v63, "logHandle");
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v65 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v66 = v65;
        if (os_signpost_enabled(v64))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v64,  OS_SIGNPOST_INTERVAL_BEGIN,  v66,  "VMUGraphStackLogReader",  "archiving VM regionTracker",  buf,  2u);
        }
      }
    }
    v67 = +[VMUDirectedGraph _archivedObject:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedObject:options:",  self->super._regionTracker,  v6);
    [v4 encodeObject:v67 forKey:@"vmRegionTracker"];

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[VM Region Tracker] Region count: %u\n\n",  -[VMUVMRegionTracker regionCount](self->super._regionTracker, "regionCount"));
    }
  }

  [v4 encodeBool:self->super._coldestFrameIsNotThreadId forKey:@"coldestFrameIsNotThreadId"];
  [v4 encodeInt64:self->_maxTimestampDelta forKey:@"maxTimestampDelta"];
  [v4 encodeInt64:self->_mslRecordsCount forKey:@"mslRecordsCount"];
  v68 = self->_debugTimer;
  if (v68)
  {
    uint64_t v69 = -[VMUDebugTimer signpostID](v68, "signpostID");
    v68 = self->_debugTimer;
    if (v69)
    {
      -[VMUDebugTimer logHandle](v68, "logHandle");
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v71 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v72 = v71;
        if (os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v70,  OS_SIGNPOST_INTERVAL_END,  v72,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      v68 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v68, "endEvent:", "VMUGraphStackLogReader");
}

- (VMUGraphStackLogReader)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[VMUGraphStackLogReader init](self, "init");
  if (!v5) {
    goto LABEL_53;
  }
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 unsignedIntValue];

  if (v7 != 1)
  {
LABEL_56:
    v50 = 0LL;
    goto LABEL_57;
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backtraceUniquingTableContents"];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    debugTimer = v5->_debugTimer;
    if (debugTimer)
    {
      uint64_t v10 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = v5->_debugTimer;
      if (v10)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
        if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v11,  OS_SIGNPOST_INTERVAL_END,  v13,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        debugTimer = v5->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( v5->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "archiving backtrace uniquing table");
    id v14 = v5->_debugTimer;
    if (v14)
    {
      -[VMUDebugTimer logHandle](v14, "logHandle");
      unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "VMUGraphStackLogReader",  "archiving backtrace uniquing table",  buf,  2u);
        }
      }
    }

    int v18 = [v4 decodeInt32ForKey:@"backtraceUniquingTableFlags"];
    unint64_t v19 = [v4 decodeInt64ForKey:@"backtraceUniquingTableSize"];
    mach_vm_address_t v20 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v8,  buf,  1LL);
    if (v19 != *(void *)buf) {
      -[VMUGraphStackLogReader initWithCoder:].cold.1();
    }
    backtrace_uniquing_table_from_archive = vmu_create_backtrace_uniquing_table_from_archive(v19, v18, (uint64_t)v20);
    v5->_backtraceUniquingTable = (vmu_backtrace_uniquing_table_t *)backtrace_uniquing_table_from_archive;
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - backtraceUniquingTableContents] %llu bytes\n\n",  *((void *)backtrace_uniquing_table_from_archive + 3));
    }
    mach_vm_size_t v22 = v5->_debugTimer;
    if (v22)
    {
      uint64_t v23 = -[VMUDebugTimer signpostID](v22, "signpostID");
      mach_vm_size_t v22 = v5->_debugTimer;
      if (v23)
      {
        -[VMUDebugTimer logHandle](v22, "logHandle");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
        if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)unint64_t v52 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v24,  OS_SIGNPOST_INTERVAL_END,  v26,  "VMUGraphStackLogReader",  "",  v52,  2u);
          }
        }

        mach_vm_size_t v22 = v5->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v22, "endEvent:", "VMUGraphStackLogReader");
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalUniquingTableContents"];
  os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v27,  buf,  1LL);
    if (v28)
    {
      objc_super v29 = v28;
      v5->_originalUniquingTable = (backtrace_uniquing_table *)msl_uniquing_table_copy_from_serialized();
      free(v29);
    }
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeToStackIdTable"];
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v5->_nodeToStackIndexTable = (unsigned int *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v30,  buf,  1LL);
    uint64_t v31 = *(void *)buf;
    uint64_t v32 = *(void *)buf >> 2;
    v5->_nodeNamespaceSize = *(void *)buf >> 2;
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - nodeToStackIndexTable] nodeNamespaceSize %u  %lu bytes\n\n",  v32,  v31);
    }
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeToTimestampTable"];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v5->_nodeToTimestampTable = (unint64_t *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v33,  buf,  1LL);
    uint64_t v34 = *(void *)buf;
    uint64_t v35 = *(void *)buf >> 3;
    v5->_nodeNamespaceSize = *(void *)buf >> 3;
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - nodeToTimestampTable] nodeNamespaceSize %u  %lu bytes\n\n",  v35,  v34);
    }
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeToMSLPayloadTable"];
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v5->_nodeToMSLPayloadTable = (unint64_t *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v36,  buf,  1LL);
    uint64_t v37 = *(void *)buf;
    uint64_t v38 = *(void *)buf >> 3;
    v5->_nodeNamespaceSize = *(void *)buf >> 3;
    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - nodeToMSLPayloadTable] nodeNamespaceSize %u  %lu bytes\n\n",  v38,  v37);
    }
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"functionNameRanges"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    uint64_t v40 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v39,  objc_opt_class(),  1LL);
    functionNameRanges = v5->_functionNameRanges;
    v5->_functionNameRanges = (VMURangeToStringMap *)v40;

    os_signpost_id_t v42 = v5->_functionNameRanges;
    if (!v42)
    {
LABEL_55:

      goto LABEL_56;
    }

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - Function Name Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](v42, "count"),  -[VMURangeToStringMap uniquedStringCount](v5->_functionNameRanges, "uniquedStringCount"));
    }
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceInfoRanges"];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43) {
    goto LABEL_48;
  }
  uint64_t v44 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v43,  objc_opt_class(),  1LL);
  sourceInfoRanges = v5->_sourceInfoRanges;
  v5->_sourceInfoRanges = (VMURangeToStringMap *)v44;

  uint64_t v46 = v5->_sourceInfoRanges;
  if (!v46)
  {
    v39 = v43;
    goto LABEL_55;
  }

  if (kVMUPrintArchivingTiming) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - SourceInfo Ranges] Count: %u  Uniqued string count: %u\n\n",  -[VMURangeToStringMap count](v46, "count"),  -[VMURangeToStringMap uniquedStringCount](v5->_sourceInfoRanges, "uniquedStringCount"));
  }
LABEL_48:
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vmRegionTracker"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    uint64_t v47 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v39,  objc_opt_class(),  1LL);
    regionTracker = v5->super._regionTracker;
    v5->super._regionTracker = (VMUVMRegionTracker *)v47;

    os_signpost_id_t v49 = v5->super._regionTracker;
    if (v49)
    {
      if (kVMUPrintArchivingTiming) {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Stack Log Reader - VM Region Tracker] Region count: %u\n\n",  -[VMUVMRegionTracker regionCount](v49, "regionCount"));
      }
      goto LABEL_52;
    }

    goto LABEL_55;
  }

- (int)streamFullStackLogsToBlock:(id)a3
{
  return msl_copy_disk_stack_logs();
}

- (BOOL)copyOriginalUniquingTable:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[VMUGraphStackLogReader copyOriginalUniquingTable:].cold.1();
  }
  v5 = v4;
  uint64_t v6 = (backtrace_uniquing_table *)msl_uniquing_table_copy_from_task();
  self->_originalUniquingTable = v6;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
    self->_nodeNamespaceSize = [WeakRetained nodeNamespaceSize];

    id v8 = objc_loadWeakRetained((id *)&self->_graph);
    self->_nodeToMSLPayloadTable = (unint64_t *)malloc(8 * [v8 nodeNamespaceSize]);

    nodeToMSLPayloadTable = self->_nodeToMSLPayloadTable;
    id v10 = objc_loadWeakRetained((id *)&self->_graph);
    memset(nodeToMSLPayloadTable, 255, 8 * [v10 nodeNamespaceSize]);

    debugTimer = self->_debugTimer;
    if (debugTimer)
    {
      uint64_t v12 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = self->_debugTimer;
      if (v12)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v13,  OS_SIGNPOST_INTERVAL_END,  v15,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        debugTimer = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "copyOriginalUniquingTable build map of node --> payload");
    uint64_t v16 = self->_debugTimer;
    if (v16)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      os_signpost_id_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v18 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = v18;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VMUGraphStackLogReader",  "copyOriginalUniquingTable build map of node --> payload",  buf,  2u);
        }
      }
    }

    uint64_t v20 = MEMORY[0x1895F87A8];
    if (self->super._usesLiteMode)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_graph);
      int v22 = VMULiteZoneIndex(v21);

      id v23 = objc_loadWeakRetained((id *)&self->_graph);
      v31[0] = v20;
      v31[1] = 3221225472LL;
      v31[2] = __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke;
      v31[3] = &unk_189DFF6D0;
      v31[4] = self;
      int v33 = v22;
      id v32 = v5;
      VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v23, v31);
    }

    self->_mslRecordsCount = 0LL;
    v30[0] = v20;
    v30[1] = 3221225472LL;
    v30[2] = __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2;
    v30[3] = &unk_189DFDAB8;
    v30[4] = self;
    [v5 enumerateMSLRecordsAndPayloads:v30];
    uint64_t v24 = self->_debugTimer;
    if (v24)
    {
      uint64_t v25 = -[VMUDebugTimer signpostID](v24, "signpostID");
      uint64_t v24 = self->_debugTimer;
      if (v25)
      {
        -[VMUDebugTimer logHandle](v24, "logHandle");
        os_signpost_id_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v27 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v26,  OS_SIGNPOST_INTERVAL_END,  v28,  "VMUGraphStackLogReader",  "",  buf,  2u);
          }
        }

        uint64_t v24 = self->_debugTimer;
      }
    }

    -[VMUDebugTimer endEvent:](v24, "endEvent:", "VMUGraphStackLogReader");
  }

  return v6 != 0LL;
}

void __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke( uint64_t a1,  unsigned int a2,  void *a3,  uint64_t a4,  BOOL *a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80LL));
  *a5 = [WeakRetained nodeNamespaceSize] <= a2;

  if (!*a5)
  {
    char v11 = [ *(id *)(*(void *)(a1 + 32) + 8) rangeIsInSharedCache: *(void *)(a4 + 8),  *(void *)(a4 + 16)];
    unint64_t v12 = a3[1];
    unint64_t v13 = v12 >> 60;
    if (v12 >> 60 != 5) {
      char v11 = 1;
    }
    if ((_DWORD)v13 == 1 || (v11 & 1) == 0)
    {
      if (*(_BYTE *)(*(void *)(a1 + 32) + 56LL))
      {
        if (*(_DWORD *)(a4 + 148) == *(_DWORD *)(a1 + 48))
        {
          uint64_t invalid = [*(id *)(a1 + 40) liteMSLPayloadforMallocAddress:*a3 size:v12 & 0xFFFFFFFFFFFFFFFLL];
LABEL_12:
          *(void *)(*(void *)(*(void *)(a1 + 32) + 128LL) + 8LL * a2) = invalid;
          unint64_t allocation_timestamp = msl_payload_get_allocation_timestamp();
          uint64_t v16 = *(void *)(a1 + 32);
          unint64_t v17 = *(void *)(v16 + 168);
          if (allocation_timestamp > v17) {
            unint64_t v17 = allocation_timestamp;
          }
          *(void *)(v16 + 168) = v17;
          return;
        }

        if (VMUGraphNodeType_IsVMRegion(v13))
        {
          uint64_t invalid = [*(id *)(a1 + 40) liteMSLPayloadforVMregionAddress:*a3];
          goto LABEL_12;
        }
      }

      uint64_t invalid = msl_payload_get_invalid();
      goto LABEL_12;
    }
  }

unint64_t __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2( unint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  unint64_t v9 = result;
  ++*(void *)(*(void *)(result + 32) + 176LL);
  if ((a2 & 0x12) != 0)
  {
    uint64_t v10 = *(void *)(result + 32);
    if (!*(_BYTE *)(v10 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v10 + 80));
      unsigned int v12 = [WeakRetained nodeForAddress:a3];

      if (v12 != -1)
      {
        id v13 = objc_loadWeakRetained((id *)(*(void *)(v9 + 32) + 80LL));

        *(void *)(*(void *)(*(void *)(v9 + 32) + 128LL) + 8LL * v12) = a5;
      }

      result = msl_payload_get_allocation_timestamp();
      uint64_t v14 = *(void *)(v9 + 32);
      unint64_t v15 = *(void *)(v14 + 168);
      if (result > v15) {
        unint64_t v15 = result;
      }
      *(void *)(v14 + 168) = v15;
    }
  }

  if ((a2 & 0x30) != 0) {
    return [*(id *)(*(void *)(v9 + 32) + 24) handleStackLogType:a2 address:a3 size:a4 stackID:msl_payload_get_uniquing_table_index()];
  }
  return result;
}

- (BOOL)populateBacktraceUniquingTableWithCore:(id)a3 zones:(_VMUZoneNode *)a4 zonesCount:(unsigned int)a5
{
  LODWORD(v5) = a5;
  v43[15] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  self->_backtraceUniquingTable = (vmu_backtrace_uniquing_table_t *)vmu_create_backtrace_uniquing_table(0, 4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  unsigned int v10 = [WeakRetained nodeNamespaceSize];

  self->_nodeNamespaceSize = v10;
  char v11 = (unsigned int *)malloc(4LL * v10);
  self->_nodeToStackIndexTable = v11;
  int __pattern4 = -1;
  memset_pattern4(v11, &__pattern4, 4LL * v10);
  CSSymbolicatorGetAOutSymbolOwner();
  CSSymbolOwnerGetSymbolWithName();
  uint64_t Range = CSSymbolGetRange();
  [v8 peekAtAddress:Range size:v13 returnsBuf:&v41];
  CSSymbolicatorGetAOutSymbolOwner();
  uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  if ((_DWORD)v5)
  {
    uint64_t v15 = BaseAddress;
    uint64_t v16 = 0LL;
    char v36 = 0;
    uint64_t v5 = v5;
    uint64_t v34 = v5;
    uint64_t v35 = a4;
    while (1)
    {
      [v8 peekAtAddress:a4[v16].var0 size:256 returnsBuf:&v40];
      if (!*v40) {
        goto LABEL_25;
      }
      uint64_t v17 = v40[24];
      if (!v17) {
        goto LABEL_25;
      }
      [v8 peekAtAddress:v17 size:32 returnsBuf:&v39];
      int v18 = *v39;
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        [v8 peekAtAddress:v40[24] + 36 size:12 * *((unsigned int *)v39 + 1) returnsBuf:&v38];
        os_signpost_id_t v19 = v39;
        if (*((_DWORD *)v39 + 1))
        {
          uint64_t v20 = 0LL;
          unint64_t v21 = 0LL;
          do
          {
            if (*(void *)(v38 + v20))
            {
              uint64_t v22 = btref_decode_unslide(v8, *(_DWORD *)(v38 + v20 + 8) & 0xFFFFFFC0, v43, v41, v15);
              if ((_DWORD)v22)
              {
                vmu_enter_stack_in_backtrace_uniquing_table( (uint64_t)self->_backtraceUniquingTable,  (uint64_t)&v37,  (uint64_t)v43,  v22,  v23);
                id v24 = objc_loadWeakRetained((id *)&self->_graph);
                int v25 = [v24 nodeForAddress:~*(void *)(v38 + v20)];

                if (v25 != -1)
                {
                  self->_nodeToStackIndexTable[v25] = v37;
                  char v36 = 1;
                }
              }

              os_signpost_id_t v19 = v39;
            }

            ++v21;
            v20 += 12LL;
          }

          while (v21 < *((unsigned int *)v19 + 1));
        }

- (void)populateBacktraceUniquingTableWithStackLogs:(id)a3
{
  uint64_t v3 = ((uint64_t (*)(VMUGraphStackLogReader *, SEL, id))MEMORY[0x1895F8858])(self, a2, a3);
  uint64_t v110 = *MEMORY[0x1895F89C0];
  id v5 = v4;
  if (!v5) {
    -[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:].cold.1();
  }
  uint64_t v6 = v5;
  *(void *)(v3 + 136) = vmu_create_backtrace_uniquing_table(0, 4);
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 80));
  unsigned int v90 = [WeakRetained nodeNamespaceSize];

  id v8 = objc_loadWeakRetained((id *)(v3 + 80));
  *(void *)(v3 + 120) = malloc(8 * [v8 nodeNamespaceSize]);

  unint64_t v9 = *(void **)(v3 + 120);
  id v10 = objc_loadWeakRetained((id *)(v3 + 80));
  memset(v9, 255, 8 * [v10 nodeNamespaceSize]);

  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:259];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v12 = *(void **)(v3 + 96);
  if (v12)
  {
    uint64_t v13 = [v12 signpostID];
    unsigned int v12 = *(void **)(v3 + 96);
    if (v13)
    {
      [v12 logHandle];
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v14,  OS_SIGNPOST_INTERVAL_END,  v16,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      unsigned int v12 = *(void **)(v3 + 96);
    }
  }

  [v12 endEvent:@"VMUGraphStackLogReader" 136];
  [*(id *)(v3 + 96) startWithCategory:"VMUGraphStackLogReader" message:"populateUniquingTable build map of address --> {nodeIndex,stackID}"];
  uint64_t v17 = *(void **)(v3 + 96);
  if (v17)
  {
    [v17 logHandle];
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [*(id *)(v3 + 96) signpostID];
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "VMUGraphStackLogReader",  "populateUniquingTable build map of address --> {nodeIndex,stackID}",  buf,  2u);
      }
    }
  }

  id v21 = objc_loadWeakRetained((id *)(v3 + 80));
  int v22 = VMULiteZoneIndex(v21);

  id v23 = objc_loadWeakRetained((id *)(v3 + 80));
  v104[0] = MEMORY[0x1895F87A8];
  v104[1] = 3221225472LL;
  v104[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke;
  v104[3] = &unk_189DFF6F8;
  v104[4] = v3;
  int v107 = v22;
  id v24 = v6;
  id v105 = v24;
  id v25 = v11;
  id v106 = v25;
  unsigned int v108 = v90;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v23, v104);

  os_signpost_id_t v26 = *(void **)(v3 + 96);
  if (v26)
  {
    uint64_t v27 = [v26 signpostID];
    os_signpost_id_t v26 = *(void **)(v3 + 96);
    if (v27)
    {
      [v26 logHandle];
      unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v30 = v29;
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v28,  OS_SIGNPOST_INTERVAL_END,  v30,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      os_signpost_id_t v26 = *(void **)(v3 + 96);
    }
  }

  [v26 endEvent:"VMUGraphStackLogReader"];
  [*(id *)(v3 + 96) startWithCategory:"VMUGraphStackLogReader" message:"populateUniquingTable read stack log records"];
  id v31 = *(void **)(v3 + 96);
  if (v31)
  {
    [v31 logHandle];
    int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [*(id *)(v3 + 96) signpostID];
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v34 = v33;
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v34,  "VMUGraphStackLogReader",  "populateUniquingTable read stack log records",  buf,  2u);
      }
    }
  }

  *(void *)(v3 + 176) = 0LL;
  v102[0] = MEMORY[0x1895F87A8];
  v102[1] = 3221225472LL;
  v102[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70;
  v102[3] = &unk_189DFF720;
  v102[4] = v3;
  uint64_t v35 = (NSMapTable *)v25;
  v103 = v35;
  [v24 enumerateMSLRecordsAndPayloads:v102];
  char v36 = *(void **)(v3 + 96);
  if (v36)
  {
    uint64_t v37 = [v36 signpostID];
    char v36 = *(void **)(v3 + 96);
    if (v37)
    {
      [v36 logHandle];
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v38,  OS_SIGNPOST_INTERVAL_END,  v40,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      char v36 = *(void **)(v3 + 96);
    }
  }

  [v36 endEvent:"VMUGraphStackLogReader"];
  [*(id *)(v3 + 96) startWithCategory:"VMUGraphStackLogReader" message:"populateUniquingTable invert map table to create oldStackId --> nodeIndex map"];
  uint64_t v41 = *(void **)(v3 + 96);
  if (v41)
  {
    [v41 logHandle];
    os_signpost_id_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = [*(id *)(v3 + 96) signpostID];
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v44 = v43;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v42,  OS_SIGNPOST_INTERVAL_BEGIN,  v44,  "VMUGraphStackLogReader",  "populateUniquingTable invert map table to create oldStackId --> nodeIndex map",  buf,  2u);
      }
    }
  }

  [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:259];
  v45 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSEnumerateMapTable(&enumerator, v35);
  value = 0LL;
  while (NSNextMapEnumeratorPair(&enumerator, 0LL, &value))
  {
    uint64_t v46 = (const void *)*((void *)value + 1);
    uint64_t v47 = (unsigned int *)NSMapGet(v45, v46);
    if (v46 != (const void *)-1LL)
    {
      unint64_t v48 = v47;
      if (v47)
      {
        uint64_t v49 = *v47;
        if ((_DWORD)v49 == v47[1])
        {
          int v50 = 4 * v49 + 6;
          int v51 = v50 & 0x3FFFFFFE;
          unint64_t v52 = malloc((4 * v50) + 8LL);
          memcpy(v52, v48, 4 * v49 + 8);
          v52[1] = v51;
          NSMapInsert(v45, v46, v52);
          unint64_t v48 = v52;
        }
      }

      else
      {
        unint64_t v48 = malloc(0x20uLL);
        *unint64_t v48 = 0x600000000LL;
        NSMapInsertKnownAbsent(v45, v46, v48);
      }

      uint64_t v53 = *(unsigned int *)v48;
      *((_DWORD *)v48 + v53 + 2) = *(_DWORD *)value;
      *(_DWORD *)unint64_t v48 = v53 + 1;
    }
  }

  NSEndMapTableEnumeration(&enumerator);

  uint64_t v54 = *(void **)(v3 + 96);
  if (v54)
  {
    uint64_t v55 = [v54 signpostID];
    uint64_t v54 = *(void **)(v3 + 96);
    if (v55)
    {
      [v54 logHandle];
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v57 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v58 = v57;
        if (os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v56,  OS_SIGNPOST_INTERVAL_END,  v58,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      uint64_t v54 = *(void **)(v3 + 96);
    }
  }

  [v54 endEvent:"VMUGraphStackLogReader"];
  [*(id *)(v3 + 96) startWithCategory:"VMUGraphStackLogReader" message:"populateUniquingTable get backtraces from libmalloc into our backtrace uniquing table"];
  uint64_t v59 = *(void **)(v3 + 96);
  if (v59)
  {
    [v59 logHandle];
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = [*(id *)(v3 + 96) signpostID];
    if ((unint64_t)(v61 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v62 = v61;
      if (os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v60,  OS_SIGNPOST_INTERVAL_BEGIN,  v62,  "VMUGraphStackLogReader",  "populateUniquingTable get backtraces from libmalloc into our backtrace uniquing table",  buf,  2u);
      }
    }
  }

  *(_DWORD *)(v3 + 104) = v90;
  v63 = malloc(4LL * v90);
  *(void *)(v3 + 112) = v63;
  int __pattern4 = -1;
  memset_pattern4(v63, &__pattern4, 4LL * v90);
  NSEnumerateMapTable(&v98, v45);
  while (NSNextMapEnumeratorPair(&v98, &key, &v96))
  {
    uint64_t v64 = [v24 getFramesForStackID:key stackFramesBuffer:buf];
    if ((_DWORD)v64)
    {
      vmu_enter_stack_in_backtrace_uniquing_table(*(void *)(v3 + v89), (uint64_t)&v95, (uint64_t)buf, v64, v65);
      os_signpost_id_t v66 = (unsigned int *)v96;
      if (*(_DWORD *)v96)
      {
        int v67 = v95;
        uint64_t v68 = *(void *)(v3 + 112);
        uint64_t v69 = 2LL;
        do
        {
          *(_DWORD *)(v68 + 4LL * v66[v69]) = v67;
          unint64_t v70 = v69++ - 1;
        }

        while (v70 < *v66);
      }
    }
  }

  NSEndMapTableEnumeration(&v98);
  unint64_t v71 = *(void **)(v3 + 96);
  if (v71)
  {
    uint64_t v72 = [v71 signpostID];
    unint64_t v71 = *(void **)(v3 + 96);
    if (v72)
    {
      [v71 logHandle];
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v74 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v74 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v75 = v74;
        if (os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v73,  OS_SIGNPOST_INTERVAL_END,  v75,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      unint64_t v71 = *(void **)(v3 + 96);
    }
  }

  [v71 endEvent:"VMUGraphStackLogReader"];
  [*(id *)(v3 + 96) startWithCategory:"VMUGraphStackLogReader" message:"populateUniquingTable convert VM region tracker's from old to new stackIDs"];
  v76 = *(void **)(v3 + 96);
  if (v76)
  {
    [v76 logHandle];
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = [*(id *)(v3 + 96) signpostID];
    if ((unint64_t)(v78 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v79 = v78;
      if (os_signpost_enabled(v77))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v77,  OS_SIGNPOST_INTERVAL_BEGIN,  v79,  "VMUGraphStackLogReader",  "populateUniquingTable convert VM region tracker's from old to new stackIDs",  buf,  2u);
      }
    }
  }

  [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:1282];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = *(void **)(v3 + 24);
  v91[0] = MEMORY[0x1895F87A8];
  v91[1] = 3221225472LL;
  v91[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_74;
  v91[3] = &unk_189DFF748;
  id v82 = v80;
  id v92 = v82;
  id v83 = v24;
  id v93 = v83;
  uint64_t v94 = v3;
  [v81 convertStackIDs:v91];
  v84 = *(void **)(v3 + 96);
  if (v84)
  {
    uint64_t v85 = [v84 signpostID];
    v84 = *(void **)(v3 + 96);
    if (v85)
    {
      [v84 logHandle];
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v87 = [*(id *)(v3 + 96) signpostID];
      if ((unint64_t)(v87 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v88 = v87;
        if (os_signpost_enabled(v86))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v86,  OS_SIGNPOST_INTERVAL_END,  v88,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      v84 = *(void **)(v3 + 96);
    }
  }

  [v84 endEvent:"VMUGraphStackLogReader"];
}

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke( uint64_t a1,  unsigned int a2,  const void **a3,  uint64_t a4,  BOOL *a5)
{
  char v10 = [*(id *)(*(void *)(a1 + 32) + 8) rangeIsInSharedCache:*(void *)(a4 + 8)  *(void *)(a4 + 16)];
  unint64_t v11 = (unint64_t)a3[1];
  unint64_t v12 = v11 >> 60;
  if (v11 >> 60 != 5) {
    char v10 = 1;
  }
  if ((_DWORD)v12 == 1 || (v10 & 1) == 0)
  {
    if (!*(_BYTE *)(*(void *)(a1 + 32) + 56LL)) {
      goto LABEL_15;
    }
    if (*(_DWORD *)(a4 + 148) == *(_DWORD *)(a1 + 56))
    {
      [*(id *)(a1 + 40) liteMSLPayloadforMallocAddress:*a3 size:v11 & 0xFFFFFFFFFFFFFFFLL];
      uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
      unint64_t allocation_timestamp = msl_payload_get_allocation_timestamp();
      *(void *)(*(void *)(*(void *)(a1 + 32) + 120LL) + 8LL * a2) = allocation_timestamp;
      uint64_t v15 = *(void *)(a1 + 32);
      unint64_t v16 = *(void *)(v15 + 168);
      if (allocation_timestamp > v16) {
        unint64_t v16 = allocation_timestamp;
      }
      *(void *)(v15 + 168) = v16;
      if (uniquing_table_index == -1) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    if (VMUGraphNodeType_IsVMRegion(v12))
    {
      [*(id *)(a1 + 40) liteMSLPayloadforVMregionAddress:*a3];
      uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
      unint64_t v17 = msl_payload_get_allocation_timestamp();
      *(void *)(*(void *)(*(void *)(a1 + 32) + 120LL) + 8LL * a2) = v17;
      uint64_t v18 = *(void *)(a1 + 32);
      unint64_t v19 = *(void *)(v18 + 168);
      if (v17 > v19) {
        unint64_t v19 = v17;
      }
      *(void *)(v18 + 168) = v19;
    }

    else
    {
LABEL_15:
      uint64_t uniquing_table_index = -1LL;
    }

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70( uint64_t a1,  uint64_t a2,  const void *a3,  uint64_t a4)
{
  uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
  if ((a2 & 0x12) != 0 && !*(_BYTE *)(*(void *)(a1 + 32) + 56LL))
  {
    unint64_t v9 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
    if (v9)
    {
      v9[1] = uniquing_table_index;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80LL));
      unsigned int v11 = [WeakRetained nodeForAddress:a3];

      if (v11 != -1)
      {
        id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80LL));

        unint64_t allocation_timestamp = msl_payload_get_allocation_timestamp();
        *(void *)(*(void *)(*(void *)(a1 + 32) + 120LL) + 8LL * v11) = allocation_timestamp;
        uint64_t v14 = *(void *)(a1 + 32);
        unint64_t v15 = *(void *)(v14 + 168);
        if (allocation_timestamp > v15) {
          unint64_t v15 = allocation_timestamp;
        }
        *(void *)(v14 + 168) = v15;
      }
    }
  }

  if ((a2 & 0x30) != 0) {
    [*(id *)(*(void *)(a1 + 32) + 24) handleStackLogType:a2 address:a3 size:a4 stackID:uniquing_table_index];
  }
}

char *__70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_74( uint64_t a1,  const void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = (char *)NSMapGet(*(NSMapTable **)(a1 + 32), a2);
  id v5 = v4;
  unint64_t v9 = v4;
  if (v4) {
    return v4 - 1;
  }
  uint64_t v6 = [*(id *)(a1 + 40) getFramesForStackID:a2 stackFramesBuffer:v10];
  if ((_DWORD)v6)
  {
    vmu_enter_stack_in_backtrace_uniquing_table( *(void *)(*(void *)(a1 + 48) + 136LL),  (uint64_t)&v9,  (uint64_t)v10,  v6,  v7);
    NSMapInsertKnownAbsent(*(NSMapTable **)(a1 + 32), a2, v9 + 1);
    return v9;
  }

  return v5;
}

- (void)enumerateUniquingTable:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  backtraceUniquingTable = self->_backtraceUniquingTable;
  if (backtraceUniquingTable)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __49__VMUGraphStackLogReader_enumerateUniquingTable___block_invoke;
    v7[3] = &unk_189DFF770;
    id v8 = v4;
    vmu_enumerate_backtrace_uniquing_table(backtraceUniquingTable, (uint64_t)v7);
  }

  else if (self->_originalUniquingTable)
  {
    msl_uniquing_table_enumerate();
  }
}

uint64_t __49__VMUGraphStackLogReader_enumerateUniquingTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)symbolicateBacktraceUniquingTable
{
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v4 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v4)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v5,  OS_SIGNPOST_INTERVAL_END,  v7,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
  -[VMUDebugTimer startWithCategory:message:]( self->_debugTimer,  "startWithCategory:message:",  "VMUGraphStackLogReader",  "symbolicateBacktraceUniquingTable");
  id v8 = self->_debugTimer;
  if (v8)
  {
    -[VMUDebugTimer logHandle](v8, "logHandle");
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "VMUGraphStackLogReader",  "symbolicateBacktraceUniquingTable",  buf,  2u);
      }
    }
  }

  [MEMORY[0x1896078B8] hashTableWithOptions:1282];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078B8] hashTableWithOptions:1282];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __59__VMUGraphStackLogReader_symbolicateBacktraceUniquingTable__block_invoke;
  v21[3] = &unk_189DFF798;
  v21[4] = self;
  id v14 = v12;
  id v22 = v14;
  id v15 = v13;
  id v23 = v15;
  -[VMUGraphStackLogReader enumerateUniquingTable:](self, "enumerateUniquingTable:", v21);
  unint64_t v16 = self->_debugTimer;
  if (v16)
  {
    uint64_t v17 = -[VMUDebugTimer signpostID](v16, "signpostID");
    unint64_t v16 = self->_debugTimer;
    if (v17)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v19 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v18,  OS_SIGNPOST_INTERVAL_END,  v20,  "VMUGraphStackLogReader",  "",  buf,  2u);
        }
      }

      unint64_t v16 = self->_debugTimer;
    }
  }

  -[VMUDebugTimer endEvent:](v16, "endEvent:", "VMUGraphStackLogReader");
}

void __59__VMUGraphStackLogReader_symbolicateBacktraceUniquingTable__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80LL));
  [WeakRetained symbolStore];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80LL));
    [v6 symbolStore];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addAddress:a2 origin:3];
  }

  CSSymbolicatorGetSymbolWithAddressAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t Range = (const void *)CSSymbolGetRange();
    uint64_t v10 = v9;
    if (!NSHashGet(*(NSHashTable **)(a1 + 40), Range))
    {
      NSHashInsert(*(NSHashTable **)(a1 + 40), Range);
      uint64_t Name = CSSymbolGetName();
      if (Name)
      {
        id v12 = *(void **)(a1 + 32);
        [NSString stringWithUTF8String:Name];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 _setFunctionName:v13 forPCAddressRange:Range];
      }
    }
  }

  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    id v14 = (const void *)CSSourceInfoGetRange();
    uint64_t v16 = v15;
    if (!NSHashGet(*(NSHashTable **)(a1 + 48), v14))
    {
      NSHashInsert(*(NSHashTable **)(a1 + 48), v14);
      uint64_t Path = CSSourceInfoGetPath();
      uint64_t LineNumber = CSSourceInfoGetLineNumber();
      unint64_t v19 = *(void **)(a1 + 32);
      [NSString stringWithUTF8String:Path];
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      [v19 _setSourcePath:v20 lineNumber:LineNumber forPCAddressRange:v14, v16];
    }
  }

- (id)binaryImagePathForPCaddress:(unint64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 path];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 range];
    unint64_t v7 = v6;
  }

  else
  {
    unint64_t v7 = 0LL;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  unint64_t v8 = v5;
  unint64_t v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)_setFunctionName:(id)a3 forPCAddressRange:(_VMURange)a4
{
}

- (id)functionNameForPCaddress:(unint64_t)a3
{
  if ((CSIsNull() & 1) != 0
    || (v7.receiver = self,
        v7.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        -[VMUStackLogReaderBase functionNameForPCaddress:](&v7, sel_functionNameForPCaddress_, a3),
        (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    -[VMURangeToStringMap stringForAddress:](self->_functionNameRanges, "stringForAddress:", a3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3
{
  if ((CSIsNull() & 1) != 0
    || (v7.receiver = self,
        v7.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        id v5 = -[VMUStackLogReaderBase functionRangeContainingPCaddress:](&v7, sel_functionRangeContainingPCaddress_, a3),
        v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v5 = (id)-[VMURangeToStringMap rangeContainingAddress:](self->_functionNameRanges, "rangeContainingAddress:", a3);
  }

  result.length = v6;
  result.location = (unint64_t)v5;
  return result;
}

- (void)_setSourcePath:(id)a3 lineNumber:(unsigned int)a4 forPCAddressRange:(_VMURange)a5
{
  if (a3)
  {
    unint64_t length = a5.length;
    unint64_t location = a5.location;
    uint64_t v7 = *(void *)&a4;
    sourceInfoRanges = self->_sourceInfoRanges;
    id v10 = a3;
    [v10 stringByDeletingLastPathComponent];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[VMURangeToStringMap indexForString:insertIfMissing:]( sourceInfoRanges,  "indexForString:insertIfMissing:",  v11,  1LL);

    uint64_t v13 = self->_sourceInfoRanges;
    [v10 lastPathComponent];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = -[VMURangeToStringMap indexForString:insertIfMissing:](v13, "indexForString:insertIfMissing:", v14, 1LL);
    [MEMORY[0x189NSStringormat:@"%u:%u:%u" v12, v15, v7];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    -[VMURangeToStringMap setString:forRange:](self->_sourceInfoRanges, "setString:forRange:", v16, location, length);
  }

- (void)_parseSourceInfoString:(id)a3 intoComponents:(unsigned int *)a4
{
  id v5 = (const char *)[a3 UTF8String];
  size_t v6 = strlen(v5);
  *a4 = 0;
  if (v6)
  {
    int v7 = 0;
    do
    {
      int v9 = *v5++;
      int v8 = v9;
      if (v9 == 58) {
        a4[++v7] = 0;
      }
      else {
        a4[v7] = v8 + 10 * a4[v7] - 48;
      }
      --v6;
    }

    while (v6);
  }

- (id)sourcePathForPCaddress:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((CSIsNull() & 1) != 0
    || (v10.receiver = self,
        v10.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourcePathForPCaddress:](&v10, sel_sourcePathForPCaddress_, a3),
        (id v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      int v12 = 0;
      uint64_t v11 = 0LL;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:]( self,  "_parseSourceInfoString:intoComponents:",  v6,  &v11);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", v11);
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v11));
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 stringByAppendingPathComponent:v8];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (id)sourceFileNameForPCaddress:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ((CSIsNull() & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourceFileNameForPCaddress:](&v8, sel_sourceFileNameForPCaddress_, a3),
        (id v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      int v10 = 0;
      uint64_t v9 = 0LL;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:]( self,  "_parseSourceInfoString:intoComponents:",  v6,  &v9);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v9));
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ((CSIsNull() & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        (unsigned int v5 = -[VMUStackLogReaderBase sourceLineNumberForPCaddress:](&v8, sel_sourceLineNumberForPCaddress_, a3)) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      unsigned int v10 = 0;
      uint64_t v9 = 0LL;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:]( self,  "_parseSourceInfoString:intoComponents:",  v6,  &v9);
      unsigned int v5 = v10;
    }

    else
    {
      unsigned int v5 = 0;
    }
  }

  return v5;
}

- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if ((CSIsNull() & 1) != 0
    || (v15.receiver = self,
        v15.super_class = (Class)&OBJC_CLASS___VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourceFileNameAndLineNumberForPCaddress:fullPath:]( &v15,  sel_sourceFileNameAndLineNumberForPCaddress_fullPath_,  a3,  v4),  (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      unsigned int v17 = 0;
      uint64_t v16 = 0LL;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:]( self,  "_parseSourceInfoString:intoComponents:",  v8,  &v16);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v16));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = v17;
      if (v4)
      {
        -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", v16);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringByAppendingPathComponent:v9];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();

        [NSString stringWithFormat:@"%@:%u", v12, v10];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [NSString stringWithFormat:@"%@:%u", v9, v17];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      id v7 = v13;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (_VMURange)sourceLineRangeContainingPCaddress:(unint64_t)a3
{
  if ((CSIsNull() & 1) != 0
    || (CSSymbolicatorGetSymbolWithAddressAtTime(), unint64_t Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t Range = -[VMURangeToStringMap rangeContainingAddress:](self->_sourceInfoRanges, "rangeContainingAddress:", a3);
  }

  result.unint64_t length = v6;
  result.unint64_t location = Range;
  return result;
}

- (BOOL)is64bit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  char v3 = [WeakRetained is64bit];

  return v3;
}

- (BOOL)inspectingLiveProcess
{
  return 0;
}

- (BOOL)containsTimestampsByNode
{
  return self->_nodeToTimestampTable != 0LL;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  id v4 = a3;
  originalUniquingTable = self->_originalUniquingTable;
  if (self->_backtraceUniquingTable)
  {
    if (originalUniquingTable) {
      -[VMUGraphStackLogReader enumerateMSLRecordsAndPayloads:].cold.1();
    }
  }

  else
  {
    if (!originalUniquingTable) {
      goto LABEL_23;
    }
    diskLogs = self->_diskLogs;
    if (diskLogs)
    {
      -[NSData bytes](diskLogs, "bytes");
      -[NSData length](self->_diskLogs, "length");
      -[VMUGraphStackLogReader is64bit](self, "is64bit");
      id v16 = v4;
      msl_disk_stack_logs_enumerate_from_buffer();

      goto LABEL_23;
    }
  }

  if (self->_nodeNamespaceSize)
  {
    for (unint64_t i = 0LL; i < self->_nodeNamespaceSize; ++i)
    {
      if (self->_originalUniquingTable)
      {
        uint64_t v7 = self->_nodeToMSLPayloadTable[i];
      }

      else
      {
        if (self->_nodeToStackIndexTable[i] == -1) {
          continue;
        }
        uint64_t v7 = msl_payload_create_from_index();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
      uint64_t v9 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained nodeDetails:i];
      }

      else
      {
        uint64_t v14 = 0LL;
        unint64_t v15 = 0LL;
      }

      unint64_t v10 = v15;
      if (v15 >> 60 == 1)
      {
        uint64_t v11 = 2LL;
LABEL_17:
        (*((void (**)(id, uint64_t, uint64_t, unint64_t, uint64_t))v4 + 2))( v4,  v11,  v14,  v10 & 0xFFFFFFFFFFFFFFFLL,  v7);
        continue;
      }

      if (VMUGraphNodeType_IsVMRegion(v15 >> 60))
      {
        uint64_t v11 = 16LL;
        unint64_t v10 = v15;
        goto LABEL_17;
      }
    }
  }

uint64_t __57__VMUGraphStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  unint64_t v7 = -[VMUGraphStackLogReader stackIDForNode:](self, "stackIDForNode:", *(void *)&a3, a4);
  if (v7 > 0xFFFFFFFE) {
    return 0LL;
  }
  unint64_t v9 = v7;
  if (self->_originalUniquingTable)
  {
    msl_uniquing_table_get_frames_from_table();
    return 0LL;
  }

  else
  {
    int64_t result = (int64_t)self->_backtraceUniquingTable;
    if (result) {
      return (int)vmu_stack_frames_for_uniqued_stack(result, v9, (uint64_t)a5, 512);
    }
  }

  return result;
}

- (unint64_t)stackIDForNode:(unsigned int)a3
{
  if (self->_originalUniquingTable) {
    return msl_payload_get_uniquing_table_index();
  }
  if (!self->_backtraceUniquingTable) {
    return -1LL;
  }
  if (self->_nodeToStackIndexTable[a3] == -1) {
    return -1LL;
  }
  return self->_nodeToStackIndexTable[a3];
}

- (unint64_t)timestampForNode:(unsigned int)a3
{
  if (self->_nodeToMSLPayloadTable) {
    return msl_payload_get_allocation_timestamp();
  }
  nodeToTimestampTable = self->_nodeToTimestampTable;
  if (nodeToTimestampTable) {
    return nodeToTimestampTable[a3];
  }
  else {
    return 0LL;
  }
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  BOOL v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  uint64_t v11 = [WeakRetained nodeForAddress:a3];

  if ((_DWORD)v11 == -1) {
    return 0LL;
  }
  else {
    return -[VMUGraphStackLogReader getFramesForNode:inLiteZone:stackFramesBuffer:]( self,  "getFramesForNode:inLiteZone:stackFramesBuffer:",  v11,  v7,  a6);
  }
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  if (a3 > 0xFFFFFFFE) {
    return 0LL;
  }
  if (self->_originalUniquingTable)
  {
    msl_uniquing_table_get_frames_from_table();
    return 0LL;
  }

  else
  {
    int64_t result = (int64_t)self->_backtraceUniquingTable;
    if (result)
    {
      int v5 = vmu_stack_frames_for_uniqued_stack(result, a3, (uint64_t)a4, 512);
      if (v5 <= 512) {
        return v5;
      }
      else {
        return 0;
      }
    }
  }

  return result;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  [WeakRetained vmuVMRegionForAddress:a3];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)nodesInUniquingTable
{
  if (self->_originalUniquingTable)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000LL;
    uint64_t v8 = 0LL;
    msl_uniquing_table_enumerate();
    unint64_t v2 = v6[3];
    _Block_object_dispose(&v5, 8);
  }

  else
  {
    backtraceUniquingTable = self->_backtraceUniquingTable;
    if (backtraceUniquingTable) {
      return backtraceUniquingTable->var7;
    }
    else {
      return 0LL;
    }
  }

  return v2;
}

uint64_t __46__VMUGraphStackLogReader_nodesInUniquingTable__block_invoke(uint64_t result)
{
  return result;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (NSData)diskLogs
{
  return self->_diskLogs;
}

- (void)setDiskLogs:(id)a3
{
}

- (unint64_t)maxTimestampDelta
{
  return self->_maxTimestampDelta;
}

- (unint64_t)mslRecordsCount
{
  return self->_mslRecordsCount;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn( "-[VMUGraphStackLogReader initWithCoder:]",  "VMUGraphStackLogReader.m",  250,  "tableSize == tableContentsSize");
}

- (void)copyOriginalUniquingTable:.cold.1()
{
}

void __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2_cold_1()
{
}

- (void)populateBacktraceUniquingTableWithStackLogs:.cold.1()
{
}

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70_cold_1()
{
}

- (void)enumerateMSLRecordsAndPayloads:.cold.1()
{
}

@end