@interface LACDTORatchetManager
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LACDTORatchetManager)initWithContextProvider:(id)a3;
- (LACDTORatchetState)ratchetState;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (int64_t)_armPolicy;
- (void)_performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)addObserver:(id)a3;
- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithReply:(id)a3;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)stateCompositeInContext:(id)a3 completion:(id)a4;
- (void)stateCompositeWithCompletion:(id)a3;
- (void)stateInContext:(id)a3 completion:(id)a4;
- (void)stateWithCompletion:(id)a3;
@end

@implementation LACDTORatchetManager

- (LACDTORatchetManager)initWithContextProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTORatchetManager;
  v5 = -[LACDTORatchetManager init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    uint64_t v8 = +[LACDarwinNotificationCenter sharedInstance](&OBJC_CLASS___LACDarwinNotificationCenter, "sharedInstance");
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = (LACDarwinNotificationCenter *)v8;

    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __48__LACDTORatchetManager_initWithContextProvider___block_invoke;
    v13[3] = &unk_18A3688D0;
    id v14 = v4;
    uint64_t v10 = __48__LACDTORatchetManager_initWithContextProvider___block_invoke((uint64_t)v13);
    remoteObjectProxy = v5->_remoteObjectProxy;
    v5->_remoteObjectProxy = (LACDTOServiceXPCClient *)v10;
  }

  return v5;
}

LACDTOServiceXPCClient *__48__LACDTORatchetManager_initWithContextProvider___block_invoke(uint64_t a1)
{
  if (objc_opt_class())
  {
    v2 = -[LACDTORatchetEndpointProvider initWithContextProvider:]( objc_alloc(&OBJC_CLASS___LACDTORatchetEndpointProvider),  "initWithContextProvider:",  *(void *)(a1 + 32));
    v3 = -[LACDTOServiceXPCClient initWithEndpointProvider:]( objc_alloc(&OBJC_CLASS___LACDTOServiceXPCClient),  "initWithEndpointProvider:",  v2);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (BOOL)isFeatureEnabled
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureEnabled]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isFeatureEnabled];

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315138;
    uint64_t v10 = v7;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled returned %s", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)isFeatureSupported
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureSupported]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_7);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isFeatureSupported];

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureSupported]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureAvailable
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isFeatureAvailable];

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureStrictModeEnabled
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_9);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isFeatureStrictModeEnabled];

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isSensorTrusted
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isSensorTrusted]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_10);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isSensorTrusted];

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isSensorTrusted]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (LACDTORatchetState)ratchetState
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  LACLogDTOClient();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[LACDTORatchetManager ratchetState]";
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:]( self,  "_remoteObjectProxyWithErrorHandler:",  &__block_literal_global_11);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 ratchetState];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  LACLogDTOClient();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[LACDTORatchetManager ratchetState]";
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (LACDTORatchetState *)v5;
}

- (void)stateWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[LACDTORatchetManager stateWithCompletion:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke;
  v13[3] = &unk_18A3689D8;
  id v7 = v4;
  id v14 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke_12;
  v10[3] = &unk_18A368A00;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v7;
  id v11 = v9;
  [v8 ratchetStateWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOClient();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();
      }

      __int16 v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = "-[LACDTORatchetManager stateWithCompletion:]_block_invoke";
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s finished with state: %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      __int16 v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    v10();
  }
}

- (void)stateCompositeWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[LACDTORatchetManager stateCompositeWithCompletion:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke;
  v13[3] = &unk_18A3689D8;
  id v7 = v4;
  id v14 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_14;
  v10[3] = &unk_18A368A28;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v7;
  id v11 = v9;
  [v8 ratchetStateCompositeWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_14( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOClient();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();
      }

      __int16 v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = "-[LACDTORatchetManager stateCompositeWithCompletion:]_block_invoke";
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s finished with state: %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      __int16 v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    v10();
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v12[3] = &unk_18A3689D8;
  id v7 = v4;
  id v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_16;
  v10[3] = &unk_18A368A50;
  id v11 = v7;
  id v9 = v7;
  [v8 checkCanEnableFeatureWithCompletion:v10];
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_16( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    __int16 v10 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[LACDTORatchetManager enableFeatureWithReply:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke;
  v12[3] = &unk_18A3689D8;
  id v7 = v4;
  id v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_18;
  v10[3] = &unk_18A368A50;
  id v11 = v7;
  id v9 = v7;
  [v8 enableFeatureWithCompletion:v10];
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    __int16 v10 = "-[LACDTORatchetManager enableFeatureWithReply:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[LACDTORatchetManager enableFeatureActivatingGracePeriodWithReply:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke;
  v12[3] = &unk_18A3689D8;
  id v7 = v4;
  id v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_19;
  v10[3] = &unk_18A368A50;
  id v11 = v7;
  id v9 = v7;
  [v8 enableFeatureActivatingGracePeriodWithCompletion:v10];
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_19( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    __int16 v10 = "-[LACDTORatchetManager enableFeatureActivatingGracePeriodWithReply:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  LACLogDTOClient();
  os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]";
    _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke;
  v16[3] = &unk_18A3689D8;
  id v10 = v6;
  id v17 = v10;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 uuid];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_20;
  v14[3] = &unk_18A3689D8;
  id v15 = v10;
  id v13 = v10;
  [v11 disableFeatureWithContext:v12 completion:v14];
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = 16 * (v3 != 0LL);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_189219000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v12[3] = &unk_18A3689D8;
  id v7 = v4;
  id v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_21;
  v10[3] = &unk_18A3689D8;
  id v11 = v7;
  id v9 = v7;
  [v8 enableFeatureStrictModeWithCompletion:v10];
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_21( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = 16 * (v3 != 0LL);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_189219000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  LACLogDTOClient();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]";
    _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v16[3] = &unk_18A3689D8;
  id v10 = v6;
  id v17 = v10;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 uuid];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_22;
  v14[3] = &unk_18A3689D8;
  id v15 = v10;
  id v13 = v10;
  [v11 disableFeatureStrictModeWithContext:v12 completion:v14];
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_22( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = 16 * (v3 != 0LL);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_189219000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)addObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[LACDTORatchetManager addObserver:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  if (!-[LACDarwinNotificationCenter hasObserver:](self->_notificationCenter, "hasObserver:", self)) {
    -[LACDarwinNotificationCenter addObserver:notification:]( self->_notificationCenter,  "addObserver:notification:",  self,  @"com.apple.LocalAuthentication.ratchet.StateDidChange");
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOClient();
  os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[LACDTORatchetManager removeObserver:]";
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
  if (!-[NSHashTable count](self->_observers, "count")) {
    -[LACDarwinNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
  }
}

- (void)reset
{
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  LACLogDTOClient();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]";
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "%s context:%{public}@ identifier:%{public}@ options:%{public}@",  buf,  0x2Au);
  }

  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v16[3] = &unk_18A368A50;
  id v17 = v13;
  id v15 = v13;
  -[LACDTORatchetManager _performArmRequestWithIdentifier:context:options:completion:]( self,  "_performArmRequestWithIdentifier:context:options:completion:",  v10,  v11,  v12,  v16);
}

void __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  LACLogDTOClient();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[LACDTORatchetManager stateInContext:completion:]";
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __50__LACDTORatchetManager_stateInContext_completion___block_invoke;
  v8[3] = &unk_18A368A78;
  id v9 = v5;
  id v7 = v5;
  -[LACDTORatchetManager stateWithCompletion:](self, "stateWithCompletion:", v8);
}

void __50__LACDTORatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager stateInContext:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)stateCompositeInContext:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  LACLogDTOClient();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[LACDTORatchetManager stateCompositeInContext:completion:]";
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke;
  v8[3] = &unk_18A368AA0;
  id v9 = v5;
  id v7 = v5;
  -[LACDTORatchetManager stateCompositeWithCompletion:](self, "stateCompositeWithCompletion:", v8);
}

void __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogDTOClient();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v8 = 16 * (v6 != 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager stateCompositeInContext:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( &dword_189219000,  v7,  v8,  "%s finished with result: %{public}@, error: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LACLogDTOClient();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]";
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier:%{public}@, reason:%{public}@", buf, 0x20u);
  }

  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v18[3] = &unk_18A3689D8;
  id v13 = v10;
  id v19 = v13;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v18);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_23;
  v16[3] = &unk_18A3689D8;
  id v17 = v13;
  id v15 = v13;
  [v14 cancelPendingEvaluationWithRatchetIdentifier:v8 reason:v9 completion:v16];
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_23( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOClient();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = 16 * (v3 != 0LL);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_189219000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  int64_t v14 = -[LACDTORatchetManager _armPolicy](self, "_armPolicy");
  uint64_t v15 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v25[3] = &unk_18A368AC8;
  id v16 = v12;
  id v26 = v16;
  id v17 = v10;
  id v27 = v17;
  __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke((uint64_t)v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472LL;
  v21[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2;
  v21[3] = &unk_18A368B18;
  objc_copyWeak(&v24, &location);
  id v19 = v11;
  id v22 = v19;
  id v20 = v13;
  id v23 = v20;
  [v19 evaluateCorePolicy:v14 options:v18 reply:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

id __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke( uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  os_log_type_t v5 = v4;

  uint64_t v6 = *(void *)(a1 + 40);
  [MEMORY[0x189607968] numberWithInteger:1066];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:v7];

  return v5;
}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2( id *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = a1[4];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3;
    v9[3] = &unk_18A368AF0;
    objc_copyWeak(&v14, a1 + 6);
    id v13 = a1[5];
    id v10 = v6;
    id v11 = a1[4];
    id v12 = v5;
    [WeakRetained stateCompositeInContext:v8 completion:v9];

    objc_destroyWeak(&v14);
  }
}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  v38[5] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    else
    {
      id v8 = *(void **)(a1 + 32);
      if (v8)
      {
        [v8 userInfo];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = (void *)[v9 mutableCopy];
        id v11 = v10;
        if (v10) {
          id v12 = v10;
        }
        else {
          id v12 = (id)objc_opt_new();
        }
        id v26 = v12;

        [v5 ratchetState];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 setObject:v27 forKeyedSubscript:@"RatchetState"];

        [v26 setObject:v5 forKeyedSubscript:@"RatchetStateComposite"];
        id v28 = objc_alloc(MEMORY[0x189607870]);
        [*(id *)(a1 + 32) domain];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend( v28,  "initWithDomain:code:userInfo:",  v29,  objc_msgSend(*(id *)(a1 + 32), "code"),  v26);

        (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
      }

      else
      {
        uint64_t v33 = *(void *)(a1 + 56);
        [MEMORY[0x189607968] numberWithInteger:21];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v36;
        v38[0] = *(void *)(a1 + 40);
        [MEMORY[0x189607968] numberWithInteger:22];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v35;
        [v5 ratchetState];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v34;
        [MEMORY[0x189607968] numberWithInteger:23];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v32;
        v38[2] = v5;
        [MEMORY[0x189607968] numberWithInteger:1];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[3] = v31;
        id v13 = *(void **)(a1 + 48);
        [MEMORY[0x189607968] numberWithInteger:1];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];
        id v16 = (void *)v15;
        uint64_t v17 = MEMORY[0x189604A80];
        if (v15) {
          uint64_t v18 = v15;
        }
        else {
          uint64_t v18 = MEMORY[0x189604A80];
        }
        v38[3] = v18;
        [MEMORY[0x189607968] numberWithInteger:3];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37[4] = v19;
        id v20 = *(void **)(a1 + 48);
        [MEMORY[0x189607968] numberWithInteger:3];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v20 objectForKeyedSubscript:v21];
        id v23 = (void *)v22;
        if (v22) {
          uint64_t v24 = v22;
        }
        else {
          uint64_t v24 = v17;
        }
        v38[4] = v24;
        [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:5];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void))(v33 + 16))(v33, v25, 0LL);
      }
    }
  }
}

- (int64_t)_armPolicy
{
  return 1026LL;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  if (self->_notificationCenter == a3
    && LACDarwinNotificationsEqual(a4, @"com.apple.LocalAuthentication.ratchet.StateDidChange"))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke;
    v5[3] = &unk_18A368B68;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1895F8AE0], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2;
    v3[3] = &unk_18A368B40;
    objc_copyWeak(&v4, v1);
    [WeakRetained stateWithCompletion:v3];
    objc_destroyWeak(&v4);
  }
}

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    LACLogDTOClient();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v7[1] count];
      *(_DWORD *)buf = 67109378;
      int v21 = v9;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "Will notify %d observers about new state: %{public}@",  buf,  0x12u);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v10 = v7[1];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "ratchetStateDidChange:", v5, (void)v15);
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v12);
    }
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  remoteObjectProxy = self->_remoteObjectProxy;
  if (remoteObjectProxy)
  {
    id v4 = remoteObjectProxy;
  }

  else
  {
    id v6 = a3;
    +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Platform not supported");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v6, v7);
  }

  return remoteObjectProxy;
}

- (void).cxx_destruct
{
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1()
{
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1()
{
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1()
{
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_cold_1()
{
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1()
{
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1()
{
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1()
{
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1()
{
}

@end