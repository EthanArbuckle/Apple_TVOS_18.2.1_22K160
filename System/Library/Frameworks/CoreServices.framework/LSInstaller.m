@interface LSInstaller
@end

@implementation LSInstaller

void __67___LSInstaller_performShimmedInstallOfArtifact_options_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSInstallLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "shimmed install returned error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v3 == 0LL, v3);
}

uint64_t __86___LSInstaller_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 == 0,  a2);
}

@end