@interface VMUSampler
+ (id)sampleAllThreadsOfPID:(int)a3;
+ (id)sampleAllThreadsOfTask:(unsigned int)a3;
+ (id)sampleAllThreadsOfTask:(unsigned int)a3 symbolicate:(BOOL)a4;
+ (void)initialize;
- (BOOL)start;
- (BOOL)stop;
- (BOOL)waitUntilDone;
- (VMUSampler)initWithPID:(int)a3;
- (VMUSampler)initWithPID:(int)a3 options:(unint64_t)a4;
- (VMUSampler)initWithPID:(int)a3 orTask:(unsigned int)a4 options:(unint64_t)a5;
- (VMUSampler)initWithPID:(int)a3 task:(unsigned int)a4 processName:(id)a5 is64Bit:(BOOL)a6 options:(unint64_t)a7;
- (VMUSampler)initWithTask:(unsigned int)a3;
- (VMUSampler)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (_CSTypeRef)symbolicator;
- (double)samplingInterval;
- (double)timeLimit;
- (id)delegate;
- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3;
- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3 returnedConcurrentFlag:(BOOL *)a4 returnedThreadId:(unint64_t *)a5;
- (id)outputString;
- (id)sampleAllThreadsOnce;
- (id)sampleAllThreadsOnceWithFramePointers:(BOOL)a3;
- (id)sampleThread:(unsigned int)a3;
- (id)samples;
- (id)stopSamplingAndReturnCallNode;
- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4;
- (id)threadNameForThread:(unsigned int)a3;
- (id)threadNameForThread:(unsigned int)a3 returnedThreadId:(unint64_t *)a4 returnedDispatchQueueSerialNum:(unint64_t *)a5;
- (int)pid;
- (unint64_t)recordSampleTo:(id)a3 timestamp:(unint64_t)a4 thread:(unsigned int)a5 recordFramePointers:(BOOL)a6 clearMemoryCache:(BOOL)a7;
- (unsigned)mainThread;
- (unsigned)sampleCount;
- (unsigned)sampleLimit;
- (void)_checkDispatchThreadLimits;
- (void)_fixupStacks:(id)a3;
- (void)_runSamplingThread;
- (void)dealloc;
- (void)flushData;
- (void)initializeSamplingContextWithOptions:(int)a3;
- (void)preloadSymbols;
- (void)sampleForDuration:(unsigned int)a3 interval:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setRecordThreadStates:(BOOL)a3;
- (void)setSampleLimit:(unsigned int)a3;
- (void)setSamplingInterval:(double)a3;
- (void)setSymbolicator:(_CSTypeRef)a3;
- (void)setTimeLimit:(double)a3;
- (void)writeOutput:(id)a3 append:(BOOL)a4;
@end

@implementation VMUSampler

- (VMUSampler)initWithPID:(int)a3 task:(unsigned int)a4 processName:(id)a5 is64Bit:(BOOL)a6 options:(unint64_t)a7
{
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___VMUSampler;
  v12 = -[VMUSampler init](&v36, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_27:
    v14 = v13;
    goto LABEL_28;
  }

  v14 = 0LL;
  if (a3 && a4)
  {
    v12->_pid = a3;
    v12->_task = a4;
    v12->_options = a7 | ((a7 & 0x40) >> 1);
    v15 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", v12->_pid);
    if (-[VMUProcInfo shouldAnalyzeWithCorpse](v15, "shouldAnalyzeWithCorpse"))
    {
      v13->_options |= 0x200uLL;
      if ((a7 & 0x20) != 0)
      {
LABEL_6:
        if ((a7 & 0x10) == 0)
        {
LABEL_16:
          uint64_t v25 = [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:259];
          lastThreadBacktraceMap = v13->_lastThreadBacktraceMap;
          v13->_lastThreadBacktraceMap = (NSMapTable *)v25;

          v13->_numberOfCopiedBacktraces = 0;
          if ((a7 & 0x40) != 0)
          {
            v13->_symbolicator._opaque_1 = 0LL;
            v13->_symbolicator._opaque_2 = 0LL;
          }

          else if ((a7 & 0x20) != 0)
          {
            if (initWithPID_task_processName_is64Bit_options__once_token != -1) {
              dispatch_once(&initWithPID_task_processName_is64Bit_options__once_token, &__block_literal_global_8);
            }
            v13->_symbolicator = (_CSTypeRef)initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask;
            CSRetain();
            CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime();
          }

          else
          {
            if ((a7 & 1) != 0) {
              CSSymbolicatorGetFlagsForNListOnlyData();
            }
            v13->_symbolicator._opaque_1 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
            v13->_symbolicator._opaque_2 = v27;
          }

          uint64_t v28 = [objc_alloc(MEMORY[0x189607828]) initWithCondition:0];
          stateLock = v13->_stateLock;
          v13->_stateLock = (NSConditionLock *)v28;

          v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
          samples = v13->_samples;
          v13->_samples = v30;

          mach_timebase_info(&info);
          LODWORD(v32) = info.numer;
          LODWORD(v33) = info.denom;
          v13->_tbRate = 1000000000.0 / (double)v32 * (double)v33;
          v13->_interval = 0.01;

          goto LABEL_27;
        }

uint64_t __59__VMUSampler_initWithPID_task_processName_is64Bit_options___block_invoke()
{
  uint64_t result = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  *(void *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask = result;
  *((void *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask + 1) = v1;
  return result;
}

- (VMUSampler)initWithPID:(int)a3 orTask:(unsigned int)a4 options:(unint64_t)a5
{
  int x = a3;
  if (a4 - 1 > 0xFFFFFFFD)
  {
    uint64_t v8 = *(void *)&a3;
    if (!a3)
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v9) {
        -[VMUSampler initWithPID:orTask:options:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      goto LABEL_12;
    }

    if (task_read_for_pid())
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[VMUSampler initWithPID:orTask:options:].cold.3();
      }
      goto LABEL_12;
    }

    self->_needTaskPortDealloc = 1;
    uint64_t v7 = a4;
LABEL_14:
    self =  -[VMUSampler initWithPID:task:processName:is64Bit:options:]( self,  "initWithPID:task:processName:is64Bit:options:",  v8,  v7,  0LL,  0LL,  a5);
    v17 = self;
    goto LABEL_15;
  }

  uint64_t v7 = *(void *)&a4;
  if (!pid_for_task(a4, &x))
  {
    uint64_t v8 = x;
    goto LABEL_14;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[VMUSampler initWithPID:orTask:options:].cold.1();
  }
LABEL_12:
  v17 = 0LL;
LABEL_15:

  return v17;
}

- (VMUSampler)initWithPID:(int)a3
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", *(void *)&a3, 0LL, 0LL);
}

- (VMUSampler)initWithTask:(unsigned int)a3
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", 0LL, *(void *)&a3, 0LL);
}

- (VMUSampler)initWithPID:(int)a3 options:(unint64_t)a4
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", *(void *)&a3, 0LL, a4);
}

- (VMUSampler)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", 0LL, *(void *)&a3, a4);
}

- (void)dealloc
{
  previousThreadList = self->_previousThreadList;
  if (previousThreadList)
  {
    if (self->_previousThreadCount)
    {
      unint64_t v4 = 0LL;
      v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
      do
        mach_port_deallocate(*v5, self->_previousThreadList[v4++]);
      while (v4 < self->_previousThreadCount);
      previousThreadList = self->_previousThreadList;
    }

    free(previousThreadList);
  }

  CSRelease();
  self->_symbolicator._opaque_1 = 0LL;
  self->_symbolicator._opaque_2 = 0LL;
  mach_port_name_t task = self->_task;
  if (task + 1 >= 2 && self->_needTaskPortDealloc) {
    mach_port_deallocate(*MEMORY[0x1895FBBE0], task);
  }
  if (self->_samplingContext)
  {
    destroy_sampling_context();
    self->_samplingContext = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUSampler;
  -[VMUSampler dealloc](&v7, sel_dealloc);
}

- (void)initializeSamplingContextWithOptions:(int)a3
{
  if (self->_samplingContext)
  {
    if (self->_samplingContextOptions == a3) {
      return;
    }
    destroy_sampling_context();
    self->_samplingContext = 0LL;
    self->_samplingContextOptions = 0;
  }

  [MEMORY[0x189603F50] date];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t options = self->_options;
  if ((options & 0x200) != 0) {
    unsigned int v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3 | 0x10;
  }
  else {
    unsigned int v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3;
  }
  sampling_context_for_task_pid_symbolicator = (sampling_context_t *)create_sampling_context_for_task_pid_symbolicator();
  self->_samplingContext = sampling_context_for_task_pid_symbolicator;
  self->_samplingContextOptions = v7;
  if (!sampling_context_for_task_pid_symbolicator)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[VMUSampler initializeSamplingContextWithOptions:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  if (g_environment_flags == 1)
  {
    [v5 timeIntervalSinceNow];
    NSLog(@"Time to initialize sampling context:  %0.2f", -v17);
  }
}

- (void)_checkDispatchThreadLimits
{
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  if (proc_pidinfo(self->_pid, 12, 0LL, &v4, 16) >= 16)
  {
    char v3 = BYTE4(v5);
    if ((v5 & 0x100000000LL) != 0) {
      ++self->_dispatchThreadSoftLimitCount;
    }
    if ((v3 & 2) != 0) {
      ++self->_dispatchThreadHardLimitCount;
    }
  }

- (unint64_t)recordSampleTo:(id)a3 timestamp:(unint64_t)a4 thread:(unsigned int)a5 recordFramePointers:(BOOL)a6 clearMemoryCache:(BOOL)a7
{
  kern_return_t v32;
  kern_return_t v33;
  int pid;
  void *v35;
  void *v36;
  int v37;
  integer_t v38;
  uint64_t v40;
  VMUBacktrace *v41;
  double v42;
  int v43;
  void *v44;
  unint64_t v45;
  unsigned int v46;
  ipc_space_t *v47;
  const void *v48;
  uint64_t v49;
  BOOL v50;
  unsigned int maxPreviousThreadCount;
  unsigned int v52;
  unsigned int *previousThreadList;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  char v63;
  void *v64;
  void *v65;
  BOOL v67;
  mach_msg_type_number_t v68;
  integer_t thread_info_out[6];
  int v70;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  unsigned int v73;
  mach_msg_type_number_t thread_info_outCnt[2];
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  kern_return_t v80;
  uint64_t v81;
  BOOL v7 = a7;
  v67 = a6;
  v81 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  v73 = a5;
  act_list = 0LL;
  if (!self->_samplingContext)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
    goto LABEL_26;
  }

  if (a5)
  {
    act_list = &v73;
    mach_msg_type_number_t v11 = 1;
    act_listCnt = 1;
  }

  else
  {
    if (task_threads(self->_task, &act_list, &act_listCnt)) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = act_list == 0LL;
    }
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.2();
      }
      goto LABEL_26;
    }

    mach_msg_type_number_t v11 = act_listCnt;
  }

  BOOL v21 = self->_previousThreadCount != v11;
  if (self->_recordThreadStates)
  {
    v22 = calloc(v11, 4uLL);
    if (act_listCnt)
    {
      for (unint64_t i = 0LL; i < act_listCnt; ++i)
      {
        thread_inspect_t v24 = act_list[i];
        thread_info_outCnt[0] = 10;
        if (!thread_info(v24, 3u, thread_info_out, thread_info_outCnt)) {
          v22[i] = v70;
        }
      }
    }
  }

  else
  {
    v22 = 0LL;
  }

  if (task_suspend2(self->_task, &self->_suspensionToken))
  {
    if (v22) {
      free(v22);
    }
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.4();
    }
LABEL_26:
    unint64_t v25 = 0LL;
    goto LABEL_27;
  }

  mach_msg_type_number_t v27 = act_listCnt;
  if (self->_dispatchThreadSoftLimit - 1 < act_listCnt || self->_dispatchThreadHardLimit - 1 < act_listCnt)
  {
    -[VMUSampler _checkDispatchThreadLimits](self, "_checkDispatchThreadLimits");
    mach_msg_type_number_t v27 = act_listCnt;
  }

  v64 = v10;
  v62 = v7;
  v63 = v21;
  if (act_list && v27)
  {
    self->_mainThread = *act_list;
LABEL_35:
    uint64_t v28 = 0LL;
    v65 = 0LL;
    int v29 = g_environment_flags;
    v30 = (os_log_s *)MEMORY[0x1895F8DA0];
    while (1)
    {
      v31 = (const void *)act_list[v28];
      if (v22 && !v22[v28]) {
        goto LABEL_65;
      }
      v68 = 10;
      unint64_t v32 = thread_info((thread_inspect_t)v31, 3u, thread_info_out, &v68);
      if (v32)
      {
        unint64_t v33 = v32;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          pid = self->_pid;
          thread_info_outCnt[0] = 67109888;
          thread_info_outCnt[1] = pid;
          v75 = 1024;
          v76 = v28;
          v77 = 1024;
          v78 = (int)v31;
          v79 = 1024;
          v80 = v33;
          _os_log_error_impl( &dword_1860C5000,  v30,  OS_LOG_TYPE_ERROR,  "[VMUSampler recordSampleTo:...] thread_info failed for pid %u thread index %u thread %u, err %d",  (uint8_t *)thread_info_outCnt,  0x1Au);
        }

        goto LABEL_64;
      }

      v35 = NSMapGet(self->_lastThreadBacktraceMap, v31);
      objc_super v36 = v35;
      if (!v35) {
        break;
      }
      v37 = thread_info_out[1];
      v38 = *((_DWORD *)v35 + 1);
      if (thread_info_out[1] < v38) {
        v37 = thread_info_out[1] + 1000000;
      }
      if (v37 != v38 || thread_info_out[0] - (thread_info_out[1] < v38) != *(_DWORD *)v35) {
        break;
      }
      v41 = (VMUBacktrace *)*((id *)v35 + 1);
      ++self->_numberOfCopiedBacktraces;
      if (v41) {
        goto LABEL_55;
      }
LABEL_63:

LABEL_64:
      mach_msg_type_number_t v27 = act_listCnt;
LABEL_65:
    }

    if (v29)
    {
      v40 = [MEMORY[0x189603F50] date];

      v65 = (void *)v40;
    }

    v41 = -[VMUBacktrace initWithSamplingContext:thread:recordFramePointers:]( objc_alloc(&OBJC_CLASS___VMUBacktrace),  "initWithSamplingContext:thread:recordFramePointers:",  self->_samplingContext,  v31,  v67);
    if (v29)
    {
      [v65 timeIntervalSinceNow];
      self->_timeSpentSampling = self->_timeSpentSampling - v42;
    }

    if (!v41) {
      goto LABEL_63;
    }
LABEL_55:
    -[VMUBacktrace setTimestamp:](v41, "setTimestamp:", a4);
    v41->_callstack.context.pid = self->_pid;
    if (v22) {
      v43 = v22[v28];
    }
    else {
      v43 = 0;
    }
    v41->_callstack.context.run_state = v43;
    if (!v36)
    {
      v44 = malloc(0x10uLL);
      if (!v44)
      {
LABEL_62:
        [v64 addObject:v41];
        goto LABEL_63;
      }

      objc_super v36 = v44;
      NSMapInsert(self->_lastThreadBacktraceMap, v31, v44);
      v63 = 1;
    }

    *objc_super v36 = *(void *)thread_info_out;
    v36[1] = v41;
    goto LABEL_62;
  }

  self->_mainThread = 0;
  if (v27) {
    goto LABEL_35;
  }
  v65 = 0LL;
LABEL_66:
  if ((v63 & 1) != 0)
  {
    if (self->_previousThreadCount)
    {
      v45 = 0LL;
      v46 = 0;
      v47 = (ipc_space_t *)MEMORY[0x1895FBBE0];
      do
      {
        v48 = (const void *)self->_previousThreadList[v45];
        if (act_listCnt <= v46)
        {
LABEL_73:
          mach_port_deallocate(*v47, self->_previousThreadList[v45]);
          NSMapRemove(self->_lastThreadBacktraceMap, v48);
        }

        else
        {
          v49 = 0LL;
          while (act_list[v46 + v49] != (_DWORD)v48)
          {
            if (act_listCnt - v46 == (_DWORD)++v49) {
              goto LABEL_73;
            }
          }

          if (!(_DWORD)v49) {
            ++v46;
          }
          if (!a5) {
            mach_port_deallocate(*v47, self->_previousThreadList[v45]);
          }
        }

        ++v45;
      }

      while (v45 < self->_previousThreadCount);
      mach_msg_type_number_t v27 = act_listCnt;
    }

    maxPreviousThreadCount = self->_maxPreviousThreadCount;
    if (maxPreviousThreadCount >= v27)
    {
      previousThreadList = self->_previousThreadList;
    }

    else
    {
      v52 = 2 * maxPreviousThreadCount;
      if (v52 > v27) {
        mach_msg_type_number_t v27 = v52;
      }
      self->_maxPreviousThreadCount = v27;
      previousThreadList = (unsigned int *)realloc(self->_previousThreadList, 4LL * v27);
      self->_previousThreadList = previousThreadList;
      mach_msg_type_number_t v27 = act_listCnt;
    }

    id v10 = v64;
    v50 = v62;
    memcpy(previousThreadList, act_list, 4LL * v27);
    mach_msg_type_number_t v27 = act_listCnt;
    self->_previousThreadCount = act_listCnt;
    if (!v27) {
      goto LABEL_89;
    }
  }

  else
  {
    id v10 = v64;
    v50 = v7;
    if (!v27) {
      goto LABEL_89;
    }
  }

  mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)act_list, 4LL * v27);
  act_listCnt = 0;
LABEL_89:
  if (v22) {
    free(v22);
  }
  if (v50 && self->_samplingContext) {
    sampling_context_clear_cache();
  }
  task_resume2(self->_suspensionToken);
  self->_stacksFixed = 0;
  if (![v10 count])
  {
    v54 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v54) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.3( v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61);
    }
  }

  unint64_t v25 = [v10 count];

LABEL_27:
  return v25;
}

+ (void)initialize
{
  g_environment_flags = 0;
  g_environment_flags = getenv("SYMBOLICATION_SHOW_BACKTRACE_TIMINGS") != 0LL;
}

- (void)_fixupStacks:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_stacksFixed && self->_samplingContext)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [ *(id *)(*((void *)&v10 + 1) + 8 * v9++) fixupStackWithSamplingContext:self->_samplingContext symbolicator:self->_symbolicator._opaque_1 symbolicator:self->_symbolicator._opaque_2];
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }

    self->_stacksFixed = 1;
  }
}

- (void)_runSamplingThread
{
}

+ (id)sampleAllThreadsOfPID:(int)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithPID:*(void *)&a3];
  [v3 sampleAllThreadsOnce];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithTask:*(void *)&a3];
  [v3 sampleAllThreadsOnce];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3 symbolicate:(BOOL)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithTask:*(void *)&a3 options:!a4];
  [v4 sampleAllThreadsOnce];
  uint8_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sampleAllThreadsOnceWithFramePointers:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603FA8] array];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VMUSampler initializeSamplingContextWithOptions:](self, "initializeSamplingContextWithOptions:", 0LL);
  if (self->_samplingContext)
  {
    if (-[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:]( self,  "recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:",  v5,  mach_absolute_time(),  0LL,  v3,  0LL))
    {
      -[VMUSampler _fixupStacks:](self, "_fixupStacks:", v5);
    }

    else
    {

      id v5 = 0LL;
    }

    id v5 = v5;
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)sampleAllThreadsOnce
{
  return -[VMUSampler sampleAllThreadsOnceWithFramePointers:](self, "sampleAllThreadsOnceWithFramePointers:", 0LL);
}

- (id)sampleThread:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((self->_options & 0x40) != 0) {
    uint64_t v5 = 25LL;
  }
  else {
    uint64_t v5 = 9LL;
  }
  -[VMUSampler initializeSamplingContextWithOptions:](self, "initializeSamplingContextWithOptions:", v5);
  if (self->_samplingContext)
  {
    thread_suspend(v3);
    uint64_t v6 = -[VMUBacktrace initWithSamplingContext:thread:recordFramePointers:]( objc_alloc(&OBJC_CLASS___VMUBacktrace),  "initWithSamplingContext:thread:recordFramePointers:",  self->_samplingContext,  v3,  0LL);
    thread_resume(v3);
    samplingContext = self->_samplingContext;
    uint64_t v8 = -[VMUSampler symbolicator](self, "symbolicator");
    -[VMUBacktrace fixupStackWithSamplingContext:symbolicator:]( v6,  "fixupStackWithSamplingContext:symbolicator:",  samplingContext,  v8,  v9);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)start
{
  if (self->_sampling)
  {
    LOBYTE(v2) = 0;
  }

  else
  {
    BOOL v2 = -[NSConditionLock tryLockWhenCondition:](self->_stateLock, "tryLockWhenCondition:", 0LL);
    if (v2)
    {
      self->_sampling = 1;
      -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1LL);
      -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
      self->_numberOfSamples = 0;
      if (self->_interval > 0.0) {
        [MEMORY[0x189607A40] detachNewThreadSelector:sel__runSamplingThread toTarget:self withObject:0];
      }
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
        [self->_delegate samplingDidStart:self];
      }
      LOBYTE(v2) = 1;
    }
  }

  return v2;
}

- (BOOL)stop
{
  if (self->_sampling)
  {
    self->_sampling = 0;
    -[NSConditionLock lockWhenCondition:](self->_stateLock, "lockWhenCondition:", 0LL);
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        [self->_delegate samplingDidStop:self];
      }
    }
  }

  return 1;
}

- (BOOL)waitUntilDone
{
  if (self->_sampling)
  {
    -[NSConditionLock lockWhenCondition:](self->_stateLock, "lockWhenCondition:", 0LL);
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        [self->_delegate samplingDidStop:self];
      }
    }
  }

  return 1;
}

- (void)setSamplingInterval:(double)a3
{
  if (a3 > 0.0) {
    self->_interval = a3;
  }
}

- (double)samplingInterval
{
  return self->_interval;
}

- (void)setTimeLimit:(double)a3
{
  if (a3 >= 0.0) {
    self->_timeLimit = a3;
  }
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setSampleLimit:(unsigned int)a3
{
  self->_sampleLimit = a3;
}

- (unsigned)sampleLimit
{
  return self->_sampleLimit;
}

- (void)setRecordThreadStates:(BOOL)a3
{
  self->_recordThreadStates = a3;
}

- (void)setSymbolicator:(_CSTypeRef)a3
{
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
  self->_symbolicator._opaque_1 = CSRetain();
  self->_symbolicator._opaque_2 = v4;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (id)samples
{
  return self->_samples;
}

- (unsigned)sampleCount
{
  return self->_numberOfSamples;
}

- (void)flushData
{
  if (!self->_sampling)
  {
    -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
    self->_numberOfSamples = 0;
    NSResetMapTable(self->_lastThreadBacktraceMap);
    self->_previousThreadCount = 0;
  }

- (unsigned)mainThread
{
  return self->_mainThread;
}

- (id)threadNameForThread:(unsigned int)a3 returnedThreadId:(unint64_t *)a4 returnedDispatchQueueSerialNum:(unint64_t *)a5
{
  samplingContext = self->_samplingContext;
  if (samplingContext)
  {
    samplingContext = (void *)thread_name_for_thread_port();
    if (samplingContext)
    {
      [NSString stringWithUTF8String:samplingContext];
      samplingContext = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return samplingContext;
}

- (id)threadNameForThread:(unsigned int)a3
{
  return -[VMUSampler threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:]( self,  "threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:",  *(void *)&a3,  0LL,  0LL);
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3 returnedConcurrentFlag:(BOOL *)a4 returnedThreadId:(unint64_t *)a5
{
  if (self->_samplingContext)
  {
    if (a3)
    {
      uint64_t v6 = dispatch_queue_name_for_serial_number();
      if (!a4) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
      if (!a4)
      {
LABEL_5:
        if (v6)
        {
          [MEMORY[0x189NSStringTF8String:];
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v7 = 0LL;
        }

        return v7;
      }
    }

    *a4 = 0;
    goto LABEL_5;
  }

  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = 0LL;
  if (a5) {
    *a5 = 0LL;
  }
  return v7;
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3
{
  return -[VMUSampler dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:]( self,  "dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:",  a3,  0LL,  0LL);
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v6 = a3;
  if (!self->_threadPortToNameMap)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
    threadPortToNameMap = self->_threadPortToNameMap;
    self->_threadPortToNameMap = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
    dispatchQueueSerialNumToNameMap = self->_dispatchQueueSerialNumToNameMap;
    self->_dispatchQueueSerialNumToNameMap = v9;
  }

  uint64_t v11 = [v6 thread];
  unsigned int v12 = -[VMUSampler mainThread](self, "mainThread");
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  -[VMUSampler threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:]( self,  "threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:",  v11,  &v38,  &v37);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 length];
  uint64_t v15 = [v6 dispatchQueueSerialNumber];
  unint64_t v16 = v15;
  if ((_DWORD)v11 == v12)
  {
    if (!v15 || v37 != v15) {
      goto LABEL_13;
    }
  }

  else if (!v15)
  {
LABEL_13:
    v22 = self->_threadPortToNameMap;
    [MEMORY[0x189607968] numberWithUnsignedInt:v11];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      if (v38) {
        [MEMORY[0x189607940] stringWithFormat:@"Thread_%qu" v38];
      }
      else {
        [MEMORY[0x189607940] stringWithFormat:@"Thread_%x" v11];
      }
      thread_inspect_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v25 = v24;
      if (v14)
      {
        [v24 appendFormat:@": %@", v13];
      }

      else if ((_DWORD)v11 == v12)
      {
        [v24 appendFormat:@": %@", kVMUMainThreadName[0]];
        if (!v37 && (self->_options & 4) == 0) {
          [v25 appendString:@"   DispatchQueue_<multiple>"];
        }
      }

      v26 = self->_threadPortToNameMap;
      mach_msg_type_number_t v27 = (void *)MEMORY[0x189607968];
      id v19 = v25;
      [v27 numberWithUnsignedInt:v11];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v19, v28);
    }

    unint64_t v16 = v11;
    goto LABEL_25;
  }

  if ((self->_options & 4) != 0) {
    goto LABEL_13;
  }
  uint64_t v17 = self->_dispatchQueueSerialNumToNameMap;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v15];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[VMUSampler dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:]( self,  "dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:",  v16,  &v36,  &v35);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 || v36)
    {
      [MEMORY[0x189607940] stringWithFormat:@"Thread_%qu" v38];
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189607940] stringWithString:@"Thread_<multiple>"];
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v19 = v21;
    if (v36) {
      v30 = "concurrent";
    }
    else {
      v30 = "serial";
    }
    [v21 appendFormat:@"   DispatchQueue_%qu: %@  (%s)", v16, v20, v30];
    if (v35 || !v36)
    {
      v31 = self->_dispatchQueueSerialNumToNameMap;
      unint64_t v32 = (void *)MEMORY[0x189607968];
      id v33 = v19;
      [v32 numberWithUnsignedLongLong:v16];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v33, v34);
    }

    if (a4) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)preloadSymbols
{
}

- (void)sampleForDuration:(unsigned int)a3 interval:(unsigned int)a4
{
}

- (id)stopSamplingAndReturnCallNode
{
  uint64_t v3 = (void *)MEMORY[0x186E32E40](self, a2);
  -[VMUSampler stop](self, "stop");
  -[VMUSampler _fixupStacks:](self, "_fixupStacks:", self->_samples);
  +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:]( &OBJC_CLASS___VMUCallTreeNode,  "rootForSamples:symbolicator:sampler:options:",  self->_samples,  self->_symbolicator._opaque_1,  self->_symbolicator._opaque_2,  self,  ((self->_options >> 2) & 0x21 | self->_options & 2) ^ 1);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)outputString
{
  uint64_t v3 = (void *)MEMORY[0x186E32E40](self, a2);
  if (!self->_processName)
  {
    self->_processName = (NSString *)@"unknown-process";
  }

  double v4 = self->_interval * 1000.0;
  else {
    uint64_t v5 = @"Analysis of sampling %@ (pid %d) every %d milliseconds\n";
  }
  [MEMORY[0x1896NSStringrmat:v5,  self->_processName,  self->_pid,  (int)v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dispatchThreadSoftLimitCount || self->_dispatchThreadHardLimitCount)
  {
    [MEMORY[0x189607940] string];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (self->_dispatchThreadSoftLimitCount) {
      [v7 appendFormat:@"Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n", @"Soft", self->_dispatchThreadSoftLimit, self->_dispatchThreadSoftLimitCount, self->_numberOfSamples];
    }
    if (self->_dispatchThreadHardLimitCount) {
      [v8 appendFormat:@"Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n", @"Hard", self->_dispatchThreadHardLimit, self->_dispatchThreadHardLimitCount, self->_numberOfSamples];
    }
    [v8 appendString:@"\n"];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  -[VMUProcessDescription description](self->_processDescription, "description");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessDescription binaryImagesDescription](self->_processDescription, "binaryImagesDescription");
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUSampler stopSamplingAndReturnCallNode](self, "stopSamplingAndReturnCallNode");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 fullOutputWithThreshold:5];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:v6];
  if ([v9 length]) {
    [v13 appendString:v9];
  }
  if ([v8 length]) {
    [v13 appendString:v8];
  }
  [v13 appendString:v12];
  if ([v10 length]) {
    [v13 appendFormat:@"\n%@", v10];
  }

  objc_autoreleasePoolPop(v3);
  return v13;
}

- (void)writeOutput:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x186E32E40]();
  id v8 = -[VMUSampler outputString](self, "outputString");
  uint64_t v9 = (const char *)[v8 UTF8String];

  unint64_t options = self->_options;
  if (v6)
  {
    uint64_t v11 = (const char *)[v6 UTF8String];
    unsigned int v12 = (char *)v11;
    if (v4) {
      __int128 v13 = "ae";
    }
    else {
      __int128 v13 = "we";
    }
    uint64_t v14 = fopen(v11, v13);
    BOOL v15 = 1;
    if (v14) {
      goto LABEL_6;
    }
  }

  else
  {
    processName = self->_processName;
    unint64_t v26 = self->_options;
    mach_msg_type_number_t v27 = v7;
    if (!processName)
    {
      self->_processName = (NSString *)@"unknown-process";

      processName = self->_processName;
    }

    uint64_t v19 = -[NSString stringByReplacingOccurrencesOfString:withString:]( processName,  "stringByReplacingOccurrencesOfString:withString:",  @" ",  @"_");
    id v20 = objc_alloc_init(MEMORY[0x189607848]);
    [v20 setDateFormat:@"yyyy-MM-dd_HHmmss"];
    -[VMUProcessDescription date](self->_processDescription, "date");
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      [MEMORY[0x189603F50] date];
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v20 stringFromDate:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v25 = (void *)v19;
    id v23 = [NSString stringWithFormat:@"/tmp/%@_%@_XXXX.sample.txt", v19, v22];
    snprintf(__str, 0x400uLL, "%s", (const char *)[v23 UTF8String]);
    int v24 = mkstemps(__str, 11);
    BOOL v15 = v24 >= 0;
    if (v24 < 0)
    {
      fwrite("Unable to create secure temp file\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      unsigned int v12 = 0LL;
      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v14 = fdopen(v24, "we");
      unsigned int v12 = __str;
    }

    unint64_t options = v26;
    uint64_t v7 = v27;
    if (v14)
    {
LABEL_6:
      size_t v16 = strlen(v9);
      if (!fwrite(v9, v16, 1uLL, v14))
      {
        -[VMUSampler writeOutput:append:].cold.1(v12);
        BOOL v15 = 0;
      }

      fclose(v14);
      if (geteuid())
      {
        if (v15) {
          goto LABEL_10;
        }
      }

      else
      {
        chmod(v12, 0x1A4u);
        if (v15)
        {
LABEL_10:
          fprintf((FILE *)*MEMORY[0x1895F89D0], "Sample analysis of process %d written to file %s\n", self->_pid, v12);
          LOBYTE(v17) = 0;
          if (v6) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
      }

      uint64_t v17 = (options >> 3) & 1;
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }

  perror("fopen");
  fprintf((FILE *)*MEMORY[0x1895F89D0], "Unable to open/create sample file %s\n", v12);
  uint64_t v17 = (options >> 3) & 1;
  if (v6) {
    goto LABEL_22;
  }
LABEL_20:
  if ((v17 & 1) == 0)
  {
    putchar(10);
    printf("%s", v9);
    putchar(10);
  }

- (void).cxx_destruct
{
}

- (void)initWithPID:orTask:options:.cold.1()
{
}

- (void)initWithPID:(uint64_t)a3 orTask:(uint64_t)a4 options:(uint64_t)a5 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithPID:orTask:options:.cold.3()
{
}

- (void)initializeSamplingContextWithOptions:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.2()
{
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.4()
{
}

- (void)writeOutput:(const char *)a1 append:.cold.1(const char *a1)
{
}

@end