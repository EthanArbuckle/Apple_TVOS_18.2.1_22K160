@interface LSDefaults
@end

@implementation LSDefaults

id __33___LSDefaults_systemContainerURL__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 75LL))
  {
    _LSDefaultsBaseSystemContainerURL();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      [MEMORY[0x1896078A8] defaultManager];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }

  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    [MEMORY[0x189604030] fileURLWithPath:@"/"];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id __31___LSDefaults_userContainerURL__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 75LL))
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    [MEMORY[0x189604030] fileURLWithPath:@"/"];
    return (id)objc_claimAutoreleasedReturnValue();
  }

  if (!container_query_create()) {
    goto LABEL_30;
  }
  container_query_set_class();
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v37 = (void *)container_error_copy_unlocalized_description();
    _LSDefaultLog();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_2((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);
    }

    free(v37);
    goto LABEL_30;
  }

  uint64_t path = container_get_path();
  _LSDefaultLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!path)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_3(v3, v45, v46, v47, v48, v49, v50, v51);
    }

LABEL_30:
    container_query_free();
    goto LABEL_31;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31___LSDefaults_userContainerURL__block_invoke_cold_8(path, v3, v4, v5, v6, v7, v8, v9);
  }

  v10 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
  [v10 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = container_copy_sandbox_token();
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = sandbox_extension_consume();
    if (v14 < 0)
    {
      int v32 = *__error();
      _LSDefaultLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __31___LSDefaults_userContainerURL__block_invoke_cold_7(v32, v16);
      }
    }

    else
    {
      uint64_t v15 = v14;
      _LSDefaultLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __31___LSDefaults_userContainerURL__block_invoke_cold_6(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    free(v13);
  }

  else
  {
    _LSDefaultLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_5(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

  container_query_free();
  if (!v11)
  {
LABEL_31:
    _LSDefaultLog();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_1(v52, v53, v54, v55, v56, v57, v58, v59);
    }

    abort();
  }

  [MEMORY[0x1896078A8] defaultManager];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  id v60 = 0LL;
  char v34 = [v33 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v60];
  id v35 = v60;

  if ((v34 & 1) == 0)
  {
    _LSDefaultLog();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_4((uint64_t)v35, v36);
    }
  }

  return v11;
}

id __38___LSDefaults_systemGroupContainerURL__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 75LL))
  {
    uint64_t v7 = 1LL;
    uint64_t v1 = container_system_group_path_for_identifier();
    if (v1)
    {
      v2 = (void *)v1;
      v3 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:v1 isDirectory:1 relativeToURL:0];
      [v3 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

      free(v2);
      return v4;
    }

    else
    {
      _LSDefaultLog();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(&v7, v6);
      }

      return 0LL;
    }
  }

  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    [MEMORY[0x189604030] fileURLWithPath:@"/"];
    return (id)objc_claimAutoreleasedReturnValue();
  }

void __31___LSDefaults_simulatorRootURL__block_invoke()
{
  v0 = getenv("SIMULATOR_ROOT");
  if (v0)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    v2 = (void *)simulatorRootURL_result;
    simulatorRootURL_result = v1;
  }

void __38___LSDefaults_simulatorRuntimeVersion__block_invoke()
{
  v0 = getenv("SIMULATOR_RUNTIME_VERSION");
  if (v0)
  {
    uint64_t v1 = [NSString stringWithUTF8String:v0];
    v2 = (void *)simulatorRuntimeVersion_result;
    simulatorRuntimeVersion_result = v1;
  }

void __43___LSDefaults_simulatorRuntimeBuildVersion__block_invoke()
{
  v0 = getenv("SIMULATOR_RUNTIME_BUILD_VERSION");
  if (v0)
  {
    uint64_t v1 = [NSString stringWithUTF8String:v0];
    v2 = (void *)simulatorRuntimeBuildVersion_result;
    simulatorRuntimeBuildVersion_result = v1;
  }

const char *__41___LSDefaults_classesWithNameForXCTests___block_invoke(uint64_t a1, Class cls)
{
  result = class_getName(cls);
  if (result)
  {
    Name = class_getName(cls);
    result = (const char *)strcmp(Name, *(const char **)(a1 + 40));
    if (!(_DWORD)result) {
      return (const char *)(id)[*(id *)(a1 + 32) setByAddingObject:cls];
    }
  }

  return result;
}

uint64_t __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke(uint64_t a1)
{
  if (getuid() || (uint64_t result = [*(id *)(a1 + 32) isInXCTestRigInsecure], (_DWORD)result))
  {
    uint64_t result = _CFGetEUID();
    proxyUIDForCurrentEffectiveUID_euid = result;
    proxyUIDForCurrentEffectiveUID_hasEUID = 1;
  }

  return result;
}

void __37___LSDefaults_preferredLocalizations__block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 objectForInfoDictionaryKey:@"CFBundleAllowMixedLocalizations"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v1 = v4;
  if (v4)
  {
    char v2 = objc_opt_respondsToSelector();
    uint64_t v1 = v4;
    if ((v2 & 1) != 0)
    {
      char v3 = [v4 BOOLValue];
      uint64_t v1 = v4;
      preferredLocalizations_useUserLangList = v3;
    }
  }
}

void __37___LSDefaults_preferredLocalizations__block_invoke_2()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 preferredLocalizations];
  uint64_t v1 = (void *)preferredLocalizations_bundleLocalizations;
  preferredLocalizations_bundleLocalizations = v0;
}

void __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAppleInternal])
  {
    [MEMORY[0x189604038] standardUserDefaults];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    markLocalizationsStoredInDatabase_uint64_t result = [v1 BOOLForKey:@"LSMarkLocalizationsStoredInDatabase"];
  }

void __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAppleInternal])
  {
    [MEMORY[0x189604038] standardUserDefaults];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    alwaysUseDebugOpenWithMenus_uint64_t result = [v1 BOOLForKey:@"LSAlwaysUseDebugOpenWithMenus"];
  }

void __28___LSDefaults_isRegionChina__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x186E2A59C]();
  id v1 = (void *)MGCopyAnswer();
  id v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 caseInsensitiveCompare:@"CH"] == 0;
    isRegionChina_uint64_t result = v3;
    if (v3) {
      goto LABEL_9;
    }
  }

  else if (isRegionChina_result)
  {
    goto LABEL_9;
  }

  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_22);
  }
  if ([(id)__LSDefaultsGetSharedInstance_sharedInstance isAppleInternal])
  {
    [MEMORY[0x189604038] standardUserDefaults];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    isRegionChina_uint64_t result = [v4 BOOLForKey:@"LSLocalizeLikeChina"];
  }

id __25___LSDefaults_HMACSecret__block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x20uLL, bytes);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:bytes length:32];
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_4(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136446466;
  BOOL v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s: NSFileManager failed to create user container URL directory: %{public}@",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_5( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_6( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_3_5( &dword_183E58000,  a2,  a3,  "%{public}s: consumed sandbox token for container, handle = %llu",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_7(int a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136446466;
  BOOL v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s: Failed to consume container sandbox token, errno = %{darwin.errno}d",  (uint8_t *)&v2,  0x12u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_8( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v5 = 136446722;
  uint64_t v6 = "NSURL *_LSDefaultsSystemGroupContainerURL(void)";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2082;
  uint64_t error_description = container_get_error_description();
  OUTLINED_FUNCTION_4_4( &dword_183E58000,  a2,  v4,  "%{public}s: error %llu getting container path: %{public}s",  (uint8_t *)&v5);
}

@end