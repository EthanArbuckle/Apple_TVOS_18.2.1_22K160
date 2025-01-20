@interface LSClientSettingsStore
@end

@implementation LSClientSettingsStore

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke( uint64_t a1,  void *a2)
{
  v7[3] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSExtensionsLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1( (uint64_t)v7,  [v3 code],  v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_195( uint64_t a1,  void *a2,  void *a3)
{
  v9[3] = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), a2);
  }

  else
  {
    _LSExtensionsLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1( (uint64_t)v9,  [v7 code],  v8);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_197(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0LL;
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v9 = 0LL;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSExtensionsLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
  }
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198( uint64_t a1,  char a2,  void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _LSExtensionsLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198_cold_1();
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0LL;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  _LSExtensionsLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_200( uint64_t a1,  void *a2)
{
  id v4 = a2;
  if (v4)
  {
    _LSExtensionsLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    char v6 = 0;
  }

  else
  {
    char v6 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0LL;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSExtensionsLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_201(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    _LSExtensionsLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    char v6 = 0;
  }

  else
  {
    char v6 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v6;
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_5( &dword_183E58000,  a3,  (uint64_t)a3,  "Failed to get settings store from 'lsd' with error code: %ld",  (uint8_t *)a1);
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1()
{
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198_cold_1()
{
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_183E58000, v0, v1, "Failed to reset user elections error: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end