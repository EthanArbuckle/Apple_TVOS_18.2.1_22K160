@interface MIDaemonConfiguration
+ (id)sharedInstance;
- (BOOL)allowPatchWithoutSinf;
- (BOOL)codeSigningEnforcementIsDisabled;
- (BOOL)deviceHasPersonas;
- (BOOL)haveUpdatedAppExtensionDataContainersWithParentID;
- (BOOL)localSigningIsUnrestricted;
- (BOOL)requireEligibilityChecksForAppsInDevelopment;
- (BOOL)skipDeviceFamilyCheck;
- (BOOL)skipThinningCheck;
- (MIDaemonConfiguration)init;
- (NSURL)currentUserCachesDirectory;
- (NSURL)currentUserDataDirectory;
- (NSURL)currentUserJournalStorageBaseURL;
- (NSURL)currentUserLaunchServicesOperationLookAsideStorageBaseURL;
- (NSURL)currentUserLaunchServicesOperationStorageBaseURL;
- (NSURL)daemonUserDataLibraryDirectory;
- (NSURL)journalStorageBaseURL;
- (NSURL)launchServicesOperationLookAsideStorageBaseURL;
- (NSURL)launchServicesOperationStorageBaseURL;
- (NSURL)stagingRootForSystemContent;
- (NSURL)stagingRootForUserContent;
- (id)builtInApplicationBundleIDs;
- (id)stagingRootForDevice:(int)a3 url:(id)a4 identifier:(unint64_t *)a5 error:(id *)a6;
- (id)stagingRootForIdentifier:(unint64_t)a3;
- (id)stagingRootForURL:(id)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (int64_t)nSimultaneousInstallations;
- (unint64_t)estimatedAvailableMemoryForValidation;
- (unsigned)installQOSOverride;
- (void)init;
- (void)setHaveUpdatedAppExtensionDataContainersWithParentID:(BOOL)a3;
@end

@implementation MIDaemonConfiguration

- (MIDaemonConfiguration)init
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MIDaemonConfiguration;
  v2 = -[MIGlobalConfiguration init](&v18, sel_init);
  if (!v2) {
    return v2;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.mobile.installation"];
  [v3 stringForKey:@"InstallQOSOverride"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || ([v4 isEqualToString:@"unspecified"] & 1) != 0) {
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"interactive"])
  {
    v2->_installQOSOverride = 33;
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"initiated"])
  {
    v2->_installQOSOverride = 25;
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"default"])
  {
    v2->_installQOSOverride = 21;
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"utility"])
  {
    v2->_installQOSOverride = 17;
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"background"])
  {
    v2->_installQOSOverride = 9;
LABEL_24:
    MOLogWrite();
    goto LABEL_25;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v14 = v5;
    MOLogWrite();
  }

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__MIDaemonConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_daemonConfigOnceToken != -1) {
    dispatch_once(&sharedInstance_daemonConfigOnceToken, block);
  }
  return (id)sharedInstance_daemonConfigInstance;
}

void __39__MIDaemonConfiguration_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_daemonConfigInstance;
  sharedInstance_daemonConfigInstance = (uint64_t)v0;
}

- (NSURL)daemonUserDataLibraryDirectory
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke;
  block[3] = &unk_189D48658;
  block[4] = self;
  if (daemonUserDataLibraryDirectory_onceToken != -1) {
    dispatch_once(&daemonUserDataLibraryDirectory_onceToken, block);
  }
  return self->_daemonUserDataLibraryDirectory;
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = container_query_create();
  if (v2)
  {
    container_query_set_class();
    xpc_object_t v3 = xpc_string_create("com.apple.installd");
    container_query_set_identifiers();

    container_query_set_persona_unique_string();
    container_query_operation_set_flags();
    uint64_t single_result = container_query_get_single_result();
    if (!single_result) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2(v2, &v31, v32);
    }
    uint64_t v5 = single_result;
    uint64_t path = container_get_path();
    if (!path) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3(v5, &v31, v32);
    }
    uint64_t v7 = path;
    char v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:v7 isDirectory:1 relativeToURL:0];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"Library" isDirectory:1];

    uint64_t v10 = container_copy_sandbox_token();
    if (v10)
    {
      id v11 = (void *)v10;
      if (sandbox_extension_consume() < 0)
      {
        int v28 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
          __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(v28);
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          strerror(v28);
LABEL_29:
          MOLogWrite();
        }
      }

      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        goto LABEL_29;
      }
    }

    else
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
      if (v20) {
        __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4( v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27);
      }
      id v11 = 0LL;
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v12) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
    id v11 = 0LL;
    uint64_t v9 = 0LL;
  }

  container_query_free();
  free(v11);
  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 160);
  *(void *)(v29 + 160) = v9;
}

- (NSURL)currentUserDataDirectory
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"MobileInstallation" isDirectory:1];
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserCachesDirectory
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"Caches" isDirectory:1];
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)codeSigningEnforcementIsDisabled
{
  BOOL v3 = -[MIGlobalConfiguration allowsInternalSecurityPolicy](self, "allowsInternalSecurityPolicy");
  if (v3)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke;
    block[3] = &unk_189D48658;
    block[4] = self;
    if (codeSigningEnforcementIsDisabled_onceToken != -1) {
      dispatch_once(&codeSigningEnforcementIsDisabled_onceToken, block);
    }
    LOBYTE(v3) = self->_codeSigningEnforcementIsDisabled;
  }

  return v3;
}

void __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke(uint64_t a1)
{
  char v8 = 0;
  +[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = 0LL;
  int v3 = [v2 isRunningInTestMode:&v8 outError:&v7];
  id v4 = v7;

  if (v3)
  {
    if (v8)
    {
      *(_BYTE *)(*(void *)(a1 + 32) + 144LL) = 0;
      goto LABEL_25;
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    MOLogWrite();
  }

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.mobile.installation"];
  if ([v5 BOOLForKey:@"FakeCodeSigningNotDisabled"])
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 144LL) = 0;
  }

  else
  {
    int bootarg_state = amfi_interface_query_bootarg_state();
    if (bootarg_state)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        strerror(bootarg_state);
        MOLogWrite();
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(a1 + 32) + 144LL) = 0;
    }
  }

LABEL_25:
}

- (BOOL)localSigningIsUnrestricted
{
  BOOL v3 = -[MIGlobalConfiguration allowsInternalSecurityPolicy](self, "allowsInternalSecurityPolicy");
  if (v3)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke;
    block[3] = &unk_189D48658;
    block[4] = self;
    if (localSigningIsUnrestricted_onceToken != -1) {
      dispatch_once(&localSigningIsUnrestricted_onceToken, block);
    }
    LOBYTE(v3) = self->_localSigningIsUnrestricted;
  }

  return v3;
}

uint64_t __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke(uint64_t a1)
{
  uint64_t result = amfi_interface_query_bootarg_state();
  if ((_DWORD)result)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      strerror(result);
      uint64_t result = MOLogWrite();
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 145LL) = 0;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 145LL) = 0;
  }

  if (*(_BYTE *)(*(void *)(a1 + 32) + 145LL))
  {
    uint64_t result = gLogHandle;
  }

  return result;
}

- (BOOL)haveUpdatedAppExtensionDataContainersWithParentID
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.mobile.installation"];
  BOOL v3 = [v2 integerForKey:@"ExtensionDataContainerParentIDUpdateVersion"] == 1;

  return v3;
}

- (void)setHaveUpdatedAppExtensionDataContainersWithParentID:(BOOL)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.mobile.installation"];
  [v3 setObject:&unk_189D64DF8 forKey:@"ExtensionDataContainerParentIDUpdateVersion"];
}

- (id)builtInApplicationBundleIDs
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MIDaemonConfiguration;
  -[MIGlobalConfiguration builtInApplicationBundleIDs](&v8, sel_builtInApplicationBundleIDs);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  MIDiskImageManagerProxy();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 diskImageAppBundleIDs];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v2 setByAddingObjectsFromSet:v5];

    uint64_t v2 = (void *)v6;
  }

  return v2;
}

- (NSURL)journalStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"Journal" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserJournalStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"Journal" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"LaunchServicesOperations" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationLookAsideStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"ReconcilingLSOperations" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"LaunchServicesOperations" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationLookAsideStorageBaseURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"ReconcilingLSOperations" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)stagingRootForSystemContent
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.mobile.installd.staging" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)stagingRootForUserContent
{
  if (-[MIGlobalConfiguration hasEAPFSVolumeSplit](self, "hasEAPFSVolumeSplit"))
  {
    -[MIDaemonConfiguration currentUserCachesDirectory](self, "currentUserCachesDirectory");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 URLByAppendingPathComponent:@"com.apple.mobile.installd.staging" isDirectory:1];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v4;
}

- (id)stagingRootForDevice:(int)a3 url:(id)a4 identifier:(unint64_t *)a5 error:(id *)a6
{
  v46[2] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  uint64_t v37 = 0LL;
  v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v27 = 0LL;
  int v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = 0LL;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIGlobalConfiguration hasEAPFSVolumeSplit](self, "hasEAPFSVolumeSplit"))
  {
    -[MIDaemonConfiguration stagingRootForUserContent](self, "stagingRootForUserContent");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v12;
    v45[1] = v13;
    v46[0] = &unk_189D64E10;
    v46[1] = &unk_189D64E28;
    [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v43 = v12;
    v44 = &unk_189D64E10;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke;
  v21[3] = &unk_189D48AC0;
  id v15 = v11;
  id v22 = v15;
  uint64_t v23 = &v27;
  int v26 = a3;
  uint64_t v24 = &v37;
  uint64_t v25 = &v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v16 = v38;
  id v17 = v38[5];
  if (v17)
  {
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }

  if (v28[5])
  {
    id v17 = 0LL;
    goto LABEL_10;
  }

  [v10 path];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v20 hasPrefix:@"/private/var/PersonaVolumes/"] & 1) != 0
    || [v20 hasPrefix:@"/var/PersonaVolumes/"])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) > 4) {
LABEL_23:
    }
      MOLogWrite();
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      -[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:].cold.1((uint64_t)v20);
    }
  }

  objc_storeStrong(v38 + 5, v12);
  v34[3] = 1LL;

  uint64_t v16 = v38;
  id v17 = v38[5];
  if (!a5) {
    goto LABEL_10;
  }
LABEL_6:
  if (v17)
  {
    *a5 = v34[3];
    id v17 = v16[5];
  }

void __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = *(void **)(a1 + 32);
  id v14 = 0LL;
  int v11 = [v10 deviceForURLOrFirstAvailableParent:v8 error:&v14];
  id v12 = v14;
  id v13 = v14;
  if (v11 == -1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v12);
    goto LABEL_5;
  }

  if (*(_DWORD *)(a1 + 64) == v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 unsignedIntegerValue];
LABEL_5:
    *a4 = 1;
  }
}

- (id)stagingRootForURL:(id)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  uint64_t v10 = [v9 deviceForURLOrFirstAvailableParent:v8 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if ((_DWORD)v10 == -1)
  {
    id v13 = 0LL;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    id v16 = v11;
    -[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:]( self,  "stagingRootForDevice:url:identifier:error:",  v10,  v8,  a4,  &v16);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v16;

    id v12 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (!v13) {
    *a5 = v12;
  }
LABEL_7:

  return v13;
}

- (id)stagingRootForIdentifier:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a3 == 2)
  {
    -[MIDaemonConfiguration stagingRootForUserContent](self, "stagingRootForUserContent");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (unsigned)installQOSOverride
{
  return self->_installQOSOverride;
}

- (BOOL)skipDeviceFamilyCheck
{
  return self->_skipDeviceFamilyCheck;
}

- (BOOL)skipThinningCheck
{
  return self->_skipThinningCheck;
}

- (BOOL)allowPatchWithoutSinf
{
  return self->_allowPatchWithoutSinf;
}

- (int64_t)nSimultaneousInstallations
{
  return self->_nSimultaneousInstallations;
}

- (BOOL)deviceHasPersonas
{
  return self->_deviceHasPersonas;
}

- (BOOL)requireEligibilityChecksForAppsInDevelopment
{
  return self->_requireEligibilityChecksForAppsInDevelopment;
}

- (unint64_t)estimatedAvailableMemoryForValidation
{
  return self->_estimatedAvailableMemoryForValidation;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)init
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2( uint64_t a1,  void *a2,  _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3( uint64_t a1,  void *a2,  _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_0( &dword_183D22000,  MEMORY[0x1895F8DA0],  a3,  "%s: container_copy_sandbox_token returned NULL!",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_3();
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v1 = 136315650;
  uint64_t v2 = "_DaemonUserDataLibraryDirectory";
  __int16 v3 = 1024;
  int v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = strerror(a1);
  _os_log_fault_impl( &dword_183D22000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%s: Failed to consume daemon container sandbox token: %d (%s)",  (uint8_t *)&v1,  0x1Cu);
}

- (void)stagingRootForDevice:(uint64_t)a1 url:identifier:error:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = 136315394;
  uint64_t v2 = "-[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_183D22000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%s: Defaulting to system staging root because we could not determine the best one for %@",  (uint8_t *)&v1,  0x16u);
  OUTLINED_FUNCTION_3();
}

@end