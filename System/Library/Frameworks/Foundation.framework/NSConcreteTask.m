@interface NSConcreteTask
- (BOOL)isRunning;
- (BOOL)isSpawnedProcessDisclaimed;
- (BOOL)launchAndReturnError:(id *)a3;
- (BOOL)launchWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)resume;
- (BOOL)suspend;
- (NSConcreteTask)init;
- (id)arguments;
- (id)currentDirectoryPath;
- (id)environment;
- (id)launchPath;
- (id)launchRequirementData;
- (id)preferredArchitectures;
- (id)standardError;
- (id)standardInput;
- (id)standardOutput;
- (id)taskDictionary;
- (id)terminationHandler;
- (int)processIdentifier;
- (int)terminationStatus;
- (int64_t)_platformExitInformation;
- (int64_t)qualityOfService;
- (int64_t)suspendCount;
- (int64_t)terminationReason;
- (void)_setTerminationHandler:(id)a3;
- (void)_withTaskDictionary:(id)a3;
- (void)dealloc;
- (void)launch;
- (void)setArguments:(id)a3;
- (void)setCurrentDirectoryPath:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLaunchPath:(id)a3;
- (void)setLaunchRequirementData:(id)a3;
- (void)setPreferredArchitectures:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setSpawnedProcessDisclaimed:(BOOL)a3;
- (void)setStandardError:(id)a3;
- (void)setStandardInput:(id)a3;
- (void)setStandardOutput:(id)a3;
- (void)setStartsNewProcessGroup:(BOOL)a3;
- (void)setTaskDictionary:(id)a3;
- (void)waitUntilExit;
@end

@implementation NSConcreteTask

- (int64_t)qualityOfService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char qos = self->_qos;
  if (!qos) {
    char qos = -1;
  }
  int64_t v5 = qos;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setQualityOfService:(int64_t)a3
{
  unint64_t v3 = atomic_load(&self->__exitRunningInfo);
  if ((v3 & 0x100000000LL) == 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_char qos = a3;
    os_unfair_lock_unlock(p_lock);
  }

- (void)setSpawnedProcessDisclaimed:(BOOL)a3
{
}

- (BOOL)isSpawnedProcessDisclaimed
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isSpawnedProcessDisclaimed);
  return v2 & 1;
}

- (id)terminationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_terminationHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setTerminationHandler:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id terminationHandler = self->_terminationHandler;
  if (terminationHandler != a3)
  {

    self->_id terminationHandler = (id)[a3 copy];
  }

  p_exitRunningInfo = &self->__exitRunningInfo;
  unint64_t v8 = atomic_load(&self->__exitRunningInfo);
  if ((v8 & 0x300000000LL) == 0x100000000LL)
  {
    id v9 = self->_terminationHandler;
    if (v9)
    {
      do
        unint64_t v10 = __ldaxr(p_exitRunningInfo);
      while (__stlxr(v10 | 0x800000000LL, p_exitRunningInfo));
      qos_class_t v11 = qos_class_main();
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(v11, 2uLL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __41__NSConcreteTask__setTerminationHandler___block_invoke;
      block[3] = &unk_189C9E898;
      block[4] = self;
      block[5] = v9;
      dispatch_async(global_queue, block);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

uint64_t __41__NSConcreteTask__setTerminationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (int)terminationStatus
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000LL) == 0)
  {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task not launched",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_13:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
    return -[NSConcreteTask _platformExitInformation](v8, v9);
  }

  if ((v2 & 0x200000000LL) != 0)
  {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task still running",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_13;
  }

  int v3 = v2 & 0x7F;
  int v4 = BYTE1(v2);
  if (v3) {
    int v4 = 0;
  }
  if (v3 == 127 || v3 == 0) {
    return v4;
  }
  else {
    return v3;
  }
}

- (int64_t)_platformExitInformation
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000LL) != 0)
  {
    if ((v2 & 0x200000000LL) == 0) {
      return v2;
    }
    int v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task still running",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    int v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task not launched",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v4 userInfo:0]);
  return -[NSConcreteTask terminationReason](v5, v6);
}

- (int64_t)terminationReason
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000LL) == 0)
  {
    SEL v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task not launched",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
    return -[NSConcreteTask isRunning](v7, v8);
  }

  if ((v2 & 0x200000000LL) != 0)
  {
    SEL v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: task still running",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }

  int v3 = v2 & 0x7F;
  int64_t v4 = 1LL;
  if (v3) {
    int64_t v4 = 2LL;
  }
  if (v3 == 127) {
    return 0LL;
  }
  else {
    return v4;
  }
}

- (BOOL)isRunning
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  return (~v2 & 0x300000000LL) == 0;
}

- (void)launch
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);
  -[NSConcreteTask launchWithDictionary:error:](self, "launchWithDictionary:error:", dictionary, 0LL);
}

- (BOOL)launchAndReturnError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( dictionary,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"_NSTaskUseErrorsForRuntimeFailures");
  return -[NSConcreteTask launchWithDictionary:error:](self, "launchWithDictionary:error:", dictionary, a3);
}

- (BOOL)launchWithDictionary:(id)a3 error:(id *)a4
{
  v108 = a4;
  uint64_t v133 = *MEMORY[0x1895F89C0];
  int v130 = 2;
  uint64_t v129 = 0x100000000LL;
  int v107 = objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"_NSTaskUseErrorsForRuntimeFailures"),  "BOOLValue");
  p_exitRunningInfo = &self->__exitRunningInfo;
  unint64_t v6 = atomic_load(&self->__exitRunningInfo);
  if ((v6 & 0x100000000LL) != 0)
  {
    if (v107)
    {
      BOOL v11 = 0;
      if (v108) {
        id *v108 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3587LL,  0LL);
      }
      return v11;
    }

    v85 = (void *)MEMORY[0x189603F70];
    uint64_t v86 = *MEMORY[0x189603A60];
    v87 = @"task already launched";
    goto LABEL_198;
  }

  if (!a3)
  {
    v85 = (void *)MEMORY[0x189603F70];
    uint64_t v86 = *MEMORY[0x189603A60];
    v87 = @"need a dictionary";
LABEL_198:
    objc_exception_throw((id)[v85 exceptionWithName:v86 reason:v87 userInfo:0]);
    goto LABEL_199;
  }

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v109 = 16LL;
  dictionary = self->_dictionary;
  SEL v8 = (objc_class *)a3;
  Class v104 = (Class)a3;
  if (dictionary != a3)
  {
    SEL v8 = (objc_class *)-[objc_class mutableCopyWithZone:](v104, "mutableCopyWithZone:", 0LL);
    (&self->super.super.isa)[v109 / 8] = v8;
    if (dictionary)
    {

      SEL v8 = (&self->super.super.isa)[v109 / 8];
    }
  }

  -[objc_class removeObjectForKey:](v8, "removeObjectForKey:", @"_NSTaskTerminationStatus");
  -[objc_class removeObjectForKey:]( (&self->super.super.isa)[v109 / 8],  "removeObjectForKey:",  @"_NSTaskHasBeenLaunched");
  SEL v9 = (void *)objc_msgSend( (id)-[objc_class objectForKey:]( (&self->super.super.isa)[v109 / 8],  "objectForKey:",  @"_NSTaskExecutablePath"),  "stringByStandardizingPath");
  if (([v9 getFileSystemRepresentation:v131 maxLength:1024] & 1) == 0
    || access((const char *)v131, 1))
  {
    if (v107)
    {
      if (v9)
      {
        if (v108)
        {
          v127 = @"NSFilePath";
          v128 = v9;
          unint64_t v10 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4,  [MEMORY[0x189603F68] dictionaryWithObjects:&v128 forKeys:&v127 count:1]);
LABEL_18:
          BOOL v11 = 0;
          id *v108 = v10;
LABEL_194:
          os_unfair_lock_unlock(p_lock);
          return v11;
        }
      }

      else if (v108)
      {
        unint64_t v10 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4LL,  0LL);
        goto LABEL_18;
      }

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke(uint64_t a1)
{
}

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8LL);
  os_unfair_lock_lock(v2);
  *(void *)(*(void *)(a1 + 40) + 32LL) = 0LL;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
  do
    pid_t v3 = waitpid(*(_DWORD *)(*(void *)(a1 + 40) + 48LL), &v19, 0);
  while (v3 < 0 && *__error() == 4);
  int v4 = v19;
  if (v3 < 0) {
    int v4 = -1;
  }
  int64_t v5 = (unint64_t *)(*(void *)(a1 + 40) + 56LL);
  do
    unint64_t v6 = __ldaxr(v5);
  while (__stlxr(v6 | v4, v5));
  v7 = (unint64_t *)(*(void *)(a1 + 40) + 56LL);
  do
    unint64_t v8 = __ldaxr(v7);
  while (__stlxr(v8 & 0xFFFFFFFDFFFFFFFFLL, v7));
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(v9 + 24);
  if (v10)
  {
    BOOL v11 = (unint64_t *)(v9 + 56);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 | 0x800000000LL, v11));
    qos_class_t v13 = qos_class_main();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v13, 2uLL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3;
    block[3] = &unk_189C9E898;
    block[4] = *(void *)(a1 + 40);
    block[5] = v10;
    dispatch_async(global_queue, block);
  }

  else
  {
    double v15 = *(__CFRunLoop **)(a1 + 56);
    uint64_t v16 = (const void *)*MEMORY[0x1896051A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4;
    v17[3] = &unk_189C9A030;
    v17[4] = v9;
    CFRunLoopPerformBlock(v15, v16, v17);
  }

  CFRunLoopRemoveSource( *(CFRunLoopRef *)(a1 + 56),  *(CFRunLoopSourceRef *)(a1 + 64),  (CFRunLoopMode)*MEMORY[0x1896051B0]);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  os_unfair_lock_unlock(v2);
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTerminationHandler:0];
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4(uint64_t result)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(result + 32) + 56LL));
  if ((v1 & 0xC00000000LL) == 0)
  {
    unint64_t v2 = (unint64_t *)(*(void *)(result + 32) + 56LL);
    do
      unint64_t v3 = __ldaxr(v2);
    while (__stlxr(v3 | 0x400000000LL, v2));
    return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSTaskDidTerminateNotification",  *(void *)(result + 32),  0LL);
  }

  return result;
}

- (void)waitUntilExit
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  _CFAutoreleasePoolPush();
  unint64_t v3 = (const __CFArray *)_CFGetTSD();
  if (v3)
  {
    int v4 = v3;
    v17.length = CFArrayGetCount(v3);
    v17.location = 0LL;
    BOOL v5 = CFArrayContainsValue(v4, v17, self) != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  memset(&context.retain, 0, 64);
  context.version = 0LL;
  context.info = self;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v7 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, &context);
  unint64_t v8 = (const __CFString *)*MEMORY[0x1896051B0];
  CFRunLoopAddSource(Current, v7, (CFRunLoopMode)*MEMORY[0x1896051B0]);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  BOOL v11 = __31__NSConcreteTask_waitUntilExit__block_invoke;
  unint64_t v12 = &unk_189CA1020;
  qos_class_t v13 = self;
  BOOL v14 = v5;
  unint64_t v9 = atomic_load(&self->__exitRunningInfo);
  if ((v9 & 0x200000000LL) != 0 || (v9 & 0x400000000LL) == 0 && (v9 & 0x800000000LL) == 0 && v14)
  {
    do
      CFRunLoopRunInMode(v8, 0.0625, 1u);
    while ((((uint64_t (*)(void *))v11)(v10) & 1) != 0);
  }

  CFRunLoopRemoveSource(Current, v7, v8);
  CFRelease(v7);
  _CFAutoreleasePoolPop();
}

BOOL __31__NSConcreteTask_waitUntilExit__block_invoke(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 56LL));
  if ((v1 & 0x200000000LL) != 0) {
    return 1LL;
  }
  if ((v1 & 0x400000000LL) != 0) {
    return 0LL;
  }
  return (v1 & 0x800000000LL) == 0 && *(_BYTE *)(a1 + 40) != 0;
}

- (void)_withTaskDictionary:(id)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_dictionary) {
    self->_dictionary = (NSMutableDictionary *) +[NSTask currentTaskDictionary]( &OBJC_CLASS___NSTask,  "currentTaskDictionary");
  }
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setArguments:(id)a3
{
}

- (void)setPreferredArchitectures:(id)a3
{
}

- (void)setLaunchRequirementData:(id)a3
{
}

- (void)setCurrentDirectoryPath:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x189603F68] dictionary];
  }
  COPY_SETTER_IMPL((uint64_t)self, v3, (uint64_t)@"_NSTaskEnvironmentDictionary", 0LL);
}

- (void)setLaunchPath:(id)a3
{
}

- (id)launchPath
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskExecutablePath");
}

- (id)environment
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskEnvironmentDictionary");
}

- (id)arguments
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskArgumentArray");
}

- (id)preferredArchitectures
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskPreferredArchitectureArray");
}

- (id)launchRequirementData
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskLaunchRequirementData");
}

- (id)currentDirectoryPath
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskDirectoryPath");
}

- (id)standardInput
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskInputFileHandle");
}

- (id)standardOutput
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskOutputFileHandle");
}

- (id)standardError
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)@"_NSTaskDiagnosticFileHandle");
}

- (void)setStandardInput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)@"_NSTaskInputFileHandle");
  }

  else
  {
    qword_18C5D6210 = (uint64_t)"Standard input can only be an NSFileHandle or NSPipe";
    __break(1u);
  }

- (void)setStandardOutput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)@"_NSTaskOutputFileHandle");
  }

  else
  {
    qword_18C5D6210 = (uint64_t)"Standard output can only be an NSFileHandle or NSPipe";
    __break(1u);
  }

- (void)setStandardError:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)@"_NSTaskDiagnosticFileHandle");
  }

  else
  {
    qword_18C5D6210 = (uint64_t)"Standard error can only be an NSFileHandle or NSPipe";
    __break(1u);
  }

- (void)setTaskDictionary:(id)a3
{
  unint64_t v4 = atomic_load(&self->__exitRunningInfo);
  if ((v4 & 0x100000000LL) != 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"task already launched" userInfo:0]);
    uint64_t v10 = v9;
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v10);
  }

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  self->_dictionary = (NSMutableDictionary *)[a3 mutableCopyWithZone:0];
  if (dictionary) {

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)taskDictionary
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 0LL;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  unint64_t v8 = __Block_byref_object_copy__15;
  unint64_t v9 = __Block_byref_object_dispose__15;
  uint64_t v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __32__NSConcreteTask_taskDictionary__block_invoke;
  v4[3] = &unk_189CA1048;
  v4[4] = self;
  v4[5] = &v5;
  -[NSConcreteTask _withTaskDictionary:](self, "_withTaskDictionary:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __32__NSConcreteTask_taskDictionary__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 56LL));
  if ((v3 & 0x100000000LL) != 0) {
    id result = (id)[a2 mutableCopyWithZone:0];
  }
  else {
    id result = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (BOOL)suspend
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)resume
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (int64_t)suspendCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t suspendCount = self->_suspendCount;
  os_unfair_lock_unlock(p_lock);
  return suspendCount;
}

- (NSConcreteTask)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteTask;
  id result = -[NSTask init](&v3, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unsigned __int8 *)&result->_isSpawnedProcessDisclaimed);
  }

  return result;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = -[NSConcreteTask standardInput](self, "standardInput");
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v3 _closeOnDealloc];
  }
  id v4 = -[NSConcreteTask standardOutput](self, "standardOutput");
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v4 _closeOnDealloc];
  }
  id v5 = -[NSConcreteTask standardError](self, "standardError");
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v5 _closeOnDealloc];
  }

  dsrc = self->_dsrc;
  if (dsrc)
  {
    dispatch_source_cancel((dispatch_source_t)dsrc);
    self->_dsrc = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSConcreteTask;
  -[NSConcreteTask dealloc](&v7, sel_dealloc);
}

- (int)processIdentifier
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_pid;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setStartsNewProcessGroup:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v4 = a3;
  -[NSConcreteTask _withTaskDictionary:](self, "_withTaskDictionary:", v3);
}

uint64_t __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32)) {
    return [a2 removeObjectForKey:@"_NSTaskNoNewProcessGroup"];
  }
  else {
    return objc_msgSend( a2,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"_NSTaskNoNewProcessGroup");
  }
}

@end