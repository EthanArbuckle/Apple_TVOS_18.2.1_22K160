@interface OSADiagnosticMonitorClient
+ (OSADiagnosticMonitorClient)sharedClient;
- (OSADiagnosticMonitorClient)init;
- (id)q_shimWrappingObserver:(id)a3 creatingIfAbsent:(BOOL)a4 removingIfPresent:(BOOL)a5;
- (void)addObserver:(id)a3 forTypes:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation OSADiagnosticMonitorClient

+ (OSADiagnosticMonitorClient)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  return (OSADiagnosticMonitorClient *)(id)sharedClient__sharedInstance;
}

void __42__OSADiagnosticMonitorClient_sharedClient__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedClient__sharedInstance;
  sharedClient__sharedInstance = v0;
}

- (OSADiagnosticMonitorClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSADiagnosticMonitorClient;
  v2 = -[OSADiagnosticMonitorClient init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalytics.diagnosticsmonitorclient", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v5;
  }

  return v2;
}

- (void)addObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke;
  block[3] = &unk_189E1D478;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[OSADiagnosticMonitor sharedMonitor](&OBJC_CLASS___OSADiagnosticMonitor, "sharedMonitor");
  [v2 addEventObserver:v4 forTypes:*(void *)(a1 + 48)];

  +[OSADiagnosticMonitor sharedMonitor](&OBJC_CLASS___OSADiagnosticMonitor, "sharedMonitor");
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addWriteObserver:v4 forTypes:*(void *)(a1 + 48)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__OSADiagnosticMonitorClient_removeObserver___block_invoke;
  block[3] = &unk_189E1D410;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __45__OSADiagnosticMonitorClient_removeObserver___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v1 = +[OSADiagnosticMonitor sharedMonitor](&OBJC_CLASS___OSADiagnosticMonitor, "sharedMonitor");
    [v1 removeEventObserver:v3];
    v2 = +[OSADiagnosticMonitor sharedMonitor](&OBJC_CLASS___OSADiagnosticMonitor, "sharedMonitor");
    [v2 removeWriteObserver:v3];
  }
}

- (id)q_shimWrappingObserver:(id)a3 creatingIfAbsent:(BOOL)a4 removingIfPresent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  observers = self->_observers;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke;
  v15[3] = &unk_189E1D5C0;
  id v10 = v8;
  id v16 = v10;
  uint64_t v11 = -[NSMutableArray indexOfObjectPassingTest:](observers, "indexOfObjectPassingTest:", v15);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      id v12 = -[ObserverShim initWithObserver:](objc_alloc(&OBJC_CLASS___ObserverShim), "initWithObserver:", v10);
      -[NSMutableArray addObject:](self->_observers, "addObject:", v12);
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = v11;
    -[NSMutableArray objectAtIndexedSubscript:](self->_observers, "objectAtIndexedSubscript:", v11);
    id v12 = (ObserverShim *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      -[NSMutableArray removeObjectAtIndex:](self->_observers, "removeObjectAtIndex:", v13);
    }
  }

  return v12;
}

uint64_t __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 matches:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end