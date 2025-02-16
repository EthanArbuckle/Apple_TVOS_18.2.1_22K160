@interface VMUTaskMemoryCache
+ (BOOL)taskIs64Bit:(unsigned int)a3;
+ (id)taskMemoryCacheForTask:(unsigned int)a3;
- (BOOL)copyRange:(_VMURange)a3 to:(void *)a4;
- (BOOL)isDriverKit;
- (BOOL)isExclave;
- (BOOL)isKernel;
- (BOOL)isSimulator;
- (BOOL)representsCore;
- (BOOL)taskIsTranslated;
- (VMUTaskMemoryCache)initWithCorePath:(id)a3 originalBinaryPaths:(id)a4 error:(id *)a5;
- (VMUTaskMemoryCache)initWithTask:(unsigned int)a3;
- (const)findMappedAddress:(unint64_t)a3 size:(unint64_t)a4;
- (const)peekStringAtAddress:(unint64_t)a3;
- (id)coreFileParentProcName;
- (id)coreFileParentProcPath;
- (id)coreFileProcName;
- (id)coreFileProcPath;
- (id)regionInfoBlock;
- (int)_kernelCorePageRangeQueryWithAddress:(unint64_t)a3 size:(unint64_t)a4 dispositions:(unint64_t)a5 dispositionsCount:(unint64_t *)a6;
- (int)getCoreFileCPUType:(int *)a3;
- (int)getPlatform:(unsigned int *)a3;
- (int)machVMPageRangeQueryWithAddress:(unint64_t)a3 size:(unint64_t)a4 dispositions:(unint64_t)a5 dispositionsCount:(unint64_t *)a6;
- (int)machVMPurgableControlWithAddress:(unint64_t)a3 control:(int)a4 state:(int *)a5;
- (int)machVMRegionRecurseSubmapInfo64onAddress:(unint64_t *)a3 size:(unint64_t *)a4 nestingDepth:(unsigned int *)a5 info:(vm_region_submap_info_64 *)a6;
- (int)machVMRegionRecurseSubmapShortInfo64onAddress:(unint64_t *)a3 size:(unint64_t *)a4 nestingDepth:(unsigned int *)a5 info:(vm_region_submap_short_info_64 *)a6;
- (int)mapAddress:(unint64_t)a3 size:(unint64_t)a4;
- (int)mapAddress:(unint64_t)a3 size:(unint64_t)a4 returnedAddress:(unint64_t *)a5 returnedSize:(unint64_t *)a6;
- (int)peekAtAddress:(unint64_t)a3 size:(unint64_t)a4 returnsBuf:(void *)a5;
- (int)procRegionFileNameForAddress:(unint64_t)a3 buffer:(void *)a4 bufferSize:(unsigned int)a5;
- (int)readPointerAt:(unint64_t)a3 value:(unint64_t *)a4;
- (int)startPeeking;
- (int)stopPeeking;
- (int)taskThreadsWithList:(unsigned int *)a3 listCnt:(unsigned int *)a4;
- (int)threadGetState:(unsigned int)a3 withFlavor:(int)a4 oldState:(unsigned int *)a5 oldStateCnt:(unsigned int *)a6;
- (int)unmapAddress:(unint64_t)a3 size:(unint64_t)a4 returnedAddress:(unint64_t *)a5 returnedSize:(unint64_t *)a6;
- (mapped_memory_t)memoryRegions;
- (uint64_t)createSymbolicatorWithFlags:(void *)a3 andNotification:;
- (uint64_t)exclaveType;
- (uint64_t)getCoreDyldSharedCacheRange:(uint64_t)result;
- (uint64_t)getCoreFileAddressingMask:(uint64_t)result;
- (uint64_t)getCoreFileArgsLen:(uint64_t)result;
- (uint64_t)getCoreFileDirtyFlags:(uint64_t)result;
- (uint64_t)getCoreFileLedgerAlternateAccounting:(uint64_t)result;
- (uint64_t)getCoreFileLedgerAlternateAccountingCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerGraphicsFootprint:(uint64_t)result;
- (uint64_t)getCoreFileLedgerGraphicsFootprintCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerInternal:(uint64_t)result;
- (uint64_t)getCoreFileLedgerInternalCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerIokitMapped:(uint64_t)result;
- (uint64_t)getCoreFileLedgerMediaFootprint:(uint64_t)result;
- (uint64_t)getCoreFileLedgerMediaFootprintCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerNetworkNonvolatile:(uint64_t)result;
- (uint64_t)getCoreFileLedgerNetworkNonvolatileCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerNeuralFootprint:(uint64_t)result;
- (uint64_t)getCoreFileLedgerNeuralFootprintCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerPageTable:(uint64_t)result;
- (uint64_t)getCoreFileLedgerPhysFootprint:(uint64_t)result;
- (uint64_t)getCoreFileLedgerPhysFootprintLifetimeMax:(uint64_t)result;
- (uint64_t)getCoreFileLedgerPurgeableNonvolatile:(uint64_t)result;
- (uint64_t)getCoreFileLedgerPurgeableNonvolatileCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerTaggedFootprint:(uint64_t)result;
- (uint64_t)getCoreFileLedgerTaggedFootprintCompressed:(uint64_t)result;
- (uint64_t)getCoreFileLedgerWiredMem:(uint64_t)result;
- (uint64_t)getCoreFilePPid:(uint64_t)result;
- (uint64_t)getCoreFilePid:(uint64_t)result;
- (uint64_t)getCoreFileProcArgc:(uint64_t)result;
- (uint64_t)getCoreFileProcFlags:(uint64_t)result;
- (uint64_t)getCoreFileProcStarttimeSec:(uint64_t)result;
- (uint64_t)getCoreFileProcStarttimeUSec:(uint64_t)result;
- (uint64_t)getCoreFileUdataPointersIntoBuffer:(void *)a3 count:;
- (uint64_t)getCoreFileUserstack:(uint64_t)result;
- (uint64_t)getExclaveVMFlagsForAddress:(uint64_t)result exclaveVMFlags:;
- (uint64_t)getOwnedVMObjectsIntoBuffer:(size_t *)a3 byteCount:;
- (unint64_t)pageSize;
- (unint64_t)tryPeekAtAddress:(unint64_t)a3 outPtr:(void *)a4;
- (unsigned)taskPort;
- (void)_createOriginalSymbolOwnersWithPaths:(id)a3;
- (void)dealloc;
- (void)enumerateMemoryCache:(id)a3;
- (void)flushMemoryCache;
- (void)setRegionInfoBlock:(id)a3;
@end

@implementation VMUTaskMemoryCache

+ (BOOL)taskIs64Bit:(unsigned int)a3
{
  return CSTaskIs64Bit();
}

+ (id)taskMemoryCacheForTask:(unsigned int)a3
{
  return (id)[objc_alloc((Class)a1) initWithTask:*(void *)&a3];
}

- (VMUTaskMemoryCache)initWithCorePath:(id)a3 originalBinaryPaths:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VMUTaskMemoryCache;
  v10 = -[VMUTaskMemoryCache init](&v20, sel_init);
  if (v10)
  {
    id v11 = v8;
    [v11 UTF8String];
    uint64_t mapped_memory_cache_for_core_file_with_label = create_mapped_memory_cache_for_core_file_with_label();
    v10->_memoryRegions = (mapped_memory_t *)mapped_memory_cache_for_core_file_with_label;
    if (mapped_memory_cache_for_core_file_with_label)
    {
      -[VMUTaskMemoryCache _createOriginalSymbolOwnersWithPaths:](v10, "_createOriginalSymbolOwnersWithPaths:", v9);
      v10->_taskType = 1LL;
      uint64_t v13 = [v11 copy];
      corePath = v10->_corePath;
      v10->_corePath = (NSString *)v13;

      -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v10, 0LL, 0LL);
      else {
        uint64_t v15 = 1LL;
      }
      v10->_taskType = v15;
      if (CSIsNull())
      {
        v16 = @"Failed to create symbolicator.";
      }

      else if (v10->_taskType == 1 && (mapped_memory_core_file_has_info_for_memory_analysis() & 1) == 0)
      {
        CSRelease();
        v16 = @"File is missing metadata required for analysis.";
      }

      else
      {
        v10->_taskArchitecture = (_CSArchitecture)CSSymbolicatorGetArchitecture();
        v10->_taskIs64Bit = mapped_memory_is_64_bit();
        v10->_taskIsTranslated = CSSymbolicatorGetTaskIsTranslated();
        v10->_taskPort = 0;
        v10->_pid = -1;
        if (mapped_memory_core_file_is_exclave())
        {
          else {
            uint64_t v19 = 2LL;
          }
          v10->_exclaveType = v19;
        }

        else
        {
          v10->_exclaveType = 0LL;
        }

        if (v10->_taskType != 2
          || (CSSymbolicatorGetAOutSymbolOwner(), (CSIsNull() & 1) == 0) && CSSymbolOwnerGetSymbolCount())
        {
          CSRelease();
          goto LABEL_12;
        }

        CSRelease();
        v16 = @"No matching kernel found.";
      }
    }

    else
    {
      v16 = @"Failed to create mapped memory cache.";
    }

    vmuTaskMemoryCacheInitializationError(v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5) {
      *a5 = v17;
    }

    v10 = 0LL;
  }

- (uint64_t)createSymbolicatorWithFlags:(void *)a3 andNotification:
{
  id v5 = a3;
  if (!a1)
  {
    uint64_t v3 = 0LL;
    goto LABEL_7;
  }

  uint64_t v6 = *(void *)(a1 + 16);
  if ((unint64_t)(v6 - 1) < 2)
  {
    [*(id *)(a1 + 40) fileSystemRepresentation];
    CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    uint64_t v7 = CSSymbolicatorCreateWithCoreFilePathAndFlags();
LABEL_6:
    uint64_t v3 = v7;
    goto LABEL_7;
  }

  if (!v6)
  {
    uint64_t v7 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
    goto LABEL_6;
  }

- (VMUTaskMemoryCache)initWithTask:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUTaskMemoryCache;
  v4 = -[VMUTaskMemoryCache init](&v7, sel_init);
  if (v4)
  {
    v4->_taskIs64Bit = CSTaskIs64Bit();
    v4->_taskIsTranslated = CSTaskIsTranslated();
    v4->_taskArchitecture = (_CSArchitecture)MEMORY[0x186E31ED4]();
    v4->_taskPort = a3;
    v4->_taskType = 0LL;
    v4->_taskIsSelf = VMUTaskIsSelf();
    if (pid_for_task(a3, &v4->_pid))
    {
LABEL_3:

      return 0LL;
    }

    if (!v4->_taskIsSelf)
    {
      uint64_t mapped_memory_cache_with_label = task_get_mapped_memory_cache_with_label();
      v4->_memoryRegions = (mapped_memory_t *)mapped_memory_cache_with_label;
      if (!mapped_memory_cache_with_label)
      {
        fputs( (const char *)[@"VMUTaskMemoryCache initialization failed, likely because the target process no longer exists.\n" UTF8String],  (FILE *)*MEMORY[0x1895F89D0]);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[VMUTaskMemoryCache initWithTask:].cold.1();
        }
        goto LABEL_3;
      }
    }
  }

  return v4;
}

- (void)flushMemoryCache
{
  if (self->_memoryRegions) {
    clear_mapped_memory();
  }
}

- (void)dealloc
{
  if (self->_memoryRegions)
  {
    set_mapped_memory_cache_region_info_block();
    id regionInfoBlock = self->_regionInfoBlock;
    self->_id regionInfoBlock = 0LL;

    if (self->_taskType) {
      MEMORY[0x186E33344](self->_memoryRegions);
    }
    else {
      task_release_mapped_memory_cache();
    }
    self->_memoryRegions = 0LL;
  }

  free(self->_originalSymbolOwners);
  cfOriginalSymbolOwners = self->_cfOriginalSymbolOwners;
  if (cfOriginalSymbolOwners) {
    CFRelease(cfOriginalSymbolOwners);
  }
  CSRelease();
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VMUTaskMemoryCache;
  -[VMUTaskMemoryCache dealloc](&v5, sel_dealloc);
}

- (void)setRegionInfoBlock:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x186E33044]();
  id regionInfoBlock = self->_regionInfoBlock;
  self->_id regionInfoBlock = v4;

  if (self->_memoryRegions) {
    set_mapped_memory_cache_region_info_block();
  }
}

- (void)enumerateMemoryCache:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_memoryRegions)
  {
    id v6 = v4;
    enumerate_mapped_memory_cache();
  }
}

uint64_t __43__VMUTaskMemoryCache_enumerateMemoryCache___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (int)startPeeking
{
  memoryRegions = self->_memoryRegions;
  if (memoryRegions) {
    LODWORD(memoryRegions) = mapped_memory_suspend_target();
  }
  return (int)memoryRegions;
}

- (int)stopPeeking
{
  memoryRegions = self->_memoryRegions;
  if (memoryRegions) {
    LODWORD(memoryRegions) = mapped_memory_resume_target();
  }
  return (int)memoryRegions;
}

- (BOOL)taskIsTranslated
{
  return self->_taskIsTranslated;
}

- (const)findMappedAddress:(unint64_t)a3 size:(unint64_t)a4
{
  return (const mapped_region_node_t *)find_node((const char *)self->_memoryRegions, (tree *)a3);
}

- (int)mapAddress:(unint64_t)a3 size:(unint64_t)a4
{
  return -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self,  "mapAddress:size:returnedAddress:returnedSize:",  a3,  a4,  0LL,  0LL);
}

- (int)mapAddress:(unint64_t)a3 size:(unint64_t)a4 returnedAddress:(unint64_t *)a5 returnedSize:(unint64_t *)a6
{
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  memoryRegions = self->_memoryRegions;
  if (memoryRegions)
  {
    node = find_node((const char *)memoryRegions, (tree *)a3);
    if (node || (node = (void *)map_new_node()) != 0LL)
    {
      if (a5) {
        *a5 = node[2] + a3 - *node;
      }
      int result = 0;
      if (a6) {
        *a6 = node[1] - a3 + *node;
      }
    }

    else
    {
      return 0;
    }
  }

  else if (memoryExists(*MEMORY[0x1895FBBE0], a3, a4))
  {
    if (a5) {
      *a5 = a3;
    }
    int result = 0;
    if (a6) {
      *a6 = a4;
    }
  }

  else
  {
    return 1;
  }

  return result;
}

- (int)unmapAddress:(unint64_t)a3 size:(unint64_t)a4 returnedAddress:(unint64_t *)a5 returnedSize:(unint64_t *)a6
{
  if (self->_memoryRegions) {
    return unmap_node();
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  return 0;
}

- (int)peekAtAddress:(unint64_t)a3 size:(unint64_t)a4 returnsBuf:(void *)a5
{
  uint64_t v7 = 0LL;
  id v8 = 0LL;
  int result = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self,  "mapAddress:size:returnedAddress:returnedSize:",  a3,  a4,  &v8,  &v7);
  *a5 = v8;
  return result;
}

- (const)peekStringAtAddress:(unint64_t)a3
{
  if (self->_taskIsSelf) {
    return (const char *)a3;
  }
  unint64_t v17 = 1LL;
  unint64_t v6 = -[VMUTaskMemoryCache pageSize](self, "pageSize");
  v16 = 0LL;
  int v7 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self,  "mapAddress:size:returnedAddress:returnedSize:",  a3,  1LL,  &v16,  &v17);
  int result = 0LL;
  if (!v7)
  {
    id v8 = v16;
    if (v16)
    {
      unint64_t v9 = 0LL;
      uint64_t v10 = MEMORY[0x1895F8770];
      while (1)
      {
        while (1)
        {
          unint64_t v11 = v17;
          if (v9 < v17) {
            break;
          }
          v17 += v6;
          if (v11 + v6 <= 0x19000)
          {
            v16 = 0LL;
            int v14 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self,  "mapAddress:size:returnedAddress:returnedSize:",  a3);
            id v8 = v16;
            if (!v14 && v16 != 0LL) {
              continue;
            }
          }

          return 0LL;
        }

        unsigned int v12 = v8[v9];
        if (!v8[v9]) {
          return v16;
        }
        if ((v12 & 0x80000000) != 0)
        {
          if (__maskrune(v8[v9], 0x40000uLL)) {
            goto LABEL_19;
          }
        }

        else if ((*(_DWORD *)(v10 + 4LL * v12 + 60) & 0x40000) != 0)
        {
          goto LABEL_19;
        }

        BOOL v13 = v12 > 0xD || ((1 << v12) & 0x2600) == 0;
LABEL_19:
        ++v9;
      }
    }
  }

  return result;
}

- (int)readPointerAt:(unint64_t)a3 value:(unint64_t *)a4
{
  if (self->_taskIs64Bit) {
    uint64_t v6 = 8LL;
  }
  else {
    uint64_t v6 = 4LL;
  }
  uint64_t v10 = 0LL;
  int result = -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self, "peekAtAddress:size:returnsBuf:", a3, v6, &v10);
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v10 == 0LL;
  }
  if (!v8)
  {
    if (self->_taskIs64Bit) {
      unint64_t v9 = *v10;
    }
    else {
      unint64_t v9 = *(unsigned int *)v10;
    }
    *a4 = v9;
  }

  return result;
}

- (BOOL)copyRange:(_VMURange)a3 to:(void *)a4
{
  size_t length = a3.length;
  location = (tree *)a3.location;
  if (!self->_memoryRegions)
  {
    if (-[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:]( self,  "peekAtAddress:size:returnsBuf:",  a3.location,  a3.length,  &__src))
    {
      LOBYTE(node) = 0;
      return (char)node;
    }

    memcpy(a4, __src, length);
LABEL_13:
    LOBYTE(node) = 1;
    return (char)node;
  }

  if (!a3.length) {
    goto LABEL_13;
  }
  while (1)
  {
    node = find_node((const char *)self->_memoryRegions, location);
    if (!node)
    {
      node = (void *)map_new_node();
      if (!node) {
        return (char)node;
      }
    }

    uint64_t v9 = node[1];
    uint64_t v10 = (char *)location - *node;
    else {
      size_t v11 = length;
    }
    memcpy(a4, &v10[node[2]], v11);
    location = (tree *)((char *)location + v11);
    length -= v11;
    if (!length) {
      goto LABEL_13;
    }
  }

- (int)getCoreFileCPUType:(int *)a3
{
  if (!self->_corePath) {
    return 4;
  }
  int result = mapped_memory_core_file_get_architecture();
  if (result) {
    return 5;
  }
  *a3 = -1;
  return result;
}

- (int)_kernelCorePageRangeQueryWithAddress:(unint64_t)a3 size:(unint64_t)a4 dispositions:(unint64_t)a5 dispositionsCount:(unint64_t *)a6
{
  unint64_t v11 = -[VMUTaskMemoryCache pageSize](self, "pageSize");
  if (!a4) {
    return 4;
  }
  unint64_t v12 = v11;
  unint64_t v13 = a4 / v11;
  if (a4 % v11 || a3 % v11 || *a6 < v13) {
    return 4;
  }
  *a6 = v13;
  if (CSIsNull())
  {
    uint64_t FlagsForNoSymbolOrSourceInfoData = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
    self->_minimalSymbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]( (uint64_t)self,  FlagsForNoSymbolOrSourceInfoData,  0LL);
    self->_minimalSymbolicator._opaque_2 = v16;
  }

  unint64_t v17 = a4 + a3;
  if (a4 + a3 <= a3) {
    return 0;
  }
  while (1)
  {
    unint64_t v18 = -[VMUTaskMemoryCache tryPeekAtAddress:outPtr:]( self,  "tryPeekAtAddress:outPtr:",  a3,  &v31,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
    if (!v18) {
      break;
    }
    if (v18 >= v12)
    {
      uint64_t v27 = 0LL;
      v28 = &v27;
      uint64_t v29 = 0x2020000000LL;
      char v30 = 1;
      CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      if ((CSIsNull() & 1) == 0)
      {
        uint64_t v20 = MEMORY[0x1895F87A8];
        uint64_t v21 = 3221225472LL;
        v22 = __95__VMUTaskMemoryCache__kernelCorePageRangeQueryWithAddress_size_dispositions_dispositionsCount___block_invoke;
        v23 = &unk_189DFE6A8;
        unint64_t v25 = v12;
        uint64_t v26 = v31;
        v24 = &v27;
        CSSymbolOwnerGetContentForRange();
      }

      if (*((_BYTE *)v28 + 24)) {
        int v19 = 13;
      }
      else {
        int v19 = 5;
      }
      _Block_object_dispose(&v27, 8);
    }

    else
    {
      int v19 = 0;
    }

    int result = 0;
    *(_DWORD *)a5 = v19;
    a5 += 4LL;
    a3 += v12;
    if (a3 >= v17) {
      return result;
    }
  }

  return 5;
}

uint64_t __95__VMUTaskMemoryCache__kernelCorePageRangeQueryWithAddress_size_dispositions_dispositionsCount___block_invoke( uint64_t result,  const void *a2,  size_t a3)
{
  size_t v4 = *(void *)(result + 40);
  if (v4 <= a3)
  {
    uint64_t v5 = result;
    int result = memcmp(*(const void **)(result + 48), a2, v4);
    if (!(_DWORD)result) {
      *(_BYTE *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = 0;
    }
  }

  return result;
}

- (int)machVMPageRangeQueryWithAddress:(unint64_t)a3 size:(unint64_t)a4 dispositions:(unint64_t)a5 dispositionsCount:(unint64_t *)a6
{
  if (self->_taskType == 2) {
    return -[VMUTaskMemoryCache _kernelCorePageRangeQueryWithAddress:size:dispositions:dispositionsCount:]( self,  "_kernelCorePageRangeQueryWithAddress:size:dispositions:dispositionsCount:",  a3,  a4,  a5,  a6);
  }
  if (!self->_corePath) {
    return mach_vm_page_range_query(self->_taskPort, a3, a4, a5, a6);
  }
  collectPhysFootprint();
  return mapped_memory_core_file_mach_vm_page_range_query();
}

- (int)machVMRegionRecurseSubmapShortInfo64onAddress:(unint64_t *)a3 size:(unint64_t *)a4 nestingDepth:(unsigned int *)a5 info:(vm_region_submap_short_info_64 *)a6
{
  if (self->_taskType == 2) {
    return 4;
  }
  if (self->_corePath) {
    return mapped_memory_core_file_mach_vm_region_recurse_submap_short_64();
  }
  mach_msg_type_number_t infoCnt = 12;
  return mach_vm_region_recurse(self->_taskPort, a3, a4, a5, &a6->protection, &infoCnt);
}

- (int)machVMRegionRecurseSubmapInfo64onAddress:(unint64_t *)a3 size:(unint64_t *)a4 nestingDepth:(unsigned int *)a5 info:(vm_region_submap_info_64 *)a6
{
  if (self->_corePath) {
    return mapped_memory_core_file_mach_vm_region_recurse_submap_64();
  }
  mach_msg_type_number_t infoCnt = 19;
  return mach_vm_region_recurse(self->_taskPort, a3, a4, a5, &a6->protection, &infoCnt);
}

- (int)machVMPurgableControlWithAddress:(unint64_t)a3 control:(int)a4 state:(int *)a5
{
  if (self->_taskType == 2)
  {
    *a5 = 3;
    return 4;
  }

  else if (self->_corePath)
  {
    return mapped_memory_core_file_mach_vm_purgable_control();
  }

  else
  {
    return mach_vm_purgable_control(self->_taskPort, a3, a4, a5);
  }

- (int)taskThreadsWithList:(unsigned int *)a3 listCnt:(unsigned int *)a4
{
  if (self->_corePath) {
    return mapped_memory_task_threads();
  }
  else {
    return task_threads(self->_taskPort, a3, a4);
  }
}

- (int)threadGetState:(unsigned int)a3 withFlavor:(int)a4 oldState:(unsigned int *)a5 oldStateCnt:(unsigned int *)a6
{
  if (self->_corePath) {
    return mapped_memory_thread_get_state();
  }
  else {
    return thread_get_state(a3, a4, a5, a6);
  }
}

- (unint64_t)pageSize
{
  if (!self->_corePath) {
    return *MEMORY[0x1895FD590];
  }
  mapped_memory_core_file_get_architecture();
  if ((CSArchitectureIsArm64() & 1) != 0) {
    return 0x4000LL;
  }
  return 4096LL;
}

- (int)getPlatform:(unsigned int *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!self->_haveAttemptedDyldPlatformFetch)
  {
    self->_haveAttemptedDyldPlatformFetch = 1;
    unint64_t taskType = self->_taskType;
    if (taskType)
    {
      if (taskType != 2)
      {
        if (taskType != 1) {
          goto LABEL_11;
        }
        if ((mapped_memory_core_file_is_exclavecore() & 1) == 0)
        {
          -[NSString UTF8String](self->_corePath, "UTF8String");
          CSSymbolicatorCreateWithPathAndArchitecture();
          if ((CSIsNull() & 1) != 0) {
            return 5;
          }
          CSSymbolicatorGetSymbolOwnerWithNameAtTime();
          if ((CSIsNull() & 1) != 0
            || (CSSymbolOwnerGetRegionWithName(), (CSIsNull() & 1) != 0)
            || (uint64_t Range = CSRegionGetRange(), v9 < 0x170))
          {
            int v10 = 3;
          }

          else
          {
            __int128 v13 = 0u;
            __int128 v14 = 0u;
            __int128 v12 = 0u;
            memset(v11, 0, sizeof(v11));
            if (-[VMUTaskMemoryCache copyRange:to:](self, "copyRange:to:", Range, 368LL, v11))
            {
              int v10 = 0;
              self->_dyldPlatform = v12;
            }

            else
            {
              int v10 = 1;
            }
          }

          CSRelease();
          if (v10) {
            return 5;
          }
          goto LABEL_10;
        }

        unsigned int v6 = 14;
LABEL_9:
        self->_dyldPlatform = v6;
LABEL_10:
        self->_dyldPlatformIsValid = 1;
        goto LABEL_11;
      }

      self->_dyldPlatform = 0;
      self->_dyldPlatformIsValid = 0;
    }

    unsigned int v6 = CSPlatformForTask();
    goto LABEL_9;
  }

- (BOOL)isSimulator
{
  int v4 = 0;
  int v2 = -[VMUTaskMemoryCache getPlatform:](self, "getPlatform:", &v4);
  BOOL result = 0;
  if (!v2) {
    return dyld_is_simulator_platform();
  }
  return result;
}

- (BOOL)isDriverKit
{
  int v4 = 0;
  return !-[VMUTaskMemoryCache getPlatform:](self, "getPlatform:", &v4) && v4 == 10;
}

- (BOOL)isKernel
{
  return self->_taskType == 2;
}

- (int)procRegionFileNameForAddress:(unint64_t)a3 buffer:(void *)a4 bufferSize:(unsigned int)a5
{
  if (self->_taskType == 2)
  {
    if ((CSIsNull() & 1) != 0)
    {
      uint64_t FlagsForNoSymbolOrSourceInfoData = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
      self->_minimalSymbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]( (uint64_t)self,  FlagsForNoSymbolOrSourceInfoData,  0LL);
      self->_minimalSymbolicator._opaque_2 = v9;
    }

    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    Path = (const char *)CSSymbolOwnerGetPath();
    __int128 v12 = strncpy((char *)a4, Path, a5);
    return strlen(v12);
  }

  else if (self->_corePath)
  {
    return mapped_memory_core_file_region_filename();
  }

  else
  {
    return proc_regionfilename(self->_pid, a3, a4, a5);
  }

- (unint64_t)tryPeekAtAddress:(unint64_t)a3 outPtr:(void *)a4
{
  unint64_t result = (unint64_t)self->_memoryRegions;
  if (result)
  {
    unint64_t result = (unint64_t)find_node((const char *)result, (tree *)a3);
    if (result || (unint64_t result = map_new_node()) != 0)
    {
      uint64_t v7 = *(void *)(result + 8);
      uint64_t v8 = *(void *)result;
      *a4 = (void *)(*(void *)(result + 16) + a3 - *(void *)result);
      return v8 - a3 + v7;
    }
  }

  return result;
}

- (id)coreFileProcName
{
  if (a1)
  {
    int proc_name = mapped_memory_core_file_get_proc_name();
    a1 = 0LL;
    if (!proc_name)
    {
      [NSString stringWithUTF8String:0];
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (id)coreFileProcPath
{
  if (a1)
  {
    int proc_path = mapped_memory_core_file_get_proc_path();
    a1 = 0LL;
    if (!proc_path)
    {
      [NSString stringWithUTF8String:0];
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (id)coreFileParentProcName
{
  if (a1)
  {
    parent_int proc_name = mapped_memory_core_file_get_parent_proc_name();
    a1 = 0LL;
    if (!parent_proc_name)
    {
      [NSString stringWithUTF8String:0];
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (id)coreFileParentProcPath
{
  if (a1)
  {
    parent_int proc_path = mapped_memory_core_file_get_parent_proc_path();
    a1 = 0LL;
    if (!parent_proc_path)
    {
      [NSString stringWithUTF8String:0];
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (uint64_t)getCoreFilePid:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_pid();
  }
  return result;
}

- (uint64_t)getCoreFilePPid:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ppid();
  }
  return result;
}

- (uint64_t)getCoreFileProcStarttimeSec:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_proc_starttime_sec();
  }
  return result;
}

- (uint64_t)getCoreFileProcStarttimeUSec:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_proc_starttime_usec();
  }
  return result;
}

- (uint64_t)getCoreFileUserstack:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_userstack();
  }
  return result;
}

- (uint64_t)getCoreFileProcFlags:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_proc_flags();
  }
  return result;
}

- (uint64_t)getCoreFileArgsLen:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_argslen();
  }
  return result;
}

- (uint64_t)getCoreFileProcArgc:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_proc_argc();
  }
  return result;
}

- (uint64_t)getCoreFileDirtyFlags:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_dirty_flags();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerInternal:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_internal();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerInternalCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_internal_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerIokitMapped:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_iokit_mapped();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerAlternateAccounting:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_alternate_accounting();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerAlternateAccountingCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_alternate_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerPurgeableNonvolatile:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_purgable_nonvolatile();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerPurgeableNonvolatileCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_purgable_nonvolatile_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerPhysFootprint:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_phys_footprint();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerPhysFootprintLifetimeMax:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_phys_footprint_lifetime_max();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerPageTable:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_page_table();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerNetworkNonvolatile:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_network_nonvolatile();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerNetworkNonvolatileCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_network_nonvolatile_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerWiredMem:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_wired_mem();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerTaggedFootprint:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_tagged_footprint();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerTaggedFootprintCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_tagged_footprint_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerMediaFootprint:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_media_footprint();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerMediaFootprintCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_media_footprint_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerGraphicsFootprint:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_graphics_footprint();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerGraphicsFootprintCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_graphics_footprint_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerNeuralFootprint:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_neural_footprint();
  }
  return result;
}

- (uint64_t)getCoreFileLedgerNeuralFootprintCompressed:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_ledger_neural_footprint_compressed();
  }
  return result;
}

- (uint64_t)getCoreFileUdataPointersIntoBuffer:(void *)a3 count:
{
  if (result)
  {
    if (*(void *)(result + 40))
    {
      if (*(void *)(result + 16) == 1LL)
      {
        return mapped_memory_core_file_get_udata_ptrs();
      }

      else
      {
        unint64_t result = 0LL;
        *a3 = 0LL;
      }
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

- (uint64_t)getOwnedVMObjectsIntoBuffer:(size_t *)a3 byteCount:
{
  if (result)
  {
    if (*(void *)(result + 40))
    {
      return mapped_memory_core_file_get_owned_vm_objects();
    }

    else
    {
      size_t v4 = *a3;
      if (sysctlbyname("vm.get_owned_vmobjects", a2, &v4, (void *)(result + 24), 4uLL) && *__error() != 2)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:].cold.1();
        }
        return 5LL;
      }

      else
      {
        unint64_t result = 0LL;
        *a3 = v4;
      }
    }
  }

  return result;
}

- (uint64_t)getCoreDyldSharedCacheRange:(uint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 40))
    {
      unint64_t result = mapped_memory_core_file_get_dyld_shared_cache_range();
      if (!(_DWORD)result) {
        *a2 = 0uLL;
      }
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

- (BOOL)representsCore
{
  if (result) {
    return *(void *)(result + 40) != 0LL;
  }
  return result;
}

- (unsigned)taskPort
{
  return self->_taskPort;
}

- (void)_createOriginalSymbolOwnersWithPaths:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = CSSymbolicatorCreateWithMachKernel();
  uint64_t v17 = v6;
  if ((CSIsNull() & 1) != 0) {
    uint64_t SymbolOwnerCountAtTime = 0LL;
  }
  else {
    uint64_t SymbolOwnerCountAtTime = CSSymbolicatorGetSymbolOwnerCountAtTime();
  }
  uint64_t v8 = [v4 count:v17, v5];
  self->_cfOriginalSymbolOwners = CFArrayCreateMutable(0LL, v8 + SymbolOwnerCountAtTime, MEMORY[0x18960E5A0]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) fileSystemRepresentation];
        CSSymbolicatorCreateWithPathAndArchitecture();
        CSSymbolicatorForeachSymbolOwnerAtTime();
        CSRelease();
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolicatorForeachSymbolOwnerAtTime();
    CSRelease();
  }

  CFIndex Count = CFArrayGetCount(self->_cfOriginalSymbolOwners);
  self->_originalSymbolOwners = (_CSTypeRef *)calloc(Count, 0x10uLL);
  if (Count >= 1)
  {
    uint64_t v15 = 0LL;
    for (CFIndex j = 0LL; j != Count; ++j)
      self->_originalSymbolOwners[v15++] = *(_CSTypeRef *)CFArrayGetValueAtIndex(self->_cfOriginalSymbolOwners, j);
  }
}

void __59__VMUTaskMemoryCache__createOriginalSymbolOwnersWithPaths___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v3[0] = a2;
  v3[1] = a3;
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 56LL), v3);
}

void __59__VMUTaskMemoryCache__createOriginalSymbolOwnersWithPaths___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v3[0] = a2;
  v3[1] = a3;
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 56LL), v3);
}

- (BOOL)isExclave
{
  if (result) {
    return (unint64_t)(*(void *)(result + 96) - 1LL) < 2;
  }
  return result;
}

- (uint64_t)exclaveType
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (uint64_t)getExclaveVMFlagsForAddress:(uint64_t)result exclaveVMFlags:
{
  if (result) {
    return mapped_memory_core_file_get_exclave_vm_flags_for_address();
  }
  return result;
}

- (uint64_t)getCoreFileAddressingMask:(uint64_t)result
{
  if (result) {
    return mapped_memory_core_file_get_addressing_mask();
  }
  return result;
}

- (mapped_memory_t)memoryRegions
{
  return self->_memoryRegions;
}

- (id)regionInfoBlock
{
  return self->_regionInfoBlock;
}

- (void).cxx_destruct
{
}

- (void)initWithTask:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  int v0 = 138412290;
  v1 = @"VMUTaskMemoryCache initialization failed, likely because the target process no longer exists.\n";
  _os_log_error_impl(&dword_1860C5000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v0, 0xCu);
}

- (void)getOwnedVMObjectsIntoBuffer:byteCount:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  int v1 = 136315394;
  uint64_t v2 = "vm.get_owned_vmobjects";
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error setting sysctl: %s. %d.\n",  (uint8_t *)&v1,  0x12u);
}

@end