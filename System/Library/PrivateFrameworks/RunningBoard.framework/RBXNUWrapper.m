@interface RBXNUWrapper
+ (id)sharedWrapper;
- (RBXNUWrapper)init;
- (int64_t)_setBallastOffset:(unint64_t)a3;
- (int64_t)setBallastDrained:(BOOL)a3;
- (unint64_t)ballastOffsetMB;
- (void)init;
- (void)setGPURole:(unsigned __int8)a3 forPid:(int)a4;
@end

@implementation RBXNUWrapper

+ (id)sharedWrapper
{
  if (sharedWrapper_onceToken != -1) {
    dispatch_once(&sharedWrapper_onceToken, &__block_literal_global_20);
  }
  return (id)sharedWrapper_result;
}

void __29__RBXNUWrapper_sharedWrapper__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RBXNUWrapper);
  v1 = (void *)sharedWrapper_result;
  sharedWrapper_result = (uint64_t)v0;
}

- (RBXNUWrapper)init
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___RBXNUWrapper;
  v2 = -[RBXNUWrapper init](&v21, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189612BA8] clientWithIdentifier:227];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;
    v5 = -[TRIClient levelForFactor:withNamespaceName:]( v2->_trialClient,  "levelForFactor:withNamespaceName:",  @"BallastOffset",  @"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS");
    rbs_process_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 longValue];
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v7;
      _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_DEFAULT, "Setting ballast offset to %lld", buf, 0xCu);
    }

    if (-[RBXNUWrapper _setBallastOffset:](v2, "_setBallastOffset:", [v5 longValue]) < 0)
    {
      rbs_process_log();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBXNUWrapper init].cold.2();
      }
    }

    objc_initWeak((id *)buf, v2);
    v9 = v2->_trialClient;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __20__RBXNUWrapper_init__block_invoke;
    v19[3] = &unk_18A257158;
    objc_copyWeak(&v20, (id *)buf);
    id v10 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:]( v9,  "addUpdateHandlerForNamespaceName:usingBlock:",  @"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS",  v19);
    if ([v5 longValue]) {
      -[RBXNUWrapper setBallastDrained:](v2, "setBallastDrained:", 1LL);
    }
    if (MEMORY[0x18960FFD0]) {
      BOOL v11 = MEMORY[0x189608568] == 0LL;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      rbs_general_log();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v13 = "IOGPU not present";
LABEL_21:
        _os_log_impl(&dword_188634000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 2u);
      }
    }

    else
    {
      v14 = IOServiceMatching("IOGPU");
      if (!IOServiceGetMatchingService(*MEMORY[0x1896086A8], v14))
      {
LABEL_23:
        v16 = v2;
        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);

        goto LABEL_24;
      }

      uint64_t v15 = IOGPUDeviceCreate();
      v2->_gpuDevice = (__IOGPUDevice *)v15;
      if (!v15)
      {
        rbs_general_log();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[RBXNUWrapper init].cold.1();
        }
        goto LABEL_22;
      }

      rbs_general_log();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v13 = "_gpuDevice initialized";
        goto LABEL_21;
      }
    }

void __20__RBXNUWrapper_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] refresh];
  [WeakRetained[3] levelForFactor:@"BallastOffset" withNamespaceName:@"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS"];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_process_log();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v2 longValue];
    _os_log_impl( &dword_188634000,  v3,  OS_LOG_TYPE_DEFAULT,  "Trial Update Received: Setting ballast offset to %lld",  (uint8_t *)&v5,  0xCu);
  }

  if (objc_msgSend(WeakRetained, "_setBallastOffset:", objc_msgSend(v2, "longValue")) < 0)
  {
    rbs_process_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBXNUWrapper init].cold.2();
    }
  }
}

- (void)setGPURole:(unsigned __int8)a3 forPid:(int)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x18960FFD8])
  {
    if (self->_gpuDevice)
    {
      if (a3 == 3) {
        int v10 = 1;
      }
      else {
        int v10 = 2;
      }
      if (a3 == 4) {
        int v11 = 0;
      }
      else {
        int v11 = v10;
      }
      int v12 = IOGPUDeviceSetAppGPURole();
      if (v12 == -536870208)
      {
        rbs_process_log();
        v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v14 = 67109376;
        int v15 = a4;
        __int16 v16 = 1024;
        int v17 = v11;
        int v5 = "%d setGPURole role to %d (no effect for this process)";
      }

      else
      {
        int v13 = v12;
        if (v12)
        {
          rbs_general_log();
          v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            -[RBXNUWrapper setGPURole:forPid:].cold.2(a4, v13, v4);
          }
          goto LABEL_23;
        }

        rbs_process_log();
        v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v14 = 67109376;
        int v15 = a4;
        __int16 v16 = 1024;
        int v17 = v11;
        int v5 = "%d setGPURole role to %d";
      }

      uint64_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      uint32_t v8 = 14;
      goto LABEL_20;
    }

    rbs_general_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBXNUWrapper setGPURole:forPid:].cold.1();
    }
  }

  else
  {
    rbs_general_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      int v5 = "Setting GPU Role not avaible on this mastering";
      uint64_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 2;
LABEL_20:
      _os_log_impl(&dword_188634000, v6, v7, v5, (uint8_t *)&v14, v8);
    }
  }

- (int64_t)setBallastDrained:(BOOL)a3
{
  BOOL v4 = a3;
  return sysctlbyname("kern.memorystatus.ballast_drained", 0LL, 0LL, &v4, 4uLL);
}

- (unint64_t)ballastOffsetMB
{
  return self->_ballastOffsetMB;
}

- (int64_t)_setBallastOffset:(unint64_t)a3
{
  self->_ballastOffsetMB = a3;
  int v4 = a3;
  return sysctlbyname("kern.memorystatus.ballast_offset_mb", 0LL, 0LL, &v4, 4uLL);
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)setGPURole:forPid:.cold.1()
{
}

- (void)setGPURole:(os_log_t)log forPid:.cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "%d setGPURole failed with result = %x",  (uint8_t *)v3,  0xEu);
}

@end