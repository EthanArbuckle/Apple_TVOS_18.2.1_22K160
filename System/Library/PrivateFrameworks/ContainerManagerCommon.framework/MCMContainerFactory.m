@interface MCMContainerFactory
- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 error:(id *)a5;
- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 reclaimSoon:(BOOL)a5 error:(id *)a6;
- (BOOL)upgradeContainer:(id)a3 clientIdentity:(id)a4 error:(id *)a5;
- (MCMClientIdentity)clientIdentity;
- (MCMContainerCache)cache;
- (MCMContainerFactory)initWithContainerCache:(id)a3 clientIdentity:(id)a4 userIdentityCache:(id)a5;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_containerPathIdentifierForContainerIdentity:(id)a3;
- (id)_createContainerForContainerIdentity:(id)a3 error:(id *)a4;
- (id)_generateConcreteContainerIdentityFromContainerIdentity:(id)a3 error:(id *)a4;
- (id)containerForContainerIdentity:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)createStagedContainerForContainerIdentity:(id)a3 finalContainerPath:(id *)a4 dataProtectionClass:(int)a5 error:(id *)a6;
@end

@implementation MCMContainerFactory

- (MCMContainerFactory)initWithContainerCache:(id)a3 clientIdentity:(id)a4 userIdentityCache:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMContainerFactory;
  v12 = -[MCMContainerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cache, a3);
    objc_storeStrong((id *)&v13->_clientIdentity, a4);
    objc_storeStrong((id *)&v13->_userIdentityCache, a5);
  }

  return v13;
}

- (id)createStagedContainerForContainerIdentity:(id)a3 finalContainerPath:(id *)a4 dataProtectionClass:(int)a5 error:(id *)a6
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  id v10 = (void *)MEMORY[0x189607AB8];
  id v11 = a3;
  [v10 UUID];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 UUIDString];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4) {
    id v14 = *a4;
  }
  else {
    id v14 = 0LL;
  }
  id v15 = v14;
  id v84 = 0LL;
  -[MCMContainerFactory _generateConcreteContainerIdentityFromContainerIdentity:error:]( self,  "_generateConcreteContainerIdentityFromContainerIdentity:error:",  v11,  &v84);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (MCMError *)v84;
  if (!v16)
  {
    v73 = 0LL;
    v74 = 0LL;
    v50 = 0LL;
    v76 = 0LL;
    v77 = 0LL;
    v51 = 0LL;
    v52 = 0LL;
    id v26 = 0LL;
    v75 = 0LL;
    if (a6) {
      goto LABEL_26;
    }
LABEL_20:
    v42 = 0LL;
    v43 = v17;
    goto LABEL_27;
  }

  unsigned int v70 = a5;
  v69 = a4;
  v71 = a6;
  uint64_t v18 = [v16 containerClass];
  uint64_t v72 = [v16 userIdentity];
  uint64_t v19 = [v16 containerPathIdentifier];
  int v20 = [v16 transient];
  [v16 identityByChangingContainerPathIdentifier:v13];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v22 = off_18A29B9F8;
    if (!v20) {
      v22 = off_18A29B9E8;
    }
    -[__objc2_class containerPathForUserIdentity:containerClass:containerPathIdentifier:]( *v22,  "containerPathForUserIdentity:containerClass:containerPathIdentifier:",  v72,  v18,  v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  unint64_t v68 = v18;
  v23 = +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:]( &OBJC_CLASS___MCMContainerStagingPath,  "stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:",  v15,  v13);
  [v23 containerClassPath];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v83 = 0LL;
  char v25 = [v24 createIfNecessaryWithError:&v83];
  id v26 = v83;

  v77 = v23;
  v73 = v21;
  v74 = (void *)v19;
  if ((v25 & 1) == 0)
  {
    v53 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 8LL);

    container_log_handle_for_category();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    [v23 classURL];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 path];
    v56 = (MCMError *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v56;
    __int16 v89 = 2112;
    id v90 = v26;
    v57 = "Failed to create staging class dir at %@ : %@";
    goto LABEL_47;
  }

  [v23 containerClassPath];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  char v28 = [v27 supportsDataProtection];

  if ((v28 & 1) == 0)
  {
    container_log_handle_for_category();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      [v23 containerClassPath];
      v30 = (MCMError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v88 = v30;
      _os_log_impl(&dword_188846000, v29, OS_LOG_TYPE_DEFAULT, "DP not supported for [%@]", buf, 0xCu);
    }

    unsigned int v70 = -1;
  }

  id v82 = v26;
  char v31 = [v23 createIfNecessaryWithDataProtectionClass:v70 error:&v82];
  id v32 = v82;

  if ((v31 & 1) == 0)
  {
    v53 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 7LL);

    container_log_handle_for_category();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      id v26 = v32;
      goto LABEL_25;
    }

    [v23 containerRootURL];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 path];
    id v26 = v32;
    v56 = (MCMError *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v56;
    __int16 v89 = 2112;
    id v90 = v26;
    v57 = "Failed to create staging dir at %@ : %@";
LABEL_47:
    _os_log_error_impl(&dword_188846000, v54, OS_LOG_TYPE_ERROR, v57, buf, 0x16u);

LABEL_25:
    v50 = (void *)v72;

    v51 = 0LL;
    v52 = 0LL;
    v75 = 0LL;
    v76 = 0LL;
    v17 = v53;
    a6 = v71;
    if (v71) {
      goto LABEL_26;
    }
    goto LABEL_20;
  }

  v66 = v13;
  v67 = v32;
  id v65 = v15;
  v85 = @"com.apple.MobileInstallation.ContentProtectionClass";
  [MEMORY[0x189607968] numberWithInt:v70];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v33;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  [v21 identifier];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  id v81 = 0LL;
  +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:]( MCMContainerSchema,  "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:",  v34,  [v21 containerClass],  &unk_18A2BE7E8,  &v81);
  v35 = self;
  id v36 = v81;

  v37 = objc_alloc(&OBJC_CLASS___MCMMetadata);
  uint64_t v38 = -[MCMContainerFactory clientIdentity](v35, "clientIdentity");
  [(id)v38 codeSignInfo];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 identifier];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v35;
  v41 = -[MCMContainerFactory userIdentityCache](v35, "userIdentityCache");
  v75 = v36;
  v42 = -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:]( v37,  "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creato r:userIdentityCache:",  v21,  v76,  v23,  0LL,  v36,  v70,  v40,  v41);

  v80 = v17;
  LOBYTE(v38) = -[MCMMetadata writeMetadataToDiskWithError:](v42, "writeMetadataToDiskWithError:", &v80);
  v43 = v80;

  if ((v38 & 1) == 0)
  {
    v59 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 34LL);

    container_log_handle_for_category();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    a6 = v71;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v59;
      _os_log_error_impl(&dword_188846000, v60, OS_LOG_TYPE_ERROR, "Failed to write metadata: %@", buf, 0xCu);
    }

    v52 = 0LL;
    v51 = 0LL;
    id v15 = v65;
    v13 = v66;
    v50 = (void *)v72;
    goto LABEL_39;
  }

  id v44 = containermanager_copy_global_configuration();
  int v45 = [v44 isGlobalSystemContainerWithContainerClass:v68];

  a6 = v71;
  if (!v45)
  {
    v13 = v66;
    id v26 = v67;
    v49 = v64;
    id v15 = v65;
LABEL_32:
    v51 = 0LL;
    if (v68 <= 0xB && ((1LL << v68) & 0xED4) != 0)
    {
      v61 = -[MCMContainerFactory userIdentityCache](v49, "userIdentityCache");
      [v61 libraryRepairForUserIdentity:v72];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v52 = +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:]( &OBJC_CLASS___MCMContainerSchema,  "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:",  v42,  v15,  v70,  v51);
    id v78 = v26;
    char v62 = [v52 writeSchemaFromVersion:&unk_18A2BE800 toTargetVersion:v75 error:&v78];
    id v63 = v78;

    if ((v62 & 1) != 0)
    {
      id v26 = v63;
      goto LABEL_43;
    }

    v67 = v63;
    v59 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 109LL);

    container_log_handle_for_category();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v72;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v88 = (MCMError *)v42;
      __int16 v89 = 2112;
      id v90 = v67;
      _os_log_error_impl( &dword_188846000,  v60,  OS_LOG_TYPE_ERROR,  "Could not create container schema for %@: %@",  buf,  0x16u);
    }

- (id)containerForContainerIdentity:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v76 = a4;
  uint64_t v94 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v77 = [v6 transient];
  LODWORD(v7) = [v6 platform];
  v8 = -[MCMContainerFactory clientIdentity](self, "clientIdentity");
  [v8 codeSignInfo];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 userIdentity];
  id v79 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v6 containerClass];
  v80 = self;
  if (!(_DWORD)v7)
  {
    v12 = -[MCMContainerFactory clientIdentity](self, "clientIdentity");
    uint64_t v7 = [v12 platform];

    uint64_t v13 = [v6 identityBySettingPlatform:v7];

    id v6 = (id)v13;
  }

  container_log_handle_for_category();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[MCMContainerFactory clientIdentity](self, "clientIdentity");
    v42 = v10;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 codeSignInfo];
    id v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 entitlements];
    int v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v88 = (const char *)v6;
    __int16 v89 = 1024;
    *(_DWORD *)id v90 = v76;
    *(_WORD *)&v90[4] = 1024;
    *(_DWORD *)&v90[6] = v7;
    *(_WORD *)uint64_t v91 = 1024;
    *(_DWORD *)&v91[2] = v77;
    LOWORD(v92) = 1024;
    *(_DWORD *)((char *)&v92 + 2) = [v45 privileged];
    HIWORD(v92) = 2112;
    v93 = v42;
    _os_log_debug_impl( &dword_188846000,  v14,  OS_LOG_TYPE_DEBUG,  "createOrLookup; identity: %@, createIfNecessary: %d, platform: %d, transient: %d, privileged: %d, clientBundleIdentifier: %@",
      buf,
      0x2Eu);

    id v10 = v42;
  }

  if (!v6)
  {
    uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 38LL);
    container_log_handle_for_category();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    int v20 = "Cannot lookup a nil container identity.";
LABEL_62:
    _os_log_error_impl(&dword_188846000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
LABEL_10:

    v21 = 0LL;
    v22 = 0LL;
LABEL_11:
    if (v18)
    {
      v23 = v18;
      v24 = 0LL;
      *a5 = v23;
    }

    else
    {
      v23 = 0LL;
      v24 = 0LL;
    }

    goto LABEL_57;
  }

  id v15 = containermanager_copy_global_configuration();
  char v16 = [v15 isUnsupportedSystemContainerWithContainerClass:v11];

  if ((v16 & 1) != 0)
  {
    uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 72LL);
    container_log_handle_for_category();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    int v20 = "System containers are unsupported on this platform.";
    goto LABEL_62;
  }

  v73 = v10;
  uint64_t v74 = v11;
  v21 = 0LL;
  uint64_t v18 = 0LL;
  v24 = 0LL;
  char v25 = 0;
  *(void *)&__int128 v17 = 136315138LL;
  __int128 v72 = v17;
  id v26 = v80;
  while (1)
  {
    char v27 = v25;
    char v28 = v21;
    v29 = -[MCMContainerFactory cache](v26, "cache");
    [v29 classCacheForContainerIdentity:v6];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MCMContainerFactory cache](v26, "cache");
    id v86 = 0LL;
    [v30 entryForContainerIdentity:v6 classCache:v21 error:&v86];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (MCMError *)v86;

    if (v24)
    {
      if (!v77 || (objc_opt_class(), ((objc_opt_isKindOfClass() | !v76) & 1) != 0))
      {
        v22 = 0LL;
        id v10 = v73;
        goto LABEL_48;
      }

      id v31 = objc_alloc(MEMORY[0x189604030]);
      id v78 = v24;
      [v24 containerPath];
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 containerRootURL];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 path];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)[v31 initFileURLWithPath:v34 isDirectory:1];

      id v36 = containermanager_copy_global_configuration();
      LOBYTE(v31) = [v36 isGlobalContainerClass:v74];

      else {
        id v37 = v79;
      }
      v85 = v18;
      BOOL v39 = -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:]( v80,  "deleteURL:forUserIdentity:reclaimSoon:error:",  v35,  v37,  1LL,  &v85,  v72);
      uint64_t v38 = v85;

      if (!v39)
      {
        uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 5LL);

        container_log_handle_for_category();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          [v35 path];
          id v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v88 = v65;
          __int16 v89 = 2112;
          *(void *)id v90 = v18;
          _os_log_error_impl( &dword_188846000,  v51,  OS_LOG_TYPE_ERROR,  "Failed to remove transient container at %@; error = %@",
            buf,
            0x16u);
        }

        v22 = 0LL;
        id v10 = v73;
        v24 = v78;
        goto LABEL_48;
      }

      id v26 = v80;
      v24 = v78;
    }

    else
    {
      if (-[MCMError type](v18, "type") != 21
        && -[MCMError type](v18, "type") != 44
        && -[MCMError type](v18, "type") != 108)
      {
        goto LABEL_60;
      }

      if (!v76)
      {
        uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);
LABEL_60:
        v22 = 0LL;
        id v10 = v73;
        goto LABEL_11;
      }

      uint64_t v38 = 0LL;
    }

    id v84 = v38;
    v22 = -[MCMContainerFactory _createContainerForContainerIdentity:error:]( v26,  "_createContainerForContainerIdentity:error:",  v6,  &v84,  v72);
    uint64_t v18 = v84;

    if (v22) {
      break;
    }
    if (-[MCMError type](v18, "type") == 130)
    {
      container_log_handle_for_category();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = " Retrying lookup.";
        if ((v27 & 1) != 0) {
          v41 = "";
        }
        *(_DWORD *)buf = v72;
        v88 = v41;
        _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Container already exists when trying to create it.%s",  buf,  0xCu);
      }

      char v25 = 1;
      if ((v27 & 1) == 0) {
        continue;
      }
    }

    v22 = 0LL;
    id v10 = v73;
    if (!v24) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }

  id v83 = v18;
  char v46 = [v22 verifyWithError:&v83];
  v47 = v83;

  id v10 = v73;
  if ((v46 & 1) != 0)
  {
    -[MCMContainerFactory cache](v80, "cache");
    int v48 = (void *)objc_claimAutoreleasedReturnValue();
    id v82 = v47;
    [v48 addContainerMetadata:v22 error:&v82];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v82;

    if (!v49)
    {
      uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 45LL);

      container_log_handle_for_category();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        [v22 containerPath];
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        [v67 containerRootURL];
        id v68 = v6;
        v69 = v21;
        unsigned int v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v70 path];
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v88 = (const char *)v22;
        __int16 v89 = 2112;
        *(void *)id v90 = v71;
        *(_WORD *)&v90[8] = 1024;
        *(_DWORD *)uint64_t v91 = v77;
        *(_WORD *)&v91[4] = 2112;
        v92 = v18;
        _os_log_error_impl( &dword_188846000,  v61,  OS_LOG_TYPE_ERROR,  "Failed to add to cache: %@, url: %@, transient: %d; error = %@",
          buf,
          0x26u);

        v21 = v69;
        id v6 = v68;
      }

      goto LABEL_11;
    }

    v24 = (void *)[v49 copyWithZone:0];
    v47 = v50;
  }

  else
  {
    container_log_handle_for_category();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
    {
      [v22 shortDescription];
      v66 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v88 = v66;
      __int16 v89 = 2112;
      *(void *)id v90 = v47;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v49,  OS_LOG_TYPE_ERROR,  "Failed to verify new metadata; metadata = %@, error = %@",
        buf,
        0x16u);
    }
  }

  uint64_t v18 = v47;
  if (!v24) {
    goto LABEL_11;
  }
LABEL_48:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v24 uuid];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 uuid];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    char v54 = [v52 isEqual:v53];

    if ((v54 & 1) == 0)
    {

      v60 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);
      uint64_t v18 = v60;
      goto LABEL_11;
    }
  }

  if (v76)
  {
    v55 = v21;
    v56 = -[MCMContainerFactory clientIdentity](v80, "clientIdentity");
    id v81 = v18;
    BOOL v57 = -[MCMContainerFactory upgradeContainer:clientIdentity:error:]( v80,  "upgradeContainer:clientIdentity:error:",  v24,  v56,  &v81);
    v23 = v81;

    if (!v57)
    {
      container_log_handle_for_category();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        [v24 containerPath];
        char v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 containerRootURL];
        id v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v63 path];
        v64 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = v64;
        __int16 v89 = 2112;
        *(void *)id v90 = v23;
        _os_log_error_impl( &dword_188846000,  v58,  OS_LOG_TYPE_ERROR,  "Failed to migrate container at [%@]; error = %@",
          buf,
          0x16u);
      }
    }

    v21 = v55;
  }

  else
  {
    v23 = v18;
  }

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 error:(id *)a5
{
  return -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:]( self,  "deleteURL:forUserIdentity:reclaimSoon:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 reclaimSoon:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  char v54 = __Block_byref_object_copy__11260;
  v55 = __Block_byref_object_dispose__11261;
  id v56 = 0LL;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x3032000000LL;
  v49[3] = __Block_byref_object_copy__11260;
  v49[4] = __Block_byref_object_dispose__11261;
  id v50 = 0LL;
  uint64_t v45 = 0LL;
  char v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = __Block_byref_object_copy__11260;
  v39[4] = __Block_byref_object_dispose__11261;
  id v40 = 0LL;
  v12 = -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
  [v12 defaultUserIdentity];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  id v14 = (dispatch_queue_s *)MCMSharedDeathrowQueue();
  uint64_t v26 = MEMORY[0x1895F87A8];
  uint64_t v27 = 3221225472LL;
  char v28 = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke;
  v29 = &unk_18A29E1A0;
  id v15 = v11;
  id v30 = v15;
  v34 = &v51;
  v35 = v39;
  id v36 = v49;
  id v16 = v10;
  id v31 = v16;
  id v32 = self;
  id v17 = v13;
  id v33 = v17;
  id v37 = &v45;
  uint64_t v38 = &v41;
  dispatch_sync(v14, &v26);

  if (*((_BYTE *)v46 + 24))
  {
    if (v7)
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___MCMCommandContext);
      -[MCMContainerFactory clientIdentity](self, "clientIdentity", v26, v27, v28, v29, v30, v31, v32);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = containermanager_copy_global_configuration();
      v22 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:]( v18,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:",  v19,  0LL,  self,  v20,  0LL,  v21);

      v23 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:]( objc_alloc(&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace),  "initWithAsynchronously:context:resultPromise:",  1LL,  v22,  0LL);
      -[MCMCommandOperationReclaimDiskSpace execute](v23, "execute");
    }

    goto LABEL_5;
  }

  if (*((_BYTE *)v42 + 24))
  {
LABEL_5:
    BOOL v24 = 1;
    goto LABEL_6;
  }

  BOOL v24 = 0;
  if (a6) {
    *a6 = (id) v52[5];
  }
LABEL_6:

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  return v24;
}

- (id)_createContainerForContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 identifier];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 containerClass];
  [v6 userIdentity];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 waitOnLock:7];

  +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMContainerFactory clientIdentity](self, "clientIdentity");
  uint64_t v13 = [v11 intendedDataProtectionClassBasedOnEntitlementsForIdentifier:v7 clientIdentity:v12 containerClass:v8 info:0];

  id v85 = 0LL;
  id v86 = 0LL;
  -[MCMContainerFactory createStagedContainerForContainerIdentity:finalContainerPath:dataProtectionClass:error:]( self,  "createStagedContainerForContainerIdentity:finalContainerPath:dataProtectionClass:error:",  v6,  &v86,  v13,  &v85);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v86;
  id v16 = (MCMError *)v85;
  if (v14)
  {
    uint64_t v77 = v8;
    id v78 = v9;
    id v79 = v16;
    uint64_t v74 = a4;
    id v75 = v6;
    [v14 containerIdentity];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v73 containerPathIdentifier];
    container_log_handle_for_category();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      -[MCMContainerFactory clientIdentity](self, "clientIdentity");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 codeSignInfo];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 identifier];
      v22 = (void *)v21;
      v23 = @"<unknown>";
      *(_DWORD *)buf = 138478595;
      uint64_t v88 = v17;
      if (v21) {
        v23 = (const __CFString *)v21;
      }
      __int16 v89 = 2113;
      id v90 = v7;
      __int16 v91 = 2050;
      uint64_t v92 = v77;
      __int16 v93 = 2113;
      uint64_t v94 = v23;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CreatingContainer",  " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class =%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ",  buf,  0x2Au);
    }

    __int128 v72 = self;
    v80 = (void *)v17;
    BOOL v76 = v7;

    [v14 containerPath];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 containerClassPath];
    char v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v84 = 0LL;
    int v26 = [v25 createIfNecessaryWithError:&v84];
    id v27 = v84;

    if (v26)
    {
      int v28 = 0;
      uint64_t v29 = *MEMORY[0x189607688];
      while (1)
      {

        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 containerRootURL];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 containerRootURL];
        id v32 = (void *)objc_claimAutoreleasedReturnValue();
        id v83 = 0LL;
        char v33 = [v30 moveItemAtURL:v31 toURL:v32 error:&v83];
        id v34 = v83;

        if ((v33 & 1) != 0) {
          break;
        }
        container_log_handle_for_category();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          [v24 containerRootURL];
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          [v71 path];
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 containerRootURL];
          char v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 path];
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          uint64_t v88 = (uint64_t)v43;
          __int16 v89 = 2112;
          id v90 = v45;
          __int16 v91 = 2112;
          uint64_t v92 = (uint64_t)v34;
          _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to move staging dir: %@ to live dir: %@; error = %@",
            buf,
            0x20u);
        }

        [v34 domain];
        id v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v36 isEqualToString:v29])
        {
          uint64_t v37 = [v34 code];

          if (v37 == 66)
          {

            v60 = objc_alloc(&OBJC_CLASS___MCMError);
            [v15 containerRootURL];
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 path];
            char v62 = (void *)objc_claimAutoreleasedReturnValue();
            id v63 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v60,  "initWithErrorType:category:path:POSIXerrno:",  130LL,  1LL,  v62,  66LL);

            v64 = (os_log_s *)v61;
            goto LABEL_21;
          }
        }

        else
        {
        }

        [v34 domain];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v38 isEqualToString:v29])
        {

LABEL_32:
          id v63 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 8LL);
          BOOL v7 = v76;
          v64 = (os_log_s *)v79;
          goto LABEL_33;
        }

        BOOL v39 = [v34 code] != 2;

        if (((v28 | v39) & 1) != 0) {
          goto LABEL_32;
        }
        [v15 containerClassPath];
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 setExists:0];

        [v15 containerClassPath];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        id v84 = v34;
        char v42 = [v41 createIfNecessaryWithError:&v84];
        id v27 = v84;

        int v28 = 1;
        if ((v42 & 1) == 0) {
          goto LABEL_18;
        }
      }

      BOOL v7 = v76;
      if (_os_feature_enabled_impl())
      {
        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 containerRootURL];
        char v48 = (void *)objc_claimAutoreleasedReturnValue();
        id v82 = 0LL;
        char v49 = [v47 enableFastDiskUsageForURL:v48 error:&v82];
        id v50 = v82;

        if ((v49 & 1) == 0)
        {
          container_log_handle_for_category();
          uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            [v15 containerRootURL];
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            [v69 path];
            unsigned int v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v88 = (uint64_t)v70;
            __int16 v89 = 2112;
            id v90 = v50;
            _os_log_error_impl( &dword_188846000,  v51,  OS_LOG_TYPE_ERROR,  "Failed to enable fast disk stats on new container [%@]; error = %@",
              buf,
              0x16u);
          }
        }
      }

      [v14 metadataByChangingContainerPath:v15];
      char v46 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = 0LL;
    }

    else
    {
LABEL_18:

      id v63 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 8LL);
      container_log_handle_for_category();
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        [v15 classURL];
        id v65 = (void *)objc_claimAutoreleasedReturnValue();
        [v65 path];
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v88 = (uint64_t)v66;
        __int16 v89 = 2112;
        id v90 = v27;
        _os_log_error_impl( &dword_188846000,  v64,  OS_LOG_TYPE_ERROR,  "Failed to create class dir at %@ : %@",  buf,  0x16u);
      }

      id v34 = v27;
LABEL_21:
      BOOL v7 = v76;
LABEL_33:

      id v9 = v78;
      if (!v24)
      {
        char v46 = 0LL;
        id v16 = v63;
        a4 = v74;
        id v6 = v75;
        goto LABEL_44;
      }

      id v52 = containermanager_copy_global_configuration();
      char v53 = [v52 isGlobalContainerClass:v77];

      if ((v53 & 1) != 0) {
        id v54 = 0LL;
      }
      else {
        id v54 = v78;
      }
      [v24 containerRootURL];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      id v81 = 0LL;
      BOOL v56 = -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:]( v72,  "deleteURL:forUserIdentity:reclaimSoon:error:",  v55,  v54,  1LL,  &v81);
      id v14 = v81;

      if (!v56)
      {
        container_log_handle_for_category();
        uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          [v24 containerRootURL];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          [v67 path];
          id v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          uint64_t v88 = (uint64_t)v68;
          __int16 v89 = 2112;
          id v90 = v14;
          _os_log_fault_impl( &dword_188846000,  v57,  OS_LOG_TYPE_FAULT,  "Failed to remove staging dir: %@; error = %@",
            buf,
            0x16u);

          BOOL v7 = v76;
        }
      }

      char v46 = 0LL;
      id v79 = v63;
    }

    a4 = v74;
    id v6 = v75;
    id v9 = v78;
    id v16 = v79;
LABEL_44:
    id v14 = v73;
    if (!a4) {
      goto LABEL_47;
    }
    goto LABEL_45;
  }

  v80 = 0LL;
  BOOL v24 = 0LL;
  id v34 = 0LL;
  char v46 = 0LL;
  if (!a4) {
    goto LABEL_47;
  }
LABEL_45:
  if (!v46)
  {
    v58 = v16;
    *a4 = v16;
    id v16 = v58;
  }

- (id)_generateConcreteContainerIdentityFromContainerIdentity:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v6 identifier];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v6 userIdentity];
    uint64_t v9 = [v6 platform];
    char v10 = [v6 transient];
    v24[0] = 1LL;
    [MEMORY[0x189607AB8] UUID];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCMContainerFactory _containerPathIdentifierForContainerIdentity:]( self,  "_containerPathIdentifierForContainerIdentity:",  v6);
    if (v12)
    {
      v22 = a4;
      uint64_t v13 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v14 = [v6 uuid];

        id v11 = (void *)v14;
      }

      [v6 containerConfig];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v21) = v10;
      LOBYTE(v21) = 0;
      uint64_t v17 = (void *)v23;
      uint64_t v8 = v13;
      +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:trans ient:userIdentityCache:error:",  v11,  v23,  v13,  v15,  v9,  v12,  v21,  v16,  v24);
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v18 = 0LL;
LABEL_12:

        goto LABEL_13;
      }

      uint64_t v19 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v18 = -[MCMError initWithErrorType:](v19, "initWithErrorType:", v24[0]);
      a4 = v22;
      if (!v22)
      {
LABEL_11:
        id v7 = 0LL;
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 138LL);
      uint64_t v17 = (void *)v23;
      if (!a4) {
        goto LABEL_11;
      }
    }

    uint64_t v18 = v18;
    id v7 = 0LL;
    *a4 = v18;
    goto LABEL_12;
  }

  id v7 = v6;
LABEL_13:

  return v7;
}

- (id)_containerPathIdentifierForContainerIdentity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x189607AB8] UUID];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = [v3 containerClass];
    [v3 platform];
    [v3 transient];
    [v3 identifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((container_class_supports_randomized_path() & 1) != 0)
    {
      if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
      {
LABEL_12:

        goto LABEL_13;
      }

      +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v8;
      if (v6 == 13) {
        [v8 wellknownSystemGroupContainerForId:v7];
      }
      else {
        [v8 wellknownSystemContainerForId:v7];
      }
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        id v10 = v10;

        v4 = v10;
      }
    }

    else
    {
      +[MCMContainerPath containerPathIdentifierForCodeSignIdentifier:containerClass:]( MCMContainerPath,  "containerPathIdentifierForCodeSignIdentifier:containerClass:",  v7,  [v3 containerClass]);
      id v10 = v4;
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }

  [v3 containerPathIdentifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

- (MCMContainerCache)cache
{
  return self->_cache;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

void __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32)) {
    +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassDeletedPath,  "deletedURLWithUserIdentity:");
  }
  else {
    +[MCMContainerClassDeletedPath deletedGlobalURL](&OBJC_CLASS___MCMContainerClassDeletedPath, "deletedGlobalURL");
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    uint64_t v21 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 13LL);
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    container_log_handle_for_category();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "Could not get deathrow URL", buf, 2u);
    }

    goto LABEL_23;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(*(void *)(a1 + 80) + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 createTemporaryDirectoryInDirectoryURL:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v8)
  {
    [*(id *)(a1 + 40) lastPathComponent];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, objc_msgSend(*(id *)(a1 + 40), "hasDirectoryPath"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8LL);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(a1 + 48) userIdentityCache];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 libraryRepairForUserIdentity:*(void *)(a1 + 56)];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8LL);
    id v47 = *(id *)(v16 + 40);
    v46[0] = MEMORY[0x1895F87A8];
    v46[2] = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15;
    v46[3] = &unk_18A29E660;
    uint64_t v17 = *(void *)(a1 + 40);
    v46[1] = 3221225472LL;
    v46[4] = v15;
    char v18 = -[os_log_s fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( v14,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  v17,  &v47,  v46);
    objc_storeStrong((id *)(v16 + 40), v47);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = v18;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL)) {
      goto LABEL_18;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) domain];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v19 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) code];

      if (v20 == 2)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
LABEL_23:

        goto LABEL_24;
      }
    }

    else
    {
    }

    uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 41LL);
    uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    container_log_handle_for_category();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) path];
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) path];
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412802;
      id v50 = v40;
      __int16 v51 = 2112;
      id v52 = v41;
      __int16 v53 = 2112;
      uint64_t v54 = v42;
      _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Failed to move item at: %@ to: %@; error = %@",
        buf,
        0x20u);
    }
  }

  else
  {
    BOOL v24 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 41LL);
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8LL);
    int v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    container_log_handle_for_category();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    [*(id *)(a1 + 40) path];
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v28 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412546;
    id v50 = v27;
    __int16 v51 = 2112;
    id v52 = v28;
    _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to create unique directory at: %@; error = %@",
      buf,
      0x16u);
  }

LABEL_18:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 48) userIdentityCache];
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 libraryRepairForUserIdentity:*(void *)(a1 + 56)];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(*(void *)(a1 + 80) + 8LL);
    id v45 = *(id *)(v34 + 40);
    char v35 = -[os_log_s fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( v14,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  v33,  &v45,  &__block_literal_global_11269);
    objc_storeStrong((id *)(v34 + 40), v45);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = v35;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL))
    {
      id v36 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 41LL);
      uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8LL);
      uint64_t v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;

      container_log_handle_for_category();
      BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 40) path];
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        char v44 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
        *(_DWORD *)buf = 138412546;
        id v50 = v43;
        __int16 v51 = 2112;
        id v52 = v44;
        _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to direct-delete [%@]; error = %@",
          buf,
          0x16u);
      }
    }

    goto LABEL_23;
  }

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 moveItemAtURL:v5 toURL:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) error:a3];

  return v7;
}

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_17( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v4 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 removeItemAtURL:v4 error:a3];

  return v6;
}

- (BOOL)upgradeContainer:(id)a3 clientIdentity:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v57 = a4;
  [v7 schemaVersion];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 containerPath];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 containerClass];
  -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 userIdentity];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 libraryRepairForUserIdentity:v11];
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 containerClass];
  if (!container_class_supports_data_subdirectory())
  {
    uint64_t v16 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_15;
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v75 = 0;
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  char v73 = 0;
  [v8 containerDataURL];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v69 = 0LL;
  v68[0] = MEMORY[0x1895F87A8];
  v68[1] = 3221225472LL;
  v68[2] = __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke;
  v68[3] = &unk_18A29E1C8;
  v68[4] = buf;
  v68[5] = &v70;
  char v13 = [v58 fixAndRetryIfPermissionsErrorWithURL:v12 containerPath:v8 containerIdentifier:v60 error:&v69 duringBlock:v68];
  id v14 = v69;

  if ((v13 & 1) == 0)
  {
    [v14 domain];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 isEqualToString:*MEMORY[0x189607688]];

    if (!v18)
    {
      uint64_t v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 105LL);
      goto LABEL_25;
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___MCMError);
    [v8 containerDataURL];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 path];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v19,  "initWithErrorType:category:path:POSIXerrno:",  105,  1,  v21,  [v14 code]);
    goto LABEL_9;
  }

  if (!*(_BYTE *)(*(void *)&buf[8] + 24LL) || !*((_BYTE *)v71 + 24))
  {
    id v67 = 0LL;
    [v7 metadataWithError:&v67];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (MCMError *)v67;
    if (!v20) {
      goto LABEL_23;
    }
    uint64_t v23 = +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
    uint64_t v24 = [(id)v23 desiredDataProtectionClassForMetadata:v20 clientIdentity:v57];

    id v66 = v14;
    LOBYTE(v23) = [v8 createDataURLIfNecessaryWithDataProtectionClass:v24 error:&v66];
    id v25 = v66;

    if ((v23 & 1) != 0)
    {
      id v26 = &unk_18A2BE800;

      v59 = &unk_18A2BE800;
      id v14 = v25;
      goto LABEL_14;
    }

    [v25 domain];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    int v48 = [v47 isEqualToString:*MEMORY[0x189607688]];

    if (v48)
    {
      char v49 = objc_alloc(&OBJC_CLASS___MCMError);
      [v8 containerDataURL];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 path];
      id v50 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v49,  "initWithErrorType:category:path:POSIXerrno:",  106,  1,  v50,  [v25 code]);

      id v14 = v25;
      uint64_t v15 = (MCMError *)v51;
      goto LABEL_10;
    }

    uint64_t v22 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 106LL);
    uint64_t v21 = v15;
    id v14 = v25;
LABEL_9:
    uint64_t v15 = v22;
LABEL_10:

LABEL_23:
LABEL_25:
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(buf, 8);
    id v28 = 0LL;
    goto LABEL_33;
  }

  uint64_t v15 = 0LL;
LABEL_14:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(buf, 8);
  uint64_t v16 = v14;
LABEL_15:
  id v65 = 0LL;
  BOOL v27 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:]( &OBJC_CLASS___MCMContainerSchema,  "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:",  v60,  v9,  v59,  &v65);
  id v28 = v65;
  if (!v27)
  {
    v64 = v15;
    [v7 metadataWithError:&v64];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = v64;

    if (v31)
    {
      +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v32 desiredDataProtectionClassForMetadata:v31 clientIdentity:v57];

      [v31 containerPath];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:]( &OBJC_CLASS___MCMContainerSchema,  "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:",  v31,  v34,  v33,  v58);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

      id v63 = v16;
      LOBYTE(v33) = [v54 writeSchemaFromVersion:v59 toTargetVersion:v28 error:&v63];
      id v14 = v63;

      if ((v33 & 1) != 0)
      {
        [v31 metadataByChangingSchemaVersion:v28];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          char v62 = v55;
          int v35 = [v29 writeMetadataToDiskWithError:&v62];
          id v36 = v62;

          if (v35)
          {
            -[MCMContainerFactory cache](self, "cache");
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v36;
            uint64_t v38 = [v37 addContainerMetadata:v29 error:&v61];
            uint64_t v15 = v61;

            if (v38)
            {
              BOOL v30 = 1;
              id v7 = (id)v38;
            }

            else
            {
              container_log_handle_for_category();
              __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_error_impl( &dword_188846000,  v53,  OS_LOG_TYPE_ERROR,  "Failed to update cache with new metadata during schema update; error = %@",
                  buf,
                  0xCu);
              }

              id v7 = 0LL;
              uint64_t v15 = 0LL;
              BOOL v30 = 1;
            }
          }

          else
          {
            container_log_handle_for_category();
            id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v36;
              _os_log_error_impl( &dword_188846000,  v52,  OS_LOG_TYPE_ERROR,  "Could not update container schema version or data protection class in metadata for %@: %@",  buf,  0x16u);
            }

            BOOL v30 = 1;
            uint64_t v15 = v36;
          }
        }

        else
        {
          BOOL v30 = 1;
          uint64_t v15 = v55;
        }

        goto LABEL_36;
      }

      container_log_handle_for_category();
      BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Could not update container schema for %@: %@",  buf,  0x16u);
      }

      [v14 domain];
      id v40 = (void *)objc_claimAutoreleasedReturnValue();
      int v41 = [v40 isEqualToString:*MEMORY[0x189607688]];

      uint64_t v42 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v43 = v42;
      if (v41)
      {
        [v8 containerDataURL];
        char v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 path];
        id v45 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v43,  "initWithErrorType:category:path:POSIXerrno:",  104,  1,  v45,  [v14 code]);
      }

      else
      {
        uint64_t v15 = -[MCMError initWithErrorType:](v42, "initWithErrorType:", 104LL);
        char v44 = v55;
      }
    }

    else
    {
      id v14 = v16;
      uint64_t v15 = v55;
    }

uint64_t __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 itemAtURL:v5 exists:*(void *)(*(void *)(a1 + 32) + 8) + 24 isDirectory:*(void *)(*(void *)(a1 + 40) + 8) + 24 error:a3];

  return v7;
}

@end