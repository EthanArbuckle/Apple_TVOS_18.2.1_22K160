@interface MCMCommandDataMigration
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_performBundleContainerOwnershipMigrationWithError:(id *)a3;
- (BOOL)_performInternalACLMigrationWithError:(id *)a3;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandDataMigration

+ (unint64_t)command
{
  return 24LL;
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
  char v4 = [v3 isAllowedToStartDataMigration];

  return v4;
}

- (void)execute
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  container_log_handle_for_category();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[MCMMigrationStatus currentBuildVersion](&OBJC_CLASS___MCMMigrationStatus, "currentBuildVersion");
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_188846000, v4, OS_LOG_TYPE_DEFAULT, "Performing Data Migration on %@", buf, 0xCu);
  }

  id v19 = 0LL;
  BOOL v6 = -[MCMCommandDataMigration _performInternalACLMigrationWithError:]( self,  "_performInternalACLMigrationWithError:",  &v19);
  id v7 = v19;
  if (!v6)
  {
    container_log_handle_for_category();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to migrate ACLs on system containers : %@",  buf,  0xCu);
    }
  }

  id v9 = containermanager_copy_global_configuration();
  int v10 = [v9 dispositionForContainerClass:1];

  if (v10 != 1)
  {
    id v12 = v7;
LABEL_13:
    if (v6) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }

  id v18 = v7;
  BOOL v11 = -[MCMCommandDataMigration _performBundleContainerOwnershipMigrationWithError:]( self,  "_performBundleContainerOwnershipMigrationWithError:",  &v18);
  id v12 = v18;

  if (v11) {
    goto LABEL_13;
  }
  container_log_handle_for_category();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to migrate bundle containers to system location : %@",  buf,  0xCu);
  }

LABEL_14:
  container_log_handle_for_category();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "Failed to perform data migration : %@", buf, 0xCu);
  }

LABEL_17:
  container_log_handle_for_category();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_188846000, v15, OS_LOG_TYPE_DEFAULT, "System data migration; error = %@", buf, 0xCu);
  }

  v16 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v12);
  v17 = -[MCMCommand resultPromise](self, "resultPromise");
  [v17 completeWithResult:v16];

  objc_autoreleasePoolPop(v3);
}

- (BOOL)_performBundleContainerOwnershipMigrationWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  -[MCMCommand context](self, "context");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userIdentityCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 defaultUserIdentity];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = containermanager_copy_global_configuration();
  [v7 staticConfig];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = 1;
  [v8 configForContainerClass:1];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = containermanager_copy_global_configuration();
  [v11 classPathCache];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 containerClassPathForUserIdentity:v6 containerConfig:v10 typeClass:objc_opt_class()];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = v14;
  if (v13)
  {
    if ([v14 hasMigrationOccurredForType:@"BundleMigration"])
    {
      v16 = 0LL;
      id v17 = 0LL;
LABEL_9:
      BOOL v9 = 1;
      goto LABEL_10;
    }

    v32 = a3;
    container_log_handle_for_category();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEFAULT,  "Changing ownership of bundle container content.",  buf,  2u);
    }

    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 categoryURL];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = containermanager_copy_global_configuration();
    [v21 bundleContainerOwner];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    char v23 = [v19 standardizeOwnershipAtURL:v20 toPOSIXUser:v22 error:&v33];
    id v17 = v33;

    if ((v23 & 1) != 0)
    {
LABEL_8:
      objc_msgSend(v15, "setMigrationCompleteForType:", @"BundleMigration", v32);
      v16 = 0LL;
      goto LABEL_9;
    }

    [v17 domain];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v25 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v26 = [v17 code];

      if (v26 == 2) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    v27 = objc_alloc(&OBJC_CLASS___MCMError);
    [v13 categoryURL];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCMError initWithNSError:url:defaultErrorType:]( v27,  "initWithNSError:url:defaultErrorType:",  v17,  v28,  127LL);

    container_log_handle_for_category();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      [v13 categoryURL];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 path];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_error_impl(&dword_188846000, v29, OS_LOG_TYPE_ERROR, "Failed to change owner of %@: %@", buf, 0x16u);
    }

    if (v32)
    {
      v16 = v16;
      BOOL v9 = 0;
      id *v32 = v16;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    v16 = 0LL;
    id v17 = 0LL;
  }

- (BOOL)_performInternalACLMigrationWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  v5 = (void *)objc_opt_new();
  -[MCMCommand context](self, "context");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 userIdentityCache];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 defaultUserIdentity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = containermanager_copy_global_configuration();
  [v9 staticConfig];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 configForContainerClass:12];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v12 = containermanager_copy_global_configuration();
  [v12 staticConfig];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 configForContainerClass:13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = containermanager_copy_global_configuration();
  LODWORD(v13) = [v15 systemContainerMode];

  if (_DWORD)v13 != 1 || ([v5 hasMigrationOccurredForType:@"ACLMigration"])
  {
    v16 = 0LL;
    id v17 = 0LL;
    id v18 = 0LL;
    id v19 = 0LL;
LABEL_4:
    BOOL v20 = 1;
    goto LABEL_5;
  }

  id v22 = containermanager_copy_global_configuration();
  [v22 classPathCache];
  char v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 containerClassPathForUserIdentity:v8 containerConfig:v11 typeClass:objc_opt_class()];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 classURL];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  LODWORD(v23) = [v25 itemExistsAtURL:v17];

  v39 = a3;
  if (!(_DWORD)v23)
  {
    id v40 = 0LL;
    goto LABEL_12;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  id v42 = 0LL;
  char v27 = [v26 standardizeAllSystemContainerACLsAtURL:v17 error:&v42];
  id v40 = v42;

  if ((v27 & 1) != 0)
  {
LABEL_12:
    v16 = 0LL;
    int v38 = 1;
    goto LABEL_13;
  }

  container_log_handle_for_category();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v40;
    _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to set ACLs on system containers : %@",  buf,  0xCu);
  }

  v16 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v40,  v17,  63LL);
  int v38 = 0;
LABEL_13:
  id v29 = containermanager_copy_global_configuration();
  [v29 classPathCache];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 containerClassPathForUserIdentity:v8 containerConfig:v14 typeClass:objc_opt_class()];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 classURL];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  LODWORD(v31) = [v32 itemExistsAtURL:v18];

  if ((_DWORD)v31)
  {
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v40;
    char v34 = [v33 standardizeAllSystemContainerACLsAtURL:v18 error:&v41];
    id v19 = v41;

    if ((v34 & 1) == 0)
    {
      container_log_handle_for_category();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v19;
        _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to set ACLs on system group containers : %@",  buf,  0xCu);
      }

      __int16 v36 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v19,  v18,  63LL);
      v16 = v36;
      id v37 = v39;
      goto LABEL_21;
    }
  }

  else
  {
    id v19 = v40;
  }

  id v37 = v39;
  if (v38)
  {
    [v5 setMigrationCompleteForType:@"ACLMigration"];
    goto LABEL_4;
  }

@end