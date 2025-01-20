@interface EventObserver
- (BOOL)matches:(id)a3;
- (EventObserver)initWithObserver:(id)a3 bugTypes:(id)a4;
- (NSSet)bugTypes;
- (OSADiagnosticEventObserver)observer;
- (void)deliverEvent:(id)a3 on:(id)a4;
@end

@implementation EventObserver

- (EventObserver)initWithObserver:(id)a3 bugTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___EventObserver;
  v8 = -[EventObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    uint64_t v10 = [MEMORY[0x189604010] setWithArray:v7];
    bugTypes = v9->_bugTypes;
    v9->_bugTypes = (NSSet *)v10;
  }

  return v9;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  -[EventObserver observer](self, "observer");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)deliverEvent:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  bugTypes = self->_bugTypes;
  [v6 identity];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 bugType];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bugTypes) = -[NSSet containsObject:](bugTypes, "containsObject:", v10);

  if ((_DWORD)bugTypes)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __33__EventObserver_deliverEvent_on___block_invoke;
    v11[3] = &unk_189E1D410;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(v7, v11);
  }
}

void __33__EventObserver_deliverEvent_on___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [*(id *)(a1 + 40) identity];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 incidentID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) identity];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 bugType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) details];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained didReceiveDiagnosticLog:v3 ofType:v5 details:v6];
}

- (OSADiagnosticEventObserver)observer
{
  return (OSADiagnosticEventObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSSet)bugTypes
{
  return self->_bugTypes;
}

- (void).cxx_destruct
{
}

@end