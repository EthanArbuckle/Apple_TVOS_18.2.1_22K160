@interface LARatchet
- (LARatchet)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (void)addObserver:(id)a3;
- (void)armWithOptions:(id)a3 completion:(id)a4;
- (void)cancelWithReason:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setContext:(id)a3;
- (void)stateWithCompletion:(id)a3;
@end

@implementation LARatchet

- (LARatchet)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LARatchet;
  v6 = -[LARatchet init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    uint64_t v8 = +[LARatchetManager sharedInstance](&OBJC_CLASS___LARatchetManager, "sharedInstance");
    ratchetManager = v7->_ratchetManager;
    v7->_ratchetManager = (LARatchetManager *)v8;
  }

  return v7;
}

- (void)armWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (([WeakRetained checkContextValidWithError:0] & 1) == 0)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___LAContext);

    objc_storeWeak((id *)&self->_context, v9);
    id WeakRetained = v9;
  }

  ratchetManager = self->_ratchetManager;
  -[LARatchet identifier](self, "identifier");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __39__LARatchet_armWithOptions_completion___block_invoke;
  v14[3] = &unk_189F98FB0;
  id v15 = WeakRetained;
  id v16 = v6;
  id v12 = WeakRetained;
  id v13 = v6;
  -[LARatchetManager performArmRequestWithIdentifier:context:options:completion:]( ratchetManager,  "performArmRequestWithIdentifier:context:options:completion:",  v11,  v12,  v7,  v14);
}

uint64_t __39__LARatchet_armWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)cancelWithReason:(id)a3 completion:(id)a4
{
  p_context = &self->_context;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained invalidate];

  ratchetManager = self->_ratchetManager;
  -[LARatchet identifier](self, "identifier");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  -[LARatchetManager cancelArmRequestWithIdentifier:reason:completion:]( ratchetManager,  "cancelArmRequestWithIdentifier:reason:completion:",  v11,  v8,  v7);
}

- (void)stateWithCompletion:(id)a3
{
  ratchetManager = self->_ratchetManager;
  p_context = &self->_context;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  -[LARatchetManager stateInContext:completion:](ratchetManager, "stateInContext:completion:", WeakRetained, v5);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end