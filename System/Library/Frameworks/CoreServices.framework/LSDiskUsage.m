@interface LSDiskUsage
@end

@implementation LSDiskUsage

void __27___LSDiskUsage_staticUsage__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __28___LSDiskUsage_dynamicUsage__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __38___LSDiskUsage_onDemandResourcesUsage__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __27___LSDiskUsage_sharedUsage__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:@"static"];
  }
}

void __32___LSDiskUsage_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(NSString);
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 initWithFormat:@"<%@ %p> { %@ }", v7, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __32___LSDiskUsage_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"knownUsage"];
}

void __38___LSDiskUsage_Internal___serverQueue__block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("Disk usage population queue", v2);
  v1 = (void *)+[_LSDiskUsage(Internal) _serverQueue]::result;
  +[_LSDiskUsage(Internal) _serverQueue]::result = (uint64_t)v0;
}

void __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v5 = v2;
    [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"ODR"];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"shared"];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4 == 0LL;
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }

    id v2 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void __38___LSDiskUsage_Private__propertyQueue__block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("Disk usage property queue", v2);
  v1 = (void *)+[_LSDiskUsage(Private) propertyQueue]::result;
  +[_LSDiskUsage(Private) propertyQueue]::result = (uint64_t)v0;
}

void __48___LSDiskUsage_Private__mobileInstallationQueue__block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("MobileInstallation callout queue for disk usage", v2);
  v1 = (void *)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;
  +[_LSDiskUsage(Private) mobileInstallationQueue]::result = (uint64_t)v0;
}

void __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke( uint64_t a1,  void *a2)
{
  v16[2] = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x186E2A59C]();
  v15[0] = @"DynamicDiskUsage";
  v15[1] = @"SharedDiskUsage";
  v16[0] = MEMORY[0x189604A88];
  v16[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)softLinkMobileInstallationCopyDiskUsageForLaunchServices(*(const void **)(a1 + 32), v5);
  id v7 = v6;
  if (!v6
    || ([v6 objectForKeyedSubscript:*(void *)(a1 + 32)],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        (v9 = v8) == 0LL))
  {
    v10 = 0LL;
    v11 = 0LL;
LABEL_7:
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  109LL,  (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]_block_invoke",  319LL,  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0LL, v12);
    goto LABEL_8;
  }

  [v8 objectForKeyedSubscript:@"DynamicDiskUsage"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"SharedDiskUsage"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v11) {
    goto LABEL_7;
  }
  v13[0] = @"dynamic";
  v13[1] = @"shared";
  v14[0] = v10;
  v14[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v3)[2](v3, v12, 0LL);
LABEL_8:

  objc_autoreleasePoolPop(v4);
}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.ondemandd.launchservices" options:4096];
  v1 = (void *)+[_LSDiskUsage(Private) ODRConnection]::result;
  +[_LSDiskUsage(Private) ODRConnection]::result = v0;

  [(id)+[_LSDiskUsage(Private) ODRConnection]::result setRemoteObjectInterface:v2];
  [(id)+[_LSDiskUsage(Private) ODRConnection]::result setInterruptionHandler:&__block_literal_global_123];
  [(id)+[_LSDiskUsage(Private) ODRConnection]::result resume];
}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke_2()
{
  uint64_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_183E58000, v0, OS_LOG_TYPE_DEFAULT, "Unable to connect to ondemandd.", v1, 2u);
  }
}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 40) ODRConnection];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_189D72590;
  id v6 = v3;
  id v13 = v6;
  [v4 remoteObjectProxyWithErrorHandler:v12];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = *(void *)(a1 + 32);
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3;
  v10[3] = &unk_189D75D28;
  id v9 = v6;
  id v11 = v9;
  [v7 bytesUsedForApplicationWithBundleID:v8 replyBlock:v10];
}

uint64_t __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189607968] numberWithInteger:a2];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSDefaultLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to get dynamic/ODR disk usage for app %@, error = %@",  (uint8_t *)&v8,  0x16u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_127(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [(id)objc_opt_class() propertyQueue];
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2;
    v10[3] = &unk_189D74BF8;
    void v10[4] = a1[4];
    id v11 = v5;
    dispatch_barrier_async(v7, v10);

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  else
  {
    _LSDefaultLog();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1[4] + 8LL);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to get dynamic/ODR disk usage for app %@, error = %@",  buf,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
  }
}

uint64_t __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(*(void *)(a1 + 40) + 16)];
}

@end