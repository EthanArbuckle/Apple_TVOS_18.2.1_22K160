@interface LSDModifyClient
@end

@implementation LSDModifyClient

uint64_t __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke( uint64_t a1)
{
  v44[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if ([*(id *)(a1 + 40) canRegisterURL:*(void *)(a1 + 48) withOptions:*(unsigned int *)(v2 + 16)])
    {
      v41[0] = 0LL;
      v41[1] = v41;
      v41[2] = 0x2020000000LL;
      int v42 = 0;
      v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
      id v4 = *(id *)(a1 + 48);
      id v5 = *(id *)(a1 + 56);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v6 = *(void **)(a1 + 64);
      }
      else {
        v6 = 0LL;
      }
      v17 = v6;
      CFTypeRef cf = 0LL;
      v18 = _LSCreateRegistrationData(0LL, v3, v4, v17, (const __CFArray **)&cf);
      MEMORY[0x186E2AFD4](v18);
      _LSServer_DatabaseExecutionContext();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3321888768LL;
      v27[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2;
      v27[3] = &unk_189D76290;
      v37 = v41;
      id v20 = v3;
      id v28 = v20;
      id v21 = v5;
      id v29 = v21;
      v22 = v18;
      v30 = v22;
      v23 = v17;
      v31 = v23;
      id v24 = v4;
      uint64_t v25 = *(void *)(a1 + 40);
      id v32 = v24;
      uint64_t v33 = v25;
      id v34 = *(id *)(a1 + 72);
      id v36 = *(id *)(a1 + 80);
      char v39 = 0;
      id v35 = *(id *)(a1 + 32);
      CFTypeRef v38 = cf;
      if (cf) {
        CFRetain(cf);
      }
      -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v19, v27);

      if (v38) {
        CFRelease(v38);
      }
      CFTypeRef v38 = 0LL;

      if (cf) {
        CFRelease(cf);
      }

      _Block_object_dispose(v41, 8);
    }

    else
    {
      uint64_t v15 = *(void *)(a1 + 80);
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10819LL,  (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke",  415LL,  0LL);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, void, void, void *))(v15 + 16))(v15, 0LL, 0LL, 0LL, 0LL, v16);
    }
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v43 = *MEMORY[0x189607490];
    v44[0] = @"invalid LSRegistrationInfo";
    [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke",  412LL,  v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void, void, void *))(v7 + 16))(v7, 0LL, 0LL, 0LL, 0LL, v9);
  }

  return MEMORY[0x186E2AFE0](v10, v11, v12, v13, v14);
}

void __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  CFTypeRef cf = 0LL;
  uint64_t v27 = 0LL;
  char v25 = 0;
  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL);
  if (v7) {
    goto LABEL_2;
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  id v20 = *(void **)(a1 + 48);
  id v21 = *(const __CFDictionary **)(a1 + 56);
  CFTypeRef cf = 0LL;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = _LSServer_RegisterItemInfo( v18,  v19,  v20,  v21,  (int *)&v27,  (uint64_t)&v27 + 4,  &v25,  &cf);
  if (cf)
  {
    v22 = +[_LSCanOpenURLManager sharedManager](&OBJC_CLASS____LSCanOpenURLManager, "sharedManager");
    [v22 resetSchemeQueryLimitForApplicationWithIdentifier:cf];
  }

  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL);
  if (!v7)
  {
    _LSArmSaveTimer(5);
    int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL);
LABEL_20:
    if (!v7)
    {
      v8 = 0LL;
      goto LABEL_3;
    }

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  _LSDatabaseSentinelDecrement();
}

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v20 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = 0LL;
  char v19 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v7, 0LL);

  if (!v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v13, 0LL);

    if (v14) {
      id v11 = 0LL;
    }
    else {
      id v11 = v20;
    }
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v11);
    goto LABEL_9;
  }

  int v9 = _LSUnregisterBundle(v8, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  uint64_t v10 = *(void *)(a1 + 32);
  if (v9)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v9,  (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]_block_invoke_2",  589LL,  0LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0LL, v11);
LABEL_9:

    goto LABEL_10;
  }

  (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, 1LL, 0LL);
LABEL_10:
  if (v17 && v19) {
    _LSContextDestroy(v17);
  }
  id v15 = v18;
  uint64_t v17 = 0LL;
  id v18 = 0LL;

  char v19 = 0;
  id v16 = v20;
  id v20 = 0LL;
}

void __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = 0LL;
  int v2 = FSNodeCreateWithURL(*(void *)(a1 + 32), 1LL, &v5);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v2,  (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]_block_invoke",  623LL,  0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0LL, v4);
  }

  else
  {
    _LSContainerAddWithNode(0LL, v5, 0, *(void **)(a1 + 40));
  }

  MEMORY[0x186E2AFE0]();
}

void __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v21 = 0LL;
  id v18 = 0LL;
  id v19 = 0LL;
  char v20 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v7, 0LL);

  if (v8)
  {
    int v9 = _LSUpdateContainerState(*v8, *(unsigned int *)(a1 + 40), (uint64_t)v17);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v9,  (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]_block_invoke",  660LL,  0LL);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0LL, v11);
    }

    else
    {
      [MEMORY[0x189603F48] dataWithBytes:v17 length:20];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v11, 0LL);
    }
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v13, 0LL);

    if (v14) {
      id v11 = 0LL;
    }
    else {
      id v11 = v21;
    }
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v11);
  }

  if (v18 && v20) {
    _LSContextDestroy(v18);
  }
  id v15 = v19;
  id v18 = 0LL;
  id v19 = 0LL;

  char v20 = 0;
  id v16 = v21;
  id v21 = 0LL;
}

void __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke( uint64_t a1)
{
  int v2 = _LSRegisterExtensionPoint( 0LL,  0LL,  *(__CFString **)(a1 + 32),  *(unsigned int *)(a1 + 64),  *(const __CFDictionary **)(a1 + 40),  *(void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v2,  (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]_block_invoke",  697LL,  0LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 1LL, 0LL);
  }

void __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke( uint64_t a1)
{
  int v2 = _LSUnregisterExtensionPoint( 0LL,  *(const __CFString **)(a1 + 32),  *(unsigned int *)(a1 + 56),  *(unsigned int *)(a1 + 60),  *(__CFString **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v2,  (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]_block_invoke",  716LL,  0LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 1LL, 0LL);
  }

void __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v9 = -10822;
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) XPCConnection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _xpcConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2;
  uint64_t v13 = &unk_189D76390;
  id v14 = *(id *)(a1 + 32);
  int v17 = *(_DWORD *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  __int128 v18 = *(_OWORD *)(a1 + 68);
  __int128 v19 = *(_OWORD *)(a1 + 84);
  uint64_t v6 = *(void *)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v6;
  _LSIfCanModifyDefaultHandler(0LL, v2, &v9, v4);

  uint64_t v7 = *(void *)(a1 + 56);
  if (v9)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v9,  (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]_block_invoke",  787LL,  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v8);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1LL, 0LL);
  }
}

uint64_t __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v2 = *(_OWORD *)(a1 + 76);
  __int128 v26 = *(_OWORD *)(a1 + 60);
  __int128 v27 = v2;
  uint64_t UnsupportedFormatFlag = _LSBundleDataGetUnsupportedFormatFlag();
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 48) XPCConnection];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 processIdentifier];
    uint64_t v7 = *(unsigned int *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    __int128 v10 = *(_OWORD *)(a1 + 76);
    v13[0] = *(_OWORD *)(a1 + 60);
    v13[1] = v10;
    _LSVersionNumberGetStringRepresentation(v13);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    v23 = v11;
    __int16 v24 = 2048;
    uint64_t v25 = (int)UnsupportedFormatFlag;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "pid %ld setting handler for content type %{public}@ roles %lx to %@ v %@ -> %ld",  buf,  0x3Eu);
  }

  return UnsupportedFormatFlag;
}

void __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke(uint64_t a1)
{
  int v8 = -10822;
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) XPCConnection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _xpcConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = *(id *)(a1 + 32);
  _LSIfCanModifyDefaultHandler(0LL, v2, &v8, v4);

  uint64_t v5 = *(void *)(a1 + 48);
  if (v8)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v8,  (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]_block_invoke",  823LL,  0LL);
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
  }

  else
  {
    (*(void (**)(void, uint64_t, void))(v5 + 16))(*(void *)(a1 + 48), 1LL, 0LL);
  }
}

uint64_t __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t UnsupportedFormatFlag = _LSBundleDataGetUnsupportedFormatFlag();
  _LSDefaultLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) XPCConnection];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 processIdentifier];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(unsigned int *)(a1 + 48);
    int v9 = 134218754;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = (int)UnsupportedFormatFlag;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "pid %ld removing content type handler for %{public}@ roles %lx -> %ld",  (uint8_t *)&v9,  0x2Au);
  }

  return UnsupportedFormatFlag;
}

void __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v10 = -10822;
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) XPCConnection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _xpcConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  __int16 v13 = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2;
  uint64_t v14 = &unk_189D76430;
  id v15 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  __int128 v6 = *(_OWORD *)(a1 + 80);
  __int128 v18 = *(_OWORD *)(a1 + 64);
  __int128 v19 = v6;
  uint64_t v7 = *(void *)(a1 + 40);
  id v16 = v5;
  uint64_t v17 = v7;
  _LSIfCanModifyDefaultHandler(v2, 0LL, &v10, v4);

  uint64_t v8 = *(void *)(a1 + 56);
  if (v10)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v10,  (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]_block_invoke",  860LL,  0LL);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v9);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1LL, 0LL);
  }
}

uint64_t __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v2 = *(_OWORD *)(a1 + 72);
  __int128 v23 = *(_OWORD *)(a1 + 56);
  __int128 v24 = v2;
  uint64_t UnsupportedFormatFlag = _LSBundleDataGetUnsupportedFormatFlag();
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 48) XPCConnection];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 processIdentifier];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    __int128 v9 = *(_OWORD *)(a1 + 72);
    v12[0] = *(_OWORD *)(a1 + 56);
    v12[1] = v9;
    _LSVersionNumberGetStringRepresentation(v12);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = (int)UnsupportedFormatFlag;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "pid %ld setting handler for scheme %{public}@ to %@ v %@: %ld",  buf,  0x34u);
  }

  return UnsupportedFormatFlag;
}

void __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  int v8 = -10822;
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) XPCConnection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _xpcConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = *(id *)(a1 + 32);
  _LSIfCanModifyDefaultHandler(v2, 0LL, &v8, v4);

  uint64_t v5 = *(void *)(a1 + 48);
  if (v8)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v8,  (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]_block_invoke",  887LL,  0LL);
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
  }

  else
  {
    (*(void (**)(void, uint64_t, void))(v5 + 16))(*(void *)(a1 + 48), 1LL, 0LL);
  }
}

uint64_t __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t UnsupportedFormatFlag = _LSBundleDataGetUnsupportedFormatFlag();
  _LSDefaultLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) XPCConnection];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 processIdentifier];
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = (int)UnsupportedFormatFlag;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "pid %ld removing handler for scheme %{public}@: %ld",  (uint8_t *)&v8,  0x20u);
  }

  return UnsupportedFormatFlag;
}

void __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__18;
  __int16 v17 = __Block_byref_object_dispose__18;
  id v18 = 0LL;
  int v12 = -10822;
  [*(id *)(a1 + 32) XPCConnection];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _xpcConnection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSIfCanModifyDefaultHandler((uint64_t)@"*", (uint64_t)@"*", &v12, v3);

  int v8 = v14;
  if (*((_BYTE *)v20 + 24))
  {
    BOOL v9 = 1LL;
  }

  else if (v14[5])
  {
    BOOL v9 = 0LL;
  }

  else
  {
    uint64_t v10 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v12,  (uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]_block_invoke",  914LL,  0LL);
    uint64_t v11 = (void *)v14[5];
    v14[5] = v10;

    int v8 = v14;
    BOOL v9 = *((_BYTE *)v20 + 24) != 0;
  }

  (*(void (**)(void, BOOL, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v9,  v8[5],  v4,  v5,  v6,  v7);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke_206(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v2 + 40);
  BOOL v3 = _LSServer_RemoveAllHandlers(&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = _LSGetOSStatusFromNSError(*(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }
  _LSDefaultLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) XPCConnection];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v6 processIdentifier];
    *(_DWORD *)buf = 134218240;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "pid %ld removing ALL handlers: %ld", buf, 0x16u);
  }

  return v4;
}

void __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = _LSCheckEntitlementForXPCConnection(v2, @"com.apple.private.coreservices.canresetserverstore");

  if (v3)
  {
    _LSResetServer();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]_block_invoke",  993LL,  0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
  }

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v28[1] = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__18;
  __int128 v26 = __Block_byref_object_dispose__18;
  id v27 = 0LL;
  int updated = _LSServer_UpdateDatabaseWithInfo( *(void **)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  0LL,  a6,  a7,  a8);
  if (updated)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  updated,  (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operat ionUUID:returnSaveToken:completionHandler:]_block_invoke_2",  1070LL,  0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0LL, 0LL, v11);
  }

  else
  {
    if (*(_BYTE *)(a1 + 84))
    {
      __int16 v12 = -[_LSDModificationPendingSaveToken initWithUUID:]( objc_alloc(&OBJC_CLASS____LSDModificationPendingSaveToken),  "initWithUUID:",  *(void *)(a1 + 64));
      uint64_t v13 = (void *)v23[5];
      v23[5] = (uint64_t)v12;

      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2;
      v19[3] = &unk_189D764D0;
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = &v22;
      uint64_t v14 = (void *)MEMORY[0x186E2A7B8](v19);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    _LSArmSaveTimerWithObserver(5, v14);
    if (*(_DWORD *)(a1 + 80))
    {
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(a1 + 32),  1LL);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = *(unsigned int *)(a1 + 80);
        v28[0] = v15;
        [MEMORY[0x189603F18] arrayWithObjects:v28 count:1];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 sendNotification:v17 forAppProxies:v18 Plugins:0 completion:0];
      }
    }

    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 72) + 16LL))( *(void *)(a1 + 72),  1LL,  v23[5],  0LL);
  }

  _Block_object_dispose(&v22, 8);
}

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSInstallLog();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Save after update app record for bundle %@ attempted: %d save error: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  89LL,  (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operat ionUUID:returnSaveToken:completionHandler:]_block_invoke",  1039LL,  0LL);

    uint64_t v10 = (void *)v11;
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  _LSDefaultLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) XPCConnection];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = 67109120;
    v5[1] = [v4 processIdentifier];
    _os_log_error_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_ERROR,  "Request to synchronize with MobileInstallation made by pid %d",  (uint8_t *)v5,  8u);
  }

  _LSServer_SyncWithMobileInstallation(0LL);
  return MEMORY[0x186E2AFE0]();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  id v42 = a2;
  id v43 = a3;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3032000000LL;
  v72 = __Block_byref_object_copy__18;
  v73 = __Block_byref_object_dispose__18;
  id v74 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (*(void *)(a1 + 32))
  {
    id v5 = 0LL;
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke",  1192LL,  0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v68 = 0LL;
  v65 = 0LL;
  id v66 = 0LL;
  char v67 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = a1;
  v45 = (id *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v65, v6, 0LL);

  uint64_t v7 = a1;
  if (!*(void *)(a1 + 32) || !v45) {
    goto LABEL_42;
  }
  uint64_t v8 = objc_alloc(&OBJC_CLASS___FSNode);
  uint64_t v9 = *(void *)(a1 + 32);
  id v63 = v5;
  v44 = -[FSNode initWithURL:flags:error:](v8, "initWithURL:flags:error:", v9, 8LL, &v63);
  v40 = (os_log_s *)v63;

  if (!v44)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v65, v18, 0LL);

    if (v19) {
      id v5 = 0LL;
    }
    else {
      id v5 = v68;
    }
    __int16 v16 = v40;
    goto LABEL_37;
  }

  v62 = v40;
  _LSContainerFindOrRegisterWithNode(v45, v44, 0, &v64, 0LL, 0LL, &v62);
  uint64_t v10 = v62;

  v41 = v10;
  if (v10)
  {
    _LSDefaultLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) absoluteString];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4( v12,  (uint64_t)v83,  v11);
    }
  }

  +[FSNode rootVolumeNode](&OBJC_CLASS___FSNode, "rootVolumeNode");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FSNode isEqual:](v44, "isEqual:", v13)) {
    goto LABEL_14;
  }
  +[FSNode systemDataVolumeNode](&OBJC_CLASS___FSNode, "systemDataVolumeNode");
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FSNode isEqual:](v44, "isEqual:", v14))
  {

LABEL_14:
    goto LABEL_15;
  }

  +[FSNode prebootVolumeNode](&OBJC_CLASS___FSNode, "prebootVolumeNode");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = -[FSNode isEqual:](v44, "isEqual:", v20);

  if (v21)
  {
LABEL_15:
    uint64_t v81 = *MEMORY[0x189607490];
    v82 = @"Mount point was root/nil";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -46LL,  (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke",  1211LL,  v15);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    _LSDefaultLog();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) absoluteString];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2( v17,  (uint64_t)v78,  v16);
    }

    goto LABEL_37;
  }

  if (v64)
  {
    uint64_t v55 = MEMORY[0x1895F87A8];
    uint64_t v56 = 3221225472LL;
    v57 = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_228;
    v58 = &unk_189D76520;
    int v61 = v64;
    v59 = &v69;
    v60 = v45;
    _CSStoreEnumerateUnits();
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id obj = (id)v70[5];
    uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v80 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 appState];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v28 = [v27 isPlaceholder];
          v79 = v25;
          [MEMORY[0x189603F18] arrayWithObjects:&v79 count:1];
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28) {
            uint64_t v30 = 9LL;
          }
          else {
            uint64_t v30 = 8LL;
          }
          [v26 sendNotification:v30 forAppProxies:v29 Plugins:0 completion:0];
        }

        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v80 count:16];
      }

      while (v22);
    }

    _LSContainerRemove((uint64_t *)v45, v64);
    if (!v41)
    {
      id v5 = 0LL;
      uint64_t v33 = v44;
LABEL_40:

      goto LABEL_41;
    }

    _LSDefaultLog();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(v46 + 32) absoluteString];
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3( v32,  (uint64_t)v41,  (uint64_t)v78,  v31);
    }

    id v5 = v41;
LABEL_38:
    _LSDefaultLog();
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(v46 + 32) absoluteString];
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1( v34,  (uint64_t)v75,  (os_log_s *)v33);
    }

    goto LABEL_40;
  }

  uint64_t v76 = *MEMORY[0x189607490];
  v77 = @"Container could not be resolved";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke",  1234LL,  v16);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
  if (v5) {
    goto LABEL_38;
  }
LABEL_41:
  uint64_t v7 = v46;
LABEL_42:
  if (v5)
  {
    uint64_t v35 = 0LL;
  }

  else
  {
    __int16 v36 = -[_LSDModificationPendingSaveToken initWithUUID:]( objc_alloc(&OBJC_CLASS____LSDModificationPendingSaveToken),  "initWithUUID:",  *(void *)(v7 + 40));
    v48[0] = MEMORY[0x1895F87A8];
    v48[1] = 3221225472LL;
    v48[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_232;
    v48[3] = &unk_189D76548;
    id v49 = *(id *)(v7 + 32);
    uint64_t v35 = v36;
    v50 = v35;
    int v37 = (void *)MEMORY[0x186E2A7B8](v48);
    _LSArmSaveTimerWithObserver(1, v37);

    uint64_t v7 = v46;
  }

  _LSDatabaseSentinelDecrement();
  if (!v35) {
    _LSDatabaseSentinelFlush();
  }
  (*(void (**)(void))(*(void *)(v7 + 56) + 16LL))();

  if (v65 && v67) {
    _LSContextDestroy(v65);
  }
  id v38 = v66;
  v65 = 0LL;
  id v66 = 0LL;

  char v67 = 0;
  id v39 = v68;
  id v68 = 0LL;

  _Block_object_dispose(&v69, 8);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_228( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 48))
  {
    +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  a2,  *(void *)(a1 + 40));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:");
  }

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_232( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSInstallLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) absoluteString];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Save after unregistering mount point: %@ attempted: %d error: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  89LL,  (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke",  1256LL,  0LL);

    uint64_t v10 = (void *)v11;
  }

  [*(id *)(a1 + 40) saveDidHappen:v10 == 0 error:v10];
}

void __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v19 = 0LL;
  v20.db = 0LL;
  if (*(void *)(a1 + 32))
  {
    int v7 = _LSContextInit((id *)&v20.db);
    if (!v7)
    {
      int v7 = FSNodeCreateWithURL(*(void *)(a1 + 32), 0LL, &v19);
      if (!v7)
      {
        int v7 = _LSBundleFindWithNode(&v20, v19, &v18, &v17);
        if (!v7)
        {
          if (*(_DWORD *)(v17 + 12))
          {
            uint64_t v8 = (void *)_CSStringCopyCFString();
            if (v8)
            {
              +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  v18,  &v20);
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
              int v7 = _LSUnregisterAppWithBundleIDUsingContext(v8, 0, &v20, 0LL);
              BOOL v9 = v7 == 0;
              +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 appState];
              uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = [v11 isPlaceholder];
              v21[0] = v16;
              [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12) {
                uint64_t v14 = 9LL;
              }
              else {
                uint64_t v14 = 8LL;
              }
              [v10 sendNotification:v14 forAppProxies:v13 Plugins:0 completion:0];

              CFRelease(v8);
              goto LABEL_13;
            }
          }

          int v7 = 0;
        }
      }

      BOOL v9 = 0;
LABEL_13:
      _LSContextDestroy((void **)&v20.db);
      goto LABEL_14;
    }

    BOOL v9 = 0;
  }

  else
  {
    BOOL v9 = 0;
    int v7 = -50;
  }

void __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) XPCConnection];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _xpcConnection];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = _LSCheckEntitlementForXPCConnection(v3, @"com.apple.lsapplicationworkspace.rebuildappdatabases");

  if (v4)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    _OWORD v13[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2;
    v13[3] = &unk_189D72590;
    id v5 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    _LSServer_RefreshContentInFrameworkAtURL(v5, v13);
    id v6 = v14;
  }

  else
  {
    _LSDefaultLog();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      [*(id *)(a1 + 32) XPCConnection];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 1024;
      int v20 = [v12 processIdentifier];
      _os_log_error_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_ERROR,  "Unentitled request to refresh plugins in framework %@ by pid %d",  buf,  0x12u);
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (@"com.apple.lsapplicationworkspace.rebuildappdatabases") {
      BOOL v9 = @"com.apple.lsapplicationworkspace.rebuildappdatabases";
    }
    else {
      BOOL v9 = @"unknown entitlement";
    }
    uint64_t v15 = *MEMORY[0x189607490];
    __int16 v16 = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient refreshContentInFrameworkAtURL:reply:]_block_invoke",  1345LL,  v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
  }
}

uint64_t __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v18 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = 0LL;
  char v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v7, 0LL);

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v10, 0LL);

    if (v11) {
      id v12 = 0LL;
    }
    else {
      id v12 = v18;
    }
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0LL, v12);
  }

  if (v15 && v17) {
    _LSContextDestroy(v15);
  }
  id v13 = v16;
  uint64_t v15 = 0LL;
  id v16 = 0LL;

  char v17 = 0;
  id v14 = v18;
  id v18 = 0LL;
}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v19 = 0LL;
  id v16 = 0LL;
  id v17 = 0LL;
  char v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v7, 0LL);

  if (v8)
  {
    id v9 = (id)[*(id *)(a1 + 32) bundleIdentifierWithContext:v8 error:0];
  }

  else
  {
    _LSDefaultLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v13, 0LL);

      if (v14) {
        id v15 = 0LL;
      }
      else {
        id v15 = v19;
      }
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_error_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_ERROR,  "Unexpected error talking to LS database while setting preference value: %{public}@",  buf,  0xCu);
    }
  }

  if (v16 && v18) {
    _LSContextDestroy(v16);
  }
  id v11 = v17;
  id v16 = 0LL;
  id v17 = 0LL;

  char v18 = 0;
  id v12 = v19;
  id v19 = 0LL;
}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_240( LaunchServices::PrefsStorage *a1)
{
  uint64_t Shared = LaunchServices::PrefsStorage::GetShared(a1);
  int v3 = (void *)*((void *)a1 + 4);
  int v4 = (void *)*((void *)a1 + 5);
  id v5 = (void *)*((void *)a1 + 6);
  uint64_t v6 = *(void *)(*((void *)a1 + 8) + 8LL);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = LaunchServices::PrefsStorage::setValueForNode(Shared, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(void *)(*((void *)a1 + 7) + 8LL) + 24LL) = v7;
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v33 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = 0LL;
  char v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v7, 0LL);

  if (!v8)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v16, 0LL);

    if (v17) {
      id v18 = 0LL;
    }
    else {
      id v18 = v33;
    }
    _LSDefaultLog();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1( (uint64_t)v18,  v23,  v24);
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v22 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v18;
    goto LABEL_13;
  }

  int v29 = 0;
  id v9 = (LaunchServices::PrefsStorage *)_LSBundleFindWithNode(v8, *(void **)(a1 + 32), &v29, 0LL);
  if (!v29)
  {
    _LSDefaultLog();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2();
    }

    uint64_t v20 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -600LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke",  1482LL,  0LL);
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
LABEL_13:

    goto LABEL_14;
  }

  uint64_t Shared = LaunchServices::PrefsStorage::GetShared(v9);
  id v12 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v14 + 40);
  BOOL v15 = LaunchServices::PrefsStorage::setValueForNode(Shared, v11, v12, v13, &obj);
  objc_storeStrong((id *)(v14 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v15;
LABEL_14:
  if (v30 && v32) {
    _LSContextDestroy(v30);
  }
  id v26 = v31;
  uint64_t v30 = 0LL;
  id v31 = 0LL;

  char v32 = 0;
  id v27 = v33;
  id v33 = 0LL;
}

uint64_t __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 == 0,  a2);
}

uint64_t __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 == 0,  a2);
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke( uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  _LSGetCollapsedMIDictionaryForAppAndContentsDictionaries(*(void **)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 count] == 1)
  {
    _LSDatabaseGetInstallingGroup();
    int v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v3);

    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2;
    v20[3] = &unk_189D76610;
    id v21 = *(id *)(a1 + 64);
    int v4 = (void *)MEMORY[0x186E2A7B8](v20);
    [v2 allValues];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 firstObject];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 objectForKeyedSubscript:*MEMORY[0x189604E00]];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSInstallLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      [*(id *)(a1 + 48) XPCConnection];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 processIdentifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Post installation registration: request to register %@, operation %@, from pid %d",  buf,  0x1Cu);
    }

    id v12 = objc_alloc(&OBJC_CLASS___LSMIResultRegistrant);
    id v13 = objc_alloc_init(&OBJC_CLASS___LSMIRegistrantServerStrategy);
    uint64_t v14 = -[LSMIResultRegistrant initWithContext:operationUUID:itemInfoDict:personas:]( v12,  "initWithContext:operationUUID:itemInfoDict:personas:",  v13,  *(void *)(a1 + 40),  v6,  *(void *)(a1 + 56));

    -[LSMIResultRegistrant runWithCompletion:](v14, "runWithCompletion:", v4);
    BOOL v15 = v21;
  }

  else
  {
    _LSInstallLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1(v16);
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"%zu items were provided to be registered; exactly 1 must be specified",
      [v2 count]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v22 = *MEMORY[0x189607490];
    uint64_t v23 = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]_block_invoke",  1581LL,  v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void *))(v17 + 16))(v17, 0LL, 0LL, v19);
  }
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  _LSDatabaseGetInstallingGroup();
  uint64_t v9 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v9);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke( uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  _LSDatabaseGetInstallingGroup();
  uint64_t v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  _OWORD v13[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2;
  v13[3] = &unk_189D76660;
  id v14 = *(id *)(a1 + 64);
  int v3 = (void *)MEMORY[0x186E2A7B8](v13);
  int v4 = objc_alloc(&OBJC_CLASS___LSMIResultUnregistrant);
  id v5 = objc_alloc_init(&OBJC_CLASS___LSMIRegistrantServerStrategy);
  id v6 = -[LSMIResultUnregistrant initWithContext:operationUUID:bundleIdentifier:precondition:type:]( v4,  "initWithContext:operationUUID:bundleIdentifier:precondition:type:",  v5,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned int *)(a1 + 72));

  _LSInstallLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(unsigned int *)(a1 + 72);
    [*(id *)(a1 + 56) XPCConnection];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 processIdentifier];
    *(_DWORD *)buf = 138413058;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Post uninstallation unregistration: request to unregister %@, operation %@, type %lx from pid %d",  buf,  0x26u);
  }

  -[LSMIResultUnregistrant runWithCompletion:](v6, "runWithCompletion:", v3);
}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v5 = a3;
  _LSDatabaseGetInstallingGroup();
  id v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v6);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v152 = *MEMORY[0x1895F89C0];
  id v105 = a2;
  id v106 = a3;
  id v128 = 0LL;
  v125 = 0LL;
  id v126 = 0LL;
  char v127 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v115 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v125, v4, 0LL);

  if (!v115)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v50 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v125, v50, 0LL);

    if (v51) {
      id v52 = 0LL;
    }
    else {
      id v52 = v128;
    }
    uint64_t v100 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v101 = *(void **)(v100 + 40);
    *(void *)(v100 + 40) = v52;

    goto LABEL_104;
  }

  [*(id *)(a1 + 32) objectEnumerator];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v109 = a1 + 56;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v7 = *(void **)(v6 + 40);
  id v8 = v5;
  v122 = 0LL;
  v123 = 0LL;
  v121 = 0LL;
  char v124 = 1;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  __int128 v139 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v136 objects:buf count:16];
  location = (id *)(v6 + 40);
  id v107 = v7;
  if (!v9)
  {
LABEL_49:
    id v49 = obj;
    goto LABEL_56;
  }

  uint64_t v10 = *(void *)v137;
LABEL_4:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v137 != v10) {
      objc_enumerationMutation(obj);
    }
    int v12 = *(void **)(*((void *)&v136 + 1) + 8 * v11);
    unsigned int v132 = 0;
    *(_OWORD *)__p = kLSVersionNumberNull;
    __int128 v144 = *(_OWORD *)algn_183FBF5B0;
    id v131 = 0LL;
    BOOL v13 = _LSBundleFindWithInfoAndNo_IOFilter(v115, 0LL, v12, 0, __p, 2, 128, 0LL, 0LL, &v132, 0LL, &v131);
    id v14 = v131;
    if (v13)
    {
      id v15 = v12;
      id v16 = v15;
      unsigned int v17 = v132;
      uint64_t v18 = v122;
      if (v122 >= (unsigned int *)v123)
      {
        uint64_t v20 = v121;
        uint64_t v21 = ((char *)v122 - (char *)v121) >> 4;
        unint64_t v22 = v21 + 1;
        uint64_t v23 = v123 - (char *)v121;
        else {
          unint64_t v24 = v22;
        }
        v135 = (LSContext *)&v123;
        if (v24)
        {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( (uint64_t)&v123,  v24);
          uint64_t v20 = v121;
          uint64_t v18 = v122;
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        __int16 v26 = &v25[16 * v21];
        *(void *)__int16 v26 = v16;
        *((_DWORD *)v26 + 2) = v17;
        if (v18 == v20)
        {
          __int16 v28 = &v25[16 * v21];
        }

        else
        {
          uint64_t v27 = v18;
          __int16 v28 = &v25[16 * v21];
          do
          {
            uint64_t v29 = *((void *)v27 - 2);
            v27 -= 4;
            *(void *)uint64_t v27 = 0LL;
            *((void *)v28 - 2) = v29;
            v28 -= 16;
            *((_DWORD *)v28 + 2) = v27[2];
          }

          while (v27 != v20);
        }

        __int16 v19 = (unsigned int *)(v26 + 16);
        v121 = (unsigned int *)v28;
        v122 = (unsigned int *)(v26 + 16);
        uint64_t v30 = v123;
        v123 = &v25[16 * v24];
        v133.__end_cap_.__value_ = v18;
        v134 = v30;
        v133.__begin_ = v20;
        v133.__end_ = v20;
        std::__split_buffer<std::tuple<NSString * {__strong},unsigned int>>::~__split_buffer((uint64_t)&v133);
      }

      else
      {
        *(void *)v122 = v15;
        v18[2] = v17;
        __int16 v19 = v18 + 4;
      }

      v122 = v19;
    }

    unsigned int v130 = 0;
    memset(v142, 0, sizeof(v142));
    id v129 = v14;
    BOOL v31 = _LSBundleFindWithInfoAndNo_IOFilter(v115, 0LL, v12, 0, v142, 2, 1152, 0LL, 0LL, &v130, 0LL, &v129);
    id v32 = v129;

    if (v31)
    {
      id v33 = v12;
      id v34 = v33;
      unsigned int v35 = v130;
      __int16 v36 = v122;
      if (v122 >= (unsigned int *)v123)
      {
        id v38 = v121;
        uint64_t v39 = ((char *)v122 - (char *)v121) >> 4;
        unint64_t v40 = v39 + 1;
        uint64_t v41 = v123 - (char *)v121;
        else {
          unint64_t v42 = v40;
        }
        v135 = (LSContext *)&v123;
        if (v42)
        {
          id v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( (uint64_t)&v123,  v42);
          id v38 = v121;
          __int16 v36 = v122;
        }

        else
        {
          id v43 = 0LL;
        }

        v44 = &v43[16 * v39];
        *(void *)v44 = v34;
        *((_DWORD *)v44 + 2) = v35;
        if (v36 == v38)
        {
          uint64_t v46 = &v43[16 * v39];
        }

        else
        {
          v45 = v36;
          uint64_t v46 = &v43[16 * v39];
          do
          {
            uint64_t v47 = *((void *)v45 - 2);
            v45 -= 4;
            *(void *)v45 = 0LL;
            *((void *)v46 - 2) = v47;
            v46 -= 16;
            *((_DWORD *)v46 + 2) = v45[2];
          }

          while (v45 != v38);
        }

        int v37 = (unsigned int *)(v44 + 16);
        v121 = (unsigned int *)v46;
        v122 = (unsigned int *)(v44 + 16);
        v48 = v123;
        v123 = &v43[16 * v42];
        v133.__end_cap_.__value_ = v36;
        v134 = v48;
        v133.__begin_ = v38;
        v133.__end_ = v38;
        std::__split_buffer<std::tuple<NSString * {__strong},unsigned int>>::~__split_buffer((uint64_t)&v133);
      }

      else
      {
        *(void *)v122 = v33;
        v36[2] = v35;
        int v37 = v36 + 4;
      }

      v122 = v37;
      goto LABEL_47;
    }

    if (!v13) {
      break;
    }
LABEL_47:

    if (++v11 == v9)
    {
      uint64_t v9 = [obj countByEnumeratingWithState:&v136 objects:buf count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }

  [NSString stringWithFormat:@"No known bundle for %@", v12];
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v140 = *MEMORY[0x189607490];
  v141 = v53;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"getAffectedBundleInfoForIdentifiers",  1672LL,  v54);
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55) {
    goto LABEL_57;
  }
  if (v124)
  {
    v133.__begin_ = (std::vector<unsigned int>::pointer)&v121;
    std::vector<std::tuple<NSString * {__strong},unsigned int>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v133);
    char v124 = 0;
  }

  id v49 = v55;
  id v107 = v49;
LABEL_56:

LABEL_57:
  objc_storeStrong(location, v107);

  if (v124)
  {
    id v108 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithCapacity:",  objc_msgSend(*(id *)(a1 + 32), "count"));
    __p[0] = 0LL;
    __p[1] = 0LL;
    *(void *)&__int128 v144 = 0LL;
    uint64_t v56 = v121;
    v57 = &off_183FBE000;
    obja = v122;
    if (v121 == v122)
    {
      char v111 = 1;
    }

    else
    {
      char v111 = 1;
      do
      {
        id v58 = *(id *)v56;
        uint64_t v59 = v56[2];
        v60 = (void *)MEMORY[0x186E2A59C]();
        uint64_t v61 = _LSBundleGet(v115->db, v59);
        if (v61)
        {
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x4812000000LL;
          v146 = __Block_byref_object_copy__284;
          v147 = __Block_byref_object_dispose__285;
          v148 = "";
          v150 = 0LL;
          uint64_t v151 = 0LL;
          v149 = 0LL;
          *(void *)&__int128 v136 = MEMORY[0x1895F87A8];
          *((void *)&v136 + 1) = 3221225472LL;
          *(void *)&__int128 v137 = ___ZL23pluginsUnitIDsForBundleP9LSContextPK12LSBundleData_block_invoke;
          *((void *)&v137 + 1) = &unk_189D766F8;
          *(void *)&__int128 v138 = buf;
          _CSArrayEnumerateAllValues();
          std::vector<LSBundleClass>::vector(&v133, (const std::vector<unsigned int> *)(*(void *)&buf[8] + 48LL));
          _Block_object_dispose(buf, 8);
          if (v149)
          {
            v150 = v149;
            operator delete(v149);
          }

          std::vector<unsigned int>::__insert_with_size[abi:nn180100]<std::__wrap_iter<unsigned int *>,std::__wrap_iter<unsigned int *>>( (std::vector<unsigned int> *)__p,  (uint64_t)__p[1],  (char *)v133.__begin_,  (char *)v133.__end_,  v133.__end_ - v133.__begin_);
          v62 = +[LSApplicationExtensionRecord appexRecordsForUnitIDsWithContext:unitIDs:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "appexRecordsForUnitIDsWithContext:unitIDs:",  v115,  &v133);
          +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
          id v63 = (void *)objc_claimAutoreleasedReturnValue();
          [v63 detachAndSendNotification:@"com.apple.LaunchServices.pluginswillberemoved" forApplicationExtensionRecords:v62];

          int v64 = v57;
          v65 = -[LSBundleRecordUpdater initWithDatabase:bundleUnit:bundleData:]( objc_alloc(&OBJC_CLASS___LSBundleRecordUpdater),  "initWithDatabase:bundleUnit:bundleData:",  v115->db,  v59,  v61);
          uint64_t v66 = *(void *)(a1 + 40);
          uint64_t v67 = *(void *)(*(void *)(a1 + 56) + 8LL);
          id v120 = *(id *)(v67 + 40);
          LODWORD(v63) = -[LSBundleRecordUpdater parsePersonas:error:](v65, "parsePersonas:error:", v66, &v120);
          objc_storeStrong((id *)(v67 + 40), v120);
          v57 = v64;
          if ((_DWORD)v63
            && (uint64_t v68 = *(void *)(*(void *)v109 + 8LL),
                id v119 = *(id *)(v68 + 40),
                BOOL v69 = -[LSBundleRecordUpdater updateBundleRecord:](v65, "updateBundleRecord:", &v119),
                objc_storeStrong((id *)(v68 + 40), v119),
                v57 = v64,
                v69))
          {
            [v108 addObject:v58];
            v70 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
            [v70 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v62];
            v57 = v64;
          }

          else
          {
            _LSInstallLog();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
            {
              v72 = *(__n128 (**)(__n128 *, __n128 *))(*(void *)(*(void *)v109 + 8LL) + 40LL);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v58;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v59;
              *(_WORD *)&buf[22] = 2112;
              v146 = v72;
              _os_log_error_impl( &dword_183E58000,  (os_log_t)v70,  OS_LOG_TYPE_ERROR,  "could not update personas for %@ (bundle unit %llx): %@",  buf,  0x20u);
            }

            char v111 = 0;
          }

          if (v133.__begin_)
          {
            v133.__end_ = v133.__begin_;
            operator delete(v133.__begin_);
          }
        }

        else
        {
          _LSRegistrationLog();
          uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v59;
            _os_log_fault_impl( &dword_183E58000,  v71,  OS_LOG_TYPE_FAULT,  "Bundle unit %llx went missing after we just enumerated it!",  buf,  0xCu);
          }
        }

        objc_autoreleasePoolPop(v60);

        v56 += 4;
      }

      while (v56 != obja);
    }

    [v108 allObjects];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    id objb = (id)[v73 mutableCopy];

    id v74 = (unsigned int *)*((void *)v57 + 479);
    v75 = objb;
    while ([v75 count])
    {
      uint64_t v76 = MEMORY[0x186E2A59C]();
      unint64_t v77 = [objb count];
      if (v77 >= 0xA) {
        uint64_t v78 = 10LL;
      }
      else {
        uint64_t v78 = v77;
      }
      objc_msgSend(objb, "subarrayWithRange:", 0, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v133.__begin_ = (std::vector<unsigned int>::pointer)MEMORY[0x1895F87A8];
      v133.__end_ = v74;
      v133.__end_cap_.__value_ = (unsigned int *)___ZL45sendPersonaChangedNotificationsForIdentifiersP9LSContextP5NSSetIP8NSStringE_block_invoke;
      v134 = (char *)&__block_descriptor_40_e38___LSApplicationProxy_16__0__NSString_8l;
      v135 = v115;
      id v80 = v79;
      uint64_t v81 = &v133;
      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v80, "count"));
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      id v83 = v80;
      uint64_t v84 = [v83 countByEnumeratingWithState:&v136 objects:buf count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v137;
        do
        {
          for (uint64_t i = 0LL; i != v84; ++i)
          {
            if (*(void *)v137 != v85) {
              objc_enumerationMutation(v83);
            }
            ((void (*)(std::vector<unsigned int> *, void))v133.__end_cap_.__value_)( v81,  *(void *)(*((void *)&v136 + 1) + 8 * i));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            [v82 addObject:v87];
          }

          uint64_t v84 = [v83 countByEnumeratingWithState:&v136 objects:buf count:16];
        }

        while (v84);
      }
      v88 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      [v88 sendNotification:14 forAppProxies:v82 Plugins:1 completion:0];

      objc_msgSend(objb, "removeObjectsInRange:", 0, v78);
      v89 = (void *)v76;
      v75 = objb;
      objc_autoreleasePoolPop(v89);
    }

    v90 = (void *)MEMORY[0x186E2A59C]();
    v91 = +[LSApplicationExtensionRecord appexRecordsForUnitIDsWithContext:unitIDs:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "appexRecordsForUnitIDsWithContext:unitIDs:",  v115,  __p);
    v92 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    [v92 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v91];

    objc_autoreleasePoolPop(v90);
    if ((v111 & 1) != 0)
    {
      v93 = -[_LSDModificationPendingSaveToken initWithUUID:]( objc_alloc(&OBJC_CLASS____LSDModificationPendingSaveToken),  "initWithUUID:",  *(void *)(a1 + 48));
      uint64_t v94 = *(void *)(*(void *)(a1 + 64) + 8LL);
      v95 = *(void **)(v94 + 40);
      *(void *)(v94 + 40) = v93;

      v116[0] = MEMORY[0x1895F87A8];
      v116[1] = v74;
      v116[2] = __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_260;
      v116[3] = &unk_189D764D0;
      id v96 = *(id *)(a1 + 32);
      uint64_t v97 = *(void *)(a1 + 64);
      id v117 = v96;
      uint64_t v118 = v97;
      _LSArmSaveTimerWithObserver(1, v116);
    }

    else if ([v108 count])
    {
      _LSInstallLog();
      v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v99 = [v108 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v99;
        _os_log_impl( &dword_183E58000,  v98,  OS_LOG_TYPE_DEFAULT,  "Not all persona updates were successful, but %zu were, so arming save timer",  buf,  0xCu);
      }

      _LSArmSaveTimer(1);
    }

    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

  else
  {
    _LSInstallLog();
    id v108 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_ERROR)) {
      __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_cold_1();
    }
  }

  if (v124)
  {
    *(void *)buf = &v121;
    std::vector<std::tuple<NSString * {__strong},unsigned int>>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_260( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSInstallLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Save after update personas for bundles %@ attempted: %d save error: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  89LL,  (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:]_block_invoke",  1788LL,  0LL);

    uint64_t v10 = (void *)v11;
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_183E58000, a3, (uint64_t)a3, "Couldn't create node for mount point: %@ ", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_3();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a3,  (uint64_t)a3,  "Tried to deregister root / nil mount point: %@",  (uint8_t *)a2);

  OUTLINED_FUNCTION_3_3();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3( void *a1,  uint64_t a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  a4,  a3,  "Failed to deregister applications at mount point: %@ error: %@",  (uint8_t *)a3);

  OUTLINED_FUNCTION_3_3();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_183E58000, a3, (uint64_t)a3, "Mount point: %@ could not be resolved", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_3();
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136446466;
  int v4 = "-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_183E58000, a2, a3, "could not get database in %{public}s: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_5( &dword_183E58000,  v0,  v1,  "self-setting preference value: could not find record for %@ in the database",  v2);
  OUTLINED_FUNCTION_1();
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1( os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "wrong number of items provided for registration, rejecting",  v1,  2u);
}

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_5(&dword_183E58000, v0, v1, "could not get affected bundle info for persona change: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end