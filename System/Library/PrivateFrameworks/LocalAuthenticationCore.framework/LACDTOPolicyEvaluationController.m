@interface LACDTOPolicyEvaluationController
- (BOOL)_checkDeviceHasBeenUnlockedSinceBoot;
- (BOOL)_verifyHasRequiredOptions:(id)a3 forPolicy:(int64_t)a4 error:(id *)a5;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOPolicyEvaluationController)initWithEnvironment:(id)a3 evaluationIdentifierFactory:(id)a4 device:(id)a5;
- (id)_errorCodesToFilterForOptions:(id)a3;
- (id)_mapResult:(id)a3 filterCodes:(id)a4;
- (id)_updateEvaluationOptions:(id)a3 environment:(id)a4;
- (void)_evaluateRequest:(id)a3 completion:(id)a4;
- (void)_evaluateRequest:(id)a3 environment:(id)a4 completion:(id)a5;
- (void)_forEachObserver:(id)a3;
- (void)_notifyObserversAboutEvaluation:(id)a3;
- (void)_notifyObserversAboutEvaluation:(id)a3 result:(id)a4;
- (void)addObserver:(id)a3;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation LACDTOPolicyEvaluationController

- (LACDTOPolicyEvaluationController)initWithEnvironment:(id)a3 evaluationIdentifierFactory:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    -[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:].cold.1();
  }
  v12 = v11;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LACDTOPolicyEvaluationController;
  v13 = -[LACDTOPolicyEvaluationController init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environment, a3);
    uint64_t v15 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v15;

    objc_storeStrong((id *)&v14->_device, a5);
    objc_storeStrong((id *)&v14->_evaluationIdentifierFactory, a4);
    uint64_t v17 = objc_opt_new();
    pendingRequests = v14->_pendingRequests;
    v14->_pendingRequests = (NSMutableDictionary *)v17;
  }

  return v14;
}

- (BOOL)canProcessRequest:(id)a3
{
  return 1;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_18A3696B0;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  -[LACDTOPolicyEvaluationController _evaluateRequest:completion:](self, "_evaluateRequest:completion:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)*((void *)WeakRetained + 5);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v10 forKeyedSubscript:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  pendingRequests = self->_pendingRequests;
  id v11 = (void *)MEMORY[0x189607968];
  id v12 = (void (**)(id, id))a5;
  objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pendingRequests, "objectForKeyedSubscript:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    id v15 = v9;
    [v8 options];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1062];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 objectForKeyedSubscript:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v18 BOOLValue])
    {
      [v8 options];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOPolicyEvaluationController _errorCodesToFilterForOptions:](self, "_errorCodesToFilterForOptions:", v19);
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v21 = -[LACDTOPolicyEvaluationController _mapResult:filterCodes:](self, "_mapResult:filterCodes:", v15, v20);

      id v15 = (id)v21;
    }

    uint64_t v26 = MEMORY[0x1895F87A8];
    uint64_t v27 = 3221225472LL;
    v28 = __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke;
    v29 = &unk_18A3696D8;
    id v22 = v14;
    id v30 = v22;
    id v31 = v15;
    id v23 = v15;
    __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke((uint64_t)&v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:]( self,  "_notifyObserversAboutEvaluation:result:",  v22,  v24,  v26,  v27,  v28,  v29);

    v12[2](v12, v23);
    id v12 = (void (**)(id, id))v18;
  }

  else
  {
    LACLogDTOEvaluation();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[LACDTOPolicyEvaluationController postProcessRequest:result:completion:].cold.1(v8, v25);
    }

    v12[2](v12, v9);
  }
}

LACDTOMutablePolicyEvaluationResult *__73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke( uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___LACDTOMutablePolicyEvaluationResult);
  [*(id *)(a1 + 32) identifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACDTOMutablePolicyEvaluationResult initWithIdentifier:](v2, "initWithIdentifier:", v3);

  [*(id *)(a1 + 40) error];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePolicyEvaluationResult setError:](v4, "setError:", v5);

  [*(id *)(a1 + 40) value];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePolicyEvaluationResult setResult:](v4, "setResult:", v6);

  return v4;
}

- (void)_evaluateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = [v6 policy];
  [v6 options];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[LACDTOPolicyEvaluationController canProcessRequest:](self, "canProcessRequest:", v6))
  {
    +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v6);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v11);
    goto LABEL_9;
  }

  id v21 = 0LL;
  BOOL v10 = -[LACDTOPolicyEvaluationController _verifyHasRequiredOptions:forPolicy:error:]( self,  "_verifyHasRequiredOptions:forPolicy:error:",  v9,  v8,  &v21);
  id v11 = v21;
  if (!v10)
  {
    v13 = +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v11);
    v7[2](v7, 0LL, v13);
LABEL_8:

    goto LABEL_9;
  }

  if (!-[LACDTOPolicyEvaluationController _checkDeviceHasBeenUnlockedSinceBoot]( self,  "_checkDeviceHasBeenUnlockedSinceBoot"))
  {
    v13 = +[LACError errorWithCode:subcode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:subcode:debugDescription:",  -1008LL,  1LL,  @"DTO policies are not available before first unlock");
    +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v14);

    goto LABEL_8;
  }

  objc_initWeak(&location, self);
  environment = self->_environment;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke;
  v15[3] = &unk_18A369700;
  objc_copyWeak(&v19, &location);
  v18 = v7;
  id v16 = v6;
  id v17 = v9;
  -[LACDTOEnvironmentProviding fetchEnvironmentForPolicy:options:completion:]( environment,  "fetchEnvironmentForPolicy:options:completion:",  v8,  v17,  v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_9:
}

void __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v5);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      id v9 = *(void **)(a1 + 32);
      [WeakRetained _updateEvaluationOptions:*(void *)(a1 + 40) environment:v11];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 updateOptions:v10];

      [v7 _evaluateRequest:*(void *)(a1 + 32) environment:v11 completion:*(void *)(a1 + 48)];
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)_verifyHasRequiredOptions:(id)a3 forPolicy:(int64_t)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (a4 == 1026
    && ([MEMORY[0x189607968] numberWithInteger:1000],
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v8],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 BOOLValue],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    id v12 = (void *)MEMORY[0x189603FC8];
    [MEMORY[0x189607968] numberWithInteger:1066];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v47[0] = objc_opt_class();
    [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 dictionaryWithDictionary:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607968] numberWithInteger:1000];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 || ([v17 BOOLValue] & 1) == 0)
    {
      [MEMORY[0x189607968] numberWithInteger:2];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v18;
      v45[0] = objc_opt_class();
      [MEMORY[0x189607968] numberWithInteger:1064];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v19;
      v45[1] = objc_opt_class();
      [MEMORY[0x189607968] numberWithInteger:1063];
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v20;
      v45[2] = objc_opt_class();
      [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:3];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addEntriesFromDictionary:v21];
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    [v15 allKeys];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v36 = a5;
      v37 = v17;
      uint64_t v24 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0LL; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v27 = [v7 objectForKeyedSubscript:v26];
          if (!v27) {
            goto LABEL_17;
          }
          v28 = (void *)v27;
          [v7 objectForKeyedSubscript:v26];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKeyedSubscript:v26];
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
LABEL_17:
            [v15 objectForKeyedSubscript:v26];
            v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            [NSString stringWithFormat:@"Missing required option (%d) with type '%@'", objc_msgSend(v26, "integerValue"), v33];
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1001LL,  v34);
              id *v36 = (id)objc_claimAutoreleasedReturnValue();
            }

            BOOL v11 = 0;
            id v17 = v37;
            goto LABEL_21;
          }
        }

        uint64_t v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        BOOL v11 = 1;
        id v17 = v37;
        if (v23) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v11 = 1;
    }

- (id)_updateEvaluationOptions:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x189603FC8];
  id v7 = a3;
  [v6 dictionaryWithDictionary:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "isDTOEnabled"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1078];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v9 forKeyedSubscript:v10];

  [MEMORY[0x189607968] numberWithInteger:1037];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    int v13 = [v5 isDTOEnabled];

    if (!v13) {
      goto LABEL_5;
    }
    +[LACLocalizationUtils encodeLocalizationKey:shouldUseDeviceVariant:]( &OBJC_CLASS___LACLocalizationUtils,  "encodeLocalizationKey:shouldUseDeviceVariant:",  @"ENTER_PASSCODE",  1LL);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1037];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v11 forKeyedSubscript:v12];
  }

LABEL_5:
  if (([v5 allowsAuthenticationFallbacks] & 1) == 0)
  {
    [MEMORY[0x189607968] numberWithInteger:1024];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:MEMORY[0x189604A88] forKeyedSubscript:v14];

    [MEMORY[0x189607968] numberWithInteger:1067];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:&unk_18A39F300 forKeyedSubscript:v15];
  }

  if (([v5 allowsGracePeriodUI] & 1) == 0)
  {
    [MEMORY[0x189607968] numberWithInteger:1073];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:MEMORY[0x189604A88] forKeyedSubscript:v16];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "isGracePeriodActive"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1082];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v17 forKeyedSubscript:v18];

  return v8;
}

- (void)_evaluateRequest:(id)a3 environment:(id)a4 completion:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void *))a5;
  uint64_t v10 = [v27 policy];
  [v27 options];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 client];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  [MEMORY[0x189607968] numberWithInteger:1066];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKeyedSubscript:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPolicyEvaluationIdentifierFactory evaluationIdentifierForClient:ratchetIdentifier:]( evaluationIdentifierFactory,  "evaluationIdentifierForClient:ratchetIdentifier:",  v12,  v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke;
  v28[3] = &unk_18A369728;
  id v17 = v16;
  id v29 = v17;
  uint64_t v32 = v10;
  id v18 = v11;
  id v30 = v18;
  id v19 = v8;
  id v31 = v19;
  __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke(v28);
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:](self, "_notifyObserversAboutEvaluation:", v20);
  [v27 payload];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = (void *)[v21 mutableCopy];
  uint64_t v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_opt_new();
  }
  v25 = v24;

  [v25 setObject:v17 forKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTORequestIdentifier"];
  [v25 setObject:v19 forKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTOEnvironment"];
  [v27 updatePayload:v25];
  +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v27);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v20, v26);
}

LACDTOMutablePolicyEvaluationRequest *__76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke( void *a1)
{
  v2 = -[LACDTOMutablePolicyEvaluationRequest initWithIdentifier:]( objc_alloc(&OBJC_CLASS___LACDTOMutablePolicyEvaluationRequest),  "initWithIdentifier:",  a1[4]);
  -[LACDTOMutablePolicyEvaluationRequest setPolicy:](v2, "setPolicy:", a1[7]);
  -[LACDTOMutablePolicyEvaluationRequest setOptions:](v2, "setOptions:", a1[5]);
  -[LACDTOMutablePolicyEvaluationRequest setEnvironment:](v2, "setEnvironment:", a1[6]);
  return v2;
}

- (void)_notifyObserversAboutEvaluation:(id)a3
{
  id v4 = a3;
  LACLogDTOEvaluation();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:].cold.1( (uint64_t)v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
  }

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke;
  v13[3] = &unk_18A369750;
  void v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  -[LACDTOPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v13);
}

uint64_t __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 policyController:*(void *)(a1 + 32) willStartPolicyEvaluation:*(void *)(a1 + 40)];
}

- (void)_notifyObserversAboutEvaluation:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LACLogDTOEvaluation();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:].cold.1( (uint64_t)v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }

  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke;
  v17[3] = &unk_18A369778;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  -[LACDTOPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v17);
}

uint64_t __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke( void *a1,  void *a2)
{
  return [a2 policyController:a1[4] didFinishPolicyEvaluation:a1[5] result:a1[6]];
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)_mapResult:(id)a3 filterCodes:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [v6 error];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            if (+[LACError error:hasCode:]( LACError,  "error:hasCode:",  v8,  objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "integerValue", (void)v17)))
            {
              LACLogDTO();
              uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v22 = self;
                __int16 v23 = 2112;
                id v24 = v8;
                _os_log_impl(&dword_189219000, v15, OS_LOG_TYPE_DEFAULT, "%@ mapping error %@ to success", buf, 0x16u);
              }

              +[LACEvaluationResult resultWithSuccess:]( &OBJC_CLASS___LACEvaluationResult,  "resultWithSuccess:",  MEMORY[0x189604A60]);
              id v14 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }

            ++v13;
          }

          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }

    id v14 = v6;
LABEL_17:
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)_errorCodesToFilterForOptions:(id)a3
{
  v12[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithInteger:1062];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v6 BOOLValue])
  {
    [MEMORY[0x189607968] numberWithInteger:-1011];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    [MEMORY[0x189607968] numberWithInteger:-5];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObjectsFromArray:v9];
  }

  [v4 allObjects];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_checkDeviceHasBeenUnlockedSinceBoot
{
  return -[LACDTODeviceInfoProvider hasBeenUnlockedSinceBoot](self->_device, "hasBeenUnlockedSinceBoot");
}

- (void).cxx_destruct
{
}

- (void)initWithEnvironment:evaluationIdentifierFactory:device:.cold.1()
{
  __assert_rtn( "-[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:]",  "LACDTOPolicyEvaluationController.m",  31,  "environment != nil");
}

- (void)postProcessRequest:(void *)a1 result:(os_log_s *)a2 completion:.cold.1( void *a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3[0] = 67109120;
  v3[1] = [a1 identifier];
  _os_log_error_impl(&dword_189219000, a2, OS_LOG_TYPE_ERROR, "No pending request for rid: %i", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a3 result:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end