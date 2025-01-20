@interface NSConcreteObservationBuffer
- (BOOL)automaticallyEmitsObjects;
- (BOOL)isMemoryPressureSensitive;
- (NSConcreteObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5;
- (id)bufferFullHandler;
- (void)_alreadyOnQueueEmitAllObjects;
- (void)_alreadyOnQueueEmitObject;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)emitAllObjects;
- (void)emitObject;
- (void)setAutomaticallyEmitsObjects:(BOOL)a3;
- (void)setBufferFullHandler:(id)a3;
- (void)setMemoryPressureSensitive:(BOOL)a3;
@end

@implementation NSConcreteObservationBuffer

- (NSConcreteObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSConcreteObservationBuffer;
  v8 = -[NSObservationBuffer initWithMaximumObjectCount:fullPolicy:outputQueue:]( &v10,  sel_initWithMaximumObjectCount_fullPolicy_outputQueue_);
  if (v8)
  {
    v8->_dequeue = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v8->_policy = a4;
    v8->_maxCount = a3;
    v8->_outputQueue = (NSOperationQueue *)a5;
    v8->_inputQueue = (OS_dispatch_queue *)dispatch_queue_create("Input Queue", 0LL);
    v8->_automaticallyEmitsObjects = 1;
    pthread_mutex_init(&v8->_lock, 0LL);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);

  self->_dequeue = 0LL;
  pthread_mutex_unlock(p_lock);

  dispatch_release((dispatch_object_t)self->_inputQueue);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSConcreteObservationBuffer;
  -[NSObservationSource dealloc](&v4, sel_dealloc);
}

- (void)_alreadyOnQueueEmitObject
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v3 = _popFront((uint64_t)self);
  objc_super v4 = v3[1];
  int v5 = *((_DWORD *)v3 + 6);
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(&v10);
  MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
  v9 = objc_constructInstance(v8, (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v9[6] = v5;
  *((void *)v9 + 1) = v4;
  *((void *)v9 + 2) = self;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___NSConcreteObservationBuffer;
    -[NSConcreteObservationBuffer _receiveBox:](&v11, sel__receiveBox_, v9);
  }

- (void)emitObject
{
  v3[5] = *MEMORY[0x1895F89C0];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__NSConcreteObservationBuffer_emitObject__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](outputQueue, "addOperationWithBlock:", v3);
}

uint64_t __41__NSConcreteObservationBuffer_emitObject__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alreadyOnQueueEmitObject];
}

- (void)_alreadyOnQueueEmitAllObjects
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  dispatch_suspend((dispatch_object_t)self->_inputQueue);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke;
  v8[3] = &unk_189CA1868;
  v8[4] = self;
  if (self->_state)
  {
    pthread_mutex_lock(&self->_lock);
    v3 = (void *)-[NSMutableArray copy](self->_dequeue, "copy");
    -[NSMutableArray removeAllObjects](self->_dequeue, "removeAllObjects");
    int updated = updateState((uint64_t)self);
    pthread_mutex_unlock(&self->_lock);
    if (updated == 2 || updated == 1) {
      (*(void (**)(void))(-[NSConcreteObservationBuffer bufferFullHandler](self, "bufferFullHandler") + 16))();
    }
    memset(v9, 0, sizeof(v9));
    unint64_t v5 = [v3 count];
    uint64_t v6 = v5;
    uint64_t v7 = (uint64_t *)v9;
    if (v5 >= 0x21) {
      uint64_t v7 = (uint64_t *)malloc(8 * v5);
    }
    objc_msgSend(v3, "getObjects:range:", v7, 0, v6);
    __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke((uint64_t)v8, v7, v6);
  }

  else
  {
    __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke( (uint64_t)v8,  (uint64_t *)&emptyValue,  1LL);
  }

  dispatch_resume((dispatch_object_t)self->_inputQueue);
}

uint64_t __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke( uint64_t result,  uint64_t *a2,  uint64_t a3)
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      uint64_t v6 = *a2++;
      uint64_t v7 = *(void *)(v5 + 32);
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v16 = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2;
      v17 = &unk_189CA1840;
      uint64_t v18 = v7;
      uint64_t v8 = *(void *)(v6 + 8);
      int v9 = *(_DWORD *)(v6 + 24);
      uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v19);
      MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
      v13 = objc_constructInstance(v12, (char *)&v15[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      v13[6] = v9;
      *((void *)v13 + 1) = v8;
      *((void *)v13 + 2) = v7;
      result = (uint64_t)v16(v15, (uint64_t)v13);
      --v3;
    }

    while (v3);
  }

  return result;
}

id __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2(id result, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)(a2 + 24))
  {
    v2.receiver = (id)*((void *)result + 4);
    v2.super_class = (Class)&OBJC_CLASS___NSConcreteObservationBuffer;
    return objc_msgSendSuper2(&v2, sel__receiveBox_, a2);
  }

  return result;
}

- (void)emitAllObjects
{
  v3[5] = *MEMORY[0x1895F89C0];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](outputQueue, "addOperationWithBlock:", v3);
}

uint64_t __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alreadyOnQueueEmitAllObjects];
}

- (void)_receiveBox:(id)a3
{
  v8[6] = *MEMORY[0x1895F89C0];
  if (self->_state == 2)
  {
    int64_t policy = self->_policy;
    if (policy == 2)
    {
      -[NSConcreteObservationBuffer _mergeChanges](self, "_mergeChanges");
    }

    else if (policy == 1)
    {
      do
        _popFront((uint64_t)self);
      while (self->_state == 2);
    }
  }

  uint64_t v6 = [a3 copyToHeap];
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3052000000LL;
  v8[3] = __Block_byref_object_copy__19;
  v8[4] = __Block_byref_object_dispose__19;
  void v8[5] = self;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__NSConcreteObservationBuffer__receiveBox___block_invoke;
  block[3] = &unk_189CA1890;
  block[4] = v6;
  block[5] = v8;
  dispatch_sync((dispatch_queue_t)self->_inputQueue, block);
  _Block_object_dispose(v8, 8);
}

uint64_t __43__NSConcreteObservationBuffer__receiveBox___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
  if (v1)
  {
    uint64_t v2 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 72));
    [*(id *)(v1 + 136) addObject:*(void *)(v2 + 32)];

    int updated = updateState(v1);
    result = pthread_mutex_unlock((pthread_mutex_t *)(v1 + 72));
    if (updated == 2 || updated == 1) {
      return (*(uint64_t (**)(void))([(id)v1 bufferFullHandler] + 16))();
    }
  }

  return result;
}

- (id)bufferFullHandler
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setBufferFullHandler:(id)a3
{
}

- (BOOL)automaticallyEmitsObjects
{
  return self->_automaticallyEmitsObjects;
}

- (void)setAutomaticallyEmitsObjects:(BOOL)a3
{
  self->_automaticallyEmitsObjects = a3;
}

- (BOOL)isMemoryPressureSensitive
{
  return self->_memoryPressureSensitive;
}

- (void)setMemoryPressureSensitive:(BOOL)a3
{
  self->_memoryPressureSensitive = a3;
}

@end