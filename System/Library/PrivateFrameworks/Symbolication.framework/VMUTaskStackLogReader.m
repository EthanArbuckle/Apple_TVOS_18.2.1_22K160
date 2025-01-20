@interface VMUTaskStackLogReader
- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforMallocAddress:(unint64_t)a3 size:(unint64_t)a4;
- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforVMregionAddress:(unint64_t)a3;
- (BOOL)inspectingLiveProcess;
- (BOOL)is64bit;
- (VMUTaskMemoryScanner)scanner;
- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3;
- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4;
- (VMUVMRegionTracker)regionTracker;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (int)enumerateMSLRecordsAndPayloads:(id)a3;
- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6;
- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5;
- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4;
- (unint64_t)nodesInUniquingTable;
- (void)dealloc;
- (void)setScanner:(id)a3;
@end

@implementation VMUTaskStackLogReader

- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3
{
  return -[VMUTaskStackLogReader initWithTask:symbolicator:]( self,  "initWithTask:symbolicator:",  *(void *)&a3,  0LL,  0LL);
}

- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4
{
  v4 = self;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!MEMORY[0x189610BF0]) {
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VMUTaskStackLogReader;
  v6 = -[VMUTaskStackLogReader init](&v14, sel_init);
  v4 = v6;
  if (!v6)
  {
LABEL_23:
    v4 = v4;
    v12 = v4;
    goto LABEL_24;
  }

  v6->super._task = v5;
  v6->super._usesLiteMode = 0;
  v6->super._symbolicator._opaque_1 = CSRetain();
  v4->super._symbolicator._opaque_2 = v7;
  if (CSIsNull())
  {
    CSSymbolicatorGetFlagsForNListOnlyData();
    CSSymbolicatorCreateWithTaskFlagsAndNotification();
  }

  else
  {
    CSRetain();
  }

  if (CSIsNull())
  {
    NSLog(@"*** getStackLoggingSharedMemoryAddressFromTask: can't get target task symbolicator\n");
    goto LABEL_20;
  }

  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if (CSIsNull())
  {
    v8 = -[VMUProcInfo initWithTask:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithTask:", v5);
    id v9 = -[VMUProcInfo valueForEnvVar:](v8, "valueForEnvVar:", @"DYLD_IMAGE_SUFFIX");
    v10 = (const char *)[v9 UTF8String];

    if (v10)
    {
      snprintf(__str, 0x7FuLL, "libsystem_malloc%s.dylib", v10);
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }

    if (CSIsNull())
    {
      NSLog(@"*** getStackLoggingSharedMemoryAddressFromTask: couldn't find libsystem_malloc dylib in target task\n");
      CSRelease();

      goto LABEL_20;
    }
  }

  CSSymbolOwnerGetSymbolWithMangledName();
  mach_vm_address_t Range = CSSymbolGetRange();
  if (Range)
  {
    task_start_peeking();
    task_stop_peeking();
  }

  else
  {
    NSLog(@"*** getStackLoggingSharedMemoryAddressFromTask: couldn't find ___mach_stack_logging_shared_memory_address in target task\n");
  }

  CSRelease();
LABEL_20:
  *(_DWORD *)__str = 0;
  if (!msl_start_reading())
  {
    v4->super._usesLiteMode = *(_DWORD *)__str != 0;
    v4->_msl_payload_version = msl_payload_version_from_task();
    v4->super._coldestFrameIsNotThreadId = msl_coldest_frame_is_threadid() == 0;
    goto LABEL_23;
  }

- (void)dealloc
{
  if (MEMORY[0x189610BF8]) {
    msl_stop_reading();
  }
  CSRelease();
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUTaskStackLogReader;
  -[VMUTaskStackLogReader dealloc](&v3, sel_dealloc);
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)inspectingLiveProcess
{
  return 1;
}

- (VMUVMRegionTracker)regionTracker
{
  regionTracker = self->super._regionTracker;
  if (!regionTracker)
  {
    v4 = -[VMUVMRegionTracker initWithStackLogReader:]( objc_alloc(&OBJC_CLASS___VMUVMRegionTracker),  "initWithStackLogReader:",  self);
    uint64_t v5 = self->super._regionTracker;
    self->super._regionTracker = v4;

    regionTracker = self->super._regionTracker;
  }

  return regionTracker;
}

- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforMallocAddress:(unint64_t)a3 size:(unint64_t)a4
{
  if (a3 && a4)
  {
    mach_vm_address_t v6 = 0LL;
    uint64_t v4 = task_peek(self->super._task, a3, a4, &v6);
    if ((_DWORD)v4)
    {
      NSLog( @"*** -[VMUTaskStackLogReader liteMSLPayloadforMallocAddress:size:] error %d from task_peek\n",  v4);
      return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
    }

    else
    {
      return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_from_lite_zone_ptr();
    }
  }

  else
  {
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
  }

- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforVMregionAddress:(unint64_t)a3
{
  if (a3) {
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_for_vm_region_in_task();
  }
  else {
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
  }
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained nodeDetails:v7];
  }

  else
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
  }

  unint64_t v11 = v14;
  if (v14 >> 60 != 1)
  {
    if (!VMUGraphNodeType_IsVMRegion(v14 >> 60)) {
      return 0LL;
    }
    unint64_t v11 = v14;
  }

  if (!self->super._usesLiteMode) {
    return -[VMUTaskStackLogReader getFramesForAddress:size:inLiteZone:stackFramesBuffer:]( self,  "getFramesForAddress:size:inLiteZone:stackFramesBuffer:",  v13,  v11 & 0xFFFFFFFFFFFFFFFLL,  v6,  a5);
  }
  if (!VMUGraphNodeType_IsVMRegion(v11 >> 60))
  {
    unint64_t v11 = v14;
    return -[VMUTaskStackLogReader getFramesForAddress:size:inLiteZone:stackFramesBuffer:]( self,  "getFramesForAddress:size:inLiteZone:stackFramesBuffer:",  v13,  v11 & 0xFFFFFFFFFFFFFFFLL,  v6,  a5);
  }

  -[VMUTaskStackLogReader liteMSLPayloadforVMregionAddress:](self, "liteMSLPayloadforVMregionAddress:", v13);
  if (msl_payload_get_uniquing_table_index() == -1) {
    return 0LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  if (!a5)
  {
    msl_get_frames_for_address();
    return 0LL;
  }

  -[VMUTaskStackLogReader liteMSLPayloadforMallocAddress:size:]( self,  "liteMSLPayloadforMallocAddress:size:",  a3,  a4,  a5,  a6);
  if (msl_payload_get_uniquing_table_index() != -1)
  {
    msl_uniquing_table_get_frames_from_task();
    return 0LL;
  }

  return 0LL;
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  return 0LL;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->super._usesLiteMode)
  {
    task_start_peeking();
    uint64_t v6 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke;
    v22[3] = &unk_189DFE428;
    v22[4] = self;
    id v7 = v5;
    id v23 = v7;
    v8 = (void *)MEMORY[0x186E33044](v22);
    uint64_t task = self->super._task;
    v20[0] = v6;
    v20[1] = 3221225472LL;
    v20[2] = __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_2;
    v20[3] = &unk_189DFE450;
    v20[4] = self;
    id v10 = v8;
    id v21 = v10;
    task_foreach_malloc_zone(task, v20);
    mach_vm_address_t address = 0LL;
    natural_t nesting_depth = 0;
    for (mach_msg_type_number_t infoCnt = 12;
          !mach_vm_region_recurse(self->super._task, &address, &size, &nesting_depth, info, &infoCnt);
          mach_msg_type_number_t infoCnt = 12)
    {
      if (!info[8])
      {
        v11.var0 = (unint64_t)-[VMUTaskStackLogReader liteMSLPayloadforVMregionAddress:]( self,  "liteMSLPayloadforVMregionAddress:",  address);
        if (!msl_payload_is_invalid()) {
          (*((void (**)(id, void, mach_vm_address_t, mach_vm_size_t, $61A80719B04F7407D3E47539F1B23CAA))v7
        }
           + 2))( v7,  (info[5] << 24) | 0x10u,  address,  size,  v11);
      }

      address += size;
      natural_t nesting_depth = 0;
    }

    task_stop_peeking();

    int v12 = 0;
  }

  else
  {
    id v14 = v4;
    int v12 = msl_disk_stack_logs_enumerate_from_task_with_block();
  }

  return v12;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    uint64_t v5 = a4;
    uint64_t v6 = (void *)(a3 + 8);
    do
    {
      [*(id *)(v4 + 32) liteMSLPayloadforMallocAddress:*(v6 - 1) size:*v6];
      result = (*(uint64_t (**)(void))(*(void *)(v4 + 40) + 16LL))();
      v6 += 2;
      --v5;
    }

    while (v5);
  }

  return result;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t (**a3)(void, void, uint64_t, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), uint64_t (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)),  void *a4)
{
  id v7 = a4;
  if ([v7 hasPrefix:@"MallocStackLoggingLiteZone"]
    && ([v7 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"] & 1) == 0)
  {
    uint64_t v8 = (*a3)( *(unsigned int *)(*(void *)(a1 + 32) + 16LL),  *(void *)(a1 + 40),  1LL,  a2,  task_peek_natural_size,  zoneEnumeratorBlockAdapter);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  return 0LL;
}

- (unint64_t)nodesInUniquingTable
{
  unint64_t v2 = msl_uniquing_table_copy_from_task();
  if (v2)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x2020000000LL;
    uint64_t v7 = 0LL;
    msl_uniquing_table_enumerate();
    MEMORY[0x186E32DF8](v2);
    unint64_t v2 = v5[3];
    _Block_object_dispose(&v4, 8);
  }

  return v2;
}

uint64_t __45__VMUTaskStackLogReader_nodesInUniquingTable__block_invoke(uint64_t result)
{
  return result;
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_scanner);
}

- (void)setScanner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end