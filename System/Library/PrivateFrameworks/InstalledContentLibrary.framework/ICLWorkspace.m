@interface ICLWorkspace
+ (id)_connectionToInstallationDaemonWithError:(id *)a3;
+ (id)defaultWorkspace;
- (BOOL)enumerateBuiltInSystemContentWithBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateCryptexContentWithBlock:(id)a3 error:(id *)a4;
- (BOOL)triggerRegistrationForContainerizedContentWithOptions:(id)a3 withError:(id *)a4;
- (ICLWorkspace)init;
- (id)bundleIDsForContainerizedContentWithError:(id *)a3;
- (id)bundleRecordsForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5;
- (id)bundleRecordsWithFrameworkURL:(id)a3 options:(id)a4 withError:(id *)a5;
- (id)containerizedAppBundleRecordsForIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 withError:(id *)a6;
- (id)diskUsageForLaunchServicesWithBundleIDs:(id)a3 options:(id)a4 withError:(id *)a5;
- (id)infoForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5;
- (void)triggerRegistrationForContainerizedContentWithOptions:(id)a3 completion:(id)a4;
- (void)triggerRegistrationForDiskImageContentWithOptions:(id)a3 completion:(id)a4;
@end

@implementation ICLWorkspace

- (ICLWorkspace)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ICLWorkspace;
  return -[ICLWorkspace init](&v3, sel_init);
}

+ (id)defaultWorkspace
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__ICLWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_onceToken != -1) {
    dispatch_once(&defaultWorkspace_onceToken, block);
  }
  return (id)defaultWorkspace_defaultInstance;
}

void __32__ICLWorkspace_defaultWorkspace__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultWorkspace_defaultInstance;
  defaultWorkspace_defaultInstance = (uint64_t)v0;
}

- (BOOL)enumerateBuiltInSystemContentWithBlock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 1LL;
  v6 = objc_alloc(&OBJC_CLASS___MILaunchServicesDatabaseGatherer);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke;
  v14[3] = &unk_189D48CE8;
  id v7 = v5;
  id v15 = v7;
  v8 = -[MILaunchServicesDatabaseGatherer initWithOptions:enumerator:](v6, "initWithOptions:enumerator:", 2LL, v14);
  id v13 = 0LL;
  BOOL v9 = -[MILaunchServicesDatabaseGatherer performGatherWithError:](v8, "performGatherWithError:", &v13);
  id v10 = v13;
  v11 = v10;
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

void __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (id)bundleIDsForContainerizedContentWithError:(id *)a3
{
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke;
  v9[3] = &unk_189D48D10;
  id v5 = v4;
  id v10 = v5;
  +[MIMCMContainer enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:]( &OBJC_CLASS___MIMCMContainer,  "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:",  1LL,  0LL,  0LL,  0LL,  0LL,  v9);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    id v5 = 0LL;
  }

  if (a3 && !v5) {
    *a3 = v6;
  }
  id v7 = (void *)[v5 copy];

  return v7;
}

uint64_t __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 identifier];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];

  return 1LL;
}

+ (id)_connectionToInstallationDaemonWithError:(id *)a3
{
  uint64_t v4 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.mobile.installd" options:0];
  if (!v4)
  {
    _CreateAndLogError( (uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]",  136LL,  ICLWorkspaceErrorDomain,  2LL,  0LL,  0LL,  @"Failed to create connection to %@",  v5,  (uint64_t)@"com.apple.mobile.installd");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_5;
    }
LABEL_7:
    id v10 = v10;
    id v6 = 0LL;
    *a3 = v10;
    goto LABEL_10;
  }

  id v6 = (void *)v4;
  MobileInstallerProtocolInterface();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setRemoteObjectInterface:v7];

  if (!xpc_user_sessions_enabled())
  {
LABEL_9:
    [v6 resume];
    id v10 = 0LL;
    goto LABEL_10;
  }

  if (xpc_user_sessions_get_foreground_uid() != -101)
  {
    [v6 _xpcConnection];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

    goto LABEL_9;
  }

  v8 = ICLWorkspaceErrorDomain;
  xpc_strerror();
  _CreateAndLogError( (uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]",  147LL,  v8,  2LL,  0LL,  0LL,  @"xpc_user_sessions_get_foreground_uid() failed with error %d - %s",  v9,  0LL);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (a3) {
    goto LABEL_7;
  }
LABEL_5:
  id v6 = 0LL;
LABEL_10:

  return v6;
}

- (void)triggerRegistrationForContainerizedContentWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v21 = 0LL;
  [(id)objc_opt_class() _connectionToInstallationDaemonWithError:&v21];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v21;
  if (v7)
  {
    uint64_t v9 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke;
    v18[3] = &unk_189D48D38;
    id v10 = v7;
    id v19 = v10;
    id v20 = v6;
    uint64_t v13 = v9;
    uint64_t v14 = 3221225472LL;
    id v15 = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2;
    uint64_t v16 = &unk_189D48D60;
    id v17 = (id)MEMORY[0x186E27154](v18);
    id v11 = v17;
    [v10 remoteObjectProxyWithErrorHandler:&v13];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v12,  "triggerRegistrationForContainerizedContentForOptions:withCompletion:",  v5,  v11,  v13,  v14,  v15,  v16);
  }

  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)triggerRegistrationForContainerizedContentWithOptions:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  id v26 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  id v6 = (void *)objc_opt_class();
  id v7 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  [v6 _connectionToInstallationDaemonWithError:&obj];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke;
    v15[3] = &unk_189D48D88;
    v15[4] = &v21;
    [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472LL;
    v14[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2;
    v14[3] = &unk_189D48DB0;
    void v14[4] = &v21;
    v14[5] = &v17;
    [v10 triggerRegistrationForContainerizedContentForOptions:v5 withCompletion:v14];

    [v8 invalidate];
  }

  int v11 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((_BYTE *)v18 + 24))
  {
    *a4 = (id) v22[5];
    int v11 = *((unsigned __int8 *)v18 + 24);
  }

  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke( uint64_t a1,  void *a2)
{
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2( uint64_t a1,  void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

- (void)triggerRegistrationForDiskImageContentWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v21 = 0LL;
  [(id)objc_opt_class() _connectionToInstallationDaemonWithError:&v21];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v21;
  if (v7)
  {
    uint64_t v9 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke;
    v18[3] = &unk_189D48D38;
    id v10 = v7;
    id v19 = v10;
    id v20 = v6;
    uint64_t v13 = v9;
    uint64_t v14 = 3221225472LL;
    id v15 = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2;
    uint64_t v16 = &unk_189D48D60;
    id v17 = (id)MEMORY[0x186E27154](v18);
    id v11 = v17;
    [v10 remoteObjectProxyWithErrorHandler:&v13];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerRegistrationForDiskImageContentForOptions:withCompletion:", v5, v11, v13, v14, v15, v16);
  }

  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)infoForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:]( &OBJC_CLASS___ICLBundleRecord,  "bundleRecordArrayToInfoDictionaryArray:",  v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bundleRecordsForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0LL;
}

- (BOOL)enumerateCryptexContentWithBlock:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (id)bundleRecordsWithFrameworkURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_opt_new();
  id v10 = (void *)objc_opt_new();
  objc_opt_class();
  id v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  if (!v12)
  {
    _CreateAndLogError( (uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]",  363LL,  @"MIInstallerErrorDomain",  25LL,  0LL,  0LL,  @"frameworkBundleURL parameter was not a valid URL",  v13,  (uint64_t)v29);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  if (v8)
  {
    objc_opt_class();
    id v14 = v8;
    id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0LL;

    if (!v15)
    {
      _CreateAndLogError( (uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]",  368LL,  @"MIInstallerErrorDomain",  25LL,  0LL,  0LL,  @"options parameter was not a dictionary",  v17,  (uint64_t)v29);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = 0LL;
      goto LABEL_21;
    }
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    [v11 path];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v30 = v8;
    MOLogWrite();
  }

  id v40 = 0LL;
  +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v11, &v40, v29, v30);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v40;
  if (!v12)
  {
LABEL_19:
    id v15 = 0LL;
    goto LABEL_21;
  }

  v18 = v10;
  id v19 = v9;
  v34 = a5;
  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 primaryPersonaString];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v39 = v16;
  +[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "entryForBundle:inContainer:forPersona:withError:",  v12,  0LL,  v21,  &v39);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v39;

  if (v15)
  {
    [v12 identifier];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v15 forKeyedSubscript:v22];

    [v9 addObject:v15];
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke;
    v36[3] = &unk_189D48DD8;
    id v37 = v18;
    id v31 = v9;
    id v38 = v31;
    uint64_t v23 = (void *)MEMORY[0x186E27154](v36);
    v24 = +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
    [v24 primaryPersonaString];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v35 = v33;
    BOOL v32 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:inst allProfiles:error:enumerator:",  v12,  v25,  0LL,  0LL,  0LL,  &v35,  v23);
    id v16 = v35;

    uint64_t v9 = v19;
    id v10 = v18;

    a5 = v34;
    if (v32)
    {
      id v26 = (void *)[v31 copy];
      if (!v34) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }

void __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, v12);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 bundleURL];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 path];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 bundleURL];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 path];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)containerizedAppBundleRecordsForIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = __Block_byref_object_copy__5;
  BOOL v32 = __Block_byref_object_dispose__5;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__5;
  id v26 = __Block_byref_object_dispose__5;
  id v27 = 0LL;
  id v11 = (void *)objc_opt_class();
  id v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  [v11 _connectionToInstallationDaemonWithError:&obj];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  if (v13)
  {
    uint64_t v14 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke;
    v20[3] = &unk_189D48D88;
    v20[4] = &v22;
    [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472LL;
    v19[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2;
    v19[3] = &unk_189D48E00;
    v19[4] = &v22;
    v19[5] = &v28;
    [v15 fetchInfoForContainerizedAppWithIdentity:v9 inDomain:a4 options:v10 completion:v19];

    [v13 invalidate];
  }

  id v16 = (void *)v29[5];
  if (a6 && !v16)
  {
    *a6 = (id) v23[5];
    id v16 = (void *)v29[5];
  }

  id v17 = v16;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke( uint64_t a1,  void *a2)
{
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v8 = v5;
  }

  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = v11;
  }

  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (id)diskUsageForLaunchServicesWithBundleIDs:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v9 = a4;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  BOOL v32 = __Block_byref_object_copy__5;
  id v33 = __Block_byref_object_dispose__5;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  id v28 = 0LL;
  if (v9)
  {
    id v10 = (void *)objc_opt_class();
    id v11 = (id *)(v24 + 5);
    id obj = (id)v24[5];
    [v10 _connectionToInstallationDaemonWithError:&obj];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, obj);
    if (v12)
    {
      uint64_t v13 = MEMORY[0x1895F87A8];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke;
      v21[3] = &unk_189D48D88;
      v21[4] = &v23;
      [v12 synchronousRemoteObjectProxyWithErrorHandler:v21];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      v20[1] = 3221225472LL;
      v20[2] = (uint64_t)__74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2;
      v20[3] = (uint64_t)&unk_189D48E28;
      v20[4] = (uint64_t)&v23;
      void v20[5] = (uint64_t)&v29;
      [v14 fetchDiskUsageForIdentifiers:v7 withOptions:v9 completion:v20];

      [v12 invalidate];
    }
  }

  else
  {
    uint64_t v15 = _CreateAndLogError( (uint64_t)"-[ICLWorkspace diskUsageForLaunchServicesWithBundleIDs:options:withError:]",  453LL,  @"MIInstallerErrorDomain",  25LL,  0LL,  0LL,  @"options dictionary parameter was not specified",  v8,  v20[0]);
    id v16 = (void *)v24[5];
    v24[5] = v15;

    id v12 = 0LL;
  }

  id v17 = (void *)v30[5];
  if (a5 && !v17)
  {
    *a5 = (id) v24[5];
    id v17 = (void *)v30[5];
  }

  id v18 = v17;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke( uint64_t a1,  void *a2)
{
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

@end