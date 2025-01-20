@interface LARatchetManager
+ (id)optionsForRatchetArmOptions:(id)a3;
+ (id)ratchetErrorForError:(id)a3;
+ (id)ratchetResultForResult:(id)a3;
+ (id)sharedInstance;
+ (int64_t)_optionForRatchetOption:(int64_t)a3;
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LARatchetManager)init;
- (LARatchetState)ratchetState;
- (id)createContext;
- (void)addObserver:(id)a3;
- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)cancelCurrentRatchetWithReason:(id)a3 completion:(id)a4;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)currentRatchetWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)enableFeatureWithReply:(id)a3;
- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)stateInContext:(id)a3 completion:(id)a4;
- (void)stateWithCompletion:(id)a3;
@end

@implementation LARatchetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  return (id)sharedInstance_sharedInstance;
}

void __34__LARatchetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LARatchetManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (LARatchetManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LARatchetManager;
  v2 = -[LARatchetManager init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189610788]) initWithContextProvider:v2];
    coreManager = v2->_coreManager;
    v2->_coreManager = (LACDTORatchetManager *)v3;
  }

  return v2;
}

- (BOOL)isFeatureEnabled
{
  return -[LACDTORatchetManager isFeatureEnabled](self->_coreManager, "isFeatureEnabled");
}

- (BOOL)isFeatureSupported
{
  return -[LACDTORatchetManager isFeatureSupported](self->_coreManager, "isFeatureSupported");
}

- (BOOL)isFeatureAvailable
{
  return -[LACDTORatchetManager isFeatureAvailable](self->_coreManager, "isFeatureAvailable");
}

- (BOOL)isFeatureStrictModeEnabled
{
  return -[LACDTORatchetManager isFeatureStrictModeEnabled](self->_coreManager, "isFeatureStrictModeEnabled");
}

- (BOOL)isSensorTrusted
{
  return -[LACDTORatchetManager isSensorTrusted](self->_coreManager, "isSensorTrusted");
}

- (LARatchetState)ratchetState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[LARatchetState initWithState:](objc_alloc(&OBJC_CLASS___LARatchetState), "initWithState:", v2);

  return v3;
}

- (void)stateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__LARatchetManager_stateWithCompletion___block_invoke;
  v7[3] = &unk_189F98EE8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  -[LACDTORatchetManager stateWithCompletion:](coreManager, "stateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__LARatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      [(id)objc_opt_class() ratchetErrorForError:v5];
      id v8 = (LARatchetState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, LARatchetState *))(v7 + 16))(v7, 0LL, v8);
    }

    else
    {
      id v8 = -[LARatchetState initWithState:](objc_alloc(&OBJC_CLASS___LARatchetState), "initWithState:", v9);
      (*(void (**)(uint64_t, LARatchetState *, void))(v7 + 16))(v7, v8, 0LL);
    }
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_189F98F10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  -[LACDTORatchetManager checkCanEnableFeatureWithCompletion:](coreManager, "checkCanEnableFeatureWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      [(id)objc_opt_class() ratchetErrorForError:v5];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }

    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0LL);
    }
  }
}

- (void)enableFeatureWithReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__LARatchetManager_enableFeatureWithReply___block_invoke;
  v7[3] = &unk_189F98F10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  -[LACDTORatchetManager enableFeatureWithReply:](coreManager, "enableFeatureWithReply:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__LARatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      [(id)objc_opt_class() ratchetErrorForError:v5];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }

    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0LL);
    }
  }
}

- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__LARatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke;
  v7[3] = &unk_189F98F10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  -[LACDTORatchetManager enableFeatureActivatingGracePeriodWithReply:]( coreManager,  "enableFeatureActivatingGracePeriodWithReply:",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__LARatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      [(id)objc_opt_class() ratchetErrorForError:v5];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }

    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0LL);
    }
  }
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke;
  v10[3] = &unk_189F98F38;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  -[LACDTORatchetManager disableFeatureWithContext:completion:]( coreManager,  "disableFeatureWithContext:completion:",  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_189F98F60;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  -[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]( coreManager,  "enableFeatureStrictModeWithCompletion:",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [(id)objc_opt_class() ratchetErrorForError:v6];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v10[3] = &unk_189F98F60;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  void v10[4] = self;
  id v11 = v9;
  -[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]( coreManager,  "disableFeatureStrictModeWithContext:completion:",  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [(id)objc_opt_class() ratchetErrorForError:v6];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = -[LARatchetObserverWrapper initWithObserver:]( objc_alloc(&OBJC_CLASS___LARatchetObserverWrapper),  "initWithObserver:",  v4);
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, v5, (void *)1);

  -[LACDTORatchetManager addObserver:](self->_coreManager, "addObserver:", v5);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = -[LARatchetObserverWrapper initWithObserver:]( objc_alloc(&OBJC_CLASS___LARatchetObserverWrapper),  "initWithObserver:",  v4);
  -[LACDTORatchetManager removeObserver:](self->_coreManager, "removeObserver:", v5);
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, 0LL, (void *)1);
}

- (void)reset
{
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  [(id)objc_opt_class() optionsForRatchetArmOptions:v12];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v17[3] = &unk_189F98F10;
  objc_copyWeak(&v19, &location);
  id v16 = v13;
  v17[4] = self;
  id v18 = v16;
  -[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]( coreManager,  "performArmRequestWithIdentifier:context:options:completion:",  v10,  v11,  v15,  v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)objc_opt_class();
    if (v5)
    {
      [v8 ratchetErrorForError:v5];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v9);
    }

    else
    {
      [v8 ratchetResultForResult:v10];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0LL);
    }
  }
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __46__LARatchetManager_stateInContext_completion___block_invoke;
  v10[3] = &unk_189F98EE8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  void v10[4] = self;
  id v11 = v9;
  -[LACDTORatchetManager stateInContext:completion:](coreManager, "stateInContext:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__LARatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      [(id)objc_opt_class() ratchetErrorForError:v5];
      id v8 = (LARatchetState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, LARatchetState *))(v7 + 16))(v7, 0LL, v8);
    }

    else
    {
      id v8 = -[LARatchetState initWithState:](objc_alloc(&OBJC_CLASS___LARatchetState), "initWithState:", v9);
      (*(void (**)(uint64_t, LARatchetState *, void))(v7 + 16))(v7, v8, 0LL);
    }
  }
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_189F98F38;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  -[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]( coreManager,  "cancelArmRequestWithIdentifier:reason:completion:",  v8,  v9,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

+ (id)ratchetResultForResult:(id)a3
{
  v21[4] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___LARatchetState);
  [MEMORY[0x189607968] numberWithInteger:*MEMORY[0x189610760]];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[LARatchetState initWithState:](v4, "initWithState:", v6);

  v20[0] = &unk_189FA0F50;
  [MEMORY[0x189607968] numberWithInteger:*MEMORY[0x189610748]];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = v7;
  v20[1] = &unk_189FA0F68;
  v20[2] = &unk_189FA0F80;
  [MEMORY[0x189607968] numberWithInteger:*MEMORY[0x189610750]];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v3 objectForKeyedSubscript:v10];
  id v12 = (void *)v11;
  id v13 = (void *)MEMORY[0x189604A80];
  if (v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = MEMORY[0x189604A80];
  }
  v21[2] = v14;
  v20[3] = &unk_189FA0F98;
  [MEMORY[0x189607968] numberWithInteger:*MEMORY[0x189610758]];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v15];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    v17 = v16;
  }
  else {
    v17 = v13;
  }
  v21[3] = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:4];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)ratchetErrorForError:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  +[LARatchetErrorBuilder ratchetErrorWithError:](&OBJC_CLASS___LARatchetErrorBuilder, "ratchetErrorWithError:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)optionsForRatchetArmOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_optionForRatchetOption:", objc_msgSend(v10, "integerValue"));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = v11;
            [v3 objectForKeyedSubscript:v10];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607968] numberWithInteger:v12];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v13 forKeyedSubscript:v14];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (int64_t)_optionForRatchetOption:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  switch(a3)
  {
    case 0LL:
      id v4 = (int64_t *)MEMORY[0x1896106E0];
      goto LABEL_20;
    case 1LL:
      id v4 = (int64_t *)MEMORY[0x1896106D0];
      goto LABEL_20;
    case 2LL:
      id v4 = (int64_t *)MEMORY[0x1896106D8];
      goto LABEL_20;
    case 4LL:
      id v4 = (int64_t *)MEMORY[0x189610720];
      goto LABEL_20;
    case 5LL:
      id v4 = (int64_t *)MEMORY[0x189610740];
      goto LABEL_20;
    case 7LL:
      id v4 = (int64_t *)MEMORY[0x189610738];
      goto LABEL_20;
    case 8LL:
      id v4 = (int64_t *)MEMORY[0x1896106F0];
      goto LABEL_20;
    case 9LL:
      id v4 = (int64_t *)MEMORY[0x1896106E8];
      goto LABEL_20;
    case 10LL:
      id v4 = (int64_t *)MEMORY[0x1896106F8];
      goto LABEL_20;
    case 11LL:
      id v4 = (int64_t *)MEMORY[0x189610710];
      goto LABEL_20;
    case 12LL:
      id v4 = (int64_t *)MEMORY[0x189610728];
      goto LABEL_20;
    case 13LL:
      id v4 = (int64_t *)MEMORY[0x189610708];
      goto LABEL_20;
    case 14LL:
      id v4 = (int64_t *)MEMORY[0x189610718];
      goto LABEL_20;
    case 15LL:
      id v4 = (int64_t *)MEMORY[0x1896106B8];
      goto LABEL_20;
    case 16LL:
      id v4 = (int64_t *)MEMORY[0x1896106C0];
      goto LABEL_20;
    case 17LL:
      id v4 = (int64_t *)MEMORY[0x189610730];
      goto LABEL_20;
    case 18LL:
      id v4 = (int64_t *)MEMORY[0x1896106C8];
      goto LABEL_20;
    case 19LL:
      id v4 = (int64_t *)MEMORY[0x189610700];
LABEL_20:
      int64_t result = *v4;
      break;
    default:
      return result;
  }

  return result;
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__LARatchetManager_enableFeatureWithCompletion___block_invoke;
  v6[3] = &unk_189F98F88;
  id v7 = v4;
  id v5 = v4;
  -[LARatchetManager enableFeatureWithReply:](self, "enableFeatureWithReply:", v6);
}

uint64_t __48__LARatchetManager_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)currentRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  +[LARatchetErrorBuilder genericErrorWithDebugDescription:]( &OBJC_CLASS___LARatchetErrorBuilder,  "genericErrorWithDebugDescription:",  @"This method has been deprecated");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
}

- (void)cancelCurrentRatchetWithReason:(id)a3 completion:(id)a4
{
  id v5 = a4;
  +[LARatchetErrorBuilder genericErrorWithDebugDescription:]( &OBJC_CLASS___LARatchetErrorBuilder,  "genericErrorWithDebugDescription:",  @"This method has been deprecated");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (id)createContext
{
  return objc_alloc_init(&OBJC_CLASS___LAContext);
}

- (void).cxx_destruct
{
}

@end