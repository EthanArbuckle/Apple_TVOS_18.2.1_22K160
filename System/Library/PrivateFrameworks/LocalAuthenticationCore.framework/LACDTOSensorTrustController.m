@interface LACDTOSensorTrustController
- (BOOL)_isHardwareTrustError:(id)a3;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOSensorTrustController)initWithReplyQueue:(id)a3 ui:(id)a4 store:(id)a5 verifier:(id)a6 flags:(id)a7;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOSensorTrustController

- (LACDTOSensorTrustController)initWithReplyQueue:(id)a3 ui:(id)a4 store:(id)a5 verifier:(id)a6 flags:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___LACDTOSensorTrustController;
  v16 = -[LACDTOSensorTrustController init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ui, a4);
    objc_storeStrong((id *)&v17->_store, a5);
    objc_storeStrong((id *)&v17->_verifier, a6);
    objc_storeStrong((id *)&v17->_flags, a7);
  }

  return v17;
}

- (BOOL)canProcessRequest:(id)a3
{
  return -[LACFeatureFlagsProviderDTO featureFlagDimpleKeySecureRepairEnabled]( self->_flags,  "featureFlagDimpleKeySecureRepairEnabled",  a3);
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[LACDTOSensorTrustController canProcessRequest:](self, "canProcessRequest:", v8))
  {
    uint64_t v11 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke;
    v22[3] = &unk_18A369ED8;
    id v12 = v8;
    id v23 = v12;
    __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke((uint64_t)v22);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 updateOptions:v13];

    LACLogDTOSensor();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "Sensor trust verification will start",  (uint8_t *)&buf,  2u);
    }

    objc_initWeak(&buf, self);
    verifier = self->_verifier;
    v17[0] = v11;
    v17[1] = 3221225472LL;
    v17[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3;
    v17[3] = &unk_18A369F00;
    objc_copyWeak(&v20, &buf);
    id v19 = v10;
    id v18 = v12;
    -[LACDTOSensorTrustVerifier verifySensorTrustWithCompletion:](verifier, "verifySensorTrustWithCompletion:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&buf);
  }

  else
  {
    v16 = +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v8);
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
  }
}

id __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)[v1 mutableCopy];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  v5 = v4;

  [MEMORY[0x189607968] numberWithInteger:1086];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:v6];

  [MEMORY[0x189607968] numberWithInteger:1085];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v8 BOOLValue] & 1) == 0)
  {

    goto LABEL_8;
  }

  [MEMORY[0x189607968] numberWithInteger:1062];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    [MEMORY[0x189607968] numberWithInteger:1062];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:v7];
LABEL_8:
  }

  return v5;
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3( id *a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    LACLogDTOSensor();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1( (uint64_t)v6,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
      }

      v16 = (void (**)(id, void *))a1[5];
      v17 = +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v6);
      v16[2](v16, v17);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        id v24 = v5;
        _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "Sensor trust verification did finish with result: %@",  buf,  0xCu);
      }

      id v18 = (void *)WeakRetained[2];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4;
      v19[3] = &unk_18A368F68;
      objc_copyWeak(&v22, a1 + 6);
      id v21 = a1[5];
      id v20 = a1[4];
      [v18 storeSensorTrustState:v5 completion:v19];

      objc_destroyWeak(&v22);
    }
  }
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      LACLogDTOSensor();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1( (uint64_t)v3,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
      }

      uint64_t v12 = *(void *)(a1 + 40);
      +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v3);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }

    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", *(void *)(a1 + 32));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    }
  }
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  if (!-[LACDTOSensorTrustController canProcessRequest:](self, "canProcessRequest:", v8)
    || ([v9 error],
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = -[LACDTOSensorTrustController _isHardwareTrustError:](self, "_isHardwareTrustError:", v11),
        v11,
        !v12))
  {
LABEL_11:
    v10[2](v10, v9);
    goto LABEL_12;
  }

  [v8 options];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1085];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKey:v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    LACLogDTOSensor();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [v9 error];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)id buf = 138543362;
      v36 = v18;
      _os_log_impl( &dword_189219000,  v17,  OS_LOG_TYPE_DEFAULT,  "Mapping unapproved sensor error %{public}@ to success on client's request",  buf,  0xCu);
    }

    +[LACEvaluationResult resultWithSuccess:]( &OBJC_CLASS___LACEvaluationResult,  "resultWithSuccess:",  MEMORY[0x189604A60]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19);

    goto LABEL_12;
  }

  [v8 options];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1039];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectForKey:v21];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    LACLogDTOSensor();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( &dword_189219000,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping sensor trust alert on client's request",  buf,  2u);
    }

    goto LABEL_11;
  }

  uint64_t v25 = MEMORY[0x1895F87A8];
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke;
  v34[3] = &unk_18A369F28;
  id v26 = v8;
  v34[4] = v26;
  uint64_t v27 = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke((uint64_t)v34);
  LACLogDTOSensor();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189607968] numberWithInteger:v27];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)id buf = 138412290;
    v36 = v29;
    _os_log_impl(&dword_189219000, v28, OS_LOG_TYPE_DEFAULT, "Sensor trust alert with id: %@ will appear.", buf, 0xCu);
  }

  ui = self->_ui;
  v31[0] = v25;
  v31[1] = 3221225472LL;
  v31[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8;
  v31[3] = &unk_18A368880;
  v33 = v10;
  id v32 = v9;
  -[LACUserInterfacePresenting presentUIForIdentifier:request:completion:]( ui,  "presentUIForIdentifier:request:completion:",  v27,  v26,  v31);

LABEL_12:
}

uint64_t __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTOEnvironment"];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  else {
    uint64_t v3 = 1LL;
  }

  return v3;
}

void __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOSensor();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( &dword_189219000,  v4,  OS_LOG_TYPE_DEFAULT,  "Sensor trust alert did disappear (err: %@)",  (uint8_t *)&v5,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)_isHardwareTrustError:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -1LL, 30LL)
  }
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -1LL, 31LL);
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end