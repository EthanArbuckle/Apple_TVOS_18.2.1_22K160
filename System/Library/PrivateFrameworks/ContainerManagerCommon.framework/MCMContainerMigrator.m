@interface MCMContainerMigrator
+ (id)sharedInstance;
- (BOOL)_migrateBundleContainersWithError:(id *)a3;
- (BOOL)_migrateDeleteOperationManifestsWithError:(id *)a3;
- (BOOL)_migrateManifestIfNecessaryAtURL:(id)a3 withLibraryRepairForUser:(id)a4 error:(id *)a5;
- (BOOL)_performEntitlementBypassListMigrationWithError:(id *)a3;
- (BOOL)performSynchronousBuildUpgradeMigration:(id)a3 context:(id)a4 error:(id *)a5;
- (MCMContainerMigrator)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (void)_checkIfDeviceMayNeedSystemContainerACLMigration:(id)a3;
- (void)setUserIdentityCache:(id)a3;
@end

@implementation MCMContainerMigrator

- (MCMContainerMigrator)initWithUserIdentityCache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMContainerMigrator;
  v6 = -[MCMContainerMigrator init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v7;
}

- (BOOL)_performEntitlementBypassListMigrationWithError:(id *)a3
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  v4 = -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
  [v4 defaultUserIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = containermanager_copy_global_configuration();
  int v7 = [v6 systemContainerMode];

  if (!v7)
  {
    id v66 = 0LL;
    v67 = 0LL;
    char v68 = 1;
    goto LABEL_61;
  }

  v77 = a3;
  objc_super v9 = 0LL;
  uint64_t v10 = 0LL;
  char v81 = 1;
  p_info = &OBJC_METACLASS___MCMXPCMessageSetDataProtection.info;
  unint64_t v12 = 0x189604000uLL;
  v13 = &OBJC_CLASS___MCMContainerStagingPath;
  *(void *)&__int128 v8 = 136315394LL;
  __int128 v74 = v8;
  char v14 = 1;
  do
  {
    char v15 = v14;
    uint64_t v16 = _performEntitlementBypassListMigrationWithError__possibleContainerClasses[v10];
    v17 = p_info[110];
    objc_msgSend(*(id *)(v12 + 16), "setWithObject:", v5, v74);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v9;
    uint64_t v92 = v16;
    v19 = -[__objc2_class_ro entriesForUserIdentities:contentClass:transient:error:]( v17,  "entriesForUserIdentities:contentClass:transient:error:",  v18,  v16,  0LL,  &v99);
    v20 = v99;

    if (v20)
    {
      container_log_handle_for_category();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v71 = v77;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v20;
        _os_log_error_impl( &dword_188846000,  v73,  OS_LOG_TYPE_ERROR,  "Failed to get list of system containers for migration: %@",  buf,  0xCu);
      }

      char v68 = 0;
LABEL_56:
      v93[0] = MEMORY[0x1895F87A8];
      v93[1] = 3221225472LL;
      v93[2] = __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke;
      v93[3] = &unk_18A29E6D8;
      v67 = v20;
      v94 = v67;
      __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke((uint64_t)v93);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v71) {
        goto LABEL_59;
      }
      goto LABEL_61;
    }

    char v78 = v15;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    id obj = v19;
    uint64_t v91 = [obj countByEnumeratingWithState:&v113 objects:v112 count:16];
    objc_super v9 = 0LL;
    if (!v91) {
      goto LABEL_46;
    }
    uint64_t v21 = *(void *)v114;
    uint64_t v83 = *(void *)v114;
    v85 = v5;
    do
    {
      uint64_t v22 = 0LL;
      do
      {
        if (*(void *)v114 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v113 + 1) + 8 * v22);
        [v23 metadataMinimal];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 identifier];
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          [&v13[6] sharedBypassList];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          int v27 = [v26 containerIdIsWellknown:v25 class:v92];

          if (v27)
          {
            v98 = v9;
            [v23 metadataWithError:&v98];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v98;

            if (!v28)
            {
              container_log_handle_for_category();
              v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v101 = (const char *)v23;
                __int16 v102 = 2112;
                v103 = v29;
                _os_log_error_impl( &dword_188846000,  v69,  OS_LOG_TYPE_ERROR,  "Couldn't load metadata; container = %@, error = %@",
                  buf,
                  0x16u);
              }

              objc_super v9 = v29;

              char v70 = 0;
              goto LABEL_53;
            }

            v88 = v24;
            v30 = v29;
            [&v13[6] sharedBypassList];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v32 = [v31 wellknownContainerForId:v25 class:v92];

            v89 = (void *)v32;
            v33 = +[MCMContainerPath containerPathForUserIdentity:containerClass:containerPathIdentifier:]( &OBJC_CLASS___MCMContainerPath,  "containerPathForUserIdentity:containerClass:containerPathIdentifier:",  v5,  v92,  v32);
            [v33 containerRootURL];
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v28 containerPath];
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v36 = [v35 containerRootURL];
            v90 = v34;
            if (v36)
            {
              v37 = (void *)v36;
              v84 = v33;
              v86 = v29;
              [v28 containerPath];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v38 containerRootURL];
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              char v40 = [v39 isEqual:v34];

              if ((v40 & 1) != 0)
              {
                v41 = 0LL;
                v13 = &OBJC_CLASS___MCMContainerStagingPath;
                v29 = v30;
                v33 = v84;
                goto LABEL_16;
              }

              container_log_handle_for_category();
              v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              v29 = v30;
              v24 = v88;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                [v28 containerPath];
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                [v56 containerRootURL];
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                [v57 path];
                v58 = (char *)objc_claimAutoreleasedReturnValue();
                [v34 path];
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v101 = v25;
                __int16 v102 = 2112;
                v103 = v58;
                __int16 v104 = 2112;
                id v105 = v59;
                _os_log_error_impl( &dword_188846000,  v43,  OS_LOG_TYPE_ERROR,  "Migrating well-known container %@ from %@ to %@",  buf,  0x20u);

                v29 = v86;
              }

              id v97 = 0LL;
              char v44 = [(id)gContainerCache removeContainerForUserIdentity:v85 contentClass:v92 identifier:v25 transient:0 error:&v97];
              id v45 = v97;
              v46 = v45;
              if ((v44 & 1) != 0)
              {
                v79 = v45;
                v47 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
                [v28 containerPath];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                [v48 containerRootURL];
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                id v96 = 0LL;
                char v50 = [v47 moveItemAtURL:v49 toURL:v34 error:&v96];
                id v80 = v96;

                v13 = &OBJC_CLASS___MCMContainerStagingPath;
                if ((v50 & 1) != 0)
                {
                  v33 = v84;
                  uint64_t v51 = [v28 metadataByChangingContainerPath:v84];
                  v29 = v86;
                  if (v51)
                  {
                    v41 = (void *)v51;
                    id v95 = 0LL;
                    [(id)gContainerCache addContainerMetadata:v51 error:&v95];
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    id v75 = v95;
                    if (v52)
                    {
                      int v42 = 0;
                    }

                    else
                    {
                      container_log_handle_for_category();
                      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315650;
                        v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                        __int16 v102 = 2112;
                        v103 = v25;
                        __int16 v104 = 2112;
                        id v105 = v75;
                        _os_log_error_impl( &dword_188846000,  v60,  OS_LOG_TYPE_ERROR,  "%s: Failed to update cache for listed container %@: %@",  buf,  0x20u);
                      }

                      char v81 = 0;
                      int v42 = 2;
                    }

                    if (!v52)
                    {
LABEL_36:

                      objc_super v9 = v29;
                      if (!v42)
                      {
                        uint64_t v21 = v83;
                        id v5 = v85;
                        goto LABEL_38;
                      }

                      char v70 = v81;
                      id v5 = v85;
LABEL_53:

                      char v81 = v70;
                      goto LABEL_54;
                    }

- (void)_checkIfDeviceMayNeedSystemContainerACLMigration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  [v4 staticConfig];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 configForContainerClass:12];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = containermanager_copy_global_configuration();
  [v7 staticConfig];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 configForContainerClass:13];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = containermanager_copy_global_configuration();
  LODWORD(v8) = [v10 systemContainerMode];

  if ((_DWORD)v8 == 1 && ([v3 hasMigrationOccurredForType:@"ACLMigration"] & 1) == 0)
  {
    v11 = +[MCMUserIdentityCache defaultUserIdentity](&OBJC_CLASS___MCMUserIdentitySharedCache, "defaultUserIdentity");
    id v12 = containermanager_copy_global_configuration();
    [v12 classPathCache];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 containerClassPathForUserIdentity:v11 containerConfig:v6 typeClass:objc_opt_class()];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 classURL];
    char v15 = (void *)objc_claimAutoreleasedReturnValue();

    id v16 = containermanager_copy_global_configuration();
    [v16 classPathCache];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 containerClassPathForUserIdentity:v11 containerConfig:v9 typeClass:objc_opt_class()];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 classURL];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    if ([v20 itemDoesNotExistAtURL:v15])
    {
      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = [v21 itemDoesNotExistAtURL:v19];

      if (v22)
      {
        container_log_handle_for_category();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl( &dword_188846000,  v23,  OS_LOG_TYPE_DEFAULT,  "No system containers requiring ACL migration",  v24,  2u);
        }

        [v3 setMigrationCompleteForType:@"ACLMigration"];
      }
    }

    else
    {
    }
  }
}

- (BOOL)_migrateBundleContainersWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  BOOL v4 = 1;
  [MEMORY[0x189604030] fileURLWithPath:@"/private/var/mobile/Containers/Bundle" isDirectory:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMUserIdentityCache defaultUserIdentity](&OBJC_CLASS___MCMUserIdentitySharedCache, "defaultUserIdentity");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = containermanager_copy_global_configuration();
  [v7 staticConfig];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 configForContainerClass:1];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = containermanager_copy_global_configuration();
  [v10 classPathCache];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 containerClassPathForUserIdentity:v6 containerConfig:v9 typeClass:objc_opt_class()];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    id v19 = 0LL;
    goto LABEL_13;
  }
  v13 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  int v14 = [v13 itemExistsAtURL:v5];

  if (!v14)
  {
    id v19 = 0LL;
LABEL_12:
    BOOL v4 = 1;
    goto LABEL_13;
  }

  container_log_handle_for_category();
  char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_188846000,  v15,  OS_LOG_TYPE_DEFAULT,  "Moving bundle containers from user to system location",  buf,  2u);
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 classURL];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = 0LL;
  char v18 = [v16 moveItemAtURL:v5 toURL:v17 error:&v22];
  id v19 = v22;

  if ((v18 & 1) != 0) {
    goto LABEL_12;
  }
  container_log_handle_for_category();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v19;
    _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Failed to migrate to new bundle containers location : %@.  This is terrible.",  buf,  0xCu);
  }

  if (a3)
  {
    id v19 = v19;
    BOOL v4 = 0;
    *a3 = v19;
  }

  else
  {
    BOOL v4 = 0;
  }

- (BOOL)performSynchronousBuildUpgradeMigration:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 runmode];

  if (v11 && ([v8 hasMigrationOccurredForType:@"DeleteManifestLocationChange"] & 1) == 0)
  {
    id v79 = 0LL;
    BOOL v12 = -[MCMContainerMigrator _migrateDeleteOperationManifestsWithError:]( self,  "_migrateDeleteOperationManifestsWithError:",  &v79);
    id v13 = v79;
    if (v12)
    {
      [v8 setMigrationCompleteForType:@"DeleteManifestLocationChange"];
    }

    else
    {
      container_log_handle_for_category();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v13;
        _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to migrate delete manifest files; error = %@",
          (uint8_t *)&multiuser_flags,
          0xCu);
      }
    }
  }

  uint32_t multiuser_flags = 0;
  host_t v15 = MEMORY[0x1895CE2D0]();
  if (host_get_multiuser_config_flags(v15, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    id v17 = v9;
    -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 defaultUserIdentity];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    [v19 homeDirectoryURL];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 URLByAppendingPathComponent:@"Library/Logs/MobileContainerManager" isDirectory:1];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v78 = 0LL;
    char v23 = [v22 removeItemAtURL:v21 error:&v78];
    id v16 = v78;

    if ((v23 & 1) == 0)
    {
      container_log_handle_for_category();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v16;
        _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to remove really old log directory: %@",  (uint8_t *)&multiuser_flags,  0xCu);
      }
    }

    id v9 = v17;
  }

  else
  {
    id v16 = 0LL;
  }

  +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v25 homeDirectoryURL];
  uint64_t v27 = [(id)v26 URLByAppendingPathComponent:@"Library/Logs/MobileContainerManager" isDirectory:1];

  v28 = (void *)v27;
  v29 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v77 = v16;
  LOBYTE(v26) = [v29 removeItemAtURL:v27 error:&v77];
  id v30 = v77;

  if ((v26 & 1) == 0)
  {
    container_log_handle_for_category();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint32_t multiuser_flags = 138412290;
      id v81 = v30;
      _os_log_error_impl( &dword_188846000,  v31,  OS_LOG_TYPE_ERROR,  "Failed to remove old log directory: %@",  (uint8_t *)&multiuser_flags,  0xCu);
    }
  }

  id v32 = containermanager_copy_global_configuration();
  BOOL v33 = 1;
  int v34 = [v32 dispositionForContainerClass:1];

  if (v34 == 1)
  {
    id v76 = v30;
    BOOL v35 = -[MCMContainerMigrator _migrateBundleContainersWithError:](self, "_migrateBundleContainersWithError:", &v76);
    id v36 = v76;

    if (v35)
    {
      BOOL v33 = 1;
    }

    else
    {
      container_log_handle_for_category();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v36;
        _os_log_error_impl( &dword_188846000,  v37,  OS_LOG_TYPE_ERROR,  "Failed to migrate bundle containers : %@",  (uint8_t *)&multiuser_flags,  0xCu);
      }

      BOOL v33 = 0;
    }
  }

  else
  {
    id v36 = v30;
  }

  id v38 = containermanager_copy_global_configuration();
  int v39 = [v38 dispositionForContainerClass:12];

  if (v39 == 1)
  {
    -[MCMContainerMigrator _checkIfDeviceMayNeedSystemContainerACLMigration:]( self,  "_checkIfDeviceMayNeedSystemContainerACLMigration:",  v8);
    id v75 = v36;
    BOOL v40 = -[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]( self,  "_performEntitlementBypassListMigrationWithError:",  &v75);
    id v41 = v75;

    if (!v40)
    {
      container_log_handle_for_category();
      int v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v41;
        _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to migrate listed bundle containers : %@",  (uint8_t *)&multiuser_flags,  0xCu);
      }

      BOOL v33 = 0;
    }
  }

  else
  {
    id v41 = v36;
  }

  id v43 = containermanager_copy_global_configuration();
  int v44 = [v43 dispositionForContainerClass:10];

  if (v44 == 1 && ([v8 hasMigrationOccurredForType:@"DaemonContainerCleaning"] & 1) == 0)
  {
    id v69 = v41;
    id v70 = v9;
    v72 = v8;
    v73 = v28;
    v71 = a5;
    +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
    id v45 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v45 allAccessibleUserIdentities];

    [MEMORY[0x189603FE0] set];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    id v74 = 0LL;
    char v68 = (void *)v46;
    [(id)gContainerCache entriesForUserIdentities:v46 contentClass:10 transient:0 error:&v74];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    id v67 = v74;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v85 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v86;
      do
      {
        for (uint64_t i = 0LL; i != v51; ++i)
        {
          if (*(void *)v86 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          [v54 identifier];
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          char v56 = [v55 hasPrefix:@"com.apple."];

          if ((v56 & 1) == 0)
          {
            [v54 containerIdentity];
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            [v47 addObject:v57];
          }
        }

        uint64_t v51 = [v49 countByEnumeratingWithState:&v85 objects:v84 count:16];
      }

      while (v51);
    }

    id v9 = v70;
    if ([v47 count])
    {
      v58 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
      [v47 allObjects];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v59,  0LL,  v70,  v58);
      [v60 execute];
      v61 = -[MCMResultPromise result](v58, "result");
      [v61 error];
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        container_log_handle_for_category();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v28 = v73;
        id v41 = v69;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
        {
          [v61 error];
          id v66 = (void *)objc_claimAutoreleasedReturnValue();
          uint32_t multiuser_flags = 138412546;
          id v81 = v66;
          __int16 v82 = 2112;
          uint64_t v83 = v47;
          _os_log_fault_impl( &dword_188846000,  v63,  OS_LOG_TYPE_FAULT,  "Failed to clear daemon containers; error = %@, containers = %@",
            (uint8_t *)&multiuser_flags,
            0x16u);

          v28 = v73;
        }

        id v8 = v72;
        goto LABEL_52;
      }
    }

    id v8 = v72;
    [v72 setMigrationCompleteForType:@"DaemonContainerCleaning"];
    v28 = v73;
    id v41 = v69;
LABEL_52:

    a5 = v71;
  }

  if (a5) {
    char v64 = v33;
  }
  else {
    char v64 = 1;
  }
  if ((v64 & 1) == 0) {
    *a5 = v41;
  }

  return v33;
}

- (BOOL)_migrateDeleteOperationManifestsWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v5 = containermanager_copy_global_configuration();
  int v6 = [v5 runmode];

  if (!v6)
  {
    uint64_t v21 = 0LL;
LABEL_23:
    BOOL v29 = 1;
    goto LABEL_31;
  }

  id v7 = containermanager_copy_global_configuration();
  [v7 managedPathRegistry];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containermanagerDeleteOperations];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 url];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v38 = 0LL;
    [v11 urlsForItemsInDirectoryAtURL:v10 error:&v38];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v38;

    if (v12)
    {
      id v35 = v13;
      id v36 = v9;
      -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
      host_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 defaultUserIdentity];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 libraryRepairForUserIdentity:v16];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      int v34 = v12;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        BOOL v33 = a3;
        uint64_t v21 = 0LL;
        uint64_t v22 = *(void *)v41;
        while (2)
        {
          uint64_t v23 = 0LL;
          id v24 = v21;
          do
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v18);
            }
            uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * v23);
            v37 = v24;
            BOOL v26 = -[MCMContainerMigrator _migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:]( self,  "_migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:",  v25,  v17,  &v37,  v33);
            uint64_t v21 = v37;

            if (!v26)
            {

              a3 = v33;
              id v13 = v35;
              id v9 = v36;
              goto LABEL_28;
            }

            ++v23;
            id v24 = v21;
          }

          while (v20 != v23);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v39 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      id v13 = v35;
      id v9 = v36;
      BOOL v12 = v34;
      goto LABEL_22;
    }

    [v13 domain];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v27 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v28 = [v13 code];

      if (v28 == 2)
      {
        uint64_t v21 = 0LL;
LABEL_22:

        goto LABEL_23;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      [v10 path];
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v45 = v13;
      __int16 v46 = 2112;
      v47 = v32;
      _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to get items at delete operations URL; error = %@, path = [%@]",
        buf,
        0x16u);
    }

    uint64_t v21 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v13,  v10,  146LL);
  }

  else
  {
    uint64_t v21 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  84LL,  1LL);
    container_log_handle_for_category();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing pending delete operations.",  buf,  2u);
    }
  }

- (BOOL)_migrateManifestIfNecessaryAtURL:(id)a3 withLibraryRepairForUser:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(&OBJC_CLASS___MCMDeleteManifest);
  -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v36 = 0LL;
  id v12 = -[MCMDeleteManifest initFromURL:userIdentityCache:error:]( v10,  "initFromURL:userIdentityCache:error:",  v8,  v11,  &v36);
  id v13 = v36;

  if (!v12)
  {
    if ([v13 category] == 1 && objc_msgSend(v13, "POSIXerrno") == 2)
    {
      int v14 = 0LL;
      if (a5)
      {
LABEL_26:
        id v13 = v13;
        BOOL v23 = 0;
        *a5 = v13;
        goto LABEL_27;
      }

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)setUserIdentityCache:(id)a3
{
}

- (void).cxx_destruct
{
}

id __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1895F89C0];
  v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Error during entitlement bypass list migration: %@", *(void *)(a1 + 32)];
  v8[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]_block_invoke"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_18A2BE0E0;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"MCMErrorDomain",  objc_msgSend(*(id *)(a1 + 32), "type"),  v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__MCMContainerMigrator_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (sharedInstance_onceToken_10786 != -1) {
    dispatch_once(&sharedInstance_onceToken_10786, v3);
  }
  return (id)sharedInstance_instance_10787;
}

void __38__MCMContainerMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  id v3 = (void *)sharedInstance_instance_10787;
  sharedInstance_instance_10787 = v2;
}

@end