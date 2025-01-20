@interface SecKeychainForceUpgradeIfNeeded
@end

@implementation SecKeychainForceUpgradeIfNeeded

void ___SecKeychainForceUpgradeIfNeeded_block_invoke_36(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  secLogObjForScope("xpc");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "upgradeIfNeeded result: %i", (uint8_t *)v5, 8u);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
}

void ___SecKeychainForceUpgradeIfNeeded_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  secLogObjForScope("SecError");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "xpc: failure to obtain XPC proxy object for upgradeIfNeeded, %@",  (uint8_t *)&v4,  0xCu);
  }
}

@end