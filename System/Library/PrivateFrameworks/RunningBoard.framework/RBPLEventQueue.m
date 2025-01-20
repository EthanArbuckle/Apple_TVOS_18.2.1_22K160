@interface RBPLEventQueue
- (RBPLEventQueue)init;
- (id)dequeueEvent;
- (void)enqueueEvent:(id)a3;
- (void)scheduleWork;
@end

@implementation RBPLEventQueue

- (RBPLEventQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBPLEventQueue;
  v2 = -[RBPLEventQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1896123B0] createBackgroundQueue:@"RBPowerlogEvent"];
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_scheduled = 0;
  }

  return v2;
}

- (void)scheduleWork
{
  if (MEMORY[0x189611CC8]) {
    RBSDispatchAsyncWithQoS();
  }
}

void __30__RBPLEventQueue_scheduleWork__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
  uint64_t v2 = [*(id *)(a1 + 32) dequeueEvent];
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      uint64_t v4 = [v3 event];
      [v3 identity];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v3 assertionCount];
      uint64_t v7 = [v3 pid];
      [v5 hostIdentifier];
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      [MEMORY[0x189607968] numberWithUnsignedInteger:v4];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v10 forKeyedSubscript:@"EventType"];

      if ((_DWORD)v7 == -1)
      {
        [v9 setObject:0 forKeyedSubscript:@"PID"];
        if (!v8)
        {
LABEL_7:
          [v9 setObject:0 forKeyedSubscript:@"HostPID"];
          goto LABEL_8;
        }
      }

      else
      {
        [MEMORY[0x189607968] numberWithInt:v7];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setObject:v11 forKeyedSubscript:@"PID"];

        if (!v8) {
          goto LABEL_7;
        }
      }

      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v8, "pid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v12 forKeyedSubscript:@"HostPID"];

LABEL_8:
      [v5 embeddedApplicationIdentifier];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v13 forKeyedSubscript:@"BundleID"];

      if ((v6 & 0x80000000) != 0)
      {
        [v9 setObject:0 forKeyedSubscript:@"AssertionCount"];
      }

      else
      {
        [MEMORY[0x189607968] numberWithInt:v6];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setObject:v14 forKeyedSubscript:@"AssertionCount"];
      }

      if (MEMORY[0x189611CC8]) {
        PLLogRegisteredEvent();
      }

      uint64_t v15 = [*(id *)(a1 + 32) dequeueEvent];

      v3 = (void *)v15;
    }

    while (v15);
  }

- (void)enqueueEvent:(id)a3
{
  if (MEMORY[0x189611CC8])
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v5);

    if (!self->_scheduled)
    {
      self->_scheduled = 1;
      -[RBPLEventQueue scheduleWork](self, "scheduleWork");
    }

    os_unfair_lock_unlock(p_lock);
  }

- (id)dequeueEvent
{
  if (MEMORY[0x189611CC8])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (-[NSMutableArray count](self->_eventQueue, "count"))
    {
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0LL);
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end