@interface PFApplicationStateMonitor
- (PFApplicationStateMonitor)init;
- (void)applicationDidActivate:(id)a3;
- (void)applicationWillDeactivate:(id)a3;
- (void)dealloc;
@end

@implementation PFApplicationStateMonitor

- (PFApplicationStateMonitor)init
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PFApplicationStateMonitor;
  v2 = -[PFApplicationStateMonitor init](&v41, sel_init);
  if (v2)
  {
    if (_PF_USE_IOS_PLATFORM == 1)
    {
      v3 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "infoDictionary"),  "objectForKey:",  @"UIBackgroundModes");
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            if (*(void *)v38 != v5) {
              objc_enumerationMutation(v3);
            }
            v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (([v7 isEqualToString:@"audio"] & 1) != 0
              || ([v7 isEqualToString:@"bluetooth-central"] & 1) != 0
              || ([v7 isEqualToString:@"bluetooth-peripheral"] & 1) != 0
              || ([v7 isEqualToString:@"external-accessory"] & 1) != 0
              || ([v7 isEqualToString:@"fetch"] & 1) != 0
              || ([v7 isEqualToString:@"location"] & 1) != 0
              || ([v7 isEqualToString:@"processing"] & 1) != 0
              || [v7 isEqualToString:@"voip"])
            {
              v2->_backgroundTimeout = 30LL;
              goto LABEL_20;
            }
          }

          uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
    }

void __33__PFApplicationStateMonitor_init__block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = 1LL;
    v2 = (unsigned int *)(WeakRetained + 24);
    do
      unsigned int v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
    v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)WeakRetained + 6);
    uint64_t v5 = v4;
    if (v4) {
      [v4 applicationStateMonitorEnteredForeground:v6];
    }

    WeakRetained = v6;
  }
}

void __33__PFApplicationStateMonitor_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = 2LL;
    v8 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    unsigned int v3 = v2;
    if (v2) {
      [v2 applicationStateMonitorEnteredBackground:v8];
    }
    if (*((uint64_t *)v8 + 4) >= 1 && _PF_USE_IOS_PLATFORM == 1)
    {
      id v4 = (unsigned int *)(v8 + 24);
      do
        unsigned int v5 = __ldaxr(v4);
      while (__stlxr(v5, v4));
      dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL * *((void *)v8 + 4));
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke;
      block[3] = &unk_189EAB7A8;
      block[4] = v8;
      unsigned int v10 = v5;
      dispatch_after(v6, global_queue, block);
    }

    WeakRetained = v8;
  }
}

- (void)dealloc
{
  self->_appActivateLifecycleObserver = 0LL;
  self->_appDeactivateLifecycleObserver = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFApplicationStateMonitor;
  -[PFApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)applicationDidActivate:(id)a3
{
}

- (void)applicationWillDeactivate:(id)a3
{
}

void __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke(uint64_t a1)
{
  id v2 = (unsigned int *)(*(void *)(a1 + 32) + 24LL);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (*(_DWORD *)(a1 + 40) == v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48LL));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained applicationStateMonitorExpiredBackgroundActivityTimeout:*(void *)(a1 + 32)];
      id WeakRetained = v5;
    }
  }

- (void).cxx_destruct
{
}

@end