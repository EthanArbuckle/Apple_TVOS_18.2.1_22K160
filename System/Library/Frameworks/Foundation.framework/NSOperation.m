@interface NSOperation
+ (BOOL)_removesDependenciesAfterFinish;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)currentOperation;
+ (id)keyPathsForValuesAffectingCancelled;
+ (id)keyPathsForValuesAffectingExecuting;
+ (id)keyPathsForValuesAffectingFinished;
+ (id)keyPathsForValuesAffectingIsCancelled;
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
+ (id)keyPathsForValuesAffectingIsReady;
+ (id)keyPathsForValuesAffectingReady;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSArray)dependencies;
- (NSOperation)init;
- (NSOperationQueuePriority)queuePriority;
- (NSQualityOfService)qualityOfService;
- (NSString)name;
- (double)threadPriority;
- (id)__graphDescription:(unint64_t)a3;
- (id)_copyCompletionBlock;
- (id)_implicitObservationInfo;
- (id)debugDescription;
- (id)description;
- (void)addDependency:(NSOperation *)op;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)cancel;
- (void)completionBlock;
- (void)dealloc;
- (void)observationInfo;
- (void)removeAllDependencies;
- (void)removeDependency:(NSOperation *)op;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setCompletionBlock:(void *)completionBlock;
- (void)setName:(NSString *)name;
- (void)setObservationInfo:(void *)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setQueuePriority:(NSOperationQueuePriority)queuePriority;
- (void)setThreadPriority:(double)threadPriority;
- (void)start;
- (void)waitUntilFinished;
- (void)waitUntilFinishedOrTimeout:(double)a3;
@end

@implementation NSOperation

- (id)_implicitObservationInfo
{
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v4 = self->_iop.__implicitObsInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)observationInfo
{
  return self->_iop.__obsInfo;
}

- (void)setObservationInfo:(void *)a3
{
  obsInfo = self->_iop.__obsInfo;
  if (obsInfo != a3)
  {
    id v5 = obsInfo;
    self->_iop.__obsInfo = a3;
  }

+ (id)keyPathsForValuesAffectingFinished
{
  return (id)[MEMORY[0x189604010] setWithObject:@"isFinished"];
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)[MEMORY[0x189604010] setWithObject:@"finished"];
}

+ (id)keyPathsForValuesAffectingReady
{
  return (id)[MEMORY[0x189604010] setWithObject:@"isReady"];
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)[MEMORY[0x189604010] setWithObject:@"ready"];
}

+ (id)keyPathsForValuesAffectingExecuting
{
  return (id)[MEMORY[0x189604010] setWithObject:@"isExecuting"];
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)[MEMORY[0x189604010] setWithObject:@"executing"];
}

+ (id)keyPathsForValuesAffectingCancelled
{
  return (id)[MEMORY[0x189604010] setWithObject:@"isCancelled"];
}

+ (id)keyPathsForValuesAffectingIsCancelled
{
  return (id)[MEMORY[0x189604010] setWithObject:@"cancelled"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (([a3 isEqualToString:@"isFinished"] & 1) != 0
    || ([a3 isEqualToString:@"finished"] & 1) != 0
    || ([a3 isEqualToString:@"isReady"] & 1) != 0
    || ([a3 isEqualToString:@"ready"] & 1) != 0
    || ([a3 isEqualToString:@"isExecuting"] & 1) != 0
    || ([a3 isEqualToString:@"executing"] & 1) != 0
    || ([a3 isEqualToString:@"isCancelled"] & 1) != 0
    || ([a3 isEqualToString:@"cancelled"] & 1) != 0
    || ([a3 isEqualToString:@"dependencies"] & 1) != 0
    || ([a3 isEqualToString:@"queuePriority"] & 1) != 0
    || ([a3 isEqualToString:@"isAsynchronous"] & 1) != 0
    || ([a3 isEqualToString:@"name"] & 1) != 0
    || ([a3 isEqualToString:@"qualityOfService"] & 1) != 0
    || ([a3 isEqualToString:@"completionBlock"] & 1) != 0)
  {
    return 0;
  }

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperation;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

+ (id)currentOperation
{
  return (id)_CFGetTSD();
}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 0;
}

- (NSOperation)init
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSOperation;
  v2 = -[NSOperation init](&v14, sel_init);
  if (qword_18C496378 != -1) {
    dispatch_once(&qword_18C496378, &__block_literal_global_32);
  }
  v3 = (objc_class *)objc_opt_class();
  value = 0LL;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C496398);
  v4 = (const __CFArray *)qword_18C4963A0;
  v17.length = CFArrayGetCount((CFArrayRef)qword_18C4963A0);
  v17.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v17, v3);
  if (FirstIndexOfValue == -1)
  {
    v15[0] = xmmword_189C9F450;
    v15[1] = *(_OWORD *)&off_189C9F460;
    v15[2] = xmmword_189C9F470;
    v8 = (void *)[objc_allocWithZone(MEMORY[0x189604010]) initWithObjects:v15 count:6];
    v9 = objc_opt_self();
    ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo(v9, v8, 0LL, 0LL, v3, (objc_class **)&value);

    CFArrayAppendValue((CFMutableArrayRef)qword_18C4963A0, v3);
    CFArrayAppendValue((CFMutableArrayRef)qword_18C4963A8, value);
    CFArrayAppendValue((CFMutableArrayRef)qword_18C4963B0, ImplicitObservationInfo);
  }

  else
  {
    CFIndex v6 = FirstIndexOfValue;
    value = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_18C4963A8, FirstIndexOfValue);
    ImplicitObservationInfo = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_18C4963B0, v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C496398);
  object_setClass(v2, (Class)value);
  pthread_mutex_init(&v2->_iop.__wait_mutex, 0LL);
  pthread_cond_init(&v2->_iop.__wait_cond, 0LL);
  atomic_store(1u, (unsigned __int8 *)&v2->_iop.__cached_isReady);
  v2->_iop.__prio = -1;
  v2->_iop.__thread_prio = 0.5;
  v2->_iop.__nameBuffer = 0LL;
  v2->_iop._shouldRemoveDependenciesAfterFinish = [(id)objc_opt_class() _removesDependenciesAfterFinish];
  id v10 = ImplicitObservationInfo;
  os_unfair_lock_lock(&v2->_iop.__lock);
  implicitObsInfo = v2->_iop.__implicitObsInfo;
  v2->_iop.__implicitObsInfo = ImplicitObservationInfo;
  os_unfair_lock_unlock(&v2->_iop.__lock);

  return v2;
}

CFMutableArrayRef __19__NSOperation_init__block_invoke()
{
  v0 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  qword_18C4963A0 = (uint64_t)CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  16LL,  &__NSOperationImplicitObservationArrayCallbacks);
  qword_18C4963A8 = (uint64_t)CFArrayCreateMutable(v0, 16LL, &__NSOperationImplicitObservationArrayCallbacks);
  CFMutableArrayRef result = CFArrayCreateMutable(v0, 16LL, &__NSOperationImplicitObservationArrayCallbacks);
  qword_18C4963B0 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  obsInfo = self->_iop.__obsInfo;
  if (obsInfo)
  {
    self->_iop.__obsInfo = 0LL;
  }

  os_unfair_lock_lock(&self->_iop.__lock);
  implicitObsInfo = self->_iop.__implicitObsInfo;
  self->_iop.__implicitObsInfo = 0LL;
  os_unfair_lock_unlock(&self->_iop.__lock);

  os_unfair_lock_lock(&self->_iop.__lock);
  queue = self->_iop.__queue;
  self->_iop.__queue = 0LL;
  voucher = self->_iop._voucher;
  id schedule = self->_iop.__schedule;
  self->_iop._voucher = 0LL;
  self->_iop.__id schedule = 0LL;
  os_unfair_lock_unlock(&self->_iop.__lock);

  if (schedule) {
    _Block_release(schedule);
  }

  pthread_cond_destroy(&self->_iop.__wait_cond);
  pthread_mutex_destroy(&self->_iop.__wait_mutex);

  free(self->_iop.__nameBuffer);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSOperation;
  -[NSOperation dealloc](&v8, sel_dealloc);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iop.__isCancelled);
  return v2 & 1;
}

- (void)cancel
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (-[NSOperation isFinished](self, "isFinished")) {
    return;
  }
  if (atomic_load(&self->_iop.__isCancelledObserverCount))
  {
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __iop_cancel_block_invoke;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = &self->_iop;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  _NSOperationCancelKeys,  1LL,  0LL,  0LL,  v21);
  }

  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_iop.__isCancelled);
  }

  unsigned int v4 = atomic_load(&self->_iop.__state);
  if (v4 > 0xDF) {
    return;
  }
  if (atomic_load(&self->_iop.__isReadyObserverCount))
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __iop_cancel_block_invoke_2;
    v20[3] = &__block_descriptor_40_e5_v8__0l;
    v20[4] = &self->_iop;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationReadyKeys,  1LL,  0LL,  0LL,  v20);
  }

  else
  {
    os_unfair_lock_lock(&self->_iop.__lock);
    self->_iop.__unfinished_deps = 0LL;
    os_unfair_lock_unlock(&self->_iop.__lock);
    +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]( &OBJC_CLASS_____NSOperationInternalObserver,  "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:",  @"isReady",  self,  0LL,  0LL,  0LL,  0LL,  0LL);
  }

  if (!self->_iop._shouldRemoveDependenciesAfterFinish) {
    return;
  }
  CFIndex v6 = self;
  char v7 = 0;
  uint64_t v8 = 0LL;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v23 = __iop_removeAllDependencies_block_invoke;
  v24 = &unk_189C9E2F8;
  v25 = self;
  p_iop = &self->_iop;
  LOBYTE(v9) = 1;
  uint64_t v10 = 1LL;
  do
  {
    while (1)
    {
      while (1)
      {
        char v11 = v7;
        uint64_t v12 = v10;
        char v13 = v9;
        objc_super v14 = _NSOperationDependenciesAndReadyKeys[v8];
        if (v14 != @"isReady") {
          break;
        }
        uint64_t v10 = 0LL;
        int v15 = atomic_load(&self->_iop.__isReadyObserverCount);
        char v16 = v7 | (v15 != 0);
        char v7 = 1;
        uint64_t v9 = v12;
        uint64_t v8 = 1LL;
        if ((v16 & 1) != 0) {
          goto LABEL_23;
        }
      }

      if (v14 != @"isFinished") {
        break;
      }
      uint64_t v10 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_22:
      int v15 = atomic_load(p_isFinishedObserverCount);
      char v18 = v7 | (v15 != 0);
      uint64_t v8 = 1LL;
      uint64_t v9 = v12;
      char v7 = 1;
      if ((v18 & 1) != 0)
      {
LABEL_23:
        if (v15) {
          char v19 = v13;
        }
        else {
          char v19 = v12;
        }
        if ((v19 & 1) != 0) {
          goto LABEL_27;
        }
        goto LABEL_29;
      }
    }

    if (v14 == @"isExecuting")
    {
      uint64_t v10 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_22;
    }

    if (v14 == @"isCancelled")
    {
      uint64_t v10 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_22;
    }

    uint64_t v10 = 0LL;
    uint64_t v8 = 1LL;
    uint64_t v9 = v12;
    char v7 = 1;
  }

  while ((v11 & 1) == 0);
  if ((v12 & 1) != 0)
  {
LABEL_27:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  _NSOperationDependenciesAndReadyKeys,  2LL,  0LL,  0LL,  v22);
    goto LABEL_30;
  }

- (BOOL)isExecuting
{
  int v2 = atomic_load(&self->_iop.__state);
  return v2 == 224;
}

- (BOOL)isFinished
{
  unsigned int v2 = atomic_load(&self->_iop.__state);
  return v2 > 0xEF;
}

- (BOOL)isConcurrent
{
  uint64_t v3 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isConcurrent);
  if (v3 != +[NSOperation instanceMethodForSelector:]( &OBJC_CLASS___NSOperation,  "instanceMethodForSelector:",  sel_isConcurrent)) {
    return 0;
  }
  uint64_t v5 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isAsynchronous);
  return v5 != +[NSOperation instanceMethodForSelector:]( &OBJC_CLASS___NSOperation,  "instanceMethodForSelector:",  sel_isAsynchronous)
      && -[NSOperation isAsynchronous](self, "isAsynchronous");
}

- (BOOL)isAsynchronous
{
  uint64_t v3 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isAsynchronous);
  if (v3 != +[NSOperation instanceMethodForSelector:]( &OBJC_CLASS___NSOperation,  "instanceMethodForSelector:",  sel_isAsynchronous)) {
    return 0;
  }
  uint64_t v5 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isConcurrent);
  return v5 != +[NSOperation instanceMethodForSelector:]( &OBJC_CLASS___NSOperation,  "instanceMethodForSelector:",  sel_isConcurrent)
      && -[NSOperation isConcurrent](self, "isConcurrent");
}

- (BOOL)isReady
{
  unsigned int v2 = self;
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  LOBYTE(v2) = v2->_iop.__unfinished_deps == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSOperationQueuePriority)queuePriority
{
  int prio = self->_iop.__prio;
  if (prio == 255) {
    LOBYTE(prio) = 0;
  }
  return (uint64_t)(char)prio;
}

- (void)setQueuePriority:(NSOperationQueuePriority)queuePriority
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  else {
    char v3 = -4;
  }
  if (queuePriority > NSOperationQueuePriorityLow) {
    char v3 = 0;
  }
  if (queuePriority <= 3) {
    char v4 = v3;
  }
  else {
    char v4 = 4;
  }
  if (queuePriority <= 7) {
    char v5 = v4;
  }
  else {
    char v5 = 8;
  }
  if (self->_iop.__prio != v5)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __iop_setQueuePriority_block_invoke;
    v6[3] = &unk_189C9F4F0;
    v6[4] = self;
    char v7 = v5;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  _NSOperationQueuePriorityKeys,  1LL,  0LL,  0LL,  v6);
  }

- (double)threadPriority
{
  return self->_iop.__thread_prio;
}

- (void)setThreadPriority:(double)threadPriority
{
  v4[6] = *MEMORY[0x1895F89C0];
  unsigned int v3 = atomic_load(&self->_iop.__state);
  if (v3 <= 0xD7)
  {
    if (threadPriority <= 0.0) {
      threadPriority = 0.0;
    }
    v4[1] = 3221225472LL;
    v4[0] = MEMORY[0x1895F87A8];
    v4[2] = __iop_setThreadPriority_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    if (threadPriority >= 1.0) {
      threadPriority = 1.0;
    }
    v4[4] = &self->_iop;
    *(double *)&v4[5] = threadPriority;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationThreadPriorityKeys,  1LL,  0LL,  0LL,  v4);
  }

- (id)_copyCompletionBlock
{
  if (qword_18C496390 != -1) {
    dispatch_once(&qword_18C496390, &__block_literal_global_307);
  }
  os_unfair_lock_lock(&self->_iop.__lock);
  id completion = self->_iop.__completion;
  if (_MergedGlobals_13) {
    self->_iop.__id completion = 0LL;
  }
  else {
    id v4 = completion;
  }
  os_unfair_lock_unlock(&self->_iop.__lock);
  return completion;
}

- (void)completionBlock
{
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  id v4 = self->_iop.__completion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCompletionBlock:(void *)completionBlock
{
  v3[6] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __iop_setCompletionBlock_block_invoke;
  v3[3] = &unk_189C9F590;
  v3[4] = completionBlock;
  v3[5] = &self->_iop;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationCompletionBlockKeys,  1LL,  0LL,  0LL,  v3);
}

- (NSString)name
{
  if (self->_iop.__nameBuffer) {
    return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:");
  }
  else {
    return 0LL;
  }
}

- (void)setName:(NSString *)name
{
  v3[6] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __iop_setName_block_invoke;
  v3[3] = &unk_189C9E2F8;
  v3[4] = name;
  v3[5] = &self->_iop;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationNameKeys,  1LL,  0LL,  0LL,  v3);
}

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result = op_get_property_qos((uint64_t)self);
  if ((_DWORD)result == (NSQualityOfServiceUtility|0x4LL) || result == 0) {
    return -1LL;
  }
  return result;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  v5[6] = *MEMORY[0x1895F89C0];
  BOOL v3 = (unint64_t)(qualityOfService + 1) > 0x22
    || ((1LL << (qualityOfService + 1)) & 0x404040441LL) == 0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__NSOperation_setQualityOfService___block_invoke;
  v5[3] = &unk_189C9E2F8;
  if (v3) {
    NSQualityOfService v4 = NSQualityOfServiceDefault;
  }
  else {
    NSQualityOfService v4 = qualityOfService;
  }
  v5[4] = self;
  v5[5] = v4;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationQualityOfServiceKeys,  1LL,  0LL,  0LL,  v5);
}

uint64_t __35__NSOperation_setQualityOfService___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1 > 16)
  {
    if (v1 != 17 && v1 != 33 && v1 != 25) {
LABEL_9:
    }
      LOBYTE(v1) = 0;
  }

  else
  {
    if (v1 == -1)
    {
      LOBYTE(v1) = 21;
      goto LABEL_11;
    }

    if (v1 != 5 && v1 != 9) {
      goto LABEL_9;
    }
  }

- (void)waitUntilFinished
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  NSQualityOfService v4 = self->_iop.__queue;
  os_unfair_lock_unlock(p_lock);
  qos_class_t v5 = atomic_load(&self->_iop.__propertyQoS);
  v22 = v4;
  if (v4) {
    CFIndex v6 = oq_begin_waiting((uint64_t)v4, v5);
  }
  else {
    CFIndex v6 = 0LL;
  }
  os_unfair_lock_lock(p_lock);
  v21 = self;
  char v7 = (void *)-[NSMutableArray copy](self->_iop.__dependencies, "copy");
  os_unfair_lock_unlock(p_lock);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        if (v6)
        {
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          char v13 = (os_unfair_lock_s *)(v12 + 232);
          os_unfair_lock_lock((os_unfair_lock_t)(v12 + 232));
          id v14 = *(id *)(v12 + 32);
          os_unfair_lock_unlock(v13);
          if (v14)
          {
            os_unfair_lock_lock((os_unfair_lock_t)v14 + 2);
            uint64_t v15 = [*((id *)v14 + 19) count];
            if (v15)
            {
              uint64_t v16 = v15;
              for (uint64_t j = 0LL; j != v16; ++j)
              {
                char v18 = (_opaque_pthread_t *)[*((id *)v14 + 19) pointerAtIndex:j];
                if (!NSMapMember(v6, v18, 0LL, 0LL))
                {
                  pthread_override_t started = pthread_override_qos_class_start_np(v18, v5, 0);
                  NSMapInsertKnownAbsent(v6, v18, started);
                }
              }
            }

            os_unfair_lock_unlock((os_unfair_lock_t)v14 + 2);
          }
        }
      }

      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    }

    while (v9);
  }

  p_wait_mutex = &v21->_iop.__wait_mutex;
  pthread_mutex_lock(&v21->_iop.__wait_mutex);
  if (!-[NSOperation isFinished](v21, "isFinished"))
  {
    do
      pthread_cond_wait(&v21->_iop.__wait_cond, p_wait_mutex);
    while (!-[NSOperation isFinished](v21, "isFinished"));
  }

  pthread_mutex_unlock(p_wait_mutex);
  if (v6) {
    oq_end_waiting(v6);
  }
}

- (void)waitUntilFinishedOrTimeout:(double)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  double v4 = CFAbsoluteTimeGetCurrent() + a3;
  os_unfair_lock_lock(&self->_iop.__lock);
  qos_class_t v5 = self->_iop.__queue;
  os_unfair_lock_unlock(&self->_iop.__lock);
  qos_class_t v6 = atomic_load(&self->_iop.__propertyQoS);
  if (v5) {
    char v7 = oq_begin_waiting((uint64_t)v5, v6);
  }
  else {
    char v7 = 0LL;
  }
  pthread_mutex_lock(&self->_iop.__wait_mutex);
  for (double i = v4 - CFAbsoluteTimeGetCurrent(); i > 0.0; double i = v4 - CFAbsoluteTimeGetCurrent())
  {
    if (-[NSOperation isFinished](self, "isFinished")) {
      break;
    }
    v9.tv_sec = vcvtmd_s64_f64(i);
    v9.tv_nsec = (int)((i - (double)(uint64_t)floor(i)) * 1000000000.0);
    pthread_cond_timedwait_relative_np(&self->_iop.__wait_cond, &self->_iop.__wait_mutex, &v9);
  }

  pthread_mutex_unlock(&self->_iop.__wait_mutex);
  if (v7) {
    oq_end_waiting(v7);
  }
}

- (void)addDependency:(NSOperation *)op
{
}

- (void)removeDependency:(NSOperation *)op
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  p_iop = &self->_iop;
  qos_class_t v6 = op;
  char v7 = self;
  char v8 = 0;
  uint64_t v9 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v22 = __iop_removeDependency_block_invoke;
  v23 = &unk_189C9F5B8;
  __int128 v25 = self;
  __int128 v26 = p_iop;
  v24 = op;
  LOBYTE(v10) = 1;
  uint64_t v11 = 1LL;
  do
  {
    while (1)
    {
      while (1)
      {
        char v12 = v8;
        uint64_t v13 = v11;
        char v14 = v10;
        uint64_t v15 = _NSOperationDependenciesAndReadyKeys[v9];
        if (v15 != @"isReady") {
          break;
        }
        uint64_t v11 = 0LL;
        int v16 = atomic_load(&self->_iop.__isReadyObserverCount);
        char v17 = v8 | (v16 != 0);
        char v8 = 1;
        uint64_t v10 = v13;
        uint64_t v9 = 1LL;
        if ((v17 & 1) != 0) {
          goto LABEL_14;
        }
      }

      if (v15 != @"isFinished") {
        break;
      }
      uint64_t v11 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_13:
      int v16 = atomic_load(p_isFinishedObserverCount);
      char v19 = v8 | (v16 != 0);
      uint64_t v9 = 1LL;
      uint64_t v10 = v13;
      char v8 = 1;
      if ((v19 & 1) != 0)
      {
LABEL_14:
        if (v16) {
          char v20 = v14;
        }
        else {
          char v20 = v13;
        }
        if ((v20 & 1) != 0) {
          goto LABEL_18;
        }
        goto LABEL_20;
      }
    }

    if (v15 == @"isExecuting")
    {
      uint64_t v11 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_13;
    }

    if (v15 == @"isCancelled")
    {
      uint64_t v11 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_13;
    }

    uint64_t v11 = 0LL;
    uint64_t v9 = 1LL;
    uint64_t v10 = v13;
    char v8 = 1;
  }

  while ((v12 & 1) == 0);
  if ((v13 & 1) != 0)
  {
LABEL_18:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  _NSOperationDependenciesAndReadyKeys,  2LL,  0LL,  0LL,  v21);
    goto LABEL_21;
  }

- (void)removeAllDependencies
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  p_iop = &self->_iop;
  double v4 = self;
  char v5 = 0;
  uint64_t v6 = 0LL;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  char v20 = __iop_removeAllDependencies_block_invoke;
  v21 = &unk_189C9E2F8;
  v22 = self;
  v23 = p_iop;
  LOBYTE(v7) = 1;
  uint64_t v8 = 1LL;
  do
  {
    while (1)
    {
      while (1)
      {
        char v9 = v5;
        uint64_t v10 = v8;
        char v11 = v7;
        char v12 = _NSOperationDependenciesAndReadyKeys[v6];
        if (v12 != @"isReady") {
          break;
        }
        uint64_t v8 = 0LL;
        int v13 = atomic_load(&self->_iop.__isReadyObserverCount);
        char v14 = v5 | (v13 != 0);
        char v5 = 1;
        uint64_t v7 = v10;
        uint64_t v6 = 1LL;
        if ((v14 & 1) != 0) {
          goto LABEL_14;
        }
      }

      if (v12 != @"isFinished") {
        break;
      }
      uint64_t v8 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_13:
      int v13 = atomic_load(p_isFinishedObserverCount);
      char v16 = v5 | (v13 != 0);
      uint64_t v6 = 1LL;
      uint64_t v7 = v10;
      char v5 = 1;
      if ((v16 & 1) != 0)
      {
LABEL_14:
        if (v13) {
          char v17 = v11;
        }
        else {
          char v17 = v10;
        }
        if ((v17 & 1) != 0) {
          goto LABEL_18;
        }
        goto LABEL_20;
      }
    }

    if (v12 == @"isExecuting")
    {
      uint64_t v8 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_13;
    }

    if (v12 == @"isCancelled")
    {
      uint64_t v8 = 0LL;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_13;
    }

    uint64_t v8 = 0LL;
    uint64_t v6 = 1LL;
    uint64_t v7 = v10;
    char v5 = 1;
  }

  while ((v9 & 1) == 0);
  if ((v10 & 1) != 0)
  {
LABEL_18:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  _NSOperationDependenciesAndReadyKeys,  2LL,  0LL,  0LL,  &v18);
    goto LABEL_21;
  }

- (NSArray)dependencies
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  BOOL v3 = (void *)objc_opt_new();
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  dependencies = self->_iop.__dependencies;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( dependencies,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(dependencies);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (object_getClass(v10) != (Class)&OBJC_CLASS____NSBarrierOperation) {
          [v3 addObject:v10];
        }
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( dependencies,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  if (v3) {
    return (NSArray *)v3;
  }
  else {
    return (NSArray *)[MEMORY[0x189603F18] array];
  }
}

- (void)start
{
  v41[5] = *MEMORY[0x1895F89C0];
  p_state = &self->_iop.__state;
  unsigned int v8 = atomic_load(&self->_iop.__state);
  if (v8 == 244) {
    return;
  }
  p_iop = &self->_iop;
  do
  {
    if (__ldaxr(p_state))
    {
      __clrex();
      if (v8 == 216)
      {
        if (self->_iop.__queue) {
          goto LABEL_10;
        }
      }

      else if (v8 == 224 || v8 == 240)
      {
        char v12 = &OBJC_CLASS___NSString;
        __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: receiver is already executing",  _NSMethodExceptionProem((objc_class *)self, sel_start));
        goto LABEL_57;
      }

      char v12 = &OBJC_CLASS___NSString;
      __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: something is trying to start the receiver simultaneously from more than one thread",  _NSMethodExceptionProem((objc_class *)self, sel_start));
      goto LABEL_57;
    }
  }

  while (__stlxr(0xD8u, p_state));
  if (v8 <= 0x50 && !-[NSOperation isReady](self, "isReady"))
  {
    atomic_store(v8, &self->_iop.__state);
    char v12 = &OBJC_CLASS___NSString;
    __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: receiver is not yet ready to execute",  _NSMethodExceptionProem((objc_class *)self, sel_start));
LABEL_57:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v13 userInfo:0]);
    if (!v35) {
      _Unwind_Resume(v34);
    }
    objc_begin_catch(v34);
    objc_end_catch();
    goto LABEL_25;
  }

- (id)description
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSOperation name](self, "name");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSOperation;
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{name = '%@'}",  -[NSOperation description](&v6, sel_description),  v3);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSOperation;
    return -[NSOperation description](&v5, sel_description);
  }

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (([a4 isEqualToString:@"isReady"] & 1) != 0
    || ([a4 isEqualToString:@"ready"] & 1) != 0)
  {
    p_isReadyObserverCount = &self->_iop.__isReadyObserverCount;
    do
      int v12 = __ldaxr(p_isReadyObserverCount);
    while (__stlxr(v12 + 1, p_isReadyObserverCount));
    if (v12 != 255)
    {
LABEL_6:
      v25.receiver = self;
      v25.super_class = (Class)&OBJC_CLASS___NSOperation;
      -[NSOperation addObserver:forKeyPath:options:context:]( &v25,  sel_addObserver_forKeyPath_options_context_,  a3,  a4,  a5,  a6);
      return;
    }

    atomic_store(0xFFu, p_isReadyObserverCount);
    __int128 v15 = @"isReady";
  }

  else if (([a4 isEqualToString:@"isExecuting"] & 1) != 0 {
         || ([a4 isEqualToString:@"executing"] & 1) != 0)
  }
  {
    p_isExecutingObserverCount = &self->_iop.__isExecutingObserverCount;
    do
      int v14 = __ldaxr(p_isExecutingObserverCount);
    while (__stlxr(v14 + 1, p_isExecutingObserverCount));
    if (v14 != 255) {
      goto LABEL_6;
    }
    atomic_store(0xFFu, p_isExecutingObserverCount);
    __int128 v15 = @"isExecuting";
  }

  else if (([a4 isEqualToString:@"isCancelled"] & 1) != 0 {
         || ([a4 isEqualToString:@"cancelled"] & 1) != 0)
  }
  {
    p_isCancelledObserverCount = &self->_iop.__isCancelledObserverCount;
    do
      int v17 = __ldaxr(p_isCancelledObserverCount);
    while (__stlxr(v17 + 1, p_isCancelledObserverCount));
    if (v17 != 255) {
      goto LABEL_6;
    }
    atomic_store(0xFFu, p_isCancelledObserverCount);
    __int128 v15 = @"isCancelled";
  }

  else
  {
    if (([a4 isEqualToString:@"isFinished"] & 1) == 0
      && ([a4 isEqualToString:@"finished"] & 1) == 0)
    {
      goto LABEL_6;
    }

    p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
    do
      int v19 = __ldaxr(p_isFinishedObserverCount);
    while (__stlxr(v19 + 1, p_isFinishedObserverCount));
    if (v19 != 255) {
      goto LABEL_6;
    }
    atomic_store(0xFFu, p_isFinishedObserverCount);
    __int128 v15 = @"isFinished";
  }

  char v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"added too many observers to an NSOperation for %@",  v15);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v20 userInfo:0]);
  -[NSOperation removeObserver:forKeyPath:](v21, v22, v23, v24);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSOperation;
  -[NSOperation removeObserver:forKeyPath:](&v9, sel_removeObserver_forKeyPath_, a3);
  if (([a4 isEqualToString:@"isReady"] & 1) != 0
    || ([a4 isEqualToString:@"ready"] & 1) != 0)
  {
    uint64_t v6 = 244LL;
    goto LABEL_13;
  }

  if (([a4 isEqualToString:@"isExecuting"] & 1) != 0
    || ([a4 isEqualToString:@"executing"] & 1) != 0)
  {
    uint64_t v6 = 242LL;
    goto LABEL_13;
  }

  if (([a4 isEqualToString:@"isCancelled"] & 1) != 0
    || ([a4 isEqualToString:@"cancelled"] & 1) != 0)
  {
    uint64_t v6 = 245LL;
    goto LABEL_13;
  }

  if (([a4 isEqualToString:@"isFinished"] & 1) != 0
    || [a4 isEqualToString:@"finished"])
  {
    uint64_t v6 = 243LL;
LABEL_13:
    uint64_t v7 = (unsigned __int8 *)self + v6;
    do
      unsigned __int8 v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
  }

- (id)debugDescription
{
  BOOL v3 = -[NSOperation isFinished](self, "isFinished");
  BOOL v4 = -[NSOperation isReady](self, "isReady");
  BOOL v5 = -[NSOperation isCancelled](self, "isCancelled");
  BOOL v6 = -[NSOperation isExecuting](self, "isExecuting");
  uint64_t v7 = objc_opt_class();
  unsigned __int8 v8 = @"NO";
  if (v3) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  if (v4) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (v5) {
    char v11 = @"YES";
  }
  else {
    char v11 = @"NO";
  }
  if (v6) {
    unsigned __int8 v8 = @"YES";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p isFinished=%@ isReady=%@ isCancelled=%@ isExecuting=%@>",  v7,  self,  v9,  v10,  v11,  v8);
}

- (id)__graphDescription:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  BOOL v5 = (void *)[&stru_189CA6A28 mutableCopy];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"  "];
      --v6;
    }

    while (v6);
  }

  objc_msgSend(v5, "appendString:", -[NSOperation debugDescription](self, "debugDescription"));
  int v7 = atomic_load(&self->_iop.__state);
  if (v7 > 215)
  {
    if (v7 > 239)
    {
      if (v7 == 240)
      {
        unsigned __int8 v8 = "finishing";
        goto LABEL_24;
      }

      if (v7 == 244)
      {
        unsigned __int8 v8 = "finished";
        goto LABEL_24;
      }
    }

    else
    {
      if (v7 == 216)
      {
        unsigned __int8 v8 = "starting";
        goto LABEL_24;
      }

      if (v7 == 224)
      {
        unsigned __int8 v8 = "executing";
        goto LABEL_24;
      }
    }
  }

  else if (v7 > 79)
  {
    if (v7 == 80)
    {
      unsigned __int8 v8 = "enqueued";
      goto LABEL_24;
    }

    if (v7 == 136)
    {
      unsigned __int8 v8 = "dispatching";
      goto LABEL_24;
    }
  }

  else
  {
    if (!v7)
    {
      unsigned __int8 v8 = "initialized";
      goto LABEL_24;
    }

    if (v7 == 72)
    {
      unsigned __int8 v8 = "enqueuing";
      goto LABEL_24;
    }
  }

  unsigned __int8 v8 = "unknown";
LABEL_24:
  objc_msgSend(v5, "appendFormat:", @" %s\n", v8);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_super v9 = -[NSOperation dependencies](self, "dependencies");
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    unint64_t v13 = a3 + 1;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( v5,  "appendString:",  objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14++), "__graphDescription:", v13));
      }

      while (v11 != v14);
      uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
    }

    while (v11);
  }

  return v5;
}

@end