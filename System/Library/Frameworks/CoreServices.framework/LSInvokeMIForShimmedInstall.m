@interface LSInvokeMIForShimmedInstall
@end

@implementation LSInvokeMIForShimmedInstall

void ___LSInvokeMIForShimmedInstall_block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "now processing install of %@ with options %@", buf, 0x16u);
  }

  v5 = (void *)[objc_alloc(getMIInstallOptionsClass()) initWithLegacyOptionsDictionary:a1[5]];
  v6 = (void *)a1[4];
  id v12 = 0LL;
  char v7 = softLinkMobileInstallationInstallForInstallCoordinationWithError(v6, 1LL, v5, 0LL, 0LL, 0LL, (uint64_t)&v12, 0LL);
  id v8 = v12;
  v9 = v8;
  if ((v7 & 1) == 0 && !v8)
  {
    _LSInstallLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ___LSInvokeMIForShimmedInstall_block_invoke_cold_1();
    }

    uint64_t v13 = *MEMORY[0x189607490];
    v14 = @"unknown error installing via mobileinstallation";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  -101LL,  (uint64_t)"_LSInvokeMIForShimmedInstall_block_invoke",  794LL,  v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void ___LSInvokeMIForShimmedInstall_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_20( &dword_183E58000,  v0,  v1,  "MobileInstallationInstallForInstallCoordinationWithError returned NO but did not emit an error?",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

@end