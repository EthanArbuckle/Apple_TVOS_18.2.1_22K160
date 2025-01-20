@interface LSDeviceIdentifierCache
@end

@implementation LSDeviceIdentifierCache

void __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke( uint64_t a1)
{
  v29[2] = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v9 = 0LL;
    goto LABEL_41;
  }

  v2 = (uint64_t *)(a1 + 64);
  [*(id *)(a1 + 48) identifiersOfTypeNotDispatched:*(void *)(a1 + 64)];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *v2;
  if (*v2 != 1) {
    goto LABEL_7;
  }
  v5 = +[LSApplicationRestrictionsManager sharedInstance]();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v5) & 1) == 0)
  {

    goto LABEL_13;
  }

  char v6 = [*(id *)(a1 + 48) deviceUnlockedSinceBoot];

  if ((v6 & 1) == 0)
  {
LABEL_13:
    uint64_t v10 = objc_msgSend(MEMORY[0x189607AB8], "_LS_nullUUID");
    goto LABEL_16;
  }

  uint64_t v4 = *(void *)(a1 + 64);
LABEL_7:
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      id v7 = *(id *)(*(void *)(a1 + 48) + 16LL);
      if (v7)
      {
LABEL_38:
        [*(id *)(a1 + 48) applyPerUserEntropyNotDispatched:v7 type:*(void *)(a1 + 64)];
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_40;
      }

      [MEMORY[0x189607AB8] UUID];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 16LL), v8);
      [*(id *)(a1 + 48) save];
      goto LABEL_37;
    }

    if (!v3) {
      goto LABEL_39;
    }
    if (+[LSHRNSupport deviceConfiguredForHRN](&OBJC_CLASS___LSHRNSupport, "deviceConfiguredForHRN"))
    {
      v29[0] = 0LL;
      v29[1] = 0LL;
      [*(id *)(a1 + 48) deviceIdentifierVendorSeed];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 getUUIDBytes:v29];

      uint64_t v12 = *(void *)(a1 + 32);
      [MEMORY[0x189603F48] dataWithBytes:v29 length:16];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[LSHRNSupport vendorIDFromVendorName:seedData:error:]( &OBJC_CLASS___LSHRNSupport,  "vendorIDFromVendorName:seedData:error:",  v12,  v13,  0LL);
      goto LABEL_40;
    }

    [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"LSVendorIdentifier"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 objectForKeyedSubscript:@"LSApplications"];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && [v17 containsObject:*(void *)(a1 + 40)])
      {
        v8 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v15];

        if (v8)
        {
LABEL_36:

LABEL_37:
          id v7 = v8;
          if (v8) {
            goto LABEL_38;
          }
LABEL_39:
          v9 = 0LL;
          goto LABEL_40;
        }
      }

      else
      {
      }
    }

    [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      [MEMORY[0x189603FC8] dictionary];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v19 forKeyedSubscript:*(void *)(a1 + 32)];
    }

    [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectForKeyedSubscript:@"LSVendorIdentifier"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v21];
    }

    else
    {
      [MEMORY[0x189607AB8] UUID];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 UUIDString];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 setObject:v22 forKeyedSubscript:@"LSVendorIdentifier"];
    }

    [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"LSApplications"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      uint64_t v26 = [MEMORY[0x189603FA8] array];
      [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 setObject:v26 forKeyedSubscript:@"LSApplications"];

      v25 = (void *)v26;
    }

    if (([v25 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
      [v25 addObject:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) save];

    goto LABEL_36;
  }

  if (!+[LSHRNSupport deviceConfiguredForHRN](&OBJC_CLASS___LSHRNSupport, "deviceConfiguredForHRN")) {
    goto LABEL_39;
  }
  uint64_t v10 = [*(id *)(a1 + 48) deviceIdentifierVendorSeed];
LABEL_16:
  v9 = (void *)v10;
LABEL_40:

LABEL_41:
  uint64_t v28 = *(void *)(a1 + 56);
  if (v28) {
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v9);
  }
}

void __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke( uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    for (uint64_t i = 0LL; i != 3; ++i)
    {
      [*(id *)(a1 + 48) identifiersOfTypeNotDispatched:_LSAllDeviceIdentifierTypes[i]];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = v3;
      if (v3)
      {
        [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        char v6 = v5;
        if (v5)
        {
          [v5 objectForKeyedSubscript:@"LSApplications"];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 removeObject:*(void *)(a1 + 40)];
          if (![v7 count]) {
            [v4 removeObjectForKey:*(void *)(a1 + 32)];
          }
          [*(id *)(a1 + 48) save];
        }
      }
    }
  }

void __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke(uint64_t a1)
{
  if (![(id)__LSDefaultsGetSharedInstance() isInEducationMode])
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9 == 2)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      v11 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = 0LL;
    }

    else
    {
      if (v9 != 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "identifiersOfTypeNotDispatched:");
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 && [v13 count])
        {
          [v13 removeAllObjects];
          [*(id *)(a1 + 32) save];
        }

        goto LABEL_13;
      }

      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 16);
      *(void *)(v10 + 16) = 0LL;
    }

    [*(id *)(a1 + 32) save];
    return;
  }

  id v13 = (id)[*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
  if (v13)
  {
    [MEMORY[0x189607968] numberWithInteger:*(void *)(a1 + 40)];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKeyedSubscript:v2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      [*(id *)(a1 + 32) generateSomePerUserEntropyNotDispatched];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithInteger:*(void *)(a1 + 40)];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setObject:v4 forKeyedSubscript:v5];

      uint64_t v6 = [v13 copy];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v6;

      [*(id *)(a1 + 32) save];
    }
  }

void __32___LSDeviceIdentifierCache_save__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) allIdentifiersNotDispatched];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = *(id *)(*(void *)(a1 + 32) + 56LL);
    if (!v3)
    {
      _LSDefaultLog();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers file URL.", buf, 2u);
      }

      goto LABEL_22;
    }

    _LSDefaultLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [v3 path];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Writing identifiers file to %@", buf, 0xCu);
    }

    uint64_t v6 = (os_log_s *)[v2 mutableCopy];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    if (v8)
    {
      [v8 UUIDString];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"LSAdvertiserIdentifier");

      uint64_t v7 = *(void *)(a1 + 32);
    }

    uint64_t v10 = *(void **)(v7 + 24);
    if (v10)
    {
      [v10 UUIDString];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, @"LSVendorSeed");
    }

    id v21 = 0LL;
    [MEMORY[0x1896079E8] dataWithPropertyList:v6 format:200 options:0 error:&v21];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v21;
    v14 = v13;
    if (v12)
    {
      id v20 = v13;
      char v15 = [v12 writeToURL:v3 options:1073741825 error:&v20];
      id v16 = v20;

      if ((v15 & 1) != 0)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }

      _LSDefaultLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        _os_log_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to write plist data for identifiers: %@",  buf,  0xCu);
      }
    }

    else
    {
      _LSDefaultLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v14;
        _os_log_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to create plist data for identifiers: %@",  buf,  0xCu);
      }

      id v16 = v14;
    }

    goto LABEL_21;
  }

  _LSDefaultLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_183E58000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers.", buf, 2u);
  }

@end