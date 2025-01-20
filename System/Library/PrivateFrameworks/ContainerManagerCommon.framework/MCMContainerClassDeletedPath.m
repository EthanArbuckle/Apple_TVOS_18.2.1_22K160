@interface MCMContainerClassDeletedPath
+ (id)_posixOwnerForDeletedPathForContainerClass:(unint64_t)a3 user:(id)a4;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)deletedGlobalURL;
+ (id)deletedURLWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassDeletedPath

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 posixUser];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _posixOwnerForDeletedPathForContainerClass:a4 user:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [a1 _modeForContainerClass:a4];
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 isGlobalContainerClass:a4];

  if (v11)
  {
    uint64_t v12 = [a1 deletedGlobalURL];
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_6;
  }

  if (v6)
  {
    uint64_t v12 = [a1 deletedURLWithUserIdentity:v6];
    goto LABEL_5;
  }

  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a4;
    _os_log_fault_impl( &dword_188846000,  v16,  OS_LOG_TYPE_FAULT,  "Container class [%llu] requires a user identity.",  buf,  0xCu);
  }

  v13 = 0LL;
LABEL_6:
  v14 = (void *)[objc_alloc((Class)a1) initWithBaseURL:v13 categoryComponent:0 classComponent:0 containerClass:a4 POSIXOwner:v8 POSIXMode:v9 userIdentity:v6];

  return v14;
}

+ (id)deletedGlobalURL
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerDeathrow];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    id v10 = 0LL;
LABEL_8:
    int v11 = 0LL;
    goto LABEL_9;
  }

  id v6 = containermanager_copy_global_configuration();
  [v6 libraryRepair];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 url];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = a1;
  id v16 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke;
  v15[3] = &__block_descriptor_40_e19_B24__0__NSURL_8__16l;
  int v9 = [v7 fixAndRetryIfPermissionsErrorWithURL:v8 error:&v16 duringBlock:v15];
  id v10 = v16;

  if (!v9)
  {
    container_log_handle_for_category();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_fault_impl( &dword_188846000,  v12,  OS_LOG_TYPE_FAULT,  "Failed to create deathrow at %@: %{public}@",  buf,  0x16u);
    }

    goto LABEL_8;
  }

  [v5 url];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  id v13 = v11;

  return v13;
}

+ (id)deletedURLWithUserIdentity:(id)a3
{
  id v3 = a3;
  v4 = +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  [v4 libraryRepairForUserIdentity:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 userRegistry];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containermanagerUserDeathrow];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 url];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_posixOwnerForDeletedPathForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  id v6 = containermanager_copy_global_configuration();
  LODWORD(a3) = [v6 isGlobalContainerClass:a3];

  if ((_DWORD)a3)
  {
    id v7 = containermanager_copy_global_configuration();
    [v7 currentUser];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

uint64_t __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = containermanager_copy_global_configuration();
  [v6 currentUser];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend( v4,  "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:",  v5,  493,  v7,  0xFFFFFFFFLL,  0,  a3);

  return v8;
}

@end