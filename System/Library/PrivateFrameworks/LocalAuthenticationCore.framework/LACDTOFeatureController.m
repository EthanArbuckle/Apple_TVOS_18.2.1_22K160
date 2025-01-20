@interface LACDTOFeatureController
- (LACDTOEventBus)eventBus;
- (LACDTOFeatureController)initWithKVStore:(id)a3 requirementsDataSource:(id)a4 featureFlags:(id)a5 workQueue:(id)a6;
- (void)_checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)_enableFeatureActivatingGracePeriod:(BOOL)a3 completion:(id)a4;
- (void)_fetchDeviceHintsCurrentConnection:(id)a3 completion:(id)a4;
- (void)_fetchRequirementsWithCompletion:(id)a3;
- (void)_setFeatureEnablementMode:(id)a3 context:(id)a4 connection:(id)a5 completion:(id)a6;
- (void)_setFeatureStrictModeEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6;
- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)fetchStateWithCompletion:(id)a3;
- (void)setEventBus:(id)a3;
@end

@implementation LACDTOFeatureController

- (LACDTOFeatureController)initWithKVStore:(id)a3 requirementsDataSource:(id)a4 featureFlags:(id)a5 workQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LACDTOFeatureController;
  v15 = -[LACDTOFeatureController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_kvStore, a3);
    objc_storeStrong((id *)&v16->_requirementsDataSource, a4);
    objc_storeStrong((id *)&v16->_featureFlags, a5);
    v17 = objc_alloc_init(&OBJC_CLASS___LACDTOFeatureEnablementModeCoder);
    enablementModeCoder = v16->_enablementModeCoder;
    v16->_enablementModeCoder = v17;

    objc_storeStrong((id *)&v16->_workQueue, a6);
  }

  return v16;
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke;
  v6[3] = &unk_18A36A7E8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[LACDTOFeatureController checkIsFeatureSupportedWithCompletion:](self, "checkIsFeatureSupportedWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2;
    v6[3] = &unk_18A36A7C0;
    void v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    char v8 = a2;
    [v5 checkIsFeatureAvailableWithCompletion:v6];
  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3;
    v5[3] = &unk_18A36A798;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    char v7 = *(_BYTE *)(a1 + 48);
    char v8 = a2;
    [v2 checkIsFeatureEnabledWithCompletion:v5];
  }

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4;
    v5[3] = &unk_18A36A770;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    __int16 v7 = *(_WORD *)(a1 + 48);
    char v8 = a2;
    [v2 checkIsFeatureStrictModeEnabledWithCompletion:v5];
  }

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5;
    v5[3] = &unk_18A36A748;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    char v7 = *(_BYTE *)(a1 + 48);
    __int16 v8 = *(_WORD *)(a1 + 49);
    char v9 = a2;
    [v2 _fetchRequirementsWithCompletion:v5];
  }

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6;
    v7[3] = &unk_18A36A720;
    int v9 = *(_DWORD *)(a1 + 48);
    id v6 = v3;
    id v8 = v3;
    __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6((uint64_t)v7);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    id v3 = v6;
  }
}

LACDTOMutableFeatureState *__52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6( uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableFeatureState);
  -[LACDTOMutableFeatureState setIsSupported:](v2, "setIsSupported:", *(unsigned __int8 *)(a1 + 40));
  -[LACDTOMutableFeatureState setIsAvailable:](v2, "setIsAvailable:", *(unsigned __int8 *)(a1 + 41));
  -[LACDTOMutableFeatureState setIsEnabled:](v2, "setIsEnabled:", *(unsigned __int8 *)(a1 + 42));
  -[LACDTOMutableFeatureState setIsStrictModeEnabled:](v2, "setIsStrictModeEnabled:", *(unsigned __int8 *)(a1 + 43));
  -[LACDTOMutableFeatureState setRequirements:](v2, "setRequirements:", *(void *)(a1 + 32));
  return v2;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke;
  v6[3] = &unk_18A36A810;
  id v7 = v4;
  id v5 = v4;
  -[LACDTOFeatureController _checkIsFeatureEnabledWithCompletion:](self, "_checkIsFeatureEnabledWithCompletion:", v6);
}

void __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 isEnabled], v5);
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_18A3688A8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 4LL, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOFeature();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1();
      }

      (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL, v6);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [v5 BOOLValue];
        id v11 = "NO";
        if (v10) {
          id v11 = "YES";
        }
        int v12 = 136315138;
        id v13 = v11;
        _os_log_impl(&dword_189219000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureStrictModeEnabled: %s", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [v5 BOOLValue],  0);
    }
  }
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v5 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2(workQueue);
  if (-[LACDTOFeatureRequirementsDataSource isPhone](self->_requirementsDataSource, "isPhone"))
  {
    LACLogDTOFeature();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureSupported: YES", (uint8_t *)&v10, 2u);
    }

    v5[2](v5, 1LL, 0LL);
    id v7 = v5;
  }

  else
  {
    +[LACLocalization dtoErrorDeviceTypeNotSupported](&OBJC_CLASS___LACLocalization, "dtoErrorDeviceTypeNotSupported");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:localizedDescription:",  -1027LL,  v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "isFeatureSupported: NO (%{public}@)",  (uint8_t *)&v10,  0xCu);
    }

    ((void (**)(id, uint64_t, void *))v5)[2](v5, 0LL, v7);
  }
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke;
  v6[3] = &unk_18A36A7E8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[LACDTOFeatureController checkIsFeatureSupportedWithCompletion:](self, "checkIsFeatureSupportedWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke( uint64_t a1,  char a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_10:
      v9();
      goto LABEL_15;
    }

    if ([WeakRetained[2] hasPasscodeSetForCurrentUser])
    {
      if (([v7[2] hasBiometricEnrollmentsForCurrentUser] & 1) == 0)
      {
        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_10;
        v13[3] = &unk_18A368770;
        id v14 = *(id *)(a1 + 32);
        [v7 checkIsFeatureEnabledWithCompletion:v13];

        goto LABEL_15;
      }

      LACLogDTOFeature();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: YES", buf, 2u);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
      goto LABEL_10;
    }

    +[LACLocalization dtoErrorPasscodeNotSet](&OBJC_CLASS___LACLocalization, "dtoErrorPasscodeNotSet");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:localizedDescription:",  -5LL,  v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_189219000, v12, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: NO (%{public}@)", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_10( uint64_t a1,  int a2,  uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3 || !a2)
  {
    +[LACLocalization dtoErrorBiometryNotEnrolled](&OBJC_CLASS___LACLocalization, "dtoErrorBiometryNotEnrolled");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:localizedDescription:",  -7LL,  v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "isFeatureAvailable: NO (%{public}@)",  (uint8_t *)&v8,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    LACLogDTOFeature();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( &dword_189219000,  v4,  OS_LOG_TYPE_DEFAULT,  "isFeatureAvailable = isFeatureEnabled = YES",  (uint8_t *)&v8,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [MEMORY[0x189607B30] currentConnection];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke;
  v8[3] = &unk_18A36A838;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v9 = v7;
  -[LACDTOFeatureController checkIsFeatureAvailableWithCompletion:](self, "checkIsFeatureAvailableWithCompletion:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke( uint64_t a1,  char a2,  void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 && (a2 & 1) == 0) {
      __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();
    }
    if (v5)
    {
      LACLogDTOFeature();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v5;
        _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "isFeatureEnabled: NO (%{public}@)",  (uint8_t *)&v9,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      [WeakRetained _fetchDeviceHintsCurrentConnection:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    }
  }
}

- (void)enableFeatureWithCompletion:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[LACDTOFeatureController _enableFeatureActivatingGracePeriod:completion:]( self,  "_enableFeatureActivatingGracePeriod:completion:",  0LL,  v5);
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[LACDTOFeatureController _enableFeatureActivatingGracePeriod:completion:]( self,  "_enableFeatureActivatingGracePeriod:completion:",  -[LACFeatureFlagsProviderDTO featureFlagDimpleKeyGracePeriodEnabled]( self->_featureFlags,  "featureFlagDimpleKeyGracePeriodEnabled"),  v5);
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  +[LACDTOFeatureEnablementMode disabled](&OBJC_CLASS___LACDTOFeatureEnablementMode, "disabled");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607B30] currentConnection];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureEnablementMode:context:connection:completion:]( self,  "_setFeatureEnablementMode:context:connection:completion:",  v10,  v8,  v9,  v7);
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  [MEMORY[0x189607B30] currentConnection];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureStrictModeEnabled:context:connection:completion:]( self,  "_setFeatureStrictModeEnabled:context:connection:completion:",  1LL,  0LL,  v6,  v5);
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  [MEMORY[0x189607B30] currentConnection];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureStrictModeEnabled:context:connection:completion:]( self,  "_setFeatureStrictModeEnabled:context:connection:completion:",  0LL,  v8,  v9,  v7);
}

- (void)_checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_18A3688A8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 0LL, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      [WeakRetained[4] decode:v5];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LACLogDTOFeature();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

- (void)_enableFeatureActivatingGracePeriod:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [MEMORY[0x189607B30] currentConnection];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke;
  v10[3] = &unk_18A36A860;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  BOOL v14 = a3;
  id v9 = v7;
  id v11 = v9;
  -[LACDTOFeatureController checkCanEnableFeatureWithCompletion:](self, "checkCanEnableFeatureWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v6;
        _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: NO (%{public}@)", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      if (*(_BYTE *)(a1 + 56)) {
        +[LACDTOFeatureEnablementMode enabledWithGracePeriod]( &OBJC_CLASS___LACDTOFeatureEnablementMode,  "enabledWithGracePeriod");
      }
      else {
        +[LACDTOFeatureEnablementMode enabled](&OBJC_CLASS___LACDTOFeatureEnablementMode, "enabled");
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = *(void *)(a1 + 32);
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15;
      v11[3] = &unk_18A368F68;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      id v13 = *(id *)(a1 + 40);
      id v12 = v5;
      [WeakRetained _setFeatureEnablementMode:v9 context:0 connection:v10 completion:v11];

      objc_destroyWeak(&v14);
    }
  }
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    LACLogDTOFeature();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15_cold_1();
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    }

    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: YES", v8, 2u);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    }

    v7();
  }
}

- (void)_setFeatureEnablementMode:(id)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke;
  v18[3] = &unk_18A36A888;
  objc_copyWeak(&v23, &location);
  id v14 = v13;
  id v22 = v14;
  id v15 = v10;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  -[LACDTOFeatureController _checkIsFeatureEnabledWithCompletion:](self, "_checkIsFeatureEnabledWithCompletion:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
LABEL_7:
      v8();
      goto LABEL_8;
    }

    int v9 = [*(id *)(a1 + 32) isEnabled];
    if (v9 == [v5 isEnabled])
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
      goto LABEL_7;
    }

    [WeakRetained[4] encode:*(void *)(a1 + 32)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke_2;
    v13[3] = &unk_18A368F68;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 32);
    [WeakRetained _setValue:v10 forKey:0 contextUUID:v11 connection:v12 completion:v13];

    objc_destroyWeak(&v16);
  }

void __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    if (!v8)
    {
      id v4 = objc_alloc(&OBJC_CLASS___LACDTOEvent);
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = -[LACDTOEvent initWithRawValue:value:](v4, "initWithRawValue:value:", 2LL, v5);

      [WeakRetained eventBus];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 dispatchEvent:v6 sender:WeakRetained];
    }
  }
}

- (void)_setFeatureStrictModeEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke;
  v16[3] = &unk_18A36A8D8;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v19 = v13;
  BOOL v21 = a3;
  id v14 = v10;
  id v17 = v14;
  id v15 = v11;
  id v18 = v15;
  -[LACDTOFeatureController checkIsFeatureStrictModeEnabledWithCompletion:]( self,  "checkIsFeatureStrictModeEnabledWithCompletion:",  v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    else
    {
      if (*(unsigned __int8 *)(a1 + 64) != a2)
      {
        id v8 = -[LACDTOKVStoreValue initWithBoolValue:]( objc_alloc(&OBJC_CLASS___LACDTOKVStoreValue),  "initWithBoolValue:",  *(unsigned __int8 *)(a1 + 64));
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        v11[0] = MEMORY[0x1895F87A8];
        v11[1] = 3221225472LL;
        v11[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2;
        v11[3] = &unk_18A36A8B0;
        objc_copyWeak(&v13, (id *)(a1 + 56));
        id v12 = *(id *)(a1 + 48);
        char v14 = *(_BYTE *)(a1 + 64);
        [WeakRetained _setValue:v8 forKey:4 contextUUID:v9 connection:v10 completion:v11];

        objc_destroyWeak(&v13);
        goto LABEL_7;
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    v7();
  }

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    if (!v8)
    {
      id v4 = objc_alloc(&OBJC_CLASS___LACDTOEvent);
      [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = -[LACDTOEvent initWithRawValue:value:](v4, "initWithRawValue:value:", 3LL, v5);

      [WeakRetained eventBus];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 dispatchEvent:v6 sender:WeakRetained];
    }
  }
}

- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  kvStore = self->_kvStore;
  if (a5) {
    -[LACDTOKVStore setValue:forKey:contextUUID:connection:completion:]( kvStore,  "setValue:forKey:contextUUID:connection:completion:",  a3,  a4,  a5,  a6,  a7);
  }
  else {
    -[LACDTOKVStore setValue:forKey:connection:completion:]( kvStore,  "setValue:forKey:connection:completion:",  a3,  a4,  a6,  a7);
  }
}

- (void)_fetchDeviceHintsCurrentConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = __Block_byref_object_copy__6;
  v14[4] = __Block_byref_object_dispose__6;
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  kvStore = self->_kvStore;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke;
  v10[3] = &unk_18A36A928;
  objc_copyWeak(&v13, &location);
  id v12 = v14;
  id v9 = v7;
  id v11 = v9;
  -[LACDTOKVStore valueForKey:connection:completion:](kvStore, "valueForKey:connection:completion:", 3LL, v6, v10);

  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1();
      }
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    [MEMORY[0x189607968] numberWithInteger:2];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v9 forKeyedSubscript:v11];

    id v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22;
    v15[3] = &unk_18A36A900;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    __int128 v14 = *(_OWORD *)(a1 + 32);
    id v13 = (id)v14;
    __int128 v16 = v14;
    [v12 hasLocationServicesEnabledWithCompletion:v15];

    objc_destroyWeak(&v17);
  }
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22_cold_1();
      }
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    [MEMORY[0x189607968] numberWithInteger:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v9 forKeyedSubscript:v11];

    id v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23;
    v15[3] = &unk_18A36A900;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    __int128 v14 = *(_OWORD *)(a1 + 32);
    id v13 = (id)v14;
    __int128 v16 = v14;
    [v12 hasHSA2AccountWithCompletion:v15];

    objc_destroyWeak(&v17);
  }
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23_cold_1();
      }
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    [MEMORY[0x189607968] numberWithInteger:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v9 forKeyedSubscript:v11];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)_fetchRequirementsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, LACDTOMutableFeatureRequirements *))a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableFeatureRequirements);
  -[LACDTOMutableFeatureRequirements setHasPasscodeSet:]( v5,  "setHasPasscodeSet:",  -[LACDTOFeatureRequirementsDataSource hasPasscodeSetForCurrentUser]( self->_requirementsDataSource,  "hasPasscodeSetForCurrentUser"));
  -[LACDTOMutableFeatureRequirements setHasBiometricEnrollments:]( v5,  "setHasBiometricEnrollments:",  -[LACDTOFeatureRequirementsDataSource hasBiometricEnrollmentsForCurrentUser]( self->_requirementsDataSource,  "hasBiometricEnrollmentsForCurrentUser"));
  v4[2](v4, v5);
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
}

- (void).cxx_destruct
{
}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1()
{
}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
  __assert_rtn( "-[LACDTOFeatureController checkCanEnableFeatureWithCompletion:]_block_invoke",  "LACDTOFeatureController.m",  185,  "isAvailable || error != nil");
}

void __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke_cold_1()
{
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15_cold_1()
{
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1()
{
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22_cold_1()
{
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23_cold_1()
{
}

@end