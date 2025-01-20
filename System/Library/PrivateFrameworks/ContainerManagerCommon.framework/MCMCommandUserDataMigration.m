@interface MCMCommandUserDataMigration
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_bundleContainerExistsForDataContainer:(id)a3 error:(id *)a4;
- (BOOL)preflightClientAllowed;
- (int)_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3;
- (void)_setDataProtectionIfNecessaryOnContainer:(id)a3;
- (void)execute;
@end

@implementation MCMCommandUserDataMigration

+ (unint64_t)command
{
  return 30LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToStartUserDataMigration];

  return v4;
}

- (void)execute
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x3032000000LL;
  v83 = __Block_byref_object_copy__2217;
  v84 = __Block_byref_object_dispose__2218;
  id v85 = 0LL;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x3032000000LL;
  v77 = __Block_byref_object_copy__2217;
  v78 = __Block_byref_object_dispose__2218;
  id v79 = 0LL;
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  char v73 = 1;
  uint64_t v66 = 0LL;
  v67 = &v66;
  uint64_t v68 = 0x2020000000LL;
  char v69 = 1;
  container_log_handle_for_category();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[MCMCommand context](self, "context", context);
    [v3 clientIdentity];
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = containermanager_copy_global_configuration();
    [v5 defaultUser];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)v87 = v4;
    *(_WORD *)&v87[8] = 2112;
    *(void *)&v87[10] = v6;
    _os_log_impl( &dword_188846000,  v2,  OS_LOG_TYPE_DEFAULT,  "Container data migration requested by %@ for default user: %@",  buf,  0x16u);
  }

  v7 = (void *)gCodeSigningMapping;
  v8 = -[MCMCommand context](self, "context");
  [v7 performAllCodeSigningMigrationAndReconciliationWithContext:v8];

  id v57 = -[MCMMigrationStatus initForMobileUserMigration]( objc_alloc(&OBJC_CLASS___MCMMigrationStatus),  "initForMobileUserMigration");
  char v9 = [v57 hasMigrationOccurredForType:@"SubdirectoryMigration"];
  uint64_t v10 = MEMORY[0x1895F87A8];
  if ((v9 & 1) == 0)
  {
    v11 = -[MCMCommand context](self, "context");
    [v11 userIdentityCache];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v10;
    v65[1] = 3221225472LL;
    v65[2] = __38__MCMCommandUserDataMigration_execute__block_invoke;
    v65[3] = &unk_18A29D118;
    v65[4] = self;
    v65[5] = &v80;
    v65[6] = &v70;
    v65[7] = &v74;
    [v12 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v65];

    if (*((_BYTE *)v71 + 24)) {
      [v57 setMigrationCompleteForType:@"SubdirectoryMigration"];
    }
  }

  v13 = (void *)v75[5];
  v75[5] = 0LL;
  v14 = -[MCMCommand context](self, "context");
  [v14 userIdentityCache];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v10;
  v64[1] = 3221225472LL;
  v64[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_15;
  v64[3] = &unk_18A29D2F0;
  v64[4] = self;
  v64[5] = &v80;
  v64[6] = &v66;
  [v15 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v64];

  v16 = (void *)v75[5];
  v75[5] = 0LL;

  uint64_t v63 = 1LL;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(MEMORY[0x189604A60], "count"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  uint64_t v17 = [MEMORY[0x189604A60] countByEnumeratingWithState:&v93 objects:v92 count:16];
  if (v17)
  {
    uint64_t v59 = *(void *)v94;
    do
    {
      uint64_t v60 = v17;
      for (uint64_t i = 0LL; i != v60; ++i)
      {
        if (*(void *)v94 != v59) {
          objc_enumerationMutation(MEMORY[0x189604A60]);
        }
        uint64_t v19 = *(void *)(*((void *)&v93 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x189604A60], "objectForKeyedSubscript:", v19, context);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 unsignedLongLongValue];

        uint64_t v63 = 1LL;
        v22 = -[MCMCommand context](self, "context");
        [v22 globalConfiguration];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 staticConfig];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 configForContainerClass:v21];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[MCMCommand context](self, "context");
        [v26 userIdentityCache];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[MCMCommand context](self, "context");
        [v28 clientIdentity];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 posixUser];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 userIdentityForPersonalPersonaWithPOSIXUser:v30];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[MCMCommand context](self, "context");
        [v32 userIdentityCache];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v31,  v19,  v25,  0LL,  v33,  &v63);
        if (v34)
        {
          v35 = (id *)(v81 + 5);
          id obj = (id)v81[5];
          [(id)gContainerCache entryForContainerIdentity:v34 error:&obj];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v35, obj);
          [v36 metadataMinimal];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            [v58 addObject:v34];
          }

          else
          {
            if ([(id)v81[5] type] == 21)
            {
              v40 = (os_log_s *)v81[5];
              v81[5] = 0LL;
            }

            else
            {
              container_log_handle_for_category();
              v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                uint64_t v41 = v81[5];
                *(_DWORD *)buf = 134218498;
                *(void *)v87 = v21;
                *(_WORD *)&v87[8] = 2112;
                *(void *)&v87[10] = v19;
                __int16 v88 = 2112;
                uint64_t v89 = v41;
                _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Failed lookup when trying to remove deprecated [%llu:%@]: %@",  buf,  0x20u);
              }
            }
          }
        }

        else
        {
          container_log_handle_for_category();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            uint64_t v38 = v63;
            uint64_t error_description = container_get_error_description();
            *(_DWORD *)buf = 134218754;
            *(void *)v87 = v21;
            *(_WORD *)&v87[8] = 2112;
            *(void *)&v87[10] = v19;
            __int16 v88 = 2048;
            uint64_t v89 = v38;
            __int16 v90 = 2080;
            uint64_t v91 = error_description;
            _os_log_error_impl( &dword_188846000,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "Could not create container identity when trying to remove deprecated [%llu:%@]: (%llu) %s",  buf,  0x2Au);
          }
        }
      }

      uint64_t v17 = [MEMORY[0x189604A60] countByEnumeratingWithState:&v93 objects:v92 count:16];
    }

    while (v17);
  }

  if (objc_msgSend(v58, "count", context))
  {
    v42 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
    v43 = (void *)[v58 copy];
    v44 = -[MCMCommand context](self, "context");
    v45 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v43,  1LL,  v44,  v42);
    [v45 execute];
    v46 = -[MCMResultPromise result](v42, "result");
    [v46 error];
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      container_log_handle_for_category();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v87 = v47;
        _os_log_error_impl( &dword_188846000,  v48,  OS_LOG_TYPE_ERROR,  "Failed to destroy container(s) during user data migration; error = %@",
          buf,
          0xCu);
      }
    }
  }

  if (*((_BYTE *)v71 + 24)) {
    int v49 = *((unsigned __int8 *)v67 + 24);
  }
  else {
    int v49 = 0;
  }
  container_log_handle_for_category();
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = v81[5];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v87 = v49;
    *(_WORD *)&v87[4] = 2112;
    *(void *)&v87[6] = v51;
    _os_log_impl( &dword_188846000,  v50,  OS_LOG_TYPE_DEFAULT,  "Per user data migration result: %d, error = %@",  buf,  0x12u);
  }

  v52 = objc_alloc(&OBJC_CLASS___MCMResultBase);
  v53 = -[MCMResultBase initWithError:](v52, "initWithError:", v81[5]);
  v54 = -[MCMCommand resultPromise](self, "resultPromise");
  [v54 completeWithResult:v53];

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  objc_autoreleasePoolPop(contexta);
}

- (void)_setDataProtectionIfNecessaryOnContainer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 containerPath];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containerClassPath];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 supportsDataProtection];

  if (v7)
  {
    id v21 = 0LL;
    BOOL v8 = -[MCMCommandUserDataMigration _bundleContainerExistsForDataContainer:error:]( self,  "_bundleContainerExistsForDataContainer:error:",  v4,  &v21);
    id v9 = v21;
    [v4 identifier];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      container_log_handle_for_category();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Error looking up bundle container for %@ : %@",  buf,  0x16u);
      }
    }

    else
    {
      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }

      uint64_t v12 = -[MCMCommandUserDataMigration _intendedDataProtectionClassBasedOnEntitlementsForIdentifier:]( self,  "_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:",  v10);
      v13 = objc_alloc(&OBJC_CLASS___MCMResultPromise);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke;
      v19[3] = &unk_18A29D168;
      v20 = v10;
      v14 = -[MCMResultPromise initWithCompletion:](v13, "initWithCompletion:", v19);
      v15 = objc_alloc(&OBJC_CLASS___MCMCommandSetDataProtection);
      [v4 containerIdentity];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommand context](self, "context");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MCMCommandSetDataProtection initWithContainerIdentity:thirdParty:dataProtectionClass:retryIfLocked:skipIfUnchanged:context:resultPromise:]( v15,  "initWithContainerIdentity:thirdParty:dataProtectionClass:retryIfLocked:skipIfUnchanged:context:resultPromise:",  v16,  0LL,  v12,  0LL,  1LL,  v17,  v14);

      -[MCMCommandSetDataProtection execute](v18, "execute");
      v11 = v20;
    }

    goto LABEL_8;
  }

- (int)_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intendedDataProtectionClass];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)_bundleContainerExistsForDataContainer:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v46 = 1LL;
  if ([v6 containerClass] == 2)
  {
    id v7 = containermanager_copy_global_configuration();
    int v8 = [v7 dispositionForContainerClass:1];

    if (v8 == 2)
    {
      container_query_create();
      container_query_set_class();
      id v9 = [v6 identifier];
      xpc_object_t v10 = xpc_string_create((const char *)[v9 UTF8String]);
      container_query_set_identifiers();

      uint64_t count_results = container_query_count_results();
      BOOL v12 = count_results > 0;
      if (count_results < 0) {
        v13 = -[MCMError initWithLibsystemError:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithLibsystemError:",  container_query_get_last_error());
      }
      else {
        v13 = 0LL;
      }
      container_query_free();
      goto LABEL_41;
    }

    -[MCMCommand context](self, "context");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 globalConfiguration];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 staticConfig];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 configForContainerClass:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 userIdentity];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identifier];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 userIdentityCache];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v24,  v25,  v16,  0LL,  v27,  &v46);
    if (v28)
    {
      id v45 = 0LL;
      [(id)gContainerCache entryForContainerIdentity:v28 error:&v45];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (MCMError *)v45;
      v13 = v30;
      if (v29)
      {
        BOOL v12 = 1;
LABEL_39:

        goto LABEL_40;
      }

      if (v30 && -[MCMError type](v30, "type") == 21)
      {

        v29 = 0LL;
        v13 = 0LL;
      }

      else
      {
        v29 = 0LL;
      }
    }

    else
    {
      v32 = objc_alloc(&OBJC_CLASS___MCMError);
      v13 = -[MCMError initWithErrorType:](v32, "initWithErrorType:", v46);
      container_log_handle_for_category();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        [v6 identifier];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v48 = (uint64_t)v33;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v29,  OS_LOG_TYPE_ERROR,  "Could not create container identity from [%@]: %@",  buf,  0x16u);
      }
    }

    BOOL v12 = 0;
    goto LABEL_39;
  }

  if ([v6 containerClass] == 4)
  {
    [(id)gCodeSigningMapping childParentMapCache];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identifier];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 parentIdentifierForChildIdentifier:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v13 = 0LL;
      BOOL v12 = 0;
LABEL_40:

      goto LABEL_41;
    }

    id v17 = containermanager_copy_global_configuration();
    int v18 = [v17 dispositionForContainerClass:1];

    if (v18 == 2)
    {
      container_query_create();
      container_query_set_class();
      xpc_object_t v19 = xpc_string_create((const char *)[v16 UTF8String]);
      container_query_set_identifiers();

      uint64_t v20 = container_query_count_results();
      BOOL v12 = v20 > 0;
      if (v20 < 0) {
        v13 = -[MCMError initWithLibsystemError:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithLibsystemError:",  container_query_get_last_error());
      }
      else {
        v13 = 0LL;
      }
      container_query_free();
      goto LABEL_40;
    }
    v34 = -[MCMCommand context](self, "context");
    [v34 globalConfiguration];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 staticConfig];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 configForContainerClass:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 userIdentity];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 userIdentityCache];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v37,  v16,  v28,  0LL,  v39,  &v46);
    if (v29)
    {
      id v44 = 0LL;
      [(id)gContainerCache entryForContainerIdentity:v29 error:&v44];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = (MCMError *)v44;
      v13 = v41;
      if (v40)
      {
        BOOL v12 = 1;
LABEL_38:

        goto LABEL_39;
      }

      if (v41 && -[MCMError type](v41, "type") == 21)
      {

        v40 = 0LL;
        v13 = 0LL;
      }

      else
      {
        v40 = 0LL;
      }
    }

    else
    {
      v42 = objc_alloc(&OBJC_CLASS___MCMError);
      v13 = -[MCMError initWithErrorType:](v42, "initWithErrorType:", v46);
      container_log_handle_for_category();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v48 = (uint64_t)v16;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v40,  OS_LOG_TYPE_ERROR,  "Could not create container identity from [%@]: %@",  buf,  0x16u);
      }
    }

    BOOL v12 = 0;
    goto LABEL_38;
  }

  v13 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 20LL);
  container_log_handle_for_category();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = [v6 containerClass];
    _os_log_error_impl(&dword_188846000, v31, OS_LOG_TYPE_ERROR, "Passed an unexpected container type: %llu", buf, 0xCu);
  }

  BOOL v12 = 0;
LABEL_41:
  if (a4 && v13) {
    *a4 = v13;
  }

  return v12;
}

id __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 error];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    container_log_handle_for_category();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      [v3 error];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "Error processing restored system container %@: %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  return v3;
}

void __38__MCMCommandUserDataMigration_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) context];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userIdentityCache];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMCommandContext privilegedWithUserIdentity:userIdentityCache:]( &OBJC_CLASS___MCMCommandContext,  "privilegedWithUserIdentity:userIdentityCache:",  v3,  v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](&OBJC_CLASS___MCMMigrationStatus, "currentBuildVersion");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v23 = v3;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v8;
    _os_log_impl( &dword_188846000,  v7,  OS_LOG_TYPE_DEFAULT,  "Performing Per User Subdirectory Migration for %@ on %@",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) context];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 classIterator];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_3;
  v17[3] = &unk_18A29D0F0;
  id v11 = v6;
  id v18 = v11;
  id v12 = v3;
  id v19 = v12;
  __int128 v20 = *(_OWORD *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 56);
  [v10 selectUserWithIterator:v17];

  container_log_handle_for_category();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = +[MCMMigrationStatus currentBuildVersion](&OBJC_CLASS___MCMMigrationStatus, "currentBuildVersion");
    v15 = (void *)v14;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      int v16 = 89;
    }
    else {
      int v16 = 78;
    }
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 1024;
    int v27 = v16;
    _os_log_impl( &dword_188846000,  v13,  OS_LOG_TYPE_DEFAULT,  "Completed Per User Subdirectory Migration for %@ on %@ : Success: %c",  buf,  0x1Cu);
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](&OBJC_CLASS___MCMMigrationStatus, "currentBuildVersion");
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v21 = v3;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v5;
    _os_log_impl( &dword_188846000,  v4,  OS_LOG_TYPE_DEFAULT,  "Performing User Data Protection Migration for %@ on %@",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) context];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 classIterator];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  v15 = __38__MCMCommandUserDataMigration_execute__block_invoke_16;
  int v16 = &unk_18A29D140;
  uint64_t v17 = *(void *)(a1 + 32);
  id v8 = v3;
  id v18 = v8;
  __int128 v19 = *(_OWORD *)(a1 + 40);
  [v7 selectDataProtectedWithIterator:&v13];

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[MCMMigrationStatus currentBuildVersion]( &OBJC_CLASS___MCMMigrationStatus,  "currentBuildVersion",  v13,  v14,  v15,  v16,  v17);
    id v11 = (void *)v10;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      int v12 = 89;
    }
    else {
      int v12 = 78;
    }
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    __int16 v24 = 1024;
    int v25 = v12;
    _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Completed User Data Protection Migration for %@ on %@ : Success: %c",  buf,  0x1Cu);
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) context];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containerCache];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:*(void *)(a1 + 40)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v3 containerClass];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v8 + 40);
  [v5 entriesForUserIdentities:v6 contentClass:v7 transient:0 error:&obj];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
          int v16 = (void *)MEMORY[0x1895CE3A8]();
          uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
          id v23 = *(id *)(v17 + 40);
          [v15 metadataWithError:&v23];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v17 + 40), v23);
          if (v18) {
            [*(id *)(a1 + 32) _setDataProtectionIfNecessaryOnContainer:v18];
          }

          objc_autoreleasePoolPop(v16);
          ++v14;
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
      }

      while (v12);
    }
  }

  else
  {
    container_log_handle_for_category();
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = [v3 containerClass];
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      uint64_t v35 = v22;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to fetch list of data containers for userIdentity: %@, class: %ld: %@",  buf,  0x20u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) containerCache];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:*(void *)(a1 + 40)];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  uint64_t v6 = [v3 containerClass];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v7 + 40);
  [v4 entriesForUserIdentities:v5 contentClass:v6 transient:0 error:&obj];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v8)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v28 = v8;
    id v29 = v8;
    uint64_t v9 = [v29 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v29);
          }
          uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1895CE3A8]();
          [v13 metadataMinimal];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          int v16 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
          uint64_t v17 = objc_alloc(&OBJC_CLASS___MCMCommandRecreateContainerStructure);
          [v15 containerIdentity];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v19 = -[MCMCommandRecreateContainerStructure initWithConcreteContainerIdentity:context:resultPromise:]( v17,  "initWithConcreteContainerIdentity:context:resultPromise:",  v18,  *(void *)(a1 + 32),  v16);

          -[MCMCommandRecreateContainerStructure execute](v19, "execute");
          -[MCMResultPromise result](v16, "result");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 error];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v31[0] = MEMORY[0x1895F87A8];
            v31[1] = 3221225472LL;
            v31[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_7;
            v31[3] = &unk_18A29D0C8;
            id v32 = v15;
            id v33 = v30;
            __int16 v34 = v16;
            uint64_t v35 = 1LL;
            uint64_t v22 = __38__MCMCommandUserDataMigration_execute__block_invoke_7((uint64_t)v31);
            uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8LL);
            __int16 v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v22;

            *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
          }

          objc_autoreleasePoolPop(v14);
          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v29 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }

      while (v10);
    }

    uint64_t v8 = v28;
  }

  else
  {
    container_log_handle_for_category();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412802;
      uint64_t v43 = v26;
      __int16 v44 = 2048;
      uint64_t v45 = 0LL;
      __int16 v46 = 2112;
      uint64_t v47 = v27;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to fetch list of containers for userIdentity: %@, class %ld : %@",  buf,  0x20u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  }
}

id __38__MCMCommandUserDataMigration_execute__block_invoke_7(uint64_t a1)
{
  v18[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) userIdentity];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(a1 + 40) containerClass];
  [*(id *)(a1 + 32) identifier];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) result];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 error];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v2 initWithFormat:@"Failed to recreate container directory structure for %@:%ld:%@ : %@", v3, v4, v5, v7];

  v17[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMCommandUserDataMigration execute]_block_invoke"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = &unk_18A2BDE40;
  uint64_t v10 = *MEMORY[0x1896075E0];
  v17[1] = @"SourceFileLine";
  v17[2] = v10;
  v18[2] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v16 = v8;
    _os_log_error_impl(&dword_188846000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:*(void *)(a1 + 56) userInfo:v11];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end