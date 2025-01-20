@interface _LSDModifyClient
- (BOOL)_canRegisterOrUnregisterURL:(id)a3 withOptions:(unsigned int)a4;
- (BOOL)canRegisterContainer;
- (BOOL)canUnregisterWithOptions:(unsigned int)a3;
- (BOOL)clientHasMIEntitlement:(id)a3;
- (BOOL)clientIsEntitledForPostInstallationOperations;
- (void)forceSaveForTestingWithCompletion:(id)a3;
- (void)garbageCollectDatabaseWithCompletionHandler:(id)a3;
- (void)installApplication:(id)a3 atURL:(id)a4 withOptions:(id)a5 installType:(unint64_t)a6 reply:(id)a7;
- (void)performPostInstallationRegistration:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6;
- (void)performPostUninstallationUnregistrationOfBundleID:(id)a3 operationUUID:(id)a4 unregisterType:(unsigned int)a5 precondition:(id)a6 reply:(id)a7;
- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performUpdateOfPersonasOfBundleIDs:(id)a3 toPersonaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6;
- (void)rebuildApplicationDatabasesForSystem:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 completionHandler:(id)a6;
- (void)refreshContentInFrameworkAtURL:(id)a3 reply:(id)a4;
- (void)registerContainerURL:(id)a3 completionHandler:(id)a4;
- (void)registerExtensionPoint:(id)a3 platform:(unsigned int)a4 declaringURL:(id)a5 withInfo:(id)a6 completionHandler:(id)a7;
- (void)registerItemInfo:(id)a3 alias:(id)a4 diskImageAlias:(id)a5 bundleURL:(id)a6 installationPlist:(id)a7 completionHandler:(id)a8;
- (void)removeAllHandlerPrefsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)removeAllHandlersWithCompletionHandler:(id)a3;
- (void)removeHandlerForContentType:(id)a3 roles:(unsigned int)a4 completionHandler:(id)a5;
- (void)removeHandlerForURLScheme:(id)a3 completionHandler:(id)a4;
- (void)resetServerStoreWithCompletionHandler:(id)a3;
- (void)setDatabaseIsSeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 forURLScheme:(id)a5 completionHandler:(id)a6;
- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 roles:(unsigned int)a5 forContentType:(id)a6 completionHandler:(id)a7;
- (void)setPreferenceValue:(id)a3 forKey:(id)a4 forApplicationAtURL:(id)a5 completionHandler:(id)a6;
- (void)setPreferenceValueForCallingApplication:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setPreferredAppMarketplaces:(id)a3 completion:(id)a4;
- (void)setUpdateAvailabilities:(id)a3 completionHandler:(id)a4;
- (void)synchronizeWithMobileInstallation;
- (void)uninstallApplication:(id)a3 withOptions:(id)a4 uninstallType:(unint64_t)a5 reply:(id)a6;
- (void)unregisterApplicationAtURL:(id)a3 reply:(id)a4;
- (void)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 reply:(id)a5;
- (void)unregisterBundleUnit:(unsigned int)a3 options:(unsigned int)a4 completionHandler:(id)a5;
- (void)unregisterExtensionPoint:(id)a3 platform:(unsigned int)a4 withVersion:(id)a5 parentBundleUnit:(unsigned int)a6 completionHandler:(id)a7;
- (void)updateContainerUnit:(unsigned int)a3 completionHandler:(id)a4;
- (void)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 returnSaveToken:(BOOL)a9 completionHandler:(id)a10;
- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDModifyClient

- (BOOL)_canRegisterOrUnregisterURL:(id)a3 withOptions:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  if ((v4 & 0x10) != 0)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isSystemServer]) {
      BOOL v7 = -[_LSDModifyClient clientHasMIEntitlement:]( self,  "clientHasMIEntitlement:",  @"InstallForLaunchServices");
    }
    else {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)canUnregisterWithOptions:(unsigned int)a3
{
  return -[_LSDModifyClient _canRegisterOrUnregisterURL:withOptions:]( self,  "_canRegisterOrUnregisterURL:withOptions:",  0LL,  *(void *)&a3);
}

- (BOOL)canRegisterContainer
{
  return -[_LSDModifyClient _canRegisterOrUnregisterURL:withOptions:]( self,  "_canRegisterOrUnregisterURL:withOptions:",  0LL,  0LL);
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____LSDModifyClient;
  -[_LSDClient willHandleInvocation:isReply:](&v8, sel_willHandleInvocation_isReply_, v6, v4);
  _LSDatabaseGetSeedingGroup();
  BOOL v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setDatabaseIsSeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSDefaultLog();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109376;
    BOOL v15 = v4;
    __int16 v16 = 1024;
    int v17 = [v8 processIdentifier];
    _os_log_impl(&dword_183E58000, v7, OS_LOG_TYPE_DEFAULT, "setting database seeded: %d from pid %d", buf, 0xEu);
  }

  _LSServer_DatabaseExecutionContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke;
  v11[3] = &unk_189D76268;
  BOOL v13 = v4;
  id v10 = v6;
  id v12 = v10;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v11);
}

- (void)registerItemInfo:(id)a3 alias:(id)a4 diskImageAlias:(id)a5 bundleURL:(id)a6 installationPlist:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  MEMORY[0x186E2AFD4]();
  _LSServer_GetIOQueue();
  v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke;
  block[3] = &unk_189D762C8;
  id v33 = v16;
  id v34 = v19;
  id v28 = v14;
  v29 = self;
  id v30 = v17;
  id v31 = v15;
  id v32 = v18;
  id v21 = v16;
  id v22 = v18;
  id v23 = v15;
  id v24 = v17;
  id v25 = v19;
  id v26 = v14;
  dispatch_async(v20, block);
}

- (void)unregisterBundleUnit:(unsigned int)a3 options:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v32[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]");
  if (a3)
  {
    if (-[_LSDModifyClient canUnregisterWithOptions:](self, "canUnregisterWithOptions:", v5))
    {
      _LSDefaultLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218496;
        uint64_t v26 = (int)[v10 processIdentifier];
        __int16 v27 = 2048;
        uint64_t v28 = a3;
        __int16 v29 = 2048;
        uint64_t v30 = v5;
        _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "client %lu will unregister unit %llx options %llx",  buf,  0x20u);
      }

      _LSDatabaseSentinelIncrement();
      v11 = (void *)MEMORY[0x186E2A7B8](v8);
      uint64_t v12 = MEMORY[0x1895F87A8];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke;
      v21[3] = &unk_189D725B8;
      id v13 = v11;
      id v22 = v13;
      id v14 = (void *)MEMORY[0x186E2A7B8](v21);

      _LSServer_DatabaseExecutionContext();
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472LL;
      v17[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2;
      v17[3] = &unk_189D762F0;
      unsigned int v19 = a3;
      int v20 = v5;
      id v8 = v14;
      id v18 = v8;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v17);

      id v16 = v22;
    }

    else
    {
      uint64_t v31 = *MEMORY[0x189607490];
      v32[0] = @"May not unregister bundle";
      [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]",  538LL,  v13);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v16);
    }
  }

  else
  {
    uint64_t v23 = *MEMORY[0x189607490];
    id v24 = @"invalid bundleInit for unregistering";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]",  598LL,  v13);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v16);
  }
}

- (void)registerContainerURL:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]");
  if (v6 && [v6 isFileURL])
  {
    if (-[_LSDModifyClient canRegisterContainer](self, "canRegisterContainer"))
    {
      MEMORY[0x186E2AFD4]();
      _LSServer_GetIOQueue();
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke;
      block[3] = &unk_189D72D30;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v8, block);

      v9 = v13;
    }

    else
    {
      uint64_t v17 = *MEMORY[0x189607490];
      v18[0] = @"May not register container";
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]",  609LL,  v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
    }
  }

  else
  {
    uint64_t v15 = *MEMORY[0x189607490];
    id v16 = @"invalid containerURL";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]",  631LL,  v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)updateContainerUnit:(unsigned int)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]");
  if (a3)
  {
    if (-[_LSDModifyClient canRegisterContainer](self, "canRegisterContainer"))
    {
      _LSServer_DatabaseExecutionContext();
      id v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke;
      v12[3] = &unk_189D76318;
      unsigned int v14 = a3;
      id v13 = v6;
      -[LSDBExecutionContext syncRead:](v7, v12);
    }

    else
    {
      uint64_t v17 = *MEMORY[0x189607490];
      v18[0] = @"May not update container registation";
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]",  643LL,  v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v11);
    }
  }

  else
  {
    uint64_t v15 = *MEMORY[0x189607490];
    id v16 = @"invalid container Unit";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]",  672LL,  v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v9);
  }
}

- (void)registerExtensionPoint:(id)a3 platform:(unsigned int)a4 declaringURL:(id)a5 withInfo:(id)a6 completionHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]");
  int v15 = 0;
  if (v11 && v13)
  {
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = _LSIsDictionaryWithKeysAndValuesOfClasses(v13, v16, 0LL);
  }

  _LSExtensionsLog();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = "-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 1024;
    unsigned int v34 = a4;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_debug_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEBUG,  "%s Registering extension point with identifier '%@' platform: %d url '%@' SDK Dictionary: %@",  buf,  0x30u);
  }

  if (v15)
  {
    _LSServer_DatabaseExecutionContext();
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke;
    v21[3] = &unk_189D76340;
    id v22 = v11;
    unsigned int v26 = a4;
    id v23 = v13;
    id v24 = v12;
    id v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v18, v21);

    unsigned int v19 = v22;
  }

  else
  {
    uint64_t v27 = *MEMORY[0x189607490];
    uint64_t v28 = @"invalid extensionPoint SDK dictionary";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]",  701LL,  v19);
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v20);
  }
}

- (void)unregisterExtensionPoint:(id)a3 platform:(unsigned int)a4 withVersion:(id)a5 parentBundleUnit:(unsigned int)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:co"
                                    "mpletionHandler:]");
  if (v11)
  {
    _LSServer_DatabaseExecutionContext();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke;
    v17[3] = &unk_189D76368;
    id v18 = v11;
    unsigned int v21 = a4;
    unsigned int v22 = a6;
    id v19 = v12;
    id v20 = v13;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v14, v17);
  }

  else
  {
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = @"invalid extensionPoint identifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]",  720LL,  v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v16);
  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 roles:(unsigned int)a5 forContentType:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]");
  if (v12 && v13)
  {
    _LSServer_DatabaseExecutionContext();
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke;
    v21[3] = &unk_189D763B8;
    id v22 = v13;
    uint64_t v23 = self;
    unsigned int v26 = a5;
    id v24 = v12;
    __int128 v16 = *(_OWORD *)&a4->_opaque[16];
    __int128 v27 = *(_OWORD *)a4->_opaque;
    __int128 v28 = v16;
    id v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v21);
  }

  else
  {
    uint64_t v19 = *MEMORY[0x189607490];
    id v20 = @"bad inputs";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]",  792LL,  v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v18);
  }
}

- (void)removeHandlerForContentType:(id)a3 roles:(unsigned int)a4 completionHandler:(id)a5
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]");
  if (v8)
  {
    _LSServer_DatabaseExecutionContext();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke;
    v13[3] = &unk_189D76408;
    id v14 = v8;
    int v15 = self;
    unsigned int v17 = a4;
    id v16 = v9;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v13);
  }

  else
  {
    uint64_t v18 = *MEMORY[0x189607490];
    v19[0] = @"contentType";
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]",  828LL,  v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v12);
  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 forURLScheme:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]");
  if (v10 && v11)
  {
    _LSServer_DatabaseExecutionContext();
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    void v19[2] = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke;
    v19[3] = &unk_189D76458;
    id v20 = v11;
    unsigned int v21 = self;
    id v22 = v10;
    __int128 v14 = *(_OWORD *)&a4->_opaque[16];
    __int128 v24 = *(_OWORD *)a4->_opaque;
    __int128 v25 = v14;
    id v23 = v12;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v13, v19);
  }

  else
  {
    uint64_t v17 = *MEMORY[0x189607490];
    uint64_t v18 = @"bad inputs";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]",  865LL,  v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v16);
  }
}

- (void)removeHandlerForURLScheme:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]");
  if (v6)
  {
    _LSServer_DatabaseExecutionContext();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke;
    v11[3] = &unk_189D740E0;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v11);
  }

  else
  {
    uint64_t v15 = *MEMORY[0x189607490];
    v16[0] = @"scheme";
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]",  893LL,  v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)removeAllHandlersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]");
  _LSServer_DatabaseExecutionContext();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke;
  v7[3] = &unk_189D75988;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);
}

- (void)removeAllHandlerPrefsForBundleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (v6)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 _xpcConnection];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = 0LL;
    int v10 = _LSCanModifyDefaultHandler((uint64_t)@"*", (uint64_t)@"*", (uint64_t)v9, &v15);
    id v11 = v15;

    if (!v10)
    {
      v7[2](v7, 0LL, v11);
      goto LABEL_8;
    }

    _LSHandlerPrefRemoveAllWithBundleID(v6, v7);
    _LSDefaultLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v13 processIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_183E58000, v12, OS_LOG_TYPE_DEFAULT, "pid %ld removed handlers for %@", buf, 0x16u);
    }
  }

  else
  {
    uint64_t v16 = *MEMORY[0x189607490];
    uint64_t v17 = @"bundleID";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient removeAllHandlerPrefsForBundleID:completionHandler:]",  940LL,  v11);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v12);
  }

LABEL_8:
}

- (void)resetServerStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]");
  _LSServer_DatabaseExecutionContext();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_189D75988;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);
}

- (BOOL)clientHasMIEntitlement:(id)a3
{
  id v4 = a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = _LSCheckMIAllowedSPIForXPCConnection(v6, v4) != 0;

  return v7;
}

- (void)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 returnSaveToken:(BOOL)a9 completionHandler:(id)a10
{
  v48[1] = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v35 = a4;
  id v17 = a5;
  id v18 = a6;
  id v33 = a8;
  id v19 = a10;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:se"
                                    "ndNotification:operationUUID:returnSaveToken:completionHandler:]");
  int v20 = v16 != 0LL;
  if (v16 && v35)
  {
    objc_msgSend(MEMORY[0x189604010], "setWithObject:", objc_opt_class(), v33);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v35, v21, 0LL);
  }

  if (v17 && v20)
  {
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v17, v22, 0LL);
  }

  if (v18 && v20)
  {
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v24 = _LSIsDictionaryWithKeysAndValuesOfClasses(v18, v23, 0LL);

    if ((v24 & 1) == 0)
    {
LABEL_10:
      uint64_t v45 = *MEMORY[0x189607490];
      v46 = @"invalid metadata, cannot update bundle record";
      objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v33);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:oper ationUUID:returnSaveToken:completionHandler:]",  1079LL,  v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, id))v19 + 2))(v19, 0LL, 0LL, v26);
      goto LABEL_29;
    }
  }

  else if (!v20)
  {
    goto LABEL_10;
  }

  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations]( self,  "clientIsEntitledForPostInstallationOperations",  v33))
  {
    id v25 = v35;
    id v26 = v17;
LABEL_21:
    __int128 v27 = v18;
    goto LABEL_23;
  }

  if (-[_LSDModifyClient clientHasMIEntitlement:]( self,  "clientHasMIEntitlement:",  @"UpdateSinfForLaunchServices"))
  {
    id v25 = v35;
  }

  else
  {
    id v25 = 0LL;
  }

  if (-[_LSDModifyClient clientHasMIEntitlement:]( self,  "clientHasMIEntitlement:",  @"UpdateiTunesMetadataForLaunchServices"))
  {
    id v26 = v17;
  }

  else
  {
    id v26 = 0LL;
  }

  if (-[_LSDModifyClient clientHasMIEntitlement:](self, "clientHasMIEntitlement:", @"UpdatePlaceholderMetadata")) {
    goto LABEL_21;
  }
  __int128 v27 = 0LL;
LABEL_23:
  id v28 = v27;
  uint64_t v29 = v28;
  if (v26 || v25 || v28)
  {
    _LSServer_DatabaseExecutionContext();
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke;
    v36[3] = &unk_189D764F8;
    id v37 = v16;
    id v38 = v25;
    id v39 = v26;
    id v40 = v29;
    BOOL v44 = a9;
    id v41 = v34;
    int v43 = a7;
    id v42 = v19;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v32, v36);
  }

  else
  {
    uint64_t v47 = *MEMORY[0x189607490];
    v48[0] = @"UpdateSinfForLaunchServices/UpdateiTunesMetadataForLaunchServices/UpdatePlaceholderMetadata";
    [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operat ionUUID:returnSaveToken:completionHandler:]",  1075LL,  v30);
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0LL, 0LL, v31);
  }

LABEL_29:
}

- (void)synchronizeWithMobileInstallation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke;
  block[3] = &unk_189D741C8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)rebuildApplicationDatabasesForSystem:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  v34[11] = *MEMORY[0x1895F89C0];
  int v10 = (void (**)(id, void, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]");
  MEMORY[0x186E2AFD4]();
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 _xpcConnection];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = _LSCheckEntitlementForXPCConnection(v12, @"com.apple.lsapplicationworkspace.rebuildappdatabases");

  if (!v13)
  {
    _LSDefaultLog();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      int v31 = [v28 processIdentifier];
      _os_log_error_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_ERROR,  "Unentitled request to RebuildApplicationDatabases by pid %d",  buf,  8u);
    }

    uint64_t v20 = -54LL;
    goto LABEL_19;
  }

  os_unfair_lock_lock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  int v14 = pthread_self();
  int v29 = pthread_getname_np(v14, (char *)buf, 0x100uLL);
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v17 = [v15 processIdentifier];
  while (proc_pidinfo(v17, 3, 0LL, buffer, 136) == 136)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s(%d)", v34, v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 addObject:v18];

    uint64_t v17 = v33;
    if (v33 <= 1) {
      goto LABEL_12;
    }
  }

  __error();
  _LSDefaultLog();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:].cold.1();
  }

LABEL_12:
  [v16 reverseObjectEnumerator];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 allObjects];
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 componentsJoinedByString:@"->"];
  char v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v24 length]) {
    pthread_setname_np((const char *)[v24 UTF8String]);
  }

  int v25 = _LSServer_RebuildApplicationDatabases(v8, v7, v6, 0, 1);
  if (!v29) {
    pthread_setname_np((const char *)buf);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  if (!v25)
  {
    uint64_t v20 = -10810LL;
LABEL_19:
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v20,  (uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]",  1156LL,  0LL);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0LL, v27);

    goto LABEL_20;
  }

  uint64_t v26 = ((uint64_t (*)(id, uint64_t, void))v10[2])(v10, 1LL, 0LL);
LABEL_20:
  MEMORY[0x186E2AFE0](v26);
}

- (void)installApplication:(id)a3 atURL:(id)a4 withOptions:(id)a5 installType:(unint64_t)a6 reply:(id)a7
{
  BOOL v8 = (void (**)(id, void, void *))a7;
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSDModifyClient installApplication:atURL:withOptions:installType:reply:]",  1168LL,  0LL);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0LL, v7);
}

- (void)uninstallApplication:(id)a3 withOptions:(id)a4 uninstallType:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = (void (**)(id, void, void *))a6;
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSDModifyClient uninstallApplication:withOptions:uninstallType:reply:]",  1176LL,  0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0LL, v6);
}

- (void)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  _LSServer_DatabaseExecutionContext();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  void v16[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke;
  v16[3] = &unk_189D76570;
  id v15 = v7;
  id v17 = v15;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v20 = v13;
  id v14 = v10;
  id v19 = v14;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v11, v16);
}

- (void)unregisterApplicationAtURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  _LSServer_DatabaseExecutionContext();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke;
  v12[3] = &unk_189D76598;
  id v11 = v5;
  id v13 = v11;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v14 = v10;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);
}

- (void)refreshContentInFrameworkAtURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _LSServer_GetIOQueue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke;
  block[3] = &unk_189D72970;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setUpdateAvailabilities:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_opt_class();
  id v9 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v6, v8, v9) & 1) == 0)
  {
    uint64_t v18 = *MEMORY[0x189607490];
    v19[0] = @"valuesByBundleID";
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]",  1356LL,  v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v14);
LABEL_9:

    goto LABEL_10;
  }

  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 _xpcConnection];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = _LSCheckEntitlementForXPCConnection(v11, @"com.apple.private.launchservices.canchangeupdateavailability");

  if (!v12)
  {
    if (@"com.apple.private.launchservices.canchangeupdateavailability") {
      id v15 = @"com.apple.private.launchservices.canchangeupdateavailability";
    }
    else {
      id v15 = @"unknown entitlement";
    }
    uint64_t v16 = *MEMORY[0x189607490];
    id v17 = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]",  1359LL,  v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v14);
    goto LABEL_9;
  }

  +[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]( &OBJC_CLASS___LSApplicationRecord,  "setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:",  v6,  v7);
LABEL_10:
}

- (void)garbageCollectDatabaseWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = _LSCheckEntitlementForXPCConnection(v6, @"com.apple.private.coreservices.canforcedatabasegc");

  if (v7)
  {
    _LSServer_DatabaseExecutionContext();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke;
    v12[3] = &unk_189D73FA8;
    id v13 = v4;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);
  }

  else
  {
    if (@"com.apple.private.coreservices.canforcedatabasegc") {
      id v9 = @"com.apple.private.coreservices.canforcedatabasegc";
    }
    else {
      id v9 = @"unknown entitlement";
    }
    uint64_t v14 = *MEMORY[0x189607490];
    v15[0] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]",  1406LL,  v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v11);
  }
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4 forApplicationAtURL:(id)a5 completionHandler:(id)a6
{
  v53[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, uint64_t))a6;
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  int v43 = __Block_byref_object_copy__18;
  BOOL v44 = __Block_byref_object_dispose__18;
  id v45 = 0LL;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v39, 0, sizeof(v39));
  }

  char v38 = 0;
  _LSIsAuditTokenSandboxed((uint64_t)v39, &v38, 0LL);
  if (v11 && v12 && ([v12 isFileURL] & 1) != 0)
  {
    if (v38
      && !_LSCheckEntitlementForAuditToken((uint64_t)v39, @"com.apple.private.launchservices.canmodifypreferences"))
    {
      if (@"com.apple.private.launchservices.canmodifypreferences") {
        uint64_t v26 = @"com.apple.private.launchservices.canmodifypreferences";
      }
      else {
        uint64_t v26 = @"unknown entitlement";
      }
      uint64_t v50 = *MEMORY[0x189607490];
      v51 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v18 = (FSNode *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]",  1428LL,  v18);
      id v28 = (void *)v41[5];
      v41[5] = v27;
    }

    else if (+[FSNode canReadMetadataOfURL:fromSandboxWithAuditToken:]( &OBJC_CLASS___FSNode,  "canReadMetadataOfURL:fromSandboxWithAuditToken:",  v12,  v39))
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___FSNode);
      id v17 = (id *)(v41 + 5);
      id obj = (id)v41[5];
      uint64_t v18 = -[FSNode initWithURL:flags:error:](v16, "initWithURL:flags:error:", v12, 1LL, &obj);
      objc_storeStrong(v17, obj);
      if (v18)
      {
        _LSServer_DatabaseExecutionContext();
        id v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = MEMORY[0x1895F87A8];
        v35[0] = MEMORY[0x1895F87A8];
        v35[1] = 3221225472LL;
        v35[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke;
        v35[3] = &unk_189D75590;
        id v21 = v18;
        id v36 = v21;
        -[LSDBExecutionContext syncRead:](v19, v35);

        _LSServer_GetIOQueue();
        uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v29[0] = v20;
        v29[1] = 3221225472LL;
        v29[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_240;
        v29[3] = &unk_189D765C0;
        int v33 = &v46;
        id v30 = v11;
        uint64_t v18 = v21;
        int v31 = v18;
        id v32 = v10;
        unsigned int v34 = &v40;
        dispatch_sync(v22, v29);
      }
    }

    else
    {
      uint64_t v25 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]",  1432LL,  0LL);
      uint64_t v18 = (FSNode *)v41[5];
      v41[5] = v25;
    }
  }

  else
  {
    uint64_t v52 = *MEMORY[0x189607490];
    v53[0] = @"bad inputs";
    [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    uint64_t v18 = (FSNode *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]",  1422LL,  v18);
    char v24 = (void *)v41[5];
    v41[5] = v23;
  }

  v13[2](v13, *((unsigned __int8 *)v47 + 24), v41[5]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

- (void)setPreferenceValueForCallingApplication:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (LaunchServices::PrefsStorage *)a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__18;
  int v33 = __Block_byref_object_dispose__18;
  id v34 = 0LL;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v11) {
    [v11 auditToken];
  }
  else {
    memset(v28, 0, sizeof(v28));
  }

  if (!v9 || (LaunchServices::PrefsStorage::preferenceKeyMayBeSelfSet(v9, v13) & 1) == 0)
  {
    uint64_t v39 = *MEMORY[0x189607490];
    v40[0] = @"prefKey";
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]",  1470LL,  v14);
LABEL_10:
    id v17 = (FSNode *)v30[5];
    v30[5] = v20;
    goto LABEL_11;
  }

  uint64_t v14 = (void *)_LSCopyBundleURLForAuditToken(v28, 0);
  if (!v14)
  {
    uint64_t v20 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -600LL,  (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]",  1492LL,  0LL);
    goto LABEL_10;
  }

  id v15 = objc_alloc(&OBJC_CLASS___FSNode);
  uint64_t v16 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  id v17 = -[FSNode initWithURL:flags:error:](v15, "initWithURL:flags:error:", v14, 0LL, &obj);
  objc_storeStrong(v16, obj);
  if (v17)
  {
    _LSServer_DatabaseExecutionContext();
    uint64_t v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke;
    v21[3] = &unk_189D765E8;
    id v19 = v17;
    uint64_t v22 = v19;
    uint64_t v25 = &v35;
    uint64_t v23 = v9;
    id v24 = v8;
    uint64_t v26 = &v29;
    -[LSDBExecutionContext syncRead:](v18, v21);

    id v17 = v19;
  }

- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  int v12 = _LSValidateEntitlementsOfConnectionForVanillaInstall(v11, v9, &v16);
  id v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke;
    v14[3] = &unk_189D72590;
    id v15 = v10;
    _LSInvokeMIForShimmedInstall(v8, v9, v14);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  BOOL v12 = _LSValidateEntitlementsOfConnectionForUninstall(v11, (uint64_t)v9, &v16);
  id v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke;
    v14[3] = &unk_189D72590;
    id v15 = v10;
    _LSInvokeMIForShimmedUninstall(v8, v9, v14);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (BOOL)clientIsEntitledForPostInstallationOperations
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = -[_LSDClient XPCConnection](self, "XPCConnection");
  [v2 _xpcConnection];
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (_LSCheckEntitlementForXPCConnectionQuiet( v3,  @"com.apple.private.coreservices.can-register-install-results")
    || _LSCheckEntitlementForXPCConnectionQuiet(v3, @"com.apple.private.installcoordinationd.daemon")
    || _LSCheckEntitlementForXPCConnectionQuiet(v3, @"com.apple.private.coreservices.lsaw"))
  {
    BOOL v4 = 1;
  }

  else
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t pid = xpc_connection_get_pid(v3);
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Connection from process %llu is not entitled for post installation modifications to the database",  (uint8_t *)&v7,  0xCu);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)performPostInstallationRegistration:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!-[_LSDModifyClient clientIsEntitledForPostInstallationOperations]( self,  "clientIsEntitledForPostInstallationOperations"))
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]",  1591LL,  0LL);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v17);
    goto LABEL_10;
  }

  if (!v11)
  {
    id v17 = 0LL;
    id v16 = 0LL;
    goto LABEL_9;
  }

  +[_LSPersonaDatabase sharedInstance]();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithArray:v11];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v15, &v27);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v27;

  if (v16)
  {
LABEL_9:
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke;
    v21[3] = &unk_189D76638;
    id v22 = v10;
    id v26 = v13;
    id v23 = v12;
    id v24 = self;
    id v25 = v16;
    id v20 = v16;
    _LSDoWithLock(RegisterInstallResultsLock, v21);

    goto LABEL_10;
  }

  _LSDefaultLog();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:].cold.1( (uint64_t)v11,  (uint64_t)v17,  v18);
  }

  (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v17);
LABEL_10:
}

- (void)performPostUninstallationUnregistrationOfBundleID:(id)a3 operationUUID:(id)a4 unregisterType:(unsigned int)a5 precondition:(id)a6 reply:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations]( self,  "clientIsEntitledForPostInstallationOperations"))
  {
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    void v18[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke;
    v18[3] = &unk_189D76688;
    id v23 = v14;
    id v19 = v12;
    id v20 = v17;
    unsigned int v24 = a5;
    id v21 = v13;
    id v22 = self;
    _LSDoWithLock(RegisterInstallResultsLock, v18);

    id v16 = v23;
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient performPostUninstallationUnregistrationOfBundleID:operationUUID:unregisterType:precondition:reply:]",  1616LL,  0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v16);
  }
}

- (void)performUpdateOfPersonasOfBundleIDs:(id)a3 toPersonaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t))a6;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations]( self,  "clientIsEntitledForPostInstallationOperations"))
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    uint64_t v39 = __Block_byref_object_copy__18;
    uint64_t v40 = __Block_byref_object_dispose__18;
    id v41 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    int v33 = __Block_byref_object_copy__18;
    id v34 = __Block_byref_object_dispose__18;
    id v35 = 0LL;
    +[_LSPersonaDatabase sharedInstance]();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = (id *)(v31 + 5);
    id obj = (id)v31[5];
    -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v11, &obj);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v15, obj);

    if (v16)
    {
      _LSInstallLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v18 processIdentifier];
        *(_DWORD *)buf = 138412802;
        int v43 = v16;
        __int16 v44 = 2112;
        id v45 = v10;
        __int16 v46 = 2048;
        uint64_t v47 = v19;
        _os_log_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEFAULT,  "attempting to set personas %@ for bundleIDs %@ from pid %ld",  buf,  0x20u);
      }

      _LSServer_DatabaseExecutionContext();
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke;
      v23[3] = &unk_189D766B0;
      unsigned int v24 = (os_log_s *)v10;
      id v27 = &v30;
      id v25 = v16;
      id v28 = &v36;
      id v26 = v12;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v20, v23);

      id v21 = v24;
    }

    else
    {
      _LSInstallLog();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:].cold.1();
      }
    }

    v13[2](v13, v37[5], v31[5]);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:]",  1816LL,  0LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, (uint64_t)v22);
  }
}

- (void)forceSaveForTestingWithCompletion:(id)a3
{
  id v9 = a3;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations]( self,  "clientIsEntitledForPostInstallationOperations")
    || (-[_LSDClient XPCConnection](self, "XPCConnection"),
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(),
        [v4 _xpcConnection],
        id v5 = (void *)objc_claimAutoreleasedReturnValue(),
        int v6 = _LSCheckEntitlementForXPCConnection( v5,  @"com.apple.private.coreservices.can-force-database-save-for-testing"),  v5,  v4,  v6))
  {
    _LSServer_DatabaseExecutionContext();
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke;
    v10[3] = &unk_189D73FA8;
    id v11 = v9;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v7, v10);

    id v8 = v11;
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDModifyClient forceSaveForTestingWithCompletion:]",  1828LL,  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v8);
  }
}

- (void)setPreferredAppMarketplaces:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSDModifyClient setPreferredAppMarketplaces:completion:]",  1844LL,  0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);
}

- (void)rebuildApplicationDatabasesForSystem:internal:user:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_ERROR,  "proc_pidinfo(PROC_PIDTBSDINFO) failed for %ld: %{darwin.errno}d",  v2,  0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)performPostInstallationRegistration:(os_log_s *)a3 personaUniqueStrings:operationUUID:reply:.cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  a3,  (uint64_t)a3,  "Could not look up personas given unique strings %@: %@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_5(&dword_183E58000, v0, v1, "could not get personas from persona unique strings: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end