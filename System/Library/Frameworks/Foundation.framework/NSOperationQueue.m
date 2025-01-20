@interface NSOperationQueue
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSOperationQueue)currentQueue;
+ (NSOperationQueue)mainQueue;
- (BOOL)isSuspended;
- (BOOL)overcommitsOperations;
- (NSArray)operations;
- (NSInteger)maxConcurrentOperationCount;
- (NSOperationQueue)init;
- (NSProgress)progress;
- (NSQualityOfService)qualityOfService;
- (NSString)description;
- (NSString)name;
- (NSUInteger)operationCount;
- (dispatch_queue_t)underlyingQueue;
- (id)__graphDescription;
- (void)_fc_addUncancellableOperationForReactorID:(id)a3 block:(id)a4;
- (void)_fc_addUncancellableOperationWithBlock:(id)a3;
- (void)addBarrierBlock:(void *)barrier;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)addOperation:(NSOperation *)op;
- (void)addOperationWithBlock:(void *)block;
- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount;
- (void)setName:(NSString *)name;
- (void)setOvercommitsOperations:(BOOL)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setSuspended:(BOOL)suspended;
- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue;
- (void)waitUntilAllOperationsAreFinished;
@end

@implementation NSOperationQueue

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (([a3 isEqualToString:@"operations"] & 1) != 0
    || ([a3 isEqualToString:@"operationCount"] & 1) != 0
    || ([a3 isEqualToString:@"suspended"] & 1) != 0
    || ([a3 isEqualToString:@"operationCount"] & 1) != 0
    || ([a3 isEqualToString:@"name"] & 1) != 0
    || ([a3 isEqualToString:@"qualityOfService"] & 1) != 0)
  {
    return 0;
  }

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperationQueue;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

+ (NSOperationQueue)currentQueue
{
  if (pthread_main_np() == 1) {
    return +[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue");
  }
  else {
    return (NSOperationQueue *)(id)_CFGetTSD();
  }
}

+ (NSOperationQueue)mainQueue
{
  if (qword_18C496388 != -1) {
    dispatch_once(&qword_18C496388, &__block_literal_global_217);
  }
  return (NSOperationQueue *)qword_18C496380;
}

void __29__NSOperationQueue_mainQueue__block_invoke()
{
  v0 = objc_allocWithZone((Class)&OBJC_CLASS___NSOperationQueue);
  v1 = -[NSPointerArray initWithOptions:](objc_alloc(&OBJC_CLASS___NSPointerArray), "initWithOptions:", 258LL);
  v0[2] = 0;
  *((void *)v0 + 19) = v1;
  *((void *)v0 + 20) = 1LL;
  v0[42] = 1;
  *((_BYTE *)v0 + 506) = -1;
  v2 = (void *)*((void *)v0 + 24);
  *((void *)v0 + 24) = [@"NSOperationQueue Main Queue" copy];

  qos_class_t v3 = qos_class_main();
  oq_set_property_qos((uint64_t)v0, v3);
  qword_18C496380 = (uint64_t)v0;
}

- (NSOperationQueue)init
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!_NSIsMultiThreaded)
  {
    _NSIsMultiThreaded = 1;
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSWillBecomeMultiThreadedNotification",  0LL,  0LL);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSOperationQueue;
  qos_class_t v3 = -[NSOperationQueue init](&v11, sel_init);
  v4 = -[NSPointerArray initWithOptions:](objc_alloc(&OBJC_CLASS___NSPointerArray), "initWithOptions:", 258LL);
  v3->_iqp.__queueLock._os_unfair_lock_opaque = 0;
  v3->_iqp.__activeThreads = v4;
  v3->_iqp.__maxNumOps = -1LL;
  v3->_iqp.__actualMaxNumOps = 0x7FFFFFFF;
  v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NSOperationQueue %p", v3);
  name = v3->_iqp.__name;
  v3->_iqp.__name = (NSString *)-[NSString copy](v5, "copy");

  p_propertyQoS = &v3->_iqp.__propertyQoS;
  do
    int v8 = __ldaxr(p_propertyQoS);
  while (__stlxr(0, p_propertyQoS));
  if (v8)
  {
    backingQueue = (dispatch_object_s *)v3->_iqp.__backingQueue;
    v3->_iqp.__backingQueue = 0LL;
    v3->_iqp.__nameBuffer[0] = 0;
    if (backingQueue) {
      dispatch_release(backingQueue);
    }
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (self->_iqp.__mainQ)
  {
    __break(1u);
LABEL_10:
    objc_super v6 = 0LL;
    goto LABEL_8;
  }

  v2 = self;
  dispatch_queue = (dispatch_object_s *)self->_iqp.__dispatch_queue;
  if (dispatch_queue) {
    dispatch_release(dispatch_queue);
  }
  v2->_iqp.__dispatch_queue = 0LL;
  backingQueue = (dispatch_object_s *)v2->_iqp.__backingQueue;
  if (backingQueue) {
    dispatch_release(backingQueue);
  }

  progress = v2->_iqp._progress;
  if (!progress) {
    goto LABEL_10;
  }
  os_unfair_lock_lock(&progress->_queueLock);
  progress->_queue = 0LL;
  os_unfair_lock_unlock(&progress->_queueLock);
  objc_super v6 = v2->_iqp._progress;
LABEL_8:

  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___NSOperationQueue;
  -[NSOperationQueue dealloc](&v7, sel_dealloc);
}

- (void)addOperation:(NSOperation *)op
{
}

- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait
{
  BOOL v4 = wait;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __addOperations((objc_class *)self, a2, 0LL, (unint64_t)ops, 0);
  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( ops,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(ops);
          }
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((void *)&v11 + 1) + 8 * v9++));
        }

        while (v7 != v9);
        uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( ops,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      }

      while (v7);
    }
  }

- (void)addOperationWithBlock:(void *)block
{
  BOOL v4 = +[NSBlockOperation blockOperationWithBlock:](&OBJC_CLASS___NSBlockOperation, "blockOperationWithBlock:", block);
  uint64_t property_qos = oq_get_property_qos((uint64_t)self);
  if (property_qos) {
    -[NSOperation setQualityOfService:](v4, "setQualityOfService:", property_qos);
  }
  -[NSOperationQueue addOperation:](self, "addOperation:", v4);
}

- (void)addBarrierBlock:(void *)barrier
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  firstOperation = self->_iqp.__firstOperation;
  if (firstOperation)
  {
    v10.receiver = objc_alloc(&OBJC_CLASS____NSBarrierOperation);
    v10.super_class = (Class)&OBJC_CLASS____NSBarrierOperation;
    uint64_t v8 = -[NSOperationQueue init](&v10, sel_init);
    *(void *)&v8->_iqp.__nameBuffer[48] = _Block_copy(barrier);
    v8->_iqp.__nameBuffer[38] = 12;
    do
    {
      -[NSOperationQueue addDependency:](v8, "addDependency:", firstOperation);
      firstOperation = firstOperation->_iop.__nextOp;
    }

    while (firstOperation);
    __addOperations((objc_class *)self, a2, (uint64_t)v8, 0LL, 1);
    os_unfair_lock_unlock(&p_iqp->__queueLock);
    goto LABEL_5;
  }

  uint64_t v9 = oq_synthesize_backing_queue((uint64_t)self);
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  if (!v9)
  {
    uint64_t v8 = 0LL;
LABEL_5:

    __NSOQSchedule((uint64_t)self);
    return;
  }

  dispatch_barrier_async(v9, barrier);
  dispatch_release(v9);
}

- (NSArray)operations
{
  qos_class_t v3 = (NSArray *)[MEMORY[0x189603FA8] array];
  __NSOperationQueueGetOperations((uint64_t)self, v3, 0);
  return v3;
}

- (NSUInteger)operationCount
{
  return atomic_load(&self->_iqp.__operationCount);
}

- (NSProgress)progress
{
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  progress = self->_iqp._progress;
  if (!progress)
  {
    progress = (_NSOperationQueueProgress *)-[_NSOperationQueueProgress initWithQueue:]( objc_alloc(&OBJC_CLASS____NSOperationQueueProgress),  (uint64_t)self);
    self->_iqp._progress = progress;
  }

  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return &progress->super;
}

- (NSInteger)maxConcurrentOperationCount
{
  return self->_iqp.__maxNumOps;
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
{
  if (maxConcurrentOperationCount <= -2)
  {
    uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: count (%ld) cannot be negative", _NSMethodExceptionProem((objc_class *)self, a2), maxConcurrentOperationCount), 0 reason userInfo];
    objc_exception_throw(v7);
    -[NSOperationQueue isSuspended](v8, v9);
  }

  else if (!self->_iqp.__mainQ)
  {
    os_unfair_lock_lock(&self->_iqp.__queueLock);
    self->_iqp.__maxNumOps = maxConcurrentOperationCount;
    if (maxConcurrentOperationCount > 0x7FFFFFFF || maxConcurrentOperationCount == -1) {
      int v6 = 0x7FFFFFFF;
    }
    else {
      int v6 = maxConcurrentOperationCount;
    }
    self->_iqp.__actualMaxNumOps = v6;
    os_unfair_lock_unlock(&self->_iqp.__queueLock);
    __NSOQSchedule((uint64_t)self);
  }

- (BOOL)isSuspended
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iqp.__suspended);
  return v2 & 1;
}

- (void)setSuspended:(BOOL)suspended
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __33__NSOperationQueue_setSuspended___block_invoke;
    v5[3] = &unk_189C9F4F0;
    v5[4] = self;
    BOOL v6 = suspended;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationQueueSuspendedKeys,  1LL,  0LL,  0LL,  v5);
    if (!suspended) {
      __NSOQSchedule((uint64_t)self);
    }
  }

uint64_t __33__NSOperationQueue_setSuspended___block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)overcommitsOperations
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iqp.__overcommit);
  return v2 & 1;
}

- (void)setOvercommitsOperations:(BOOL)a3
{
  if (!self->_iqp.__mainQ)
  {
    p_overcommit = &self->_iqp.__overcommit;
    do
      unsigned __int8 v4 = __ldaxr((unsigned __int8 *)p_overcommit);
    while (__stlxr(a3, (unsigned __int8 *)p_overcommit));
    if ((v4 & 1) != a3)
    {
      backingQueue = (dispatch_object_s *)self->_iqp.__backingQueue;
      self->_iqp.__backingQueue = 0LL;
      self->_iqp.__nameBuffer[0] = 0;
      if (backingQueue) {
        dispatch_release(backingQueue);
      }
    }
  }

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result = oq_get_property_qos((uint64_t)self);
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
  NSQualityOfService v4 = NSQualityOfServiceDefault;
  if (!v3) {
    NSQualityOfService v4 = qualityOfService;
  }
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __40__NSOperationQueue_setQualityOfService___block_invoke;
    v5[3] = &unk_189C9E2F8;
    v5[4] = self;
    void v5[5] = v4;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationQualityOfServiceKeys,  1LL,  0LL,  0LL,  v5);
  }

void __40__NSOperationQueue_setQualityOfService___block_invoke(uint64_t a1)
{
}

- (dispatch_queue_t)underlyingQueue
{
  if (self->_iqp.__mainQ) {
    return (dispatch_queue_t)MEMORY[0x1895F8AE0];
  }
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  v5 = self->_iqp.__dispatch_queue;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return (dispatch_queue_t)v5;
}

- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue
{
  if (!self->_iqp.__mainQ)
  {
    if (__NSOperationQueueGetOperations((uint64_t)self, 0LL, 1))
    {
      uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: operation queue must be empty in order to change underlying dispatch queue", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v7);
      -[NSOperationQueue name](v8, v9);
    }

    else
    {
      if (underlyingQueue) {
        dispatch_retain(underlyingQueue);
      }
      dispatch_queue = (dispatch_object_s *)self->_iqp.__dispatch_queue;
      if (dispatch_queue) {
        dispatch_release(dispatch_queue);
      }
      self->_iqp.__dispatch_queue = (OS_dispatch_queue *)underlyingQueue;
    }
  }

- (NSString)name
{
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  name = self->_iqp.__name;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return name;
}

- (void)setName:(NSString *)name
{
  v3[6] = *MEMORY[0x1895F89C0];
  if (!self->_iqp.__mainQ)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __28__NSOperationQueue_setName___block_invoke;
    v3[3] = &unk_189C991F0;
    v3[4] = self;
    v3[5] = name;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  &_NSOperationNameKeys,  1LL,  0LL,  0LL,  v3);
  }

void __28__NSOperationQueue_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    BOOL v3 = *(__CFString **)(a1 + 40);
  }
  else {
    BOOL v3 = &stru_189CA6A28;
  }
  NSQualityOfService v4 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = -[__CFString copy](v3, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

- (void)cancelAllOperations
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!self->_iqp.__mainQ)
  {
    BOOL v3 = (void *)[MEMORY[0x189603FA8] array];
    __NSOperationQueueGetOperations((uint64_t)self, v3, 1);
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          __NSOPERATIONQUEUE_IS_CANCELLING_AN_OPERATION__(*(void **)(*((void *)&v9 + 1) + 8 * v7++));
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
      }

      while (v5);
    }
  }

- (void)waitUntilAllOperationsAreFinished
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  BOOL v3 = self;
  for (i = (void *)objc_opt_new(); ; [i removeAllObjects])
  {
    __NSOperationQueueGetOperations((uint64_t)self, i, 1);
    if (![i count]) {
      break;
    }
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v5 = [i countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(i);
          }
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((void *)&v10 + 1) + 8 * v8++));
        }

        while (v6 != v8);
        uint64_t v6 = [i countByEnumeratingWithState:&v10 objects:v9 count:16];
      }

      while (v6);
    }
  }
}

- (id)__graphDescription
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  BOOL v3 = (void *)[&stru_189CA6A28 mutableCopy];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = -[NSOperationQueue operations](self, "operations");
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( v3,  "appendString:",  objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "__graphDescription:", 0));
        [v3 appendString:@"\n"];
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (NSString)description
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSOperationQueue name](self, "name");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSOperationQueue;
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{name = '%@'}",  -[NSOperationQueue description](&v6, sel_description),  v3);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSOperationQueue;
    return -[NSOperationQueue description](&v5, sel_description);
  }

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (([a4 isEqualToString:@"operations"] & 1) == 0)
  {
    if ([a4 isEqualToString:@"operationCount"])
    {
      p_operationCountObserverCount = &self->_iqp.__operationCountObserverCount;
      do
        int v15 = __ldaxr(p_operationCountObserverCount);
      while (__stlxr(v15 + 1, p_operationCountObserverCount));
      if (v15 == 255)
      {
        atomic_store(0xFFu, p_operationCountObserverCount);
        __int128 v13 = @"operationCount";
        goto LABEL_12;
      }
    }

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSOperationQueue;
  -[NSOperationQueue removeObserver:forKeyPath:](&v9, sel_removeObserver_forKeyPath_, a3);
  if ([a4 isEqualToString:@"operations"])
  {
    uint64_t v6 = 503LL;
  }

  else
  {
    uint64_t v6 = 504LL;
  }

  uint64_t v7 = (unsigned __int8 *)self + v6;
  do
    unsigned __int8 v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
}

- (void)_fc_addUncancellableOperationWithBlock:(id)a3
{
}

- (void)_fc_addUncancellableOperationForReactorID:(id)a3 block:(id)a4
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke;
  v4[3] = &unk_189C9FF78;
  v4[4] = a3;
  v4[5] = a4;
  -[NSOperationQueue addOperation:]( self,  "addOperation:",  +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS____NSFCUncancellableBlockOperation,  "blockOperationWithBlock:",  v4));
}

void __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  id v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  @"_NSCurrentReactorID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  @"_NSCurrentReactorID");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v3,  @"_NSCurrentReactorID");
}

@end