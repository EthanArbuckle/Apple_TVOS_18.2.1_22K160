@interface VMUStackLogReaderBase
- (BOOL)coldestFrameIsNotThreadId;
- (BOOL)inspectingLiveProcess;
- (BOOL)is64bit;
- (BOOL)shouldIgnoreSymbolWithName:(id)a3 binaryPath:(id)a4;
- (BOOL)usesCoreFile;
- (BOOL)usesLiteMode;
- (NSSet)excludedFrames;
- (VMUTask)vmuTask;
- (VMUVMRegionTracker)regionTracker;
- (_CSTypeRef)symbolicator;
- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3;
- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3;
- (id)_allocationTypeNameForStackID:(unint64_t)a3 returnedBinaryPath:(id *)a4;
- (id)binaryImagePathForPCaddress:(unint64_t)a3;
- (id)functionNameForPCaddress:(unint64_t)a3;
- (id)identifierForBinaryImagePath:(id)a3;
- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4;
- (id)sourceFileNameForPCaddress:(unint64_t)a3;
- (id)sourcePathForPCaddress:(unint64_t)a3;
- (id)symbolicatedBacktraceForFrames:(unint64_t *)a3 frameCount:(int64_t)a4 options:(unint64_t)a5;
- (id)symbolicatedBacktraceForNode:(unsigned int)a3 nodeDetails:(id)a4 isLiteZone:(id)a5 options:;
- (id)symbolicatedBacktraceForStackID:(unint64_t)a3 options:(unint64_t)a4;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (int)enumerateMSLRecordsAndPayloads:(id)a3;
- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6;
- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5;
- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4;
- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3;
- (unsigned)task;
- (void)identifyNonObjectsUsingStackBacktraces:(id)a3 classInfoMap:(id)a4 classInfoSetterBlock:(id)a5;
- (void)setExcludedFrames:(id)a3;
@end

@implementation VMUStackLogReaderBase

- (id)symbolicatedBacktraceForNode:(unsigned int)a3 nodeDetails:(id)a4 isLiteZone:(id)a5 options:
{
  uint64_t v5 = MEMORY[0x1895F8858](self, a2, *(void *)&a3, a4.var0, a5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  v11 = v10;
  uint64_t v13 = v12;
  v14 = (id *)v5;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (VMUGraphNodeType_IsVMRegion(v10[1] >> 60))
  {
    [v14[3] vmRegionRangeInfoForRange:*v11, v11[1] & 0xFFFFFFFFFFFFFFFLL];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15 || (uint64_t v17 = [v15 stackIdentifier], v17 == -1))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        uint64_t v17 = [v14 stackIDForNode:v13];
      }
      else {
        uint64_t v17 = -1LL;
      }
    }

    uint64_t v18 = [v14 getFramesForStackID:v17 stackFramesBuffer:v20];
  }

  else
  {
    uint64_t v18 = [v14 getFramesForNode:v13 inLiteZone:v9 stackFramesBuffer:v20];
  }

  [v14 symbolicatedBacktraceForFrames:v20 frameCount:v18 options:v7];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)symbolicatedBacktraceForStackID:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[VMUStackLogReaderBase symbolicatedBacktraceForFrames:frameCount:options:]( self,  "symbolicatedBacktraceForFrames:frameCount:options:",  v5,  -[VMUStackLogReaderBase getFramesForStackID:stackFramesBuffer:]( self,  "getFramesForStackID:stackFramesBuffer:",  a3,  v5),  a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identifierForBinaryImagePath:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:]( self->_binaryImagePathToIdentifierMap,  "objectForKeyedSubscript:",  v4);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      CFURLRef v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], v4, kCFURLPOSIXPathStyle, 1u);
      if (v6)
      {
        CFURLRef v7 = v6;
        uint64_t v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
        if (v8)
        {
          uint64_t v9 = v8;
          CFBundleGetIdentifier(v8);
          uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CFRelease(v9);
          CFRelease(v7);
          if (v5)
          {
LABEL_10:
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_binaryImagePathToIdentifierMap,  "setObject:forKeyedSubscript:",  v5,  v4);
            goto LABEL_11;
          }
        }

        else
        {
          CFRelease(v7);
        }
      }

      -[__CFString lastPathComponent](v4, "lastPathComponent");
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v5 = @"???";
  }

- (id)symbolicatedBacktraceForFrames:(unint64_t *)a3 frameCount:(int64_t)a4 options:(unint64_t)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  int64_t v5 = a4 - 1;
  if (a4 < 1) {
    return 0LL;
  }
  char v6 = a5;
  int v7 = a4;
  if (!self->_binaryImagePathToIdentifierMap)
  {
    v10 = (NSMutableDictionary *)objc_opt_new();
    binaryImagePathToIdentifierMap = self->_binaryImagePathToIdentifierMap;
    self->_binaryImagePathToIdentifierMap = v10;
  }

  context = (void *)MEMORY[0x186E32E40]();
  char v56 = v6;
  if ((v6 & 0x20) != 0)
  {
    char v55 = 0;
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = (__CFString *)objc_opt_new();
    uint64_t v13 = v12;
    if ((v6 & 4) != 0) {
      -[__CFString appendString:](v12, "appendString:", @"\n");
    }
    if (-[VMUStackLogReaderBase coldestFrameIsNotThreadId](self, "coldestFrameIsNotThreadId"))
    {
      char v55 = 0;
    }

    else
    {
      -[__CFString appendFormat:](v13, "appendFormat:", @"[thread %#llx]:", a3[v5] - 1);
      if ((v6 & 8) != 0)
      {
        -[__CFString appendString:](v13, "appendString:", @"\t");
        char v55 = 0;
      }

      else
      {
        char v55 = 1;
      }

      int v7 = v5;
    }

    if (!self->_addressToSymbolicationMap)
    {
      [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:0];
      v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      addressToSymbolicationMap = self->_addressToSymbolicationMap;
      self->_addressToSymbolicationMap = v15;
    }
  }

  if ((v6 & 4) != 0)
  {
    if (-[VMUStackLogReaderBase is64bit](self, "is64bit")) {
      uint64_t v17 = 18LL;
    }
    else {
      uint64_t v17 = 10LL;
    }
    unint64_t v50 = 30LL;
  }

  else
  {
    unint64_t v50 = 0LL;
    uint64_t v17 = 0LL;
  }

  int v18 = 0;
  char v49 = 0;
  uint64_t v19 = v56 & 0x44;
  int v20 = -1;
  v51 = a3;
  v52 = v13;
  while (v7 != v18)
  {
    if (v19 == 4) {
      int v21 = v18;
    }
    else {
      int v21 = v7 + v20;
    }
    v22 = (char *)a3[v21];
    if ((unint64_t)v22 >= 0x1000)
    {
      NSMapGet(self->_addressToSymbolicationMap, (const void *)a3[v21]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        if ((v56 & 2) != 0)
        {
          unint64_t v53 = v50;
          id v54 = 0LL;
        }

        else
        {
          v25 = -[VMUStackLogReaderBase binaryImagePathForPCaddress:](self, "binaryImagePathForPCaddress:", v22);
          v26 = -[VMUStackLogReaderBase identifierForBinaryImagePath:](self, "identifierForBinaryImagePath:", v25);
          id v54 = v26;
          if ((v56 & 4) != 0)
          {
            unint64_t v28 = [v26 length];
            uint64_t v27 = v50;
            if (v28 > v50) {
              uint64_t v27 = [v54 length];
            }
          }

          else
          {
            uint64_t v27 = 0LL;
          }

          unint64_t v53 = v27;
        }

        -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", v22);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = v29;
          if ([v29 hasPrefix:@"_malloc_type_"]
            && [v30 hasSuffix:@"_outlined"])
          {
            [v30 substringFromIndex:[@"_malloc_type" length]];
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if ([v31 hasPrefix:@"_zone"])
            {
              uint64_t v32 = [v31 stringByReplacingOccurrencesOfString:@"_zone" withString:@"_malloc_zone"];

              v31 = (void *)v32;
            }

            uint64_t v33 = [v31 substringToIndex:[v31 length] - [@"_outlined" length]];

            v30 = (void *)v33;
            a3 = v51;
            if (!v33) {
              goto LABEL_44;
            }
          }

          else
          {
          }

          if (-[NSSet containsObject:](self->_excludedFrames, "containsObject:", v30))
          {

            char v49 = 1;
            int v23 = 3;
            v24 = v54;
            uint64_t v13 = v52;
LABEL_70:

            uint64_t v19 = v56 & 0x44;
            goto LABEL_71;
          }

          id v35 = v30;
          v36 = (const char *)[v35 UTF8String];
          v37 = v36;
          else {
            size_t v39 = strcspn(v36, "(<");
          }
          v24 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithBytes:v37 length:v39 encoding:4];
          char v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
LABEL_56:
              [MEMORY[0x189607940] stringWithFormat:@"%#*llx (%-*s) %@", v17, v22, v53, [v54 UTF8String], v24, context];
              goto LABEL_60;
            }

            goto LABEL_61;
          }

          [v24 appendFormat:@" + %llu", &v22[--[VMUStackLogReaderBase functionRangeContainingPCaddress:]( self,  "functionRangeContainingPCaddress:",  v22)]];
        }

        else
        {
LABEL_44:
          char v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
              [MEMORY[0x189607940] stringWithString:@"???"];
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              id v35 = 0LL;
              goto LABEL_56;
            }

            [MEMORY[0x189607940] stringWithFormat:@"%#llx" v22];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            id v35 = 0LL;
            goto LABEL_61;
          }

          uint64_t v40 = -[VMUStackLogReaderBase binaryImageRangeForPCaddress:](self, "binaryImageRangeForPCaddress:", v22);
          [MEMORY[0x189607940] stringWithFormat:@"%#llx + %llu", v40, &v22[-v40]];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          id v35 = 0LL;
        }

        [MEMORY[0x189607940] stringWithFormat:@"%-*s %#*llx %@", v53, [v54 UTF8String], v17, v22, v24, context];
        uint64_t v41 = LABEL_60:;

        v24 = (void *)v41;
        char v34 = v56;
LABEL_61:
        uint64_t v42 = -[VMUStackLogReaderBase sourceFileNameAndLineNumberForPCaddress:fullPath:]( self,  "sourceFileNameAndLineNumberForPCaddress:fullPath:",  v22,  v34 & 1);
        v43 = (void *)v42;
        if (v42) {
          [v24 appendFormat:@"  %@", v42];
        }
        NSMapInsertKnownAbsent(self->_addressToSymbolicationMap, v22, v24);

        a3 = v51;
        uint64_t v13 = v52;
      }

      *(void *)__str = 0LL;
      uint64_t v58 = 0LL;
      v44 = " | ";
      if ((v56 & 4) != 0)
      {
        snprintf(__str, 0x10uLL, "%-3d ", v21);
        v44 = "\n";
      }

      if ((v55 & 1) != 0) {
        -[__CFString appendFormat:](v13, "appendFormat:", @"%s%s%@", v44, __str, v24);
      }
      else {
        -[__CFString appendFormat:](v13, "appendFormat:", @"%s%@", __str, v24, v47);
      }
      int v23 = 0;
      char v55 = 1;
      goto LABEL_70;
    }

    int v23 = 2;
LABEL_71:
    ++v18;
    --v20;
    if (v23 == 3) {
      break;
    }
  }

  -[__CFString appendString:](v13, "appendString:", @" ");
  objc_autoreleasePoolPop(context);
  v45 = VMUBacktraceIsExcludedMarker;
  if ((v49 & 1) == 0) {
    v45 = v13;
  }
  v46 = v45;

  return v46;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)inspectingLiveProcess
{
  return 0;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  return 5;
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  return 0LL;
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  return 0LL;
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  return 0LL;
}

- (id)binaryImagePathForPCaddress:(unint64_t)a3
{
  Path = (void *)CSSymbolOwnerGetPath();
  if (Path)
  {
    [NSString stringWithUTF8String:Path];
    Path = (void *)objc_claimAutoreleasedReturnValue();
  }

  return Path;
}

- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3
{
  unint64_t Range = CSRegionGetRange();
  if (!v4)
  {
    unint64_t Range = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v4 = 0LL;
  }

  result.length = v4;
  result.location = Range;
  return result;
}

- (id)functionNameForPCaddress:(unint64_t)a3
{
  Name = (void *)CSSymbolGetName();
  if (Name)
  {
    [NSString stringWithUTF8String:Name];
    Name = (void *)objc_claimAutoreleasedReturnValue();
  }

  return Name;
}

- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3
{
  unint64_t Range = CSSymbolGetRange();
  result.length = v4;
  result.location = Range;
  return result;
}

- (id)sourcePathForPCaddress:(unint64_t)a3
{
  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    [NSString stringWithUTF8String:Path];
    Path = (void *)objc_claimAutoreleasedReturnValue();
  }

  return Path;
}

- (id)sourceFileNameForPCaddress:(unint64_t)a3
{
  Filename = (void *)CSSourceInfoGetFilename();
  if (Filename)
  {
    [NSString stringWithUTF8String:Filename];
    Filename = (void *)objc_claimAutoreleasedReturnValue();
  }

  return Filename;
}

- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3
{
  return CSSourceInfoGetLineNumber();
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  return 0LL;
}

- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4
{
  BOOL v4 = a4;
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  if (v4) {
    uint64_t Path = CSSourceInfoGetPath();
  }
  else {
    uint64_t Path = CSSourceInfoGetFilename();
  }
  uint64_t v6 = Path;
  uint64_t LineNumber = CSSourceInfoGetLineNumber();
  if (v6)
  {
    [NSString stringWithFormat:@"%s:%u", v6, LineNumber];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)shouldIgnoreSymbolWithName:(id)a3 binaryPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5)
  {
    BOOL v9 = 0;
    goto LABEL_19;
  }

  if (!v6)
  {
    BOOL v9 = 1;
    goto LABEL_19;
  }

  [v6 lastPathComponent];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldIgnoreSymbolWithName_binaryPath__onceToken != -1) {
    dispatch_once(&shouldIgnoreSymbolWithName_binaryPath__onceToken, &__block_literal_global_1);
  }
  if (([(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore containsObject:v8] & 1) == 0
    && ([(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore containsObject:v5] & 1) == 0)
  {
    if (([v5 hasPrefix:@"operator new"] & 1) == 0
      && ([v5 hasPrefix:@"__typed_operator_new_impl"] & 1) == 0
      && ([v5 hasPrefix:@"$_0::operator()"] & 1) == 0
      && ([v5 hasPrefix:@"caulk::alloc::darwin_resource"] & 1) == 0
      && ([v5 hasPrefix:@"objc::DenseMap"] & 1) == 0
      && ([v5 hasPrefix:@"objc::detail::DenseMapPair"] & 1) == 0
      && ([v5 hasPrefix:@"llvm::BumpPtrAllocatorImpl"] & 1) == 0
      && (![v5 hasPrefix:@"bmalloc_"]
       || ([v5 containsString:@"_allocate"] & 1) == 0)
      && (![v5 hasPrefix:@"WTF::"]
       || ([v5 hasPrefix:@"WTF::fastZeroedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastStrDup"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastMemDup"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastZeroedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastCalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastCalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastRealloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastRealloc"] & 1) == 0)
      && (![v5 hasPrefix:@"Gigacage::"]
       || ([v5 hasPrefix:@"Gigacage::tryMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryRealloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryAllocateZeroedVirtualPages"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::malloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryMallocArray"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::mallocArray"] & 1) == 0)
      && (![v5 hasPrefix:@"JSC::"]
       || ([v5 hasPrefix:@"JSC::IsoAlignedMemoryAllocator"] & 1) == 0
       && ([v5 hasPrefix:@"JSC::tryAllocateAlignedMemory"] & 1) == 0
       && ![v5 hasPrefix:@"JSC::tryAllocateMemory"]))
    {
      BOOL v9 = 0;
      goto LABEL_16;
    }

    [(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore addObject:v5];
  }

  BOOL v9 = 1;
LABEL_16:

LABEL_19:
  return v9;
}

void __63__VMUStackLogReaderBase_shouldIgnoreSymbolWithName_binaryPath___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FE0]) initWithObjects:@"libsystem_malloc.dylib", @"libCoreLib.dylib", 0];
  v1 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x189603FE0]) initWithObjects:@"strndup", @"reallocf", @"_dispatch_calloc", @"_dispatch_strdup_if_mutable", @"_dispatch_continuation_alloc_from_heap", @"_xpc_alloc", @"swift_slowAlloc", @"swift_allocObject", @"swift_allocBox", @"__CFSafelyReallocateWithAllocator", @"CFStorageReplaceValues", @"__NSMS1", @"pdf_named_calloc", @"pdf_named_malloc", @"hash_table_modify", @"CMMMemMgr::New(unsigned long)", @"CMMBase::NewInternal(unsigned long, CMMMemMgr&, char const*)", @"XAtomicAllocator::reserve(int)", @"_table_addStorageBlock", @"sqlite3MemMalloc", @"sqlite3MemRealloc", @"dbMallocRawFinish", @"dbReallocFinish", @"llvm::safe_malloc(unsigned long)", @"llvm::safe_calloc(unsigned long, unsigned long)", @"llvm::safe_realloc(void*, unsigned long)", @"llvm::allocate_buffer(unsigned long, unsigned long)", @"geo::MallocZoneAllocator::allocate(unsigned long, unsigned long)", @"geo::MallocZoneAllocator::callocate(unsigned long, unsigned long)", @"geo::MallocZoneAllocator::reallocate(void*, unsigned long)", @"kalloc_ext", @"IOMalloc_internal", @"strdup", @"IOLockAlloc", 0];
  v3 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore = v2;
}

- (id)_allocationTypeNameForStackID:(unint64_t)a3 returnedBinaryPath:(id *)a4
{
  BOOL v4 = a4;
  v43[512] = *MEMORY[0x1895F89C0];
  if (a4) {
    *a4 = @"<unknown>";
  }
  if (a3 == -1LL) {
    return @"non-object with no stack backtrace";
  }
  int v7 = (void *)MEMORY[0x186E32E40](self, a2);
  int64_t v8 = -[VMUStackLogReaderBase getFramesForStackID:stackFramesBuffer:]( self,  "getFramesForStackID:stackFramesBuffer:",  a3,  v43);
  if (!v8)
  {
    objc_autoreleasePoolPop(v7);
    return @"non-object with no stack backtrace";
  }

  uint64_t v9 = v8;
  -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", v43[0]);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    if (-[__CFString hasPrefix:](v10, "hasPrefix:", @"_malloc_zone_"))
    {
      -[__CFString substringFromIndex:](v11, "substringFromIndex:", 13LL);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      uint64_t v13 = -[__CFString rangeOfString:](v12, "rangeOfString:", @"_instrumented_or_legacy");
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v12;
      }

      else
      {
        -[__CFString substringToIndex:](v12, "substringToIndex:", v13);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", @"malloc_zone_realloc") & 1) != 0 {
           || (-[__CFString hasPrefix:](v11, "hasPrefix:", @"WTF::fastRealloc") & 1) != 0
    }
           || -[__CFString hasPrefix:](v11, "hasPrefix:", @"WTF::tryFastRealloc"))
    {

      v11 = @"realloc";
    }

    else if (-[__CFString hasPrefix:](v11, "hasPrefix:", @"caulk::alloc::darwin_resource"))
    {

      v11 = @"caulk::alloc::darwin_resource";
    }

    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", @"realloc") & 1) == 0 {
           && (-[__CFString isEqualToString:](v11, "isEqualToString:", @"sqlite3MemRealloc") & 1) == 0)
    }
    {
      -[__CFString isEqualToString:](v11, "isEqualToString:", @"__CFSafelyReallocateWithAllocator");
    }
  }

  else
  {
    v11 = @"malloc";
  }

  if (v9 >= 1)
  {
    v37 = v11;
    int v38 = v7;
    size_t v39 = v4;
    uint64_t v40 = 0LL;
    id v15 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    char v16 = 0;
    uint64_t v17 = 0LL;
    int v18 = 0LL;
    uint64_t v19 = v43;
    while (1)
    {
      int v20 = v18;
      int v21 = v15;
      v22 = -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", *v19);
      uint64_t v23 = *v19++;
      -[VMUStackLogReaderBase binaryImagePathForPCaddress:](self, "binaryImagePathForPCaddress:", v23);
      int v18 = (void *)objc_claimAutoreleasedReturnValue();

      id v15 = v22;
      _removeReturnValueFromCPlusPlusSymbolName(v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      int v24 = [v17 hasPrefix:@"std::"];
      if (v24)
      {
        id v25 = v17;

        id v26 = v15;
        id v27 = v18;

        uint64_t v41 = v27;
        uint64_t v42 = v25;
        uint64_t v40 = v26;
      }

      else
      {
        if ((v16 & 1) != 0
          && ([v42 hasPrefix:@"std::__"] & 1) == 0
          && ([v42 hasPrefix:@"std::enable_if"] & 1) == 0)
        {
          id v32 = v42;

          id v33 = v40;
          id v34 = v41;

          uint64_t v41 = v34;
          uint64_t v42 = v32;
          int v18 = v34;
          uint64_t v17 = v32;
          uint64_t v40 = v33;
          id v15 = v33;
          if (!v32)
          {
LABEL_30:
            int v7 = v38;
            BOOL v4 = v39;
            v11 = v37;
            v31 = v40;
            v30 = v41;
            goto LABEL_31;
          }

- (void)identifyNonObjectsUsingStackBacktraces:(id)a3 classInfoMap:(id)a4 classInfoSetterBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = -[VMUStackLogConsolidator initWithScannerOrGraph:stackLogReader:]( objc_alloc(&OBJC_CLASS___VMUStackLogConsolidator),  "initWithScannerOrGraph:stackLogReader:",  v10,  self);

  if (-[VMUStackLogReaderBase usesLiteMode](self, "usesLiteMode")
    || -[VMUStackLogReaderBase usesCoreFile](self, "usesCoreFile"))
  {
    uint64_t v12 = (void *)objc_opt_new();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke;
  v25[3] = &unk_189DFD9A8;
  v25[4] = self;
  id v26 = v12;
  id v14 = v8;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = v12;
  -[VMUStackLogConsolidator stackIDsToNodesFilteredBy:](v11, "stackIDsToNodesFilteredBy:", v25);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472LL;
  v21[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2;
  v21[3] = &unk_189DFD9D0;
  v21[4] = self;
  id v22 = (id)objc_opt_new();
  id v23 = v14;
  id v24 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v22;
  [v17 enumerateKeysAndObjectsUsingBlock:v21];
}

uint64_t __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x186E32E40]();
  if (*(void *)(a3 + 8) >> 60 != 1LL) {
    goto LABEL_17;
  }
  id v9 = *(void **)(a3 + 16);
  if (!v9) {
    goto LABEL_6;
  }
  [v9 displayName];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 hasPrefix:@"non-object"])
  {

    goto LABEL_6;
  }

  int v11 = [*(id *)(a3 + 16) isDerivedFromStackBacktrace];

  if (!v11)
  {
LABEL_17:
    uint64_t v14 = 0LL;
    goto LABEL_18;
  }

void __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x186E32E40]();
  uint64_t v8 = [v5 unsignedLongValue];
  id v9 = *(void **)(a1 + 32);
  id v32 = 0LL;
  [v9 _allocationTypeNameForStackID:v8 returnedBinaryPath:&v32];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = (__CFString *)v32;
  id v12 = v11;
  if (v10)
  {
    if (!v11) {
      id v12 = @"<unknown>";
    }
    uint64_t v13 = -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v10);
    [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    id v25 = (void *)v13;
    id v26 = v7;
    if (v14)
    {
      [v14 unsignedIntValue];
    }

    else
    {
      else {
        uint64_t v16 = 16LL;
      }
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v10,  v12,  v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setIsDerivedFromStackBacktrace:1];
      uint64_t v18 = [*(id *)(a1 + 48) indexForClassInfo:v17];
      [MEMORY[0x189607968] numberWithUnsignedInt:v18];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v13];
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v27 = v6;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v22);
    }

    id v7 = v26;
    id v6 = v27;
  }

  objc_autoreleasePoolPop(v7);
}

- (unsigned)task
{
  return self->_task;
}

- (BOOL)usesLiteMode
{
  return self->_usesLiteMode;
}

- (BOOL)usesCoreFile
{
  return self->_usesCoreFile;
}

- (BOOL)coldestFrameIsNotThreadId
{
  return self->_coldestFrameIsNotThreadId;
}

- (VMUVMRegionTracker)regionTracker
{
  return (VMUVMRegionTracker *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSSet)excludedFrames
{
  return self->_excludedFrames;
}

- (void)setExcludedFrames:(id)a3
{
}

- (_CSTypeRef)symbolicator
{
  unint64_t v2 = v4[0];
  unint64_t v3 = v4[1];
  result._opaque_2 = v3;
  result._opaque_1 = v2;
  return result;
}

- (VMUTask)vmuTask
{
  return (VMUTask *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end