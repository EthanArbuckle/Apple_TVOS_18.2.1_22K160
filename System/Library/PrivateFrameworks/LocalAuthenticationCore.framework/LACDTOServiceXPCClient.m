@interface LACDTOServiceXPCClient
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LACDTOServiceXPCClient)initWithEndpointProvider:(id)a3;
- (id)_connectionWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)ratchetState;
- (void)_handleConnectionClose;
- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)dealloc;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
@end

@implementation LACDTOServiceXPCClient

- (LACDTOServiceXPCClient)initWithEndpointProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOServiceXPCClient;
  v6 = -[LACDTOServiceXPCClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointProvider, a3);
    v7->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LACDTOServiceXPCClient;
  -[LACDTOServiceXPCClient dealloc](&v3, sel_dealloc);
}

- (id)ratchetState
{
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  uint64_t v2 = MEMORY[0x1895F87A8];
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke;
  v7[3] = &unk_18A369E38;
  v7[4] = &v8;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v7);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472LL;
  v6[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3;
  v6[3] = &unk_18A369E60;
  v6[4] = &v8;
  [v3 ratchetStateWithCompletion:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    LACLogDTO();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1();
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  objc_super v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (BOOL)isFeatureEnabled
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke;
  v6[3] = &unk_18A369E38;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472LL;
  v5[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5;
  v5[3] = &unk_18A369E88;
  v5[4] = &v7;
  [v3 checkIsFeatureEnabledWithCompletion:v5];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    LACLogDTO();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1();
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

- (BOOL)isFeatureSupported
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke;
  v6[3] = &unk_18A369E38;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472LL;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7;
  v5[3] = &unk_18A369E88;
  v5[4] = &v7;
  [v3 checkIsFeatureSupportedWithCompletion:v5];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    LACLogDTO();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1();
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

- (BOOL)isFeatureAvailable
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke;
  v6[3] = &unk_18A369E38;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472LL;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8;
  v5[3] = &unk_18A369E88;
  v5[4] = &v7;
  [v3 checkIsFeatureAvailableWithCompletion:v5];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    LACLogDTO();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1();
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

- (BOOL)isFeatureStrictModeEnabled
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke;
  v6[3] = &unk_18A369E38;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472LL;
  v5[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9;
  v5[3] = &unk_18A369E88;
  v5[4] = &v7;
  [v3 checkIsFeatureStrictModeEnabledWithCompletion:v5];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    LACLogDTO();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1();
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

- (BOOL)isSensorTrusted
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke;
  v6[3] = &unk_18A369E38;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472LL;
  v5[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10;
  v5[3] = &unk_18A369E88;
  v5[4] = &v7;
  [v3 checkIsSensorTrustedWithCompletion:v5];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LACLogDTO();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    LACLogDTO();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1();
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 ratchetStateWithCompletion:v5];
}

uint64_t __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 ratchetStateCompositeWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 checkIsFeatureEnabledWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 checkIsFeatureSupportedWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 checkIsFeatureAvailableWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 checkIsFeatureStrictModeEnabledWithCompletion:v5];
}

uint64_t __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 disableFeatureWithContext:v7 completion:v6];
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 checkCanEnableFeatureWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 enableFeatureWithCompletion:v5];
}

uint64_t __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __75__LACDTOServiceXPCClient_enableFeatureActivatingGracePeriodWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 enableFeatureActivatingGracePeriodWithCompletion:v5];
}

uint64_t __75__LACDTOServiceXPCClient_enableFeatureActivatingGracePeriodWithCompletion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_18A3689D8;
  id v8 = v4;
  id v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 enableFeatureStrictModeWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke;
  v10[3] = &unk_18A3689D8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 disableFeatureStrictModeWithContext:v8 completion:v7];
}

uint64_t __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_18A3689D8;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  v12 = -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  [v12 cancelPendingEvaluationWithRatchetIdentifier:v11 reason:v10 completion:v9];
}

uint64_t __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  -[LACDTOServiceXPCClient _connectionWithErrorHandler:](self, "_connectionWithErrorHandler:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 remoteObjectProxyWithErrorHandler:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  -[LACDTOServiceXPCClient _connectionWithErrorHandler:](self, "_connectionWithErrorHandler:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connectionWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    endpointProvider = self->_endpointProvider;
    id v17 = 0LL;
    -[LACDTOServiceXPCEndpointProvider endpoint:](endpointProvider, "endpoint:", &v17);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (uint64_t)v17;
    if (v7)
    {
      id v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v7];
      connection = self->_connection;
      self->_connection = v8;

      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C795E38];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v10);

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke;
      aBlock[3] = &unk_18A368B68;
      objc_copyWeak(&v15, &location);
      id v11 = _Block_copy(aBlock);
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v11);
      -[NSXPCConnection resume](self->_connection, "resume");

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    if (!((uint64_t)self->_connection | v5))
    {
      uint64_t v5 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"XPC connection to LACDTOServiceXPC could not be created");
    }

    if (v5) {
      v4[2](v4, v5);
    }
  }

  os_unfair_lock_unlock(&self->_connectionLock);
  v12 = self->_connection;

  return v12;
}

void __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionClose];
}

- (void)_handleConnectionClose
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "XPC connection to LACDTOServiceXPC endpoint closed",  v1,  2u);
}

- (void).cxx_destruct
{
}

  ;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1()
{
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1()
{
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1()
{
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1()
{
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1()
{
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1()
{
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1()
{
}

@end