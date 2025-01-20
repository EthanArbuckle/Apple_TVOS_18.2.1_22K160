@interface RBEventQueue
- (NSArray)events;
- (RBEventQueue)initWithQueue:(id)a3 timeProvider:(id)a4;
- (RBEventQueueEvent)nextEvent;
- (id)description;
- (unint64_t)count;
- (void)_queue_processEvents;
- (void)_queue_startEventTimer;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)batchModify:(id)a3;
- (void)removeEvent:(id)a3;
- (void)removeEvents:(id)a3;
@end

@implementation RBEventQueue

- (RBEventQueue)initWithQueue:(id)a3 timeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RBEventQueue;
  v9 = -[RBEventQueue init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [MEMORY[0x189603FA8] array];
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_timeProvider, a4);
  }

  return v10;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_eventQueue, "count");
}

- (RBEventQueueEvent)nextEvent
{
  return (RBEventQueueEvent *)-[NSMutableArray firstObject](self->_eventQueue, "firstObject");
}

- (void)batchModify:(id)a3
{
  queue = self->_queue;
  v6 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  if (self->_inModifyBlock)
  {
    v6[2]();
  }

  else
  {
    self->_inModifyBlock = 1;
    v6[2]();

    BOOL dirtyDuringModify = self->_dirtyDuringModify;
    *(_WORD *)&self->_inModifyBlock = 0;
    if (dirtyDuringModify) {
      -[NSMutableArray sortUsingComparator:](self->_eventQueue, "sortUsingComparator:", &__block_literal_global_4);
    }
    -[RBEventQueue _queue_startEventTimer]((uint64_t)self);
  }

uint64_t __28__RBEventQueue_batchModify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_queue_startEventTimer
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Event queue more than 5 seconds late, expected to fire at %f and it's now %f",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)addEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  int v4 = (void *)MEMORY[0x189603F18];
  id v5 = a3;
  [v4 arrayWithObjects:&v7 count:1];
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBEventQueue addEvents:](self, "addEvents:", v6, v7, v8);
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __26__RBEventQueue_addEvents___block_invoke;
    v5[3] = &unk_18A255B00;
    v5[4] = self;
    id v6 = v4;
    -[RBEventQueue batchModify:](self, "batchModify:", v5);
  }
}

uint64_t __26__RBEventQueue_addEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) addObjectsFromArray:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(a1 + 32) + 50LL) = 1;
  return result;
}

- (void)removeEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x189603F18];
  id v5 = a3;
  [v4 arrayWithObjects:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBEventQueue removeEvents:](self, "removeEvents:", v6, v7, v8);
}

- (void)removeEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __29__RBEventQueue_removeEvents___block_invoke;
    v5[3] = &unk_18A255B00;
    v5[4] = self;
    id v6 = v4;
    -[RBEventQueue batchModify:](self, "batchModify:", v5);
  }
}

uint64_t __29__RBEventQueue_removeEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsInArray:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(a1 + 32) + 50LL) = 1;
  return result;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[NSMutableArray count](self->_eventQueue, "count");
  -[NSMutableArray componentsJoinedByString:](self->_eventQueue, "componentsJoinedByString:", @",\n\t");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v3 initWithFormat:@"<%@| eventCount:%lu events:[\n\t%@\n\t]>", v4, v5, v6];

  return v7;
}

- (void)_queue_processEvents
{
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 3221225472LL;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2;
  activity_block[3] = &unk_18A255C70;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_188634000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2(uint64_t a1)
{
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_7(uint64_t a1)
{
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 3221225472LL;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2_8;
  activity_block[3] = &unk_18A255C70;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_188634000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2_8(uint64_t a1)
{
}

- (NSArray)events
{
  return &self->_eventQueue->super;
}

- (void).cxx_destruct
{
}

@end