@interface NEHotspotConfigurationManager
+ (NEHotspotConfigurationManager)sharedManager;
- (void)applyConfiguration:(NEHotspotConfiguration *)configuration completionHandler:(void *)completionHandler;
- (void)getConfiguredSSIDsWithCompletionHandler:(void *)completionHandler;
- (void)joinAccessoryHotspot:(id)a3 passphrase:(id)a4 completionHandler:(id)a5;
- (void)joinAccessoryHotspotWithoutSecurity:(id)a3 completionHandler:(id)a4;
- (void)removeConfigurationForHS20DomainName:(NSString *)domainName;
- (void)removeConfigurationForSSID:(NSString *)SSID;
- (void)reportError:(void *)a3 completionHandler:;
@end

@implementation NEHotspotConfigurationManager

- (void)applyConfiguration:(NEHotspotConfiguration *)configuration completionHandler:(void *)completionHandler
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v6 = configuration;
  v7 = completionHandler;
  uint64_t v8 = -[NEHotspotConfiguration validate](v6, "validate");
  if (v8 != 100)
  {
    uint64_t v15 = v8;
    v16 = self;
LABEL_11:
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)v16, v15, v7);
    goto LABEL_17;
  }

  if (!self) {
    goto LABEL_8;
  }
  v9 = (objc_class *)MEMORY[0x1896078F8];
  v10 = v6;
  v11 = (void *)[[v9 alloc] initRequiringSecureCoding:1];
  [v11 encodeObject:v10 forKey:@"NEHotspotConfigurationKey"];

  [v11 finishEncoding];
  [v11 encodedData];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:
    ne_log_obj();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = (id)objc_opt_class();
      id v19 = v24;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "%@ failed to serialize configuration object",  buf,  0xCu);
    }

    v16 = self;
    uint64_t v15 = 107LL;
    goto LABEL_11;
  }
  v13 = +[NEHotspotConfigurationHelper sharedManager]();
  v14 = v13;
  if (v13)
  {
    if (v7)
    {
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke;
      v21[3] = &unk_18A08C820;
      v21[4] = self;
      id v22 = v7;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v14, v12, 0LL, v21);
    }

    else
    {
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v13, v12, 0LL, 0LL);
    }
  }

  else
  {
    ne_log_obj();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = (id)objc_opt_class();
      id v20 = v24;
      _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%@ failed to instantiate hotspot configuration helper.",  buf,  0xCu);
    }

    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)self, 107LL, v7);
  }

LABEL_17:
}

- (void)removeConfigurationForSSID:(NSString *)SSID
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v3 = SSID;
  v4 = +[NEHotspotConfigurationHelper sharedManager]();
  v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1LL, 0LL);
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ failed to instantiate hotspot configuration helper.",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)removeConfigurationForHS20DomainName:(NSString *)domainName
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v3 = domainName;
  v4 = +[NEHotspotConfigurationHelper sharedManager]();
  v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1LL, 0LL);
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ failed to instantiate hotspot configuration helper.",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)getConfiguredSSIDsWithCompletionHandler:(void *)completionHandler
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v3 = completionHandler;
  if (v3)
  {
    v4 = +[NEHotspotConfigurationHelper sharedManager]();
    if (v4)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke;
      v7[3] = &unk_18A08C848;
      int v8 = v3;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, 0LL, 2LL, v7);
      v5 = v8;
    }

    else
    {
      ne_log_obj();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = (id)objc_opt_class();
        id v6 = v10;
        _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ Failed to instantiate NEHotspotConfigurationHelper.",  buf,  0xCu);
      }
    }
  }

  else
  {
    ne_log_obj();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1876B1000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "no completion handler providd.", buf, 2u);
    }
  }
}

- (void)joinAccessoryHotspot:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  id v5 = a5;
  id v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__NEHotspotConfigurationManager_joinAccessoryHotspot_passphrase_completionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v8 = v5;
    dispatch_async(MEMORY[0x1895F8AE0], block);
  }
}

- (void)joinAccessoryHotspotWithoutSecurity:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  id v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __87__NEHotspotConfigurationManager_joinAccessoryHotspotWithoutSecurity_completionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v7 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], block);
  }
}

uint64_t __87__NEHotspotConfigurationManager_joinAccessoryHotspotWithoutSecurity_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __83__NEHotspotConfigurationManager_joinAccessoryHotspot_passphrase_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_18A0908C8;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1895F8AE0], v6);
}

uint64_t __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2( uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }
  else {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }
  return v2();
}

- (void)reportError:(void *)a3 completionHandler:
{
  id v5 = a3;
  id v6 = v5;
  if (a1 && v5)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke;
    block[3] = &unk_18A08FCA0;
    void block[4] = a1;
    id v8 = v5;
    uint64_t v9 = a2;
    dispatch_async(MEMORY[0x1895F8AE0], block);
  }
}

void __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    id v5 = v7;
    _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%@ received result code %lld", (uint8_t *)&v6, 0x16u);
  }

  -[NEHotspotConfigurationManager reportError:completionHandler:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
}

void __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke(void *a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1[5];
  if (a1[4])
  {
    id v2 = 0LL;
    uint64_t v3 = a1[6];
    switch(v3)
    {
      case 0LL:
        break;
      case 1LL:
        id v5 = @"failed to get user's approval.";
        uint64_t v6 = 7LL;
        goto LABEL_23;
      case 2LL:
LABEL_7:
        id v5 = @"internal error.";
        uint64_t v6 = 8LL;
        goto LABEL_23;
      case 3LL:
        id v5 = @"pending request.";
        uint64_t v6 = 9LL;
        goto LABEL_23;
      case 4LL:
        id v5 = @"unknown error.";
        goto LABEL_16;
      case 5LL:
        id v5 = @"cannot modify system configuration.";
        uint64_t v6 = 10LL;
        goto LABEL_23;
      case 6LL:
        id v5 = @"already associated.";
        uint64_t v6 = 13LL;
        goto LABEL_23;
      case 7LL:
      case 9LL:
LABEL_15:
        id v5 = @"<unknown>";
LABEL_16:
        uint64_t v6 = 11LL;
        goto LABEL_23;
      case 8LL:
        id v5 = @"application is not in the foreground.";
        uint64_t v6 = 14LL;
        goto LABEL_23;
      case 10LL:
        id v5 = @"accessory access is unauthorized by the user.";
        uint64_t v6 = 16LL;
        goto LABEL_23;
      case 11LL:
        id v5 = @"system denied configuration of the accessory network.";
        uint64_t v6 = 17LL;
LABEL_23:
        id v7 = (void *)MEMORY[0x189607870];
        uint64_t v11 = *MEMORY[0x1896075E0];
        v12[0] = v5;
        [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 errorWithDomain:@"NEHotspotConfigurationErrorDomain" code:v6 userInfo:v8];
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        id v2 = v9;
        break;
      default:
        uint64_t v4 = v3 - 100;
        id v5 = @"invalid SSID.";
        uint64_t v6 = 1LL;
        switch(v4)
        {
          case 0LL:
            goto LABEL_24;
          case 1LL:
            goto LABEL_23;
          case 2LL:
            id v5 = @"invalid WPA/WPA2 Passphrase.";
            uint64_t v6 = 2LL;
            goto LABEL_23;
          case 3LL:
            id v5 = @"invalid WEP Passphrase.";
            uint64_t v6 = 3LL;
            goto LABEL_23;
          case 4LL:
            id v5 = @"invalid EAP settings.";
            uint64_t v6 = 4LL;
            goto LABEL_23;
          case 5LL:
            id v5 = @"invalid Hotspot 2.0 Settings.";
            uint64_t v6 = 5LL;
            goto LABEL_23;
          case 6LL:
            id v5 = @"invalid Hotspot 2.0 Domain Name.";
            uint64_t v6 = 6LL;
            goto LABEL_23;
          case 7LL:
            goto LABEL_7;
          case 9LL:
            id v5 = @"JoinOnce is not supported for EAP security type.";
            uint64_t v6 = 12LL;
            goto LABEL_23;
          case 10LL:
            id v5 = @"invalid SSID Prefix.";
            uint64_t v6 = 15LL;
            goto LABEL_23;
          default:
            goto LABEL_15;
        }
    }
  }

  else
  {
    id v2 = 0LL;
  }

+ (NEHotspotConfigurationManager)sharedManager
{
  if (sharedManager_init_manager_7226 != -1) {
    dispatch_once(&sharedManager_init_manager_7226, &__block_literal_global_7227);
  }
  return (NEHotspotConfigurationManager *)(id)sharedManager_g_manager_7228;
}

void __46__NEHotspotConfigurationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NEHotspotConfigurationManager);
  uint64_t v1 = (void *)sharedManager_g_manager_7228;
  sharedManager_g_manager_7228 = (uint64_t)v0;
}

@end