@interface LAAuthenticationBiometricMethod
- (BOOL)isAllowed;
- (BOOL)isDevicePresent;
- (BOOL)isEnrolled;
- (BOOL)start;
- (LAAuthenticationBiometricMethod)initWithConfiguration:(id)a3;
- (LAAuthenticationBiometricMethodState)currentState;
- (LAContext)context;
- (unint64_t)lockoutStateFromError:(id)a3;
- (void)distributeBiometricFeedback:(int64_t)a3;
- (void)distributeStateChange;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)runBiometricOperation;
- (void)setCurrentState:(id)a3;
- (void)terminate;
@end

@implementation LAAuthenticationBiometricMethod

- (unint64_t)lockoutStateFromError:(id)a3
{
  id v3 = a3;
  [v3 domain];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v4 isEqualToString:@"com.apple.LocalAuthentication"])
  {

    goto LABEL_6;
  }

  uint64_t v5 = [v3 code];

  if (v5 != -8)
  {
LABEL_6:
    unint64_t v9 = 0LL;
    goto LABEL_7;
  }

  [v3 userInfo];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"Subcode"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 integerValue];

  else {
    unint64_t v9 = qword_186ECCBA8[v8 - 1];
  }
LABEL_7:

  return v9;
}

- (LAAuthenticationBiometricMethod)initWithConfiguration:(id)a3
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___LAAuthenticationBiometricMethod;
  uint64_t v5 = -[LAAuthenticationMethod initWithConfiguration:](&v31, sel_initWithConfiguration_, v4);
  if (v5)
  {
    [v4 authenticationContext];
    v6 = (LAContext *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6) {
      v7 = objc_alloc_init(&OBJC_CLASS___LAContext);
    }
    objc_storeStrong((id *)&v5->_context, v7);
    if (!v6) {

    }
    uint64_t v8 = -[LAAuthenticationMethodState initWithAvailableUsers:]( objc_alloc(&OBJC_CLASS___LAAuthenticationBiometricMethodState),  "initWithAvailableUsers:",  0LL);
    -[LAAuthenticationBiometricMethod setCurrentState:](v5, "setCurrentState:", v8);

    v5->_isDevicePresent = 1;
    -[LAAuthenticationBiometricMethod context](v5, "context");
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = &unk_189FA0FC8;
    v35[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v30 = 0LL;
    [v9 evaluatePolicy:1 options:v10 error:&v30];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v30;
    v13 = v12;
    if (v11)
    {

LABEL_8:
      LA_LOG_laabio();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[LAAuthenticationBiometricMethod initWithConfiguration:].cold.1(v14);
      }

      v5->_isEnrolled = 1;
LABEL_11:
      v5->_isAllowed = v5->_isEnrolled;

      goto LABEL_12;
    }

    [v12 domain];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:@"com.apple.LocalAuthentication"])
    {
      uint64_t v17 = [v13 code];

      if (v17 == -1004) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    LA_LOG_laabio();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[LAAuthenticationBiometricMethod initWithConfiguration:].cold.2((uint64_t)v13, v18, v19, v20, v21, v22, v23, v24);
    }

    [v13 domain];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = [v25 isEqualToString:@"com.apple.LocalAuthentication"];

    if (v26)
    {
      switch([v13 code])
      {
        case -8LL:
          v5->_isEnrolled = 1;
          uint64_t v27 = -[LAAuthenticationBiometricMethod lockoutStateFromError:](v5, "lockoutStateFromError:", v13);
          v28 = -[LAAuthenticationBiometricMethod currentState](v5, "currentState");
          [v28 setLockoutState:v27];

          break;
        case -7LL:
        case -5LL:
          goto LABEL_11;
        case -6LL:
          goto LABEL_25;
        default:
          LA_LOG_laabio();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v13;
            _os_log_impl(&dword_186EAF000, v29, OS_LOG_TYPE_DEFAULT, "unhandled error for canEvaluate: %@", buf, 0xCu);
          }

LABEL_25:
          v5->_isDevicePresent = 0;
          break;
      }
    }

    goto LABEL_11;
  }

- (BOOL)start
{
  BOOL v3 = -[LAAuthenticationBiometricMethod isDevicePresent](self, "isDevicePresent");
  if (v3)
  {
    BOOL v3 = -[LAAuthenticationBiometricMethod isEnrolled](self, "isEnrolled");
    if (v3)
    {
      BOOL v3 = -[LAAuthenticationBiometricMethod isAllowed](self, "isAllowed");
      if (v3)
      {
        v7.receiver = self;
        v7.super_class = (Class)&OBJC_CLASS___LAAuthenticationBiometricMethod;
        BOOL v3 = -[LAAuthenticationMethod start](&v7, sel_start);
        if (v3)
        {
          v6[0] = MEMORY[0x1895F87A8];
          v6[1] = 3221225472LL;
          v6[2] = __40__LAAuthenticationBiometricMethod_start__block_invoke;
          v6[3] = &unk_189F996E0;
          v6[4] = self;
          -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:]( self,  "forEachObserverWithProtocol:selector:invoke:",  &unk_18C6B33C0,  sel_authenticationMethod_didStartWithState_,  v6);
          -[LAAuthenticationBiometricMethod context](self, "context");
          id v4 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setUiDelegate:self];

          -[LAAuthenticationBiometricMethod runBiometricOperation](self, "runBiometricOperation");
          LOBYTE(v3) = 1;
        }
      }
    }
  }

  return v3;
}

void __40__LAAuthenticationBiometricMethod_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 currentState];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 authenticationMethod:v2 didStartWithState:v4];
}

- (void)distributeBiometricFeedback:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke;
  v3[3] = &unk_189F99708;
  v3[4] = self;
  v3[5] = a3;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:]( self,  "forEachObserverWithProtocol:selector:invoke:",  &unk_18C6B4160,  sel_authenticationBiometricsMethod_didReceiveFeedback_,  v3);
}

uint64_t __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 authenticationBiometricsMethod:*(void *)(a1 + 32) didReceiveFeedback:*(void *)(a1 + 40)];
}

- (void)distributeStateChange
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke;
  v2[3] = &unk_189F996E0;
  v2[4] = self;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:]( self,  "forEachObserverWithProtocol:selector:invoke:",  &unk_18C6B4160,  sel_authenticationMethod_didChangeState_,  v2);
}

void __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 currentState];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 authenticationMethod:v2 didChangeState:v4];
}

- (void)runBiometricOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 lockoutState];

  if (!v4)
  {
    -[LAAuthenticationBiometricMethod context](self, "context");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke;
    v6[3] = &unk_189F99758;
    v6[4] = self;
    [v5 evaluatePolicy:1 options:MEMORY[0x189604A60] reply:v6];
  }

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  LA_LOG_laabio();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2( (uint64_t)v5,  v7,  v9,  v10,  v11,  v12,  v13,  v14);
    }

    v15 = -[LAAuthenticationMethodResult initWithAuthenticatedUser:authenticationMethod:]( objc_alloc(&OBJC_CLASS___LAAuthenticationMethodResult),  "initWithAuthenticatedUser:authenticationMethod:",  &stru_189F9A2A8,  *(void *)(a1 + 32));
    v16 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_110;
    v24[3] = &unk_189F99730;
    v24[4] = v16;
    v25 = v15;
    uint64_t v17 = v15;
    [v16 forEachObserverWithProtocol:&unk_18C6B33C0 selector:sel_authenticationMethod_didAuthenticateWithResult_ invoke:v24];
  }

  else
  {
    if (v8) {
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1( (uint64_t)v6,  v7,  v9,  v10,  v11,  v12,  v13,  v14);
    }

    [v6 domain];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = [v18 isEqualToString:@"com.apple.LocalAuthentication"];

    if (v19)
    {
      uint64_t v20 = [v6 code];
      if (v20 == -8)
      {
        uint64_t v22 = [*(id *)(a1 + 32) lockoutStateFromError:v6];
        [*(id *)(a1 + 32) currentState];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 setLockoutState:v22];

        [*(id *)(a1 + 32) distributeStateChange];
      }

      else if (v20 == -1)
      {
        [*(id *)(a1 + 32) configuration];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
}

uint64_t __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_110(uint64_t a1, void *a2)
{
  return [a2 authenticationMethod:*(void *)(a1 + 32) didAuthenticateWithResult:*(void *)(a1 + 40)];
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7 = a4;
  LA_LOG_laabio();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LAAuthenticationBiometricMethod event:params:reply:].cold.5();
  }

  -[LAAuthenticationBiometricMethod currentState](self, "currentState");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 isUserPresent];

  if (a3 > 6)
  {
    if (a3 == 7)
    {
      [v7 objectForKeyedSubscript:&unk_189FA0FF8];
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v16;
      if (v16)
      {
        switch(-[os_log_s integerValue](v16, "integerValue"))
        {
          case 0LL:
LABEL_16:
            uint64_t v10 = 1LL;
            break;
          case 1LL:
LABEL_19:
            uint64_t v10 = 0LL;
            break;
          case 2LL:
          case 3LL:
          case 4LL:
          case 5LL:
          case 6LL:
          case 7LL:
          case 9LL:
          case 10LL:
          case 11LL:
          case 12LL:
          case 13LL:
            goto LABEL_40;
          case 8LL:
            uint64_t v14 = self;
            uint64_t v15 = 13LL;
LABEL_39:
            -[LAAuthenticationBiometricMethod distributeBiometricFeedback:](v14, "distributeBiometricFeedback:", v15);
            break;
          default:
            LA_LOG_laabio();
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[LAAuthenticationBiometricMethod event:params:reply:].cold.3();
            }
LABEL_37:

            break;
        }
      }

      goto LABEL_40;
    }

    if (a3 == 12)
    {
      [v7 objectForKeyedSubscript:&unk_189FA1010];
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v13;
      if (v13)
      {
        switch(-[os_log_s integerValue](v13, "integerValue"))
        {
          case 1LL:
            uint64_t v14 = self;
            uint64_t v15 = 12LL;
            goto LABEL_39;
          case 2LL:
            uint64_t v14 = self;
            uint64_t v15 = 0LL;
            goto LABEL_39;
          case 3LL:
            uint64_t v14 = self;
            uint64_t v15 = 1LL;
            goto LABEL_39;
          case 4LL:
            uint64_t v14 = self;
            uint64_t v15 = 2LL;
            goto LABEL_39;
          case 5LL:
            uint64_t v14 = self;
            uint64_t v15 = 3LL;
            goto LABEL_39;
          case 6LL:
            uint64_t v14 = self;
            uint64_t v15 = 4LL;
            goto LABEL_39;
          case 7LL:
          case 11LL:
            uint64_t v14 = self;
            uint64_t v15 = 5LL;
            goto LABEL_39;
          case 8LL:
            uint64_t v14 = self;
            uint64_t v15 = 6LL;
            goto LABEL_39;
          case 9LL:
            uint64_t v14 = self;
            uint64_t v15 = 7LL;
            goto LABEL_39;
          case 10LL:
            uint64_t v14 = self;
            uint64_t v15 = 8LL;
            goto LABEL_39;
          case 12LL:
            uint64_t v14 = self;
            uint64_t v15 = 10LL;
            goto LABEL_39;
          case 13LL:
            uint64_t v14 = self;
            uint64_t v15 = 11LL;
            goto LABEL_39;
          default:
            LA_LOG_laabio();
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[LAAuthenticationBiometricMethod event:params:reply:].cold.4();
            }
            goto LABEL_37;
        }
      }

      goto LABEL_40;
    }

    goto LABEL_17;
  }

  if (!a3) {
    goto LABEL_41;
  }
  if (a3 != 1)
  {
LABEL_17:
    LA_LOG_laabio();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[LAAuthenticationBiometricMethod event:params:reply:].cold.1();
    }
    goto LABEL_40;
  }

  [v7 objectForKeyedSubscript:&unk_189FA0FE0];
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    switch(-[os_log_s integerValue](v11, "integerValue"))
    {
      case 0LL:
        goto LABEL_16;
      case 1LL:
        goto LABEL_19;
      case 2LL:
      case 4LL:
      case 5LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 11LL:
      case 12LL:
        break;
      case 3LL:
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        v21[2] = __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke;
        v21[3] = &unk_189F996E0;
        v21[4] = self;
        -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:]( self,  "forEachObserverWithProtocol:selector:invoke:",  &unk_18C6B4160,  sel_authenticationBiometricsMethodDidReceiveNoMatch_,  v21);
        break;
      default:
        LA_LOG_laabio();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[LAAuthenticationBiometricMethod event:params:reply:].cold.2();
        }
        goto LABEL_37;
    }
  }

uint64_t __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 authenticationBiometricsMethodDidReceiveNoMatch:*(void *)(a1 + 32)];
}

- (void)terminate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAAuthenticationBiometricMethod;
  -[LAAuthenticationMethod terminate](&v4, sel_terminate);
}

- (BOOL)isDevicePresent
{
  return self->_isDevicePresent;
}

- (BOOL)isEnrolled
{
  return self->_isEnrolled;
}

- (BOOL)isAllowed
{
  return self->_isAllowed;
}

- (LAContext)context
{
  return self->_context;
}

- (LAAuthenticationBiometricMethodState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_186EAF000, log, OS_LOG_TYPE_DEBUG, "initial evaluatePolicy succeeded", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)event:params:reply:.cold.1()
{
}

- (void)event:params:reply:.cold.2()
{
}

- (void)event:params:reply:.cold.3()
{
}

- (void)event:params:reply:.cold.4()
{
}

- (void)event:params:reply:.cold.5()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_186EAF000, v1, OS_LOG_TYPE_DEBUG, "got bio event: %d (%@)", v2, 0x12u);
  OUTLINED_FUNCTION_4_0();
}

@end