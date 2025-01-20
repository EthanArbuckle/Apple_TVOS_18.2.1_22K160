@interface VMUTaskThreadStates
- (VMUTaskThreadStates)initWithPid:(int)a3 task:(unsigned int)a4;
- (VMUTaskThreadStates)initWithVMUTask:(id)a3;
- (unint64_t)stackPointerForThreadNum:(unsigned int)a3;
- (unsigned)threadCount;
- (unsigned)threadStateSize;
- (void)dealloc;
- (void)threadStateForThreadNum:(unsigned int)a3;
@end

@implementation VMUTaskThreadStates

- (VMUTaskThreadStates)initWithPid:(int)a3 task:(unsigned int)a4
{
  v5 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", *(void *)&a4);
  v6 = -[VMUTaskThreadStates initWithVMUTask:](self, "initWithVMUTask:", v5);

  return v6;
}

- (VMUTaskThreadStates)initWithVMUTask:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___VMUTaskThreadStates;
  v5 = -[VMUTaskThreadStates init](&v39, sel_init);
  if (!v5) {
    goto LABEL_33;
  }
  mach_vm_address_t v38 = 0LL;
  unsigned int v37 = 0;
  [v4 memoryCache];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 taskThreadsWithList:&v38 listCnt:&v37];

  if ((_DWORD)v7)
  {
    uint64_t v8 = [v4 pid];
    v9 = mach_error_string(v7);
    NSLog(@"Unable to gather threads of remote process %d: %s (%d)\n", v8, v9, v7);
    goto LABEL_4;
  }

  size_t v11 = v37;
  v5->_unint64_t threadCount = v37;
  v5->_stackPointers = (unint64_t *)calloc(v11, 8uLL);
  if (!v5->_threadCount)
  {
    mach_vm_deallocate(*MEMORY[0x1895FBBE0], v38, 0LL);
    goto LABEL_33;
  }

  unint64_t v12 = 0LL;
  while (1)
  {
    v5->_size_t threadStateSize = 272;
    int v30 = 68;
    [v4 memoryCache];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 threadGetState:*(unsigned int *)(v38 + 4 * v12) withFlavor:6 oldState:__src oldStateCnt:&v30];

    id v15 = v4;
    unsigned int v16 = v36;
    if ((v36 & 1) == 0)
    {
      uint64_t v35 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v35);
      unsigned int v16 = v36;
    }

    if ((v16 & 3) != 0)
    {
      if ((v16 & 1) == 0) {
        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v33 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v33);
      unsigned int v16 = v36;
      if ((v36 & 1) == 0)
      {
LABEL_23:
        uint64_t v34 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v34);
        unsigned int v16 = v36;
        if ((v36 & 1) != 0) {
          goto LABEL_14;
        }
LABEL_13:
        uint64_t v32 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v32);
        unsigned int v16 = v36;
        goto LABEL_14;
      }
    }

    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_14:
    unsigned int v36 = v16 & 0xFFFFFFF2 | 1;
LABEL_15:

    if ((_DWORD)v14) {
      break;
    }
    uint64_t v17 = v34;
    threadStates = (char *)v5->_threadStates;
    if (!threadStates)
    {
      threadStates = (char *)calloc(v5->_threadCount, v5->_threadStateSize);
      v5->_threadStates = threadStates;
    }

    v5->_stackPointers[v12] = v17;
    size_t threadStateSize = v5->_threadStateSize;
    if ((_DWORD)threadStateSize) {
      memcpy(&threadStates[(threadStateSize * v12)], __src, threadStateSize);
    }
    ++v12;
    unint64_t threadCount = v5->_threadCount;
    if (v12 >= threadCount) {
      goto LABEL_27;
    }
  }

  uint64_t v21 = [v15 pid];
  v22 = mach_error_string(v14);
  NSLog(@"Unable to get thread state for thread %u of remote process %d: %s (%d)\n", v12, v21, v22, v14);
  LODWORD(threadCount) = v5->_threadCount;
LABEL_27:
  if ((_DWORD)threadCount)
  {
    unint64_t v23 = 0LL;
    v24 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    do
    {
      mach_port_deallocate(*v24, *(_DWORD *)(v38 + 4 * v23++));
      unint64_t v25 = v5->_threadCount;
    }

    while (v23 < v25);
    mach_vm_size_t v26 = 4 * v25;
    vm_map_t v27 = *v24;
    mach_vm_address_t v28 = v38;
  }

  else
  {
    vm_map_t v27 = *MEMORY[0x1895FBBE0];
    mach_vm_address_t v28 = v38;
    mach_vm_size_t v26 = 0LL;
  }

  mach_vm_deallocate(v27, v28, v26);
  if (!(_DWORD)v14)
  {
LABEL_33:
    v10 = v5;
    goto LABEL_34;
  }

- (void)dealloc
{
  stackPointers = self->_stackPointers;
  threadStates = self->_threadStates;
  if (threadStates) {
    free(threadStates);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VMUTaskThreadStates;
  -[VMUTaskThreadStates dealloc](&v5, sel_dealloc);
}

- (void)threadStateForThreadNum:(unsigned int)a3
{
  threadStates = (char *)self->_threadStates;
  if (threadStates && self->_threadCount > a3) {
    return &threadStates[self->_threadStateSize * a3];
  }
  else {
    return 0LL;
  }
}

- (unint64_t)stackPointerForThreadNum:(unsigned int)a3
{
  stackPointers = self->_stackPointers;
  else {
    return 0LL;
  }
}

- (unsigned)threadCount
{
  return self->_threadCount;
}

- (unsigned)threadStateSize
{
  return self->_threadStateSize;
}

@end