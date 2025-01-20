@interface LSDServiceStartAllServices
@end

@implementation LSDServiceStartAllServices

void ___LSDServiceStartAllServices_block_invoke()
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v0 = objc_alloc_init(MEMORY[0x189603FE0]);
  v1 = (void *)_LSDServiceStartAllServices::services;
  _LSDServiceStartAllServices::services = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x189603FE0]);
  v3 = (void *)_LSDServiceStartAllServices::listeners;
  _LSDServiceStartAllServices::listeners = (uint64_t)v2;

  *(void *)&__int128 buf = NSClassFromString(@"_LSDReadService");
  *((void *)&buf + 1) = NSClassFromString(@"_LSDModifyService");
  Class v22 = NSClassFromString(@"_LSDOpenService");
  Class v23 = NSClassFromString(@"_LSDDeviceIdentifierService");
  Class v24 = NSClassFromString(@"_LSDIconService");
  Class v25 = NSClassFromString(@"_LSDRebuildService");
  [MEMORY[0x189603F18] arrayWithObjects:&buf count:6];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v14,  "handleFailureInFunction:file:lineNumber:description:",  v15,  @"LSDService.mm",  334,  @"Failed to get LSDService subclass list for process %lu",  getpid());
  }

  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 XPCConnectionIsAlwaysPrivileged])
        {
          SharedInstance = (void *)__LSDefaultsGetSharedInstance();
        }
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  _LSDefaultLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "componentsJoinedByString:", @", ");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_183E58000, v12, OS_LOG_TYPE_DEFAULT, "Starting services: %@", (uint8_t *)&buf, 0xCu);
  }

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_29];
}

void ___LSDServiceStartAllServices_block_invoke_27(uint64_t a1, objc_class *a2)
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  objc_msgSend( SharedInstance,  "serviceNameForConnectionType:lightweightSystemService:",  -[objc_class connectionType](a2, "connectionType"),  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInFunction:v7, @"LSDService.mm", 356, @"Failed to create XPC service name for class %@", a2 file lineNumber description];
  }

  v4 = (void *)[objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:v11];
  if (v4)
  {
    id v5 = (void *)[[a2 alloc] initWithXPCListener:v4];
    if (!v5)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 handleFailureInFunction:v10, @"LSDService.mm", 365, @"Failed to create XPC service object of class %@", a2 file lineNumber description];
    }

    [v4 setDelegate:v5];
    [v4 resume];
    [(id)_LSDServiceStartAllServices::services addObject:v5];
    [(id)_LSDServiceStartAllServices::listeners addObject:v4];
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInFunction:v8, @"LSDService.mm", 361, @"Failed to create XPC listener for class %@", a2 file lineNumber description];
  }
}

@end