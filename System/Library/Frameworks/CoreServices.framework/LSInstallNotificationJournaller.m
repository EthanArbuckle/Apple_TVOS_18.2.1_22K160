@interface LSInstallNotificationJournaller
@end

@implementation LSInstallNotificationJournaller

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  v16.db = 0LL;
  if (*(void *)(a1 + 32))
  {
    int v7 = _LSContextInit((id *)&v16.db);
    if (v7)
    {
      _LSInstallLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2( v7,  v8);
      }
    }

    else
    {
      int v15 = 0;
      uint64_t v14 = 0LL;
      int v10 = *(unsigned __int8 *)(a1 + 48) << 10;
      v11 = *(void **)(a1 + 32);
      *(_OWORD *)buf = kLSVersionNumberNull;
      __int128 v18 = *(_OWORD *)algn_183FBF5B0;
      if (!_LSBundleFindWithInfo(&v16, 0LL, v11, 0, buf, 2, v10, &v15, &v14))
      {
        _LSInstallLog();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_INFO,  "Found registered application for journal entry: %@",  buf,  0xCu);
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      }
    }
  }

  else
  {
    _LSInstallLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1(v9);
    }
  }
}

uint64_t __71___LSInstallNotificationJournaller_removeJournalAfterNotificationFence__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeJournalFile];
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "Attempting to lookup application with nil bundle identifier",  v1,  2u);
  OUTLINED_FUNCTION_33();
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2( int a1,  os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_183E58000, a2, OS_LOG_TYPE_FAULT, "couldn't connect to database: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_33();
}

@end