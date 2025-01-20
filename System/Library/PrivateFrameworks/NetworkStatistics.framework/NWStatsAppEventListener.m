@interface NWStatsAppEventListener
- (NWAppStateEventListenerDelegate)appStateDelegate;
- (NWStatsAppEventListener)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (RBSProcessMonitor)appStateMonitor;
- (void)_applicationStateMonitorInit;
- (void)cleanupAppStateMonitor;
- (void)dealloc;
- (void)setAppStateDelegate:(id)a3;
- (void)setAppStateMonitor:(id)a3;
@end

@implementation NWStatsAppEventListener

- (void)_applicationStateMonitorInit
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v3 = dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 4);
  self->_runningBoradDylibHandle = v3;
  if (v3
    && (self->_Class RBSProcessMonitorClass = objc_getClass("RBSProcessMonitor"),
        self->_Class RBSProcessPredicateClass = objc_getClass("RBSProcessPredicate"),
        Class = objc_getClass("RBSProcessStateDescriptor"),
        self->_Class RBSProcessStateDescriptorClass = Class,
        self->_runningBoradDylibHandle)
    && (v5 = Class, (Class v6 = self->_RBSProcessMonitorClass) != 0LL)
    && self->_RBSProcessPredicateClass
    && v5)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke;
    v14[3] = &unk_18A1B62C0;
    v14[4] = self;
    -[objc_class monitorWithConfiguration:](v6, "monitorWithConfiguration:", v14);
    v7 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
    appStateMonitor = self->_appStateMonitor;
    self->_appStateMonitor = v7;
  }

  else
  {
    NStatGetLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      Class RBSProcessMonitorClass = self->_RBSProcessMonitorClass;
      Class RBSProcessPredicateClass = self->_RBSProcessPredicateClass;
      Class RBSProcessStateDescriptorClass = self->_RBSProcessStateDescriptorClass;
      runningBoradDylibHandle = self->_runningBoradDylibHandle;
      *(_DWORD *)buf = 134218752;
      v16 = runningBoradDylibHandle;
      __int16 v17 = 2048;
      Class v18 = RBSProcessMonitorClass;
      __int16 v19 = 2048;
      Class v20 = RBSProcessPredicateClass;
      __int16 v21 = 2048;
      Class v22 = RBSProcessStateDescriptorClass;
      _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_FAULT,  "RB Mapping dylib failure handle %p proc monitor %p predicate %p descriptor %p",  buf,  0x2Au);
    }
  }

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke(id *a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = (id *)a1[4];
  a1 += 4;
  [v4[4] descriptor];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setValues:1];
  [v5 setEndowmentNamespaces:&unk_18A1C6148];
  [v3 setStateDescriptor:v5];
  [v3 setEvents:1];
  v10[0] = [*((id *)*a1 + 3) performSelector:NSSelectorFromString(@"predicateForSymptomsd")];
  [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
  Class v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setPredicates:v6];

  objc_initWeak(&location, *a1);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2;
  v7[3] = &unk_18A1B6298;
  objc_copyWeak(&v8, &location);
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained queue];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v9 queue];
      v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3;
      block[3] = &unk_18A1B6270;
      block[4] = v9;
      id v13 = v7;
      id v14 = v6;
      dispatch_async(v11, block);
    }
  }
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [v2 handleStateUpdate:*(void *)(a1 + 40) forProcess:*(void *)(a1 + 48)];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsAppEventListener;
  -[NWStatsAppEventListener dealloc](&v3, sel_dealloc);
}

- (void)cleanupAppStateMonitor
{
  appStateMonitor = self->_appStateMonitor;
  if (appStateMonitor)
  {
    -[RBSProcessMonitor invalidate](appStateMonitor, "invalidate");
    v4 = self->_appStateMonitor;
    self->_appStateMonitor = 0LL;
  }

- (void)setAppStateDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStateDelegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appStateDelegate, obj);
    if (obj) {
      -[NWStatsAppEventListener _applicationStateMonitorInit](self, "_applicationStateMonitorInit");
    }
    else {
      -[NWStatsAppEventListener cleanupAppStateMonitor](self, "cleanupAppStateMonitor");
    }
  }
}

- (NWStatsAppEventListener)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWStatsAppEventListener;
  id v6 = -[NWStatsAppEventListener init](&v9, sel_init);
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (NWAppStateEventListenerDelegate)appStateDelegate
{
  return (NWAppStateEventListenerDelegate *)objc_loadWeakRetained((id *)&self->_appStateDelegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RBSProcessMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end