@interface WriteObserver
- (BOOL)matches:(id)a3;
- (NSSet)bugTypes;
- (OSADiagnosticWriteObserver)observer;
- (WriteObserver)initWithObserver:(id)a3 bugTypes:(id)a4;
- (void)deliverDidWrite:(id)a3 on:(id)a4;
- (void)deliverWillWrite:(id)a3 on:(id)a4;
@end

@implementation WriteObserver

- (WriteObserver)initWithObserver:(id)a3 bugTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WriteObserver;
  v8 = -[WriteObserver init](&v13, sel_init);
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
  -[WriteObserver observer](self, "observer");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)deliverWillWrite:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  bugTypes = self->_bugTypes;
  [v6 bugType];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bugTypes) = -[NSSet containsObject:](bugTypes, "containsObject:", v9);

  if ((_DWORD)bugTypes)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __37__WriteObserver_deliverWillWrite_on___block_invoke;
    v10[3] = &unk_189E1D410;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(v7, v10);
  }
}

void __37__WriteObserver_deliverWillWrite_on___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [*(id *)(a1 + 40) incidentID];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) bugType];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained willWriteDiagnosticLog:v2 ofType:v3];
}

- (void)deliverDidWrite:(id)a3 on:(id)a4
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
    v11[2] = __36__WriteObserver_deliverDidWrite_on___block_invoke;
    v11[3] = &unk_189E1D410;
    id v12 = v6;
    objc_super v13 = self;
    dispatch_async(v7, v11);
  }
}

void __36__WriteObserver_deliverDidWrite_on___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
    [*(id *)(a1 + 32) identity];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 incidentID];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) identity];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 bugType];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) filePath];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained didWriteDiagnosticLog:v4 ofType:v6 toPath:v7];
  }

  else
  {
    [*(id *)(a1 + 32) error];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
    [*(id *)(a1 + 32) identity];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 incidentID];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) identity];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 bugType];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) error];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained failedToWriteDiagnosticLog:v4 ofType:v6 error:v7];
  }
}

- (OSADiagnosticWriteObserver)observer
{
  return (OSADiagnosticWriteObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSSet)bugTypes
{
  return self->_bugTypes;
}

- (void).cxx_destruct
{
}

@end